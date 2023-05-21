<?php

require_once('modules/AOW_Actions/actions/actionBase.php');

class actionSendEmail extends actionBase {

    private $emailableModules = array();

    function __construct($id = '') {
        parent::__construct($id);
    }

    /**
     * @deprecated deprecated since version 7.6, PHP4 Style Constructors are deprecated and will be remove in 7.8, please update your code, use __construct instead
     */
    function actionSendEmail($id = '') {
        $deprecatedMessage = 'PHP4 Style Constructors are deprecated and will be remove in 7.8, please update your code';
        if (isset($GLOBALS['log'])) {
            $GLOBALS['log']->deprecated($deprecatedMessage);
        } else {
            trigger_error($deprecatedMessage, E_USER_DEPRECATED);
        }
        self::__construct($id);
    }

    function loadJS() {
        return array('modules/AOW_Actions/actions/actionSendEmail.js');
    }

    function edit_display($line, SugarBean $bean = null, $params = array()) {
        global $app_list_strings;
        $email_templates_arr = get_bean_select_array(true, 'EmailTemplate', 'name', '', 'name');

        if (!in_array($bean->module_dir, getEmailableModules()))
            unset($app_list_strings['aow_email_type_list']['Record Email']);
        $targetOptions = getRelatedEmailableFields($bean->module_dir);
        if (empty($targetOptions))
            unset($app_list_strings['aow_email_type_list']['Related Field']);

        $html = '<input type="hidden" name="aow_email_type_list" id="aow_email_type_list" value="' . get_select_options_with_id($app_list_strings['aow_email_type_list'], '') . '">
				  <input type="hidden" name="aow_email_to_list" id="aow_email_to_list" value="' . get_select_options_with_id($app_list_strings['aow_email_to_list'], '') . '">';

        $checked = '';
        if (isset($params['individual_email']) && $params['individual_email'])
            $checked = 'CHECKED';

        $html .= "<table border='0' cellpadding='0' cellspacing='0' width='100%' data-workflow-action='send-email'>";
        $html .= "<tr>";
        $html .= '<td id="relate_label" scope="row" valign="top"><label>' . translate("LBL_INDIVIDUAL_EMAILS", "AOW_Actions") . ':</label>';
        $html .= '</td>';
        $html .= "<td valign='top'>";
        $html .= "<input type='hidden' name='aow_actions_param[" . $line . "][individual_email]' value='0' >";
        $html .= "<input type='checkbox' id='aow_actions_param[" . $line . "][individual_email]' name='aow_actions_param[" . $line . "][individual_email]' value='1' $checked></td>";
        $html .= '</td>';

        if (!isset($params['email_template']))
            $params['email_template'] = '';
        $hidden = "style='visibility: hidden;'";
        if ($params['email_template'] != '')
            $hidden = "";

        $html .= '<td id="name_label" scope="row" valign="top"><label>' . translate("LBL_EMAIL_TEMPLATE", "AOW_Actions") . ':<span class="required">*</span></label></td>';
        $html .= "<td valign='top'>";
        $html .= "<select name='aow_actions_param[" . $line . "][email_template]' id='aow_actions_param_email_template" . $line . "' onchange='show_edit_template_link(this," . $line . ");' >" . get_select_options_with_id($email_templates_arr, $params['email_template']) . "</select>";

        $html .= "&nbsp;<a href='javascript:open_email_template_form(" . $line . ")' >" . translate('LBL_CREATE_EMAIL_TEMPLATE', 'AOW_Actions') . "</a>";
        $html .= "&nbsp;<span name='edit_template' id='aow_actions_edit_template_link" . $line . "' $hidden><a href='javascript:edit_email_template_form(" . $line . ")' >" . translate('LBL_EDIT_EMAIL_TEMPLATE', 'AOW_Actions') . "</a></span>";
        $html .= "</td>";
        $html .= "</tr>";
        $html .= "<tr>";
        $html .= '<td id="name_label" scope="row" valign="top"><label>' . translate("LBL_EMAIL", "AOW_Actions") . ':<span class="required">*</span></label></td>';
        $html .= '<td valign="top" scope="row">';

        $html .='<button type="button" onclick="add_emailLine(' . $line . ')"><img src="' . SugarThemeRegistry::current()->getImageURL('id-ff-add.png') . '"></button>';
        $html .= '<table id="emailLine' . $line . '_table" width="100%" class="email-line"></table>';
        $html .= '</td>';
        $html .= "</tr>";
        $html .= "</table>";

        $html .= "<script id ='aow_script" . $line . "'>";

        //backward compatible
        if (isset($params['email_target_type']) && !is_array($params['email_target_type'])) {
            $email = '';
            switch ($params['email_target_type']) {
                case 'Email Address':
                    $email = $params['email'];
                    break;
                case 'Specify User':
                    $email = $params['email_user_id'];
                    break;
                case 'Related Field':
                    $email = $params['email_target'];
                    break;
            }
            $html .= "load_emailline('" . $line . "','to','" . $params['email_target_type'] . "','" . $email . "');";
        }
        //end backward compatible

        if (isset($params['email_target_type'])) {
            foreach ($params['email_target_type'] as $key => $field) {
                if (is_array($params['email'][$key]))
                    $params['email'][$key] = json_encode($params['email'][$key]);
                $html .= "load_emailline('" . $line . "','" . $params['email_to_type'][$key] . "','" . $params['email_target_type'][$key] . "','" . $params['email'][$key] . "');";
            }
        }
        $html .= "</script>";

        return $html;
    }

