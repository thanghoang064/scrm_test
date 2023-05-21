<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}


class ce_sms_utils
{

    function getmobilenumbers($modulefrom, $records)
    {

        $sending_rec_id = explode(",", $records);

        $listwithnumber = array();
        $mobile_list = "";
        for ($ismsc = 0; $ismsc < count($sending_rec_id); $ismsc++) {
            $phone_mobile = $this->getnumberfromid($modulefrom, $sending_rec_id[$ismsc]);
            $listwithnumber[$phone_mobile] = $sending_rec_id[$ismsc];
            if ((count($sending_rec_id) - 1) == $ismsc) {
                $mobile_list .= $phone_mobile;
            } else {
                $mobile_list .= $phone_mobile . ",";
            }
        }
        $listwithnumber['sms_rec_list'] = $mobile_list;
        return $listwithnumber;
    }

    function save_gateway($REQUEST)
    {

        // Http Gateway Variables
        $gateway = trim($_REQUEST['gateway']);
        $username = trim($_REQUEST['username']);
        $password = trim($_REQUEST['password']);
        $from = trim($_REQUEST['from']);
        $parameter1 = trim($_REQUEST['parameter1']);
        $parameter2 = trim($_REQUEST['parameter2']);
        $parameter3 = trim($_REQUEST['parameter3']);
        $parameter4 = trim($_REQUEST['parameter4']);
        $parameter5 = trim($_REQUEST['parameter5']);
        $parameter6 = trim($_REQUEST['parameter6']);
        $parameter7 = trim($_REQUEST['parameter7']);
        $http_to = trim($_REQUEST['http_to']);
        $api_url = trim($_REQUEST['api_url']);

        //Twilio Variable
        $account_sid = trim($_REQUEST['account_sid']);
        $auth_token = trim($_REQUEST['auth_token']);
        $from_number = trim($_REQUEST['from_number']);
        $twilio_to = trim($_REQUEST['twilio_to']);

        //Plivo Variable

        $plivo_auth_id = trim($_REQUEST['plivo_auth_id']);
        $plivo_src = trim($_REQUEST['plivo_src']);
        $plivo_text = trim($_REQUEST['plivo_text']);
        $plivo_auth_token = trim($_REQUEST['plivo_auth_token']);
        $pl_destination = trim($_REQUEST['pl_destination']);
        $pl_api_url = trim($_REQUEST['pl_api_url']);

        $checking_rec = $this->record_avail($gateway);

        if (empty($checking_rec)) {
            //Insesrt gateway
            if ($gateway === "Http") {
                $sql_ht = "INSERT INTO ce_sms_configuration (id, username, password, from_number, parameter_one, parameter_two, parameter_three, parameter_four, parameter_five, parameter_six, parameter_seven, to_number, api_url, sms_type)"
                    . " VALUES (uuid(), '$username', '$password', '$from', '$parameter1', '$parameter2', '$parameter3', '$parameter4', '$parameter5', '$parameter6', '$parameter7', '$http_to', '$api_url', 'Http')";
                $result_ht = $GLOBALS['db']->query($sql_ht);
            }
            if ($gateway === "Twilio") {
                $sql_tw = "INSERT INTO ce_sms_configuration (id, tw_account_sid, tw_auth_token, tw_from_number, tw_to_number, sms_type) "
                    . "VALUES (uuid(), '$account_sid', '$auth_token', '$from_number', '$twilio_to', 'Twilio')";
                $result_tw = $GLOBALS['db']->query($sql_tw);
            }
            if ($gateway == "Plivo") {
                $sql_pl = "INSERT INTO ce_sms_configuration (id, pl_auth_id, pl_auth_token, pl_src_number, pl_text, pl_destination, pl_api_url, sms_type)"
                    . " VALUES (uuid(),'$plivo_auth_id', '$plivo_auth_token', '$plivo_src', '$plivo_text', '$pl_destination', '$pl_api_url', 'Plivo')";
                $result_pl = $GLOBALS['db']->query($sql_pl);
            }
        } else {
            //Update gateway
            if ($gateway === "Http") {
                $sql_ht_u = "Update ce_sms_configuration Set username='$username',password='$password', from_number='$from',"
                    . " parameter_one='$parameter1', parameter_two='$parameter2', parameter_three='$parameter3', parameter_four='$parameter4', "
                    . "parameter_five='$parameter5', parameter_six='$parameter6', parameter_seven='$parameter7', to_number='$http_to', api_url='$api_url' where sms_type = 'Http'";
                $result_ht_u = $GLOBALS['db']->query($sql_ht_u);
            }

            if ($gateway === "Twilio") {
                $sql_tw_u = "Update ce_sms_configuration Set tw_account_sid='$account_sid', tw_auth_token='$auth_token', tw_from_number='$from_number', tw_to_number='$twilio_to' where sms_type='Twilio'";
                $result_tw_u = $GLOBALS['db']->query($sql_tw_u);
            }

            if ($gateway === "Plivo") {
                $sql_pl = "Update ce_sms_configuration Set pl_auth_id='$plivo_auth_id', pl_auth_token='$plivo_auth_token', pl_src_number='$plivo_src', pl_text='$plivo_text', pl_destination='$pl_destination', pl_api_url='$pl_api_url' where sms_type='Plivo'";
                $result_pl = $GLOBALS['db']->query($sql_pl);
            }
        }
        //Update the gateway
        $this->save_type($gateway);
    }

