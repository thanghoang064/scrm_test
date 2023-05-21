<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('modules/CE_SMS_Configuration/CE_SMS_Utils.php');
require_once('modules/CE_SMS_Configuration/license/OutfittersLicense.php');

$ce_sms_utils = new ce_sms_utils();
require_once("include/TimeDate.php");
$DateTime = new TimeDate();
if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "get_smsbulk_body")) {
    require_once('modules/ACLRoles/ACLRole.php');
    global $current_user;
    $roles = ACLRole::getUserRoleNames($current_user->id);
    if (!in_array("Leader", $roles)) {
        echo "<font color='red' style='font-weight: bold;'>Chỉ trưởng phòng mới sử dụng được chức năng này!.</font>";
        return;
    }

    $modulefrom = trim($_REQUEST['modulefrom']);
    $recid = trim($_REQUEST['recid']);
    $gotres = $ce_sms_utils->getmobilenumbers($modulefrom, $recid);
    $mobilenumbers = $gotres['sms_rec_list'];
    $recid_res = serialize($gotres);
    $sql_et = "SELECT et.id,et.name FROM email_templates as et,email_templates_cstm as etc where et.id=etc.id_c and type='sms' and etc.sms_module_c='$modulefrom' and et.deleted=0";
    $result_et = $GLOBALS['db']->query($sql_et);
    $total_recs = $result_et->num_rows;
    if (!empty($modulefrom) && $total_recs >= 1) {
        $optionlist = "<option value='NS'>--Not Selected--</option>";
        while ($row_et = $GLOBALS['db']->fetchByAssoc($result_et)) {
            //Use $row['id'] to grab the id fields value
            $id = $row_et['id'];
            $etname = $row_et['name'];
            $optionlist .= "<option value='$id'>$etname</option>";
        }
    } else {
        $optionlist = "<option>No SMS Template Found</option>";
    }
    $validate = SMSOutfittersLicense::isValid('CE_SMS_Configuration');
    if ($validate == 1) {
        echo "<div class='panel-body panel-collapse collapse in' id='detailpanel_-1'>"
            . "<div class='tab-content'><div class='row edit-view-row'>"
            . "<font color='red' style='text-align: center;'><span id='errr_msg' style='display:none'><b>Empty message cant be send.</b></span></font>"
            . "<div id='loading_whatsapp' style='display:none'><div style='display: flex;justify-content: center;'><image src='modules/CE_SMS_Configuration/images/sms_loading.gif'/></div></div>"
            . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
            . "<div class='col-xs-12 col-sm-4 label'>"
            . "Send to Numbers:</div><br>"
            . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
            . "<textarea id='bulkmobile_numbers' rows='2' cols='90'>" . $mobilenumbers . "</textarea>"
            . "</div>"
            . "</div>"
            . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
            . "<div class='col-xs-12 col-sm-4 label'>Select Template:</div><br>"
            . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
            . "<select style='width:90%' name='bulktemplate_id' id='bulktemplate_id'>$optionlist</select>"
            . "</div></div>"
            . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
            . "<div class='col-xs-12 col-sm-4 label'>"
            . "Message Description:</div><br>"
            . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
            . "<textarea id='bulksms_description' rows='3' cols='90' maxlength='160'></textarea>"
            . "</div>"
            . "<input type='hidden' name='sl_mod' id='bulk_sl_mod' value='$modulefrom'/>"
            . "<input type='hidden' name='sl_mod_id' id='bulk_sl_mod_id' value='$recid_res'/>"
            . "</div>"
            . "</div></div></div>";
    } else {
        echo "CE SMS addon is not active.";
    }
}