    private function getEmailsFromParams(SugarBean $bean, $params) {

        $emails = array();
        //backward compatible
        if (isset($params['email_target_type']) && !is_array($params['email_target_type'])) {
            $email = '';
            switch ($params['email_target_type']) {
                case 'Email Address':
                    $params['email'] = array($params['email']);
                    break;
                case 'Specify User':
                    $params['email'] = array($params['email_user_id']);
                    break;
                case 'Related Field':
                    $params['email'] = array($params['email_target']);
                    break;
            }
            $params['email_target_type'] = array($params['email_target_type']);
            $params['email_to_type'] = array('to');
        }
        //end backward compatible
        if (isset($params['email_target_type'])) {
            foreach ($params['email_target_type'] as $key => $field) {
                switch ($field) {
                    case 'Email Address':
                        if (trim($params['email'][$key]) != '')
                            $emails[$params['email_to_type'][$key]][] = $params['email'][$key];
                        break;
                    case 'Specify User':
                        $user = new User();
                        $user->retrieve($params['email'][$key]);
                        $user_email = $user->emailAddress->getPrimaryAddress($user);
                        if (trim($user_email) != '') {
                            $emails[$params['email_to_type'][$key]][] = $user_email;
                            $emails['template_override'][$user_email] = array('Users' => $user->id);
                        }

                        break;
                    case 'Users':
                        $users = array();
                        switch ($params['email'][$key][0]) {
                            Case 'security_group':
                                if (file_exists('modules/SecurityGroups/SecurityGroup.php')) {
                                    require_once('modules/SecurityGroups/SecurityGroup.php');
                                    $security_group = new SecurityGroup();
                                    $security_group->retrieve($params['email'][$key][1]);
                                    $users = $security_group->get_linked_beans('users', 'User');
                                    $r_users = array();
                                    if ($params['email'][$key][2] != '') {
                                        require_once('modules/ACLRoles/ACLRole.php');
                                        $role = new ACLRole();
                                        $role->retrieve($params['email'][$key][2]);
                                        $role_users = $role->get_linked_beans('users', 'User');
                                        foreach ($role_users as $role_user) {
                                            $r_users[$role_user->id] = $role_user->name;
                                        }
                                    }
                                    foreach ($users as $user_id => $user) {
                                        if ($params['email'][$key][2] != '' && !isset($r_users[$user->id])) {
                                            unset($users[$user_id]);
                                        }
                                    }
                                    break;
                                }
                            //No Security Group module found - fall through.
                            Case 'role':
                                require_once('modules/ACLRoles/ACLRole.php');
                                $role = new ACLRole();
                                $role->retrieve($params['email'][$key][2]);
                                $users = $role->get_linked_beans('users', 'User');
                                break;
                            Case 'all':
                            default:
                                global $db;
                                $sql = "SELECT id from users WHERE status='Active' AND portal_only=0 ";
                                $result = $db->query($sql);
                                while ($row = $db->fetchByAssoc($result)) {
                                    $user = new User();
                                    $user->retrieve($row['id']);
                                    $users[$user->id] = $user;
                                }
                                break;
                        }
                        foreach ($users as $user) {
                            $user_email = $user->emailAddress->getPrimaryAddress($user);
                            if (trim($user_email) != '') {
                                $emails[$params['email_to_type'][$key]][] = $user_email;
                                $emails['template_override'][$user_email] = array('Users' => $user->id);
                            }
                        }
                        break;
                    case 'Related Field':
                        $emailTarget = $params['email'][$key];
                        $relatedFields = array_merge($bean->get_related_fields(), $bean->get_linked_fields());
                        $field = $relatedFields[$emailTarget];
                        if ($field['type'] == 'relate') {
                            $linkedBeans = array();
                            $idName = $field['id_name'];
                            $id = $bean->$idName;
                            $linkedBeans[] = BeanFactory::getBean($field['module'], $id);
                        } else if ($field['type'] == 'link') {
                            $relField = $field['name'];
                            if (isset($field['module']) && $field['module'] != '') {
                                $rel_module = $field['module'];
                            } else if ($bean->load_relationship($relField)) {
                                $rel_module = $bean->$relField->getRelatedModuleName();
                            }
                            $linkedBeans = $bean->get_linked_beans($relField, $rel_module);
                        } else {
                            $linkedBeans = $bean->get_linked_beans($field['link'], $field['module']);
                        }
                        if ($linkedBeans) {
                            foreach ($linkedBeans as $linkedBean) {
                                $rel_email = $linkedBean->emailAddress->getPrimaryAddress($linkedBean);
                                if (trim($rel_email) != '') {
                                    $emails[$params['email_to_type'][$key]][] = $rel_email;
                                    $emails['template_override'][$rel_email] = array($linkedBean->module_dir => $linkedBean->id);
                                }
                            }
                        }
                        break;
                    case 'Record Email':
                        $recordEmail = $bean->emailAddress->getPrimaryAddress($bean);
                        if ($recordEmail == '' && isset($bean->email1))
                            $recordEmail = $bean->email1;
                        if (trim($recordEmail) != '')
                            $emails[$params['email_to_type'][$key]][] = $recordEmail;
                        break;
                }
            }
        }
        return $emails;
    }