    public function getnumberfromid($module, $rec_id)
    {

        $Bean = BeanFactory::newBean($module);
        $SearchSMS = $Bean->retrieve_by_string_fields(array('id' => $rec_id));
        $foundmobilenumb = "";
        if ($module == "Accounts") {
            $acc_val = array("phone_office", "phone_alternate", "phone_fax", "phone1_c");
            foreach ($acc_val as $fieldssearch_id) {
                $fieldssearch = trim($fieldssearch_id);
                $foundmob = $SearchSMS->$fieldssearch;
                if (!empty($foundmob)) {
                    $foundmobilenumb = $foundmob;
                    break;
                }
            }
        }

        if ($module == "Contacts") {
            $getarr_val = array("phone_mobile", "phone_other", "phone_work", "phone_fax", "phone_home");
            foreach ($getarr_val as $fieldssearch_id) {
                $fieldssearch = trim($fieldssearch_id);
                $foundmob = $SearchSMS->$fieldssearch;
                if (!empty($foundmob)) {
                    $foundmobilenumb = $foundmob;
                    break;
                }
            }
        }

        if ($module == "Leads") {
            $getarr_val = array("phone_mobile", "phone_other", "phone_work", "phone_fax", "phone_home");
            foreach ($getarr_val as $fieldssearch_id) {
                $fieldssearch = trim($fieldssearch_id);
                $foundmob = $SearchSMS->$fieldssearch;
                if (!empty($foundmob)) {
                    $foundmobilenumb = $foundmob;
                    break;
                }
            }
        }

        return $foundmobilenumb;
    }

    function record_avail($type)
    {
        $sql_et = "SELECT id FROM ce_sms_configuration where sms_type='$type'";
        $result_et = $GLOBALS['db']->query($sql_et);
        $result_row = $GLOBALS['db']->fetchByAssoc($result_et);
        return $result_row['id'];
    }

    function save_type($ce_sms_type)
    {
        require_once('modules/Configurator/Configurator.php');
        $confi_sms = new Configurator();

        $confi_sms->loadConfig();
        $confi_sms->config['ce_sms_type'] = $ce_sms_type;
        $confi_sms->saveConfig();
    }

    function httpurl($mobtosend, $msgtosend)
    {
        $sql_et = "Select username, password, from_number, parameter_one, parameter_two, parameter_three, parameter_four, parameter_five, parameter_six, parameter_seven, to_number, api_url from ce_sms_configuration where sms_type = 'Http'";
        $result_et = $GLOBALS['db']->query($sql_et);
        $row_et = $GLOBALS['db']->fetchByAssoc($result_et);

        $smsparam = array();
        if (!empty($row_et['username'])) {
            array_push($smsparam, trim($row_et['username']));
        }
        if (!empty($row_et['password'])) {
            array_push($smsparam, trim($row_et['password']));
        }
        if (!empty($row_et['from_number'])) {
            array_push($smsparam, trim($row_et['from_number']));
        }
        if (!empty($row_et['parameter_one'])) {
            array_push($smsparam, trim($row_et['parameter_one']));
        }
        if (!empty($row_et['parameter_two'])) {
            array_push($smsparam, trim($row_et['parameter_two']));
        }
        if (!empty($row_et['parameter_three'])) {
            array_push($smsparam, trim($row_et['parameter_three']));
        }
        if (!empty($row_et['parameter_four'])) {
            array_push($smsparam, trim($row_et['parameter_four']));
        }

        if (!empty($row_et['parameter_five'])) {
            array_push($smsparam, trim($row_et['parameter_five']));
        }
        if (!empty($row_et['parameter_six'])) {
            array_push($smsparam, trim($row_et['parameter_six']));
        }

        //parameter7 = text
        if (!empty($row_et['parameter_seven'])) {
            $split_text = explode("=", trim($row_et['parameter_seven']));
            $to_text = $split_text[0] . "=" . $msgtosend;
            array_push($smsparam, $to_text);
        }
        //Number
        if (!empty($row_et['to_number'])) {
            $split_number = explode("=", trim($row_et['to_number']));
            $to_number = $split_number[0] . "=" . $mobtosend;
            array_push($smsparam, $to_number);
        }

        $api_url = trim($row_et['api_url']);

        for ($api = 0; $api < count($smsparam); $api++) {
            if (!empty($smsparam[$api])) {
                if ($api == 0) {
                    $api_url .= trim($smsparam[$api]);
                } else {
                    $api_url .= "&" . trim($smsparam[$api]);
                }
            }
        }

        return $api_url;
    }