if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "get_test_body")) {
    $searcharray = array();
    parse_str($_REQUEST['finals'], $searcharray);
    $result_s = "";
    if ($searcharray['gateway'] == "Twilio") {
        $post = array(
            "From" => "+" . trim($searcharray['from_number']),
            "To" => "+" . trim($searcharray['twilio_to']),
            "Body" => "Twilio Testing"
        );

        $ch = curl_init();
        $tl_url = "https://api.twilio.com/2010-04-01/Accounts/" . trim($searcharray['account_sid']) . "/Messages.json";
        curl_setopt($ch, CURLOPT_URL, $tl_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        curl_setopt($ch, CURLOPT_USERPWD, trim($searcharray['account_sid']) . ":" . $searcharray['auth_token']);
        $result = curl_exec($ch);
        curl_close($ch);

        $result_sms = json_decode($result, true);
        if (!empty($result_sms['sid'])) {
            $result_s = "<font color='green'>Message Successfully Sent</font>";
        } else {
            $result_s = print_r($result_sms, true);
        }
    }

    if ($searcharray['gateway'] == "Http") {
        $split_number = explode("=", trim($searcharray['http_to']));
        $split_text = explode("=", trim($searcharray['parameter7']));
        $final_url = $ce_sms_utils->httpurl("+" . trim($split_number[1]), rawurlencode($split_text[1]));

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $final_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);
        $result_s .= $final_url . "<br><font color='green'>Message Sent</font><br><br>";

        if (!empty($result)) {
            $result_s .= print_r($result, true);
        }
    }

    if ($searcharray['gateway'] == "Plivo") {
        $post = array(
            "src" => trim($searcharray['plivo_src']),
            "dst" => trim($searcharray['pl_destination']),
            "text" => $searcharray['plivo_text']
        );
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $searcharray['pl_api_url']);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($post));
        curl_setopt($ch, CURLOPT_USERPWD, $searcharray['plivo_auth_id'] . ":" . $searcharray['plivo_auth_token']);

        $headers = array();
        $headers[] = "Content-Type: application/json";
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $result = curl_exec($ch);
        curl_close($ch);

        $result_sms = json_decode($result);
        if (!empty($result_sms->message_uuid[0])) {
            $result_s = "<font color='green'>Message successfully Sent</font><br><br>";
        } else {
            $result_s = print_r($result, true);
        }
    }

    if (empty($result_s)) {
        $result_s = "Please enter details of SMS gateway";
    }

    echo "<div class='panel-body panel-collapse collapse in' id='detailpanel_-1'>"
        . "<div class='tab-content'><div class='row edit-view-row'>"
        . "<div class='col-xs-12 col-sm-6 edit-view-row-item' style='float: left;overflow-y: auto;height: 100%;'>"
        . "<div class='col-xs-12 col-sm-4 label'>"
        . "Testing Message Results:- <br> <pre>"
        . $result_s
        . "</pre></div>"
        . "</div>"
        . "</div></div></div>";
}
if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "get_sms_body")) {
    
    require_once('modules/ACLRoles/ACLRole.php');
    global $current_user;
    $roles = ACLRole::getUserRoleNames($current_user->id);

    $sql = "SELECT id FROM calls WHERE assigned_user_id ='$current_user->id' AND name='OutboundSMS' AND DATE(date_modified) = CURDATE()";
    $result = $GLOBALS['db']->query($sql);

    while($call = $GLOBALS['db']->fetchByAssoc($result)){
        $calls[] = $call;
    }

    $warn = "<font style='font-weight: bold;'>Bạn đã gửi ".count($calls)." SMS trong ngày hôm nay.</font>";
    if (!in_array("Leader", $roles) && count($calls) >= 299) {
        $warn = "<font color='red' style='font-weight: bold;'>Hôm nay bạn đã gửi hết 300 SMS.</font>";
    }

    $mobile = trim($_REQUEST['mobile']);
    $modulefrom = trim($_REQUEST['modulefrom']);
    $recid = trim($_REQUEST['recid']);
    $sql_et = "SELECT et.id,et.name FROM email_templates as et,email_templates_cstm as etc where et.id=etc.id_c and type='sms' and etc.sms_module_c='$modulefrom' and et.deleted=0";
    $result_et = $GLOBALS['db']->query($sql_et);
    $total_recs = $result_et->num_rows;
    if (!empty($modulefrom) && $total_recs >= 1) {
        $optionlist = "<option value='NS'>--Not Selected--</option>";
        while ($row_et = $GLOBALS['db']->fetchByAssoc($result_et)) {
            $id = $row_et['id'];
            $etname = $row_et['name'];
            $optionlist .= "<option value='$id'>$etname</option>";
        }
    } else {
        $optionlist = "<option>No SMS Template Found</option>";
    }
    $validate = SMSOutfittersLicense::isValid('CE_SMS_Configuration');
    if ($validate == 1) {
        echo "<div class='modal-header' style='background:#66727d;padding:5px'>"
            . "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>×</span></button>"
            . "<h4 class='modal-title' style='color:#fff'><b>New SMS</b></h4>"
            . "</div>"
            . "<div class='modal-body' id='sms_dashboardDialog' style='display:block'>"
            . $warn
            . "<div class='panel-body panel-collapse collapse in' id='detailpanel_-1'>"
            . "<div class='tab-content'><div class='row edit-view-row modal-body' style='margin-bottom:-30px;margin-top:-10px'>"
            . "<font color='red' style='text-align: center;'><span id='errr_msg' style='display:none'><b>Empty message cant be send.</b></span></font>"
            . "<div id='loading_sms' style='display:none'><div style='display: flex;justify-content: center;'><image src='modules/CE_SMS_Configuration/images/sms_loading.gif'/></div></div>"

            . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
            . "<div class='col-xs-12 col-sm-4 label'>"
            . "Send to Numbers:</div><br>"
            . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
            . "<textarea id='mobile_numbers' rows='1' cols='90'>" . $mobile . "</textarea>"
            . "</div>"
            . "</div>"

            . "</div></div>"
            . "</div>"

            . "<div style='padding:1.0em 1.4em 0.3em'>"
            . "History:</div>"
            . "<div class='modal-body' id='sms_history' style='display:block'>"
            . "</div>"

            . "<div class='tab-content'><div id='text-message'><div class='row edit-view-row modal-body' style='margin-bottom:-25px'>"

            . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
            . "<div class='col-xs-12 col-sm-4 label'>Select Template:</div><br>"
            . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
            . "<select style='width:90%' name='template_id' id='template_id'>$optionlist</select>"
            . "</div></div>"

            . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
            . "<div class='col-xs-12 col-sm-4 label'>"
            . "Message :</div><br>"
            . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
            . "<textarea id='sms_description' rows='1' cols='90' maxlength='160'></textarea>"
            . "</div>"
            . "<input type='hidden' name='sl_mod' id='sl_mod' value='$modulefrom'/>"
            . "<input type='hidden' name='sl_mod_id' id='sl_mod_id' value='$recid'/>"
            . "</div>"
            . "</div>"
            . "</div>"
            . "</div>"
            . "</div>"
            . "<div class='modal-footer' style='background-color:#F5F5F5'>"
            . "<button type='button' class='button' id='rec_history_sms' hidden>History</button> &nbsp;"
            . "<button type='button' class='button' id='refresh_history_sms' hidden>Refresh</button> &nbsp;"
            . "<button type='button' class='button' id='mod_can' data-dismiss='modal'>Close</button> &nbsp;"
            . "<button type='submit' id='submit' class='button'>Send</button> &nbsp;"
            . "<button type='submit' id='schedule' class='button'>Schedule SMS</button></div>";
    } else {
        echo "CE SMS addon is not active.";
    }
}
if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "sms_fetch")) {

    $et_id = trim($_REQUEST['et_id']);
    $sl_mod = trim($_REQUEST['sl_mod']);
    $sl_mod_id = trim($_REQUEST['sl_mod_id']);
    $template = new EmailTemplate();
    $template->retrieve_by_string_fields(array('id' => $et_id, 'type' => 'sms'));
    $module_et = BeanFactory::getBean($sl_mod, $sl_mod_id);
    //Parse Body HTML
    echo $template->body = $template->parse_template_bean($template->body, $module_et->module_dir, $module_et);
}