    private function CE_SMS_Functions(SugarBean $bean, $params) {

        $emails = array();
        //backward compatible
        if (isset($params['email_target_type']) && !is_array($params['email_target_type'])) {
            $email = '';
            switch ($params['email_target_type']) {
                case 'Email Address':
                    $params['email'] = array($params['email']);
                    break;
                case 'Specify User':
                    $params['email'] = array($params['email_user_id']);
                    break;
                case 'Related Field':
                    $params['email'] = array($params['email_target']);
                    break;
            }
            $params['email_target_type'] = array($params['email_target_type']);
            $params['email_to_type'] = array('to');
        }
        //end backward compatible
        if (isset($params['email_target_type'])) {
            foreach ($params['email_target_type'] as $key => $field) {
                switch ($field) {
                    case 'Email Address':
                        if (trim($params['email'][$key]) != '')
                            $emails[$params['email_to_type'][$key]][] = $params['email'][$key];
                        break;
                    case 'Specify User':
                        $user = new User();
                        $user->retrieve($params['email'][$key]);

                        $acc_val = array("phone_mobile", "phone_work", "phone_other", "phone_home");
                        foreach ($acc_val as $aacv) {
                            $arr_op = trim($aacv);
                            $phone1 = $user->$arr_op;
                            if (!empty($phone1)) {
                                $phone_num = $phone1;
                                break;
                            }
                        }

                        if (trim($phone_num) != '') {
                            $emails[$params['email_to_type'][$key]][] = $phone_num;
                            $emails['template_override'][$phone_num] = array('Users' => $user->id);
                        }

                        break;
                    case 'Users':
                        $users = array();
                        switch ($params['email'][$key][0]) {
                            Case 'security_group':
                                if (file_exists('modules/SecurityGroups/SecurityGroup.php')) {
                                    require_once('modules/SecurityGroups/SecurityGroup.php');
                                    $security_group = new SecurityGroup();
                                    $security_group->retrieve($params['email'][$key][1]);
                                    $users = $security_group->get_linked_beans('users', 'User');
                                    $r_users = array();
                                    if ($params['email'][$key][2] != '') {
                                        require_once('modules/ACLRoles/ACLRole.php');
                                        $role = new ACLRole();
                                        $role->retrieve($params['email'][$key][2]);
                                        $role_users = $role->get_linked_beans('users', 'User');
                                        foreach ($role_users as $role_user) {
                                            $r_users[$role_user->id] = $role_user->name;
                                        }
                                    }
                                    foreach ($users as $user_id => $user) {
                                        if ($params['email'][$key][2] != '' && !isset($r_users[$user->id])) {
                                            unset($users[$user_id]);
                                        }
                                    }
                                    break;
                                }
                            //No Security Group module found - fall through.
                            Case 'role':
                                require_once('modules/ACLRoles/ACLRole.php');
                                $role = new ACLRole();
                                $role->retrieve($params['email'][$key][2]);
                                $users = $role->get_linked_beans('users', 'User');
                                break;
                            Case 'all':
                            default:
                                global $db;
                                $sql = "SELECT id from users WHERE status='Active' AND portal_only=0 ";
                                $result = $db->query($sql);
                                while ($row = $db->fetchByAssoc($result)) {
                                    $user = new User();
                                    $user->retrieve($row['id']);
                                    $users[$user->id] = $user;
                                }
                                break;
                        }
                        foreach ($users as $user) {

                            $acc_val = array("phone_mobile", "phone_work", "phone_other", "phone_home");
                            foreach ($acc_val as $aacv) {
                                $arr_op = trim($aacv);
                                $phone1 = $user->$arr_op;
                                if (!empty($phone1)) {
                                    $phone_num = $phone1;
                                    break;
                                }
                            }

                            if (trim($phone_num) != '') {
                                $emails[$params['email_to_type'][$key]][] = $phone_num;
                                $emails['template_override'][$phone_num] = array('Users' => $user->id);
                            }
                        }
                        break;
                    case 'Related Field':
                        $emailTarget = $params['email'][$key];
                        $relatedFields = array_merge($bean->get_related_fields(), $bean->get_linked_fields());
                        $field = $relatedFields[$emailTarget];
                        if ($field['type'] == 'relate') {
                            $linkedBeans = array();
                            $idName = $field['id_name'];
                            $id = $bean->$idName;
                            $linkedBeans[] = BeanFactory::getBean($field['module'], $id);
                        } else if ($field['type'] == 'link') {
                            $relField = $field['name'];
                            if (isset($field['module']) && $field['module'] != '') {
                                $rel_module = $field['module'];
                            } else if ($bean->load_relationship($relField)) {
                                $rel_module = $bean->$relField->getRelatedModuleName();
                            }
                            $linkedBeans = $bean->get_linked_beans($relField, $rel_module);
                        } else {
                            $linkedBeans = $bean->get_linked_beans($field['link'], $field['module']);
                        }
                        if ($linkedBeans) {
                            foreach ($linkedBeans as $linkedBean) {
                                $phone_num = "";
                                //Users
                                if ($field['module'] == "Users") {
                                    $acc_val = array("phone_mobile", "phone_work", "phone_other", "phone_home");
                                    foreach ($acc_val as $aacv) {
                                        $arr_op = trim($aacv);
                                        $phone1 = $linkedBean->$arr_op;
                                        if (!empty($phone1)) {
                                            $phone_num = $phone1;
                                            break;
                                        }
                                    }
                                }
                                //Accounts
                                if ($field['module'] == "Accounts") {
                                    $acc_val = array("phone_office", "phone_alternate", "phone_fax");
                                    foreach ($acc_val as $aacv) {
                                        $arr_op = trim($aacv);
                                        $phone1 = $linkedBean->$arr_op;
                                        if (!empty($phone1)) {
                                            $phone_num = $phone1;
                                            break;
                                        }
                                    }
                                }
                                // Contacts
                                if ($field['module'] == "Contacts") {
                                    $getarr_val = array("phone_mobile", "phone_other", "phone_work", "phone_fax", "phone_home");
                                    foreach ($getarr_val as $aacv) {
                                        $arr_op = trim($aacv);
                                        $phone1 = $linkedBean->$arr_op;
                                        if (!empty($phone1)) {
                                            $phone_num = $phone1;
                                            break;
                                        }
                                    }
                                }
                                //Leads
                                if ($field['module'] == "Leads") {
                                    $getarr_val = array("phone_mobile", "phone_other", "phone_work", "phone_fax", "phone_home");
                                    foreach ($getarr_val as $aacv) {
                                        $arr_op = trim($aacv);
                                        $phone1 = $linkedBean->$arr_op;
                                        if (!empty($phone1)) {
                                            $phone_num = $phone1;
                                            break;
                                        }
                                    }
                                }

                                if (trim($phone_num) != '') {

                                    $emails[$params['email_to_type'][$key]][] = $phone_num;
                                    $emails['template_override'][$phone_num] = array($linkedBean->module_dir => $linkedBean->id);
                                }
                            }
                        }
                        break;
                    case 'Record Email':
                        $phone_num = "";
                        //Users
                        if ($bean->module_name == "Users") {
                            $acc_val = array("phone_mobile", "phone_work", "phone_other", "phone_home");
                            foreach ($acc_val as $aacv) {
                                $arr_op = trim($aacv);
                                $phone1 = $bean->$arr_op;
                                if (!empty($phone1)) {
                                    $phone_num = $phone1;
                                    break;
                                }
                            }
                        }
                        //Accounts
                        if ($bean->module_name == "Accounts") {
                            $acc_val = array("phone_office", "phone_alternate", "phone_fax");
                            foreach ($acc_val as $aacv) {
                                $arr_op = trim($aacv);
                                $phone1 = $bean->$arr_op;
                                if (!empty($phone1)) {
                                    $phone_num = $phone1;
                                    break;
                                }
                            }
                        }
                        // Contacts
                        if ($bean->module_name == "Contacts") {
                            $getarr_val = array("phone_mobile", "phone_other", "phone_work", "phone_fax", "phone_home");
                            foreach ($getarr_val as $aacv) {
                                $arr_op = trim($aacv);
                                $phone1 = $bean->$arr_op;
                                if (!empty($phone1)) {
                                    $phone_num = $phone1;
                                    break;
                                }
                            }
                        }
                        //Leads
                        if ($bean->module_name == "Leads") {
                            $getarr_val = array("phone_mobile", "phone_other", "phone_work", "phone_fax", "phone_home");
                            foreach ($getarr_val as $aacv) {
                                $arr_op = trim($aacv);
                                $phone1 = $bean->$arr_op;
                                if (!empty($phone1)) {
                                    $phone_num = $phone1;
                                    break;
                                }
                            }
                        }

                        if (trim($phone_num) != '')
                            $emails[$params['email_to_type'][$key]][] = $phone_num;
                        break;
                }
            }
        }
        return $emails;
    }