    function sendbytwilio($mobile_numbers, $template_name, $message, $sl_mod, $sl_mod_id)
    {
        $sql_tw = "Select tw_account_sid, tw_auth_token, tw_from_number, tw_to_number from ce_sms_configuration where sms_type = 'Twilio'";
        $result_tw = $GLOBALS['db']->query($sql_tw);
        $row_tw = $GLOBALS['db']->fetchByAssoc($result_tw);

        $mobile_numbers_array = explode(",", $mobile_numbers);
        for ($ce = 0; $ce < count($mobile_numbers_array); $ce++) {

            $message = htmlspecialchars_decode($message, ENT_QUOTES);
            $post = array(
                "From" => trim($row_tw['tw_from_number']),
                "To" => "+" . trim($mobile_numbers_array[$ce]),
                "Body" => $message
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
            //$GLOBALS['log']->fatal(print_r($result_sms,true));
            if (!empty($result_sms['sid'])) {
                $call_status = "Sent";
            } else {
                $call_status = "Failure";
            }
            //Create the sms
            return $this->create_sms($template_name, $message, $call_status, $sl_mod, $sl_mod_id);
        }
    }

    function sendbyhttp($mobile_numbers, $template_name, $message, $sl_mod, $sl_mod_id)
    {

        if (strlen($message) > 160) {
            $call_status = "Failure";
            return;
        }

        require_once('modules/SecurityGroups/SecurityGroup.php');
        require_once('modules/ACLRoles/ACLRole.php');

        global $current_user;
        $roles = ACLRole::getUserRoleNames($current_user->id);


        $sql = "SELECT id FROM calls WHERE assigned_user_id ='$current_user->id' AND name='OutboundSMS' AND DATE(date_modified) = CURDATE()";
        $result = $GLOBALS['db']->query($sql);
        while ($call = $GLOBALS['db']->fetchByAssoc($result)) {
            $calls[] = $call;
        }

        if (!in_array("Leader", $roles) && count($calls) >= 299 && !empty($calls)) {
            $call_status = "Failure";
            return;
        }

        $security_group_arr = SecurityGroup::getUserSecurityGroups($current_user->id);

        // if (count($security_group_arr) > 2) {
        //     $call_status = "Failure";
        //     return;
        // }

        $security_group_id = array_values($security_group_arr)[0]['id'];

        $group_arr = [
            'd38a052c-3bfe-7286-f088-589d417b1578' => [
                'client_id' => '105fD5ed68f9D5b11fbbd09391c2F3819a522F80',
                'client_secret' => '811bb955b26c181841167eeA977bb799b8a1ec0182763a047e93d4baf613bb7345A52528' //hn
            ],
            'd7576688-99c0-52e4-b22f-6257cb378032' => [
                'brand_name' => 'CaoDang FPT',
                'client_id' => '162053A39540b932712605f237141daf8199D05e',
                'client_secret' => 'c571a9a43fa0ad1bb5df947Ce5fb4c8f918e4537aAd7f2B61aCabcc4cfd874c11415b361' //hp
            ],
            'b9f05e38-7c48-2de3-721f-589d3ff27e78' => [
                'client_id' => '2Bbc992289c7aB1Ea16DEa12198d8aa7197c2809',
                'client_secret' => '91c3d2C49764dc0aeAbe065893b599aA461a62e811e294207D3872b6ffaf453ab42D9b06' //hcm
            ],
            '4ad7e29a-c17e-eb4a-cb88-589d61641f51' => [
                'client_id' => '868a2FC3b8e4Bd2148c068df09055c4d03e4f633',
                'client_secret' => '65143a89121F43995451bf9a109Cdac0ff7007d835db11c7711388094b3ba6564e07Ed29' //danang
            ],
            '9fd2a5c7-dad7-c0ff-1469-589d403d0ced' => [
                'client_id' => 'b8c65Dc30Cb029FCd8615e4fc984aCe35ffeaf39',
                'client_secret' => '07D862714c6ab3ea0566fda91584f79aC4b556be64161eCe7a3b053635c4Fa29da96cd8e',
                // 'client_id' => '9C87ea4d2979d23b81618a8590bd7abe8732d8dC', 
                // 'client_secret' => 'C727a65fcd325eee1D2cAfBcf2fb81c8df55c21438Dbcb65bc9E5347a7de5ed8C95aaef3' //taynguyen
            ],
            'c7708bb1-668d-ba86-7c91-5a94bf7f722c' => [
                'client_id' => '3e258a4d32Ecc2961C289c60ffdc7df36Da1030c',
                'client_secret' => 'ad5dF131acd370072bc4232f15625b26b93f909084044670126f3f46c8fc5ee6d5687bb1' //cantho
            ],
            '724c8860-b55f-69e8-27b9-637b40a89488' => [
                'brand_name' => 'CaoDang FPT',
                'client_id' => '50b1645354957Ef4846b52d2c20F12899eD45E3b',
                'client_secret' => 'D008f86187d75c5955043a77d00B6966a22f94e0cAe3b88d70b0ec44b7e2f9c119ac18fc', // thanhhoa
            ],
            'aed1f6fb-7364-653a-270d-637b4069ab85' => [
                'brand_name' => 'CaoDang FPT',
                'client_id' => 'd2013D59AAA9176506cce9ce2f457481431de702',
                'client_secret' => 'ca7d6baa19c1b676bE46d40e5ae62a751d5e810b2bfae9ed2212bfdBc484b47ba97f8ed1' // hanam
            ],
            'b151efd4-969f-ffbc-4758-637b40674e6d' => [
                'brand_name' => 'CaoDang FPT',
                'client_id' => '208ee24638820b2d3D9ac4D9fc436Ae27c404D66',
                'client_secret' => '2f198fecF758eD1ca44756561593999887f627a79c9c9af5c59Cdf02d29aE22b072628c8' // quynhon
            ],
            '4d47149e-448c-89fc-5ee8-63a18b4497eb' => [
                'brand_name' => 'CaoDang FPT',
                'client_id' => 'd620991f860636bf7517ad4ffC6523019811Fdaa',
                'client_secret' => '2710b1Cefae9a8bdff93014daccEdb29617214e56403cac46dd824a7a3817cc0113a8c8a' // thainguyen
            ],
            'd9a88517-cb4f-d3a7-bb0d-63b7816f0f0a' => [
                'brand_name' => 'CaoDang FPT',
                'client_id' => '3162D6c0979f15a0716EA56bef3075dd734bbaf1',
                'client_secret' => '6E09c102e745ef421f04555e303cEf4c70e95107be02a47554276041D1725821D9a5fd7d' // dongnai
            ],
            '390447ba-fc1c-9172-b894-592f97096458' => [
                'client_id' => 'a9074d0e77c5C8cb68Bd0c0206D059236d927014',
                'client_secret' => '1a8d50c79e1beF75c95a95baC89249F169513a26ab73a09049fda8fdeeb4d14bf40e601B' //kbt hcm
            ],
            '7fe1a7a9-5b84-7447-0c37-592f97135c62' => [
                'client_id' => '105fD5ed68f9D5b11fbbd09391c2F3819a522F80',
                'client_secret' => '811bb955b26c181841167eeA977bb799b8a1ec0182763a047e93d4baf613bb7345A52528' //kbt hn
            ],
            '4d76ecb8-494c-86d6-4fdb-589d41939b5d' => [
                'client_id' => '105fD5ed68f9D5b11fbbd09391c2F3819a522F80',
                'client_secret' => '811bb955b26c181841167eeA977bb799b8a1ec0182763a047e93d4baf613bb7345A52528' //mkt
            ],

        ];

        $groupName = $group_arr[$security_group_id];

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://app.sms.fpt.net/oauth2/token',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => '{
                    "client_id": "' . $groupName['client_id'] . '",
                    "client_secret": "' . $groupName['client_secret'] . '",
                    "scope": "send_brandname_otp send_brandname",
                    "session_id": "' . md5(time()) . '",
                    "grant_type": "client_credentials"
                }',
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json'
            ),
        ));

        $response = json_decode(curl_exec($curl), true);
        curl_close($curl);
        // var_dump($response);

        $token = $response['access_token'];


        $mobile_numbers_array = explode(",", $mobile_numbers);
        for ($ce = 0; $ce < count($mobile_numbers_array); $ce++) {

            $messageBase64 = base64_encode($message);

            try {

                $curl = curl_init();
                $branName = $groupName['brand_name'] ?? "CAODANG FPT";
                // var_dump($branName);

                curl_setopt_array($curl, array(
                    CURLOPT_URL => 'https://app.sms.fpt.net/api/push-brandname-otp',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => '{
                        "access_token": "' . $token . '",
                        "session_id": "' . md5(time()) . '",
                        "BrandName": "' . $branName . '",
                        "Phone": "' . $mobile_numbers_array[$ce] . '",
                        "Message": "' . $messageBase64 . '",
                        "RequestId": "SCRM Push SMS"
                        }',
                    CURLOPT_HTTPHEADER => array(
                        'Content-Type: application/json'
                    ),
                ));

                $response = json_decode(curl_exec($curl), true);

                curl_close($curl);
                // var_dump($response);

                // kiểm tra kết quả trả về có lỗi hay không
                if (!empty($response['error'])) {
                    $GLOBALS['log']->fatal(print_r($response, true));
                    $call_status = "Failure";
                } else {
                    $call_status = "Sent";
                }

                //Create the sms
                return $this->create_sms($template_name, $message, $call_status, $sl_mod, $sl_mod_id);
            } catch (\Exception $ex) {
                $GLOBALS['log']->fatal(print_r($ex, true));
            }
        }
    }

    function create_sms($template_name, $message, $call_status, $sl_mod, $sl_mod_id)
    {
        global $timedate;
        global $current_user;
        $create_bean = BeanFactory::newBean("Calls");
        $create_bean->date_start = $timedate->getInstance()->nowDb();
        $create_bean->date_end = $timedate->getInstance()->nowDb();
        if (!empty($template_name) && trim($template_name) != "No SMS Template Found") {
            $create_bean->name = "OutboundSMS-" . $template_name;
        } else {
            $create_bean->name = "OutboundSMS";
        }
        $create_bean->description = $message;
        $create_bean->status = $call_status;
        $create_bean->direction = "Outbound";

        $create_bean->set_created_by = false;
        $create_bean->update_date_entered = false;
        $create_bean->update_date_modified = false;
        $create_bean->update_modified_by = false;

        $create_bean->assigned_user_id = $current_user->id;
        $create_bean->modified_user_id = $current_user->id;
        $create_bean->created_by = $current_user->id;

        $create_bean->parent_type = $sl_mod;
        $create_bean->parent_id = $sl_mod_id;
        $create_id = $create_bean->save();

        $RelCall = BeanFactory::getBean('Calls', $create_id);
        if ($sl_mod == "Contacts") {
            $RelCall->load_relationship('contacts');
            $RelCall->contacts->add($sl_mod_id);
        }
        if ($sl_mod == "Leads") {
            $RelCall->load_relationship('leads');
            $RelCall->leads->add($sl_mod_id);
        }

        //Creating Relationships
        return $create_id;
    }

    function sendbyplivo($mobile_numbers, $template_name, $message, $sl_mod, $sl_mod_id)
    {

        $sql_pl = "Select pl_auth_id, pl_auth_token, pl_src_number, pl_text, pl_destination, pl_api_url from ce_sms_configuration where sms_type = 'Plivo'";
        $result_pl = $GLOBALS['db']->query($sql_pl);
        $row_pl = $GLOBALS['db']->fetchByAssoc($result_pl);

        $mobile_numbers_array = explode(",", $mobile_numbers);
        for ($ce = 0; $ce < count($mobile_numbers_array); $ce++) {

            $message = htmlspecialchars_decode($message, ENT_QUOTES);
            $post = array(
                "src" => trim($row_pl['pl_src_number']),
                "dst" => trim($mobile_numbers_array[$ce]),
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
            if (!empty($result_sms->message_uuid[0])) {
                $call_status = "Sent";
            } else {
                $call_status = "Failure";
            }
            //Create the sms
            return $this->create_sms($template_name, $message, $call_status, $sl_mod, $sl_mod_id);
        }
    }
}