if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "bulksms_fetch")) {
    $et_id = trim($_REQUEST['et_id']);
    $template = new EmailTemplate();
    $template->retrieve_by_string_fields(array('id' => $et_id, 'type' => 'sms'));
    echo $template->body;
}
if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "send_sms")) {

    global $sugar_config;
    $mobile_numbers = $_REQUEST['mobile_numbers'];
    $template_name = trim($_REQUEST['template_name']);
    $message = $_REQUEST['body'];
    $sl_mod = trim($_REQUEST['sl_mod']);
    $sl_mod_id = trim($_REQUEST['sl_mod_id']);
    $selected_gateway = trim($sugar_config['ce_sms_type']);
    if ($selected_gateway === "Http") {
        echo $ce_sms_utils->sendbyhttp($mobile_numbers, $template_name, $message, $sl_mod, $sl_mod_id);
    }
    if ($selected_gateway === "Plivo") {
        echo $ce_sms_utils->sendbyplivo($mobile_numbers, $template_name, $message, $sl_mod, $sl_mod_id);
    }
    if ($selected_gateway === "Twilio") {
        echo $ce_sms_utils->sendbytwilio($mobile_numbers, $template_name, $message, $sl_mod, $sl_mod_id);
    }
    if ($selected_gateway === "Dinstar") {
        echo $ce_sms_utils->sendbydinstar($mobile_numbers, $template_name, $message, $sl_mod, $sl_mod_id);
    }
    // print_r(explode(",",$mobile_numbers));
}
if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "bulksend_sms")) {
    global $sugar_config;
    $template_id = $_REQUEST['template_id'];
    $template_name = $_REQUEST['template_name'];
    $mobile_numbers = $_REQUEST['mobile_numbers'];
    $sl_mod = trim($_REQUEST['sl_mod']);
    $numbers_array2 = htmlspecialchars_decode(trim($_REQUEST['sl_mod_id']), ENT_QUOTES);
    $numbers_array = unserialize($numbers_array2);
    $body = trim($_REQUEST['body']);
    $mobile_numbers_arr = explode(",", $mobile_numbers);

    for ($bm = 0; $bm < count($mobile_numbers_arr); $bm++) {
        $mobile_numberss = $mobile_numbers_arr[$bm];
        $mob_record = $numbers_array[$mobile_numbers_arr[$bm]];
        if ($template_id == "No SMS Template Found") {
            $template_name = "Template Not Selected";
            $message = $body;
        } else {
            $template = new EmailTemplate();
            $template->retrieve_by_string_fields(array('id' => $template_id, 'type' => 'sms'));
            $module_et = BeanFactory::getBean($sl_mod, $mob_record);
            $message = $template->body = $template->parse_template_bean($template->body, $module_et->module_dir, $module_et);
        }
        // $selected_gateway = trim($sugar_config['ce_sms_type']);
        echo $ce_sms_utils->sendbyhttp($mobile_numberss, $template_name, $message, $sl_mod, $mob_record);
    }
}
//
if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "sms_history")) {

    $sl_mod = trim($_REQUEST['sl_mod']);
    $sl_mod_id = trim($_REQUEST['sl_mod_id']);
    $whatsapp_history_inner = '';
    $sql_whatsapp_history = "SELECT name,date_entered,description,status,direction FROM calls WHERE parent_id LIKE '" . $sl_mod_id . "' and (name LIKE '%InboundSMS%' or name LIKE '%OutboundSMS%') and deleted=0 ORDER BY date_entered DESC";
    $GLOBALS['log']->fatal($sql_whatsapp_history);
    $result_wh = $GLOBALS['db']->query($sql_whatsapp_history);
    $records = "not";
    while ($row_wh = $GLOBALS['db']->fetchByAssoc($result_wh)) {

        $direction = $row_wh['direction'];
        $msgdate = $DateTime->to_display_date_time($row_wh['date_entered'], true, true, $GLOBALS['current_user']);
        if ($direction == "Inbound" && !empty($row_wh['description'])) {
            $whatsapp_history_inner .= '<div class="shoutbox-list-left" id="list-24" style="float: left;"><span class="shoutbox-list-time">' . $msgdate . '</span><br><span class="shoutbox-list-nick"><span class="users-list tome extra-class-left" style="margin:-4px;" usr_id="admin"></span></span><span class="shoutbox-list-message" style="margin-left: 2px;">' . $row_wh['description'] . '</span></div>';
        }
        if ($direction == "Outbound" && !empty($row_wh['description'])) {
            $sts_red = "";
            if ($row_wh['status'] == "Failure") {
                $sts_red = "<img src='modules/CE_SMS_Configuration/images/failed.png' style='width:24px;height::24px'/>";
            }
            $whatsapp_history_inner .= '<div class="shoutbox-list-right" id="list-24" style="float: right;"><span class="shoutbox-list-time">' . $msgdate . '</span><br><span class="shoutbox-list-nick"><span class="isay extra-class-right" style="margin:-4px;" usr_id="admin"></span></span><span class="shoutbox-list-message" style="margin-left: 2px;">' . $row_wh['description'] . $sts_red . '</span></div>';
        }
        $records = "yes";
    }
    $whatsapp_history_footer = '<div>';
    if ($records == "not") {
        $whatsapp_history_header = '<div id="history-list" class="panel-body panel-collapse collapse in" style="overflow: auto; height: 120px;width: 100%; display: block;">';
        $whatsapp_history_inner .= '<div>&nbsp;&nbsp;No History Found</div>';
    } else {
        $whatsapp_history_header = '<div id="history-list" class="panel-body panel-collapse collapse in" style="overflow: auto; height: 200px;width: 100%; display: block;">';
    }
    echo $whatsapp_history_header . $whatsapp_history_inner . $whatsapp_history_footer;
}
if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "sms_history_refresh")) {

    $sl_mod = trim($_REQUEST['sl_mod']);
    $sl_mod_id = trim($_REQUEST['sl_mod_id']);
    $whatsapp_history_inner = '';
    $sql_whatsapp_history = "SELECT name,date_entered,description,status,direction FROM calls WHERE parent_id LIKE '" . $sl_mod_id . "' and (name LIKE '%InboundSMS%' or name LIKE '%OutboundSMS%') and deleted=0 ORDER BY date_entered DESC";
    // $GLOBALS['log']->fatal("Refresh:-".$sql_whatsapp_history);
    $result_wh = $GLOBALS['db']->query($sql_whatsapp_history);
    $records = "not";
    while ($row_wh = $GLOBALS['db']->fetchByAssoc($result_wh)) {
        $direction = $row_wh['direction'];
        $msgdate = $DateTime->to_display_date_time($row_wh['date_entered'], true, true, $GLOBALS['current_user']);
        if ($direction == "Inbound" && !empty($row_wh['description'])) {
            $whatsapp_history_inner .= '<div class="shoutbox-list-left" id="list-24" style="float: left;"><span class="shoutbox-list-time">' . $msgdate . '</span><br><span class="shoutbox-list-nick"><span class="users-list tome extra-class-left" style="margin:-4px;" usr_id="admin"></span></span><span class="shoutbox-list-message" style="margin-left: 2px;">' . $row_wh['description'] . '</span></div>';
        }
        if ($direction == "Outbound" && !empty($row_wh['description'])) {
            $sts_red = "";
            if ($row_wh['status'] == "Failure") {
                $sts_red = "<img src='modules/CE_SMS_Configuration/images/failed.png' style='width:24px;height::24px'/>";
            }
            $whatsapp_history_inner .= '<div class="shoutbox-list-right" id="list-24" style="float: right;"><span class="shoutbox-list-time">' . $msgdate . '</span><br><span class="shoutbox-list-nick"><span class="isay extra-class-right" style="margin:-4px;" usr_id="admin"></span></span><span class="shoutbox-list-message" style="margin-left: 2px;">' . $row_wh['description'] . $sts_red . '</span></div>';
        }
        $records = "yes";
    }
    $whatsapp_history_footer = '<div>';
    if ($records == "not") {
        $whatsapp_history_header = '<div id="history-list" class="panel-body panel-collapse collapse in" style="overflow: auto; height: 20px;width: 100%; display: block;">';
        $whatsapp_history_inner .= '<div>&nbsp;&nbsp;No History Found</div>';
    } else {
        $whatsapp_history_header = '<div id="history-list" class="panel-body panel-collapse collapse in" style="overflow: auto; height: 200px;width: 100%; display: block;">';
    }
    echo $whatsapp_history_inner;
}
if (isset($_REQUEST['action']) && trim($_REQUEST['action'] === "send_sms_target")) {
    // echo "<pre>";
    $targetId = $_REQUEST['recid'];
    $moduleNameFrom = "ProspectLists";
    $targetListQuery    = "SELECT *  FROM `prospect_lists_prospects` WHERE `prospect_list_id` LIKE '$targetId' AND deleted = 0";
    $resultTargetResult = $GLOBALS['db']->query($targetListQuery);
    $totalTargetNum     = $resultTargetResult->num_rows;
    if ($totalTargetNum > 0) {
        while ($targetListRow = $GLOBALS['db']->fetchByAssoc($resultTargetResult)) {
            $moduleName = $targetListRow['related_type'];
            $moduleID   = $targetListRow['related_id'];
            $moduleBean = BeanFactory::getBean($moduleName, $moduleID);
            if ($moduleBean->module_name == "Prospects" || $moduleBean->module_name == "Contacts" || $moduleBean->module_name == "Leads") {
                $phoneNumber[$moduleBean->id . "_" . $moduleBean->module_name . "_" . $moduleBean->phone_mobile] = trim($moduleBean->phone_mobile);
            }
        }
    }
    $mobileNumber = implode(",", $phoneNumber);
    $sql_et = "SELECT et.id,et.name FROM email_templates as et,email_templates_cstm as etc where et.id=etc.id_c and type='sms' and etc.sms_module_c='$moduleNameFrom' and et.deleted=0";
    $result_et = $GLOBALS['db']->query($sql_et);
    $total_recs = $result_et->num_rows;

    if (!empty($moduleNameFrom) && $total_recs >= 1) {
        $optionlist = "<option value='NS'>--Not Selected--</option>";

        while ($row_et = $GLOBALS['db']->fetchByAssoc($result_et)) {
            //Use $row['id'] to grab the id fields value
            $id = $row_et['id'];
            $etname = $row_et['name'];
            $optionlist .= "<option value='$id'>$etname</option>";
        }
    } else {
        $optionlist = "<option>No SMS Template Found</option>";
    }

    echo "<div class='panel-body panel-collapse collapse in' id='detailpanel_-1'>"
        . "<div class='tab-content'><div class='row edit-view-row'>"
        . "<font color='red' style='text-align: center;'><span id='errr_msg' style='display:none'><b>Empty message cant be send.</b></span></font>"
        . "<div id='loading_sms' style='display:none'><div style='display: flex;justify-content: center;'><image src='modules/CE_SMS_Configuration/images/sms_loading.gif'/></div></div>"
        . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
        . "<div class='col-xs-12 col-sm-4 label'>"
        . "Send to Numbers:</div><br>"
        . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
        . "<textarea id='bulkmobile_numbers' rows='2' cols='90'>" . $mobileNumber . "</textarea>"
        . "</div>"
        . "</div>"
        . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
        . "<div class='col-xs-12 col-sm-4 label'>Select Template:</div><br>"
        . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
        . "<select style='width:90%' name='bulktemplate_id' id='bulktemplate_id'>$optionlist</select>"
        . "</div></div>"
        . "<div class='col-xs-12 col-sm-6 edit-view-row-item'>"
        . "<div class='col-xs-12 col-sm-4 label'>"
        . "SMS Description:</div><br>"
        . "<div class='col-xs-12 col-sm-8 edit-view-field ' type='varchar'>"
        . "<textarea id='bulksms_description' rows='3' cols='90' maxlength='160'></textarea>"
        . "</div>"
        . "<input type='hidden' name='sl_mod' id='bulk_sl_mod' value='$moduleNameFrom'/>"
        . "<input type='hidden' name='sl_mod_id' id='bulk_sl_mod_id' value='$targetId'/>"
        . "</div>"
        . "</div></div></div>";
}