    function run_action(SugarBean $bean, $params = array(), $in_save = false) {

        include_once('modules/EmailTemplates/EmailTemplate.php');
        $emailTemp = new EmailTemplate();
        $emailTemp->retrieve($params['email_template']);

        $Email_Type = $emailTemp->type;
        $Email_TNAME = $emailTemp->name;

        if (trim($Email_Type) === "sms") {

            //sms

            if ($emailTemp->id == '') {
                return false;
            }

            $emails = $this->CE_SMS_Functions($bean, $params);

            if (!isset($emails['to']) || empty($emails['to']))
                return false;

            $attachments = $this->getAttachments($emailTemp);

            if (isset($params['individual_email']) && $params['individual_email']) {

                foreach ($emails['to'] as $email_to) {
                    $emailTemp = new EmailTemplate();
                    $emailTemp->retrieve($params['email_template']);
                    $template_override = isset($emails['template_override'][$email_to]) ? $emails['template_override'][$email_to] : array();
                    $this->parse_template($bean, $emailTemp, $template_override);
                    $this->Sending_SMS_CE(array($email_to), $emailTemp->subject, $emailTemp->body_html, $emailTemp->body, $bean, $emails['cc'], $emails['bcc'], $attachments, $Email_TNAME);
                }
            } else {
                $this->parse_template($bean, $emailTemp);
                if ($emailTemp->text_only == '1') {
                    $email_body_html = $emailTemp->body;
                } else {
                    $email_body_html = $emailTemp->body_html;
                }
                return $this->Sending_SMS_CE($emails['to'], $emailTemp->subject, $email_body_html, $emailTemp->body, $bean, $emails['cc'], $emails['bcc'], $attachments, $Email_TNAME);
            }
        } else {
            // email

            if ($emailTemp->id == '') {
                return false;
            }

            $emails = $this->getEmailsFromParams($bean, $params);

            if (!isset($emails['to']) || empty($emails['to']))
                return false;

            $attachments = $this->getAttachments($emailTemp);

            if (isset($params['individual_email']) && $params['individual_email']) {

                foreach ($emails['to'] as $email_to) {
                    $emailTemp = new EmailTemplate();
                    $emailTemp->retrieve($params['email_template']);
                    $template_override = isset($emails['template_override'][$email_to]) ? $emails['template_override'][$email_to] : array();
                    $this->parse_template($bean, $emailTemp, $template_override);
                    $this->sendEmail(array($email_to), $emailTemp->subject, $emailTemp->body_html, $emailTemp->body, $bean, $emails['cc'], $emails['bcc'], $attachments);
                }
            } else {
                $this->parse_template($bean, $emailTemp);
                if ($emailTemp->text_only == '1') {
                    $email_body_html = $emailTemp->body;
                } else {
                    $email_body_html = $emailTemp->body_html;
                }
                return $this->sendEmail($emails['to'], $emailTemp->subject, $email_body_html, $emailTemp->body, $bean, $emails['cc'], $emails['bcc'], $attachments);
            }
        }

        return true;
    }

    function parse_template(SugarBean $bean, &$template, $object_override = array()) {
        global $sugar_config;

        require_once('modules/AOW_Actions/actions/templateParser.php');

        $object_arr[$bean->module_dir] = $bean->id;

        foreach ($bean->field_defs as $bean_arr) {
            if ($bean_arr['type'] == 'relate') {
                if (isset($bean_arr['module']) && $bean_arr['module'] != '' && isset($bean_arr['id_name']) && $bean_arr['id_name'] != '' && $bean_arr['module'] != 'EmailAddress') {
                    $idName = $bean_arr['id_name'];
                    if (isset($bean->field_defs[$idName]) && $bean->field_defs[$idName]['source'] != 'non-db') {
                        if (!isset($object_arr[$bean_arr['module']]))
                            $object_arr[$bean_arr['module']] = $bean->$idName;
                    }
                }
            }
            else if ($bean_arr['type'] == 'link') {
                if (!isset($bean_arr['module']) || $bean_arr['module'] == '')
                    $bean_arr['module'] = getRelatedModule($bean->module_dir, $bean_arr['name']);
                if (isset($bean_arr['module']) && $bean_arr['module'] != '' && !isset($object_arr[$bean_arr['module']]) && $bean_arr['module'] != 'EmailAddress') {
                    $linkedBeans = $bean->get_linked_beans($bean_arr['name'], $bean_arr['module'], array(), 0, 1);
                    if ($linkedBeans) {
                        $linkedBean = $linkedBeans[0];
                        if (!isset($object_arr[$linkedBean->module_dir]))
                            $object_arr[$linkedBean->module_dir] = $linkedBean->id;
                    }
                }
            }
        }

        $object_arr['Users'] = is_a($bean, 'User') ? $bean->id : $bean->assigned_user_id;

        $object_arr = array_merge($object_arr, $object_override);

        $parsedSiteUrl = parse_url($sugar_config['site_url']);
        $host = $parsedSiteUrl['host'];
        if (!isset($parsedSiteUrl['port'])) {
            $parsedSiteUrl['port'] = 80;
        }

        $port = ($parsedSiteUrl['port'] != 80) ? ":" . $parsedSiteUrl['port'] : '';
        $path = !empty($parsedSiteUrl['path']) ? $parsedSiteUrl['path'] : "";
        $cleanUrl = "{$parsedSiteUrl['scheme']}://{$host}{$port}{$path}";

        $url = $cleanUrl . "/index.php?module={$bean->module_dir}&action=DetailView&record={$bean->id}";

        $template->subject = str_replace("\$contact_user", "\$user", $template->subject);
        $template->body_html = str_replace("\$contact_user", "\$user", $template->body_html);
        $template->body = str_replace("\$contact_user", "\$user", $template->body);
        $template->subject = aowTemplateParser::parse_template($template->subject, $object_arr);
        $template->body_html = aowTemplateParser::parse_template($template->body_html, $object_arr);
        $template->body_html = str_replace("\$url", $url, $template->body_html);
        $template->body = aowTemplateParser::parse_template($template->body, $object_arr);
        $template->body = str_replace("\$url", $url, $template->body);
    }

    function getAttachments(EmailTemplate $template) {

        $attachments = array();
        if ($template->id != '') {
            $note_bean = new Note();
            $notes = $note_bean->get_full_list('', "parent_type = 'Emails' AND parent_id = '" . $template->id . "'");

            if ($notes != null) {
                foreach ($notes as $note) {
                    $attachments[] = $note;
                }
            }
        }
        return $attachments;
    }

    function sendEmail($emailTo, $emailSubject, $emailBody, $altemailBody, SugarBean $relatedBean = null, $emailCc = array(), $emailBcc = array(), $attachments = array()) {
        require_once('modules/Emails/Email.php');
        require_once('include/SugarPHPMailer.php');

        $emailObj = new Email();
        $defaults = $emailObj->getSystemDefaultEmail();
        $mail = new SugarPHPMailer();
        $mail->setMailerForSystem();
        $mail->From = $defaults['email'];
        $mail->FromName = $defaults['name'];
        $mail->ClearAllRecipients();
        $mail->ClearReplyTos();
        $mail->Subject = from_html($emailSubject);
        $mail->Body = $emailBody;
        $mail->AltBody = $altemailBody;
        $mail->handleAttachments($attachments);
        $mail->prepForOutbound();

        if (empty($emailTo))
            return false;
        foreach ($emailTo as $to) {
            $mail->AddAddress($to);
        }
        if (!empty($emailCc)) {
            foreach ($emailCc as $email) {
                $mail->AddCC($email);
            }
        }
        if (!empty($emailBcc)) {
            foreach ($emailBcc as $email) {
                $mail->AddBCC($email);
            }
        }

        //now create email
        if (@$mail->Send()) {
            $emailObj->to_addrs = implode(',', $emailTo);
            $emailObj->cc_addrs = implode(',', $emailCc);
            $emailObj->bcc_addrs = implode(',', $emailBcc);
            $emailObj->type = 'out';
            $emailObj->deleted = '0';
            $emailObj->name = $mail->Subject;
            $emailObj->description = $mail->AltBody;
            $emailObj->description_html = $mail->Body;
            $emailObj->from_addr = $mail->From;
            if ($relatedBean instanceOf SugarBean && !empty($relatedBean->id)) {
                $emailObj->parent_type = $relatedBean->module_dir;
                $emailObj->parent_id = $relatedBean->id;
            }
            $emailObj->date_sent = TimeDate::getInstance()->nowDb();
            $emailObj->modified_user_id = '1';
            $emailObj->created_by = '1';
            $emailObj->status = 'sent';
            $emailObj->save();

            // Fix for issue 1561 - Email Attachments Sent By Workflow Do Not Show In Related Activity.
            foreach ($attachments as $attachment) {
                $note = new Note();
                $note->id = create_guid();
                $note->date_entered = $attachment->date_entered;
                $note->date_modified = $attachment->date_modified;
                $note->modified_user_id = $attachment->modified_user_id;
                $note->assigned_user_id = $attachment->assigned_user_id;
                $note->new_with_id = true;
                $note->parent_id = $emailObj->id;
                $note->parent_type = $attachment->parent_type;
                $note->name = $attachment->name;
                ;
                $note->filename = $attachment->filename;
                $note->file_mime_type = $attachment->file_mime_type;
                $fileLocation = "upload://{$attachment->id}";
                $dest = "upload://{$note->id}";
                if (!copy($fileLocation, $dest)) {
                    $GLOBALS['log']->debug("EMAIL 2.0: could not copy attachment file to $fileLocation => $dest");
                }
                $note->save();
            }
            return true;
        }
        return false;
    }

    function Sending_SMS_CE($emailTo, $emailSubject, $emailBody, $altemailBody, SugarBean $relatedBean = null, $emailCc = array(), $emailBcc = array(), $attachments = array(), $Email_TNAME) {
        global $sugar_config, $db, $current_user, $timedate;
        require_once('modules/CE_SMS_Configuration/CE_SMS_Utils.php');
        $ce_sms_utils = new ce_sms_utils();


        $gateway = $sugar_config['ce_sms_type'];

        foreach ($emailTo as $to) {

            if ($gateway === "Twilio") {

                $sql_tw = "Select tw_account_sid, tw_auth_token, tw_from_number, tw_to_number from ce_sms_configuration where sms_type = 'Twilio'";
                $result_tw = $GLOBALS['db']->query($sql_tw);
                $row_tw = $GLOBALS['db']->fetchByAssoc($result_tw);
                $altemailBody = htmlspecialchars_decode($altemailBody, ENT_QUOTES);
                $post = array(
                    "From" => trim($row_tw['tw_from_number']),
                    "To" => "+" . trim($to),
                    "Body" => $altemailBody
                );
                $ch = curl_init();
                $tl_url = "https://api.twilio.com/2010-04-01/Accounts/" . trim($row_tw['tw_account_sid']) . "/Messages.json";
                curl_setopt($ch, CURLOPT_URL, $tl_url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
                curl_setopt($ch, CURLOPT_USERPWD, trim($row_tw['tw_account_sid']) . ":" . $row_tw['tw_auth_token']);
                $result = curl_exec($ch);
                curl_close($ch);

                $result_sms = json_decode($result, true);

                //$GLOBALS['log']->fatal("CALLED124" . print_r($result_sms, true));
                if (!empty($result_sms['sid'])) {
                    $call_status = "Sent";
                } else {
                    $call_status = "Failure";
                    $GLOBALS['log']->fatal("Workflow SMS Sending Failed");
                }
                //Create the sms
                $ce_sms_utils->create_sms($Email_TNAME, $altemailBody, $call_status, $relatedBean->module_dir, $relatedBean->id);
            }

            if ($gateway === "Http") {
                $message_p = htmlspecialchars_decode($altemailBody, ENT_QUOTES);
                $message_p = rawurlencode($message_p);
                $final_url = $ce_sms_utils->httpurl($to, $message_p);
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $final_url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                $result = curl_exec($ch);
                curl_close($ch);

                if (!empty($result)) {
                    $call_status = "Sent";
                } else {
                    $call_status = "Failure";
                    $GLOBALS['log']->fatal("Workflow SMS Sending Failed");
                }

                //Create the sms
                $ce_sms_utils->create_sms($Email_TNAME, $altemailBody, $call_status, $relatedBean->module_dir, $relatedBean->id);
            }

            if ($gateway === "Plivo") {

                $sql_pl = "Select pl_auth_id, pl_auth_token, pl_src_number, pl_text, pl_destination, pl_api_url from ce_sms_configuration where sms_type = 'Plivo'";
                $result_pl = $GLOBALS['db']->query($sql_pl);
                $row_pl = $GLOBALS['db']->fetchByAssoc($result_pl);

                    $message = htmlspecialchars_decode($altemailBody, ENT_QUOTES);
                    $post = array(
                        "src" => trim($row_pl['pl_src_number']),
                        "dst" => trim($to),
                        "text" => $message
                    );
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $row_pl['pl_api_url']);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($post));
                    curl_setopt($ch, CURLOPT_USERPWD, $row_pl['pl_auth_id'] . ":" . $row_pl['pl_auth_token']);

                    $headers = array();
                    $headers[] = "Content-Type: application/json";
                    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

                    $result = curl_exec($ch);
                    curl_close($ch);

                    $result_sms = json_decode($result);
                    //$GLOBALS['log']->fatal(print_r($result_sms,true));
                    if (!empty($result_sms->message_uuid[0])) {
                        $call_status = "Sent";
                    } else {
                        $call_status = "Failure";
                        $GLOBALS['log']->fatal("Workflow SMS Sending Failed");
                    }
                    //Create the sms
                    $ce_sms_utils->create_sms($Email_TNAME, $altemailBody, $call_status, $relatedBean->module_dir, $relatedBean->id);
                
            }
        }


        return true;
    }

}
