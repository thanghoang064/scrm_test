<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

require_once("modules/Administration/Administration.php");

class Viewceconfig extends SugarView {

    public function preDisplay() {
        global $current_user;
        global $sugar_config;
        if (!is_admin($current_user)) {
            sugar_die("Unauthorized access to administration.");
        }
       require_once('modules/CE_SMS_Configuration/license/OutfittersLicense.php');
       $validate = SMSOutfittersLicense::isValid('CE_SMS_Configuration');
       if ($validate != 1) {
           header('Location: index.php?module=CE_SMS_Configuration&action=license');
       }
    }

    public function display() {

        require_once('modules/CE_SMS_Configuration/CE_SMS_Utils.php');
        require_once('include/Sugar_Smarty.php');

        $ce_sms_utils = new ce_sms_utils();

        global $sugar_config, $db;

        if (!is_admin($GLOBALS['current_user'])) {
            sugar_die('You do not have permission.');
        }

        if ((isset($_POST['save_sms'])) && (!empty($_POST['save_sms'])) && in_array(trim($_POST['gateway']), array("Http", "Twilio", "Plivo"))) {
            // Saving SMS Type as Http
            $ce_sms_utils->save_gateway($_REQUEST);
        }

        $sql_et = "Select username, password, from_number, parameter_one, parameter_two, parameter_three, parameter_four, parameter_five, parameter_six, parameter_seven, to_number, api_url from ce_sms_configuration where sms_type = 'Http'";
        $result_et = $GLOBALS['db']->query($sql_et);
        $row_et = $GLOBALS['db']->fetchByAssoc($result_et);

        $ss = new Sugar_Smarty();

        $ss->assign('USERNAME', $row_et['username']);
        $ss->assign('PASSWORD', $row_et['password']);
        $ss->assign('FROM_NUMBER', $row_et['from_number']);
        $ss->assign('PARAM_ONE', $row_et['parameter_one']);
        $ss->assign('PARAM_TWO', $row_et['parameter_two']);
        $ss->assign('PARAM_THREE', $row_et['parameter_three']);
        $ss->assign('PARAM_FOUR', $row_et['parameter_four']);
        $ss->assign('PARAM_FIVE', $row_et['parameter_five']);
        $ss->assign('PARAM_SIX', $row_et['parameter_six']);
        $ss->assign('PARAM_SEVEN', $row_et['parameter_seven']);
        $ss->assign('TO_NUMBER', $row_et['to_number']);
        $ss->assign('API_URL', $row_et['api_url']);

        $sql_tw = "Select tw_account_sid, tw_auth_token, tw_from_number, tw_to_number from ce_sms_configuration where sms_type = 'Twilio'";
        $result_tw = $GLOBALS['db']->query($sql_tw);
        $row_tw = $GLOBALS['db']->fetchByAssoc($result_tw);

        $ss->assign('TW_ACCOUNT_SID', $row_tw['tw_account_sid']);
        $ss->assign('TW_AUTH_TOKEN', $row_tw['tw_auth_token']);
        $ss->assign('TW_FROM_NUMBER', $row_tw['tw_from_number']);
        $ss->assign('TW_TO_NUMBER', $row_tw['tw_to_number']);

        $sql_pl = "Select pl_auth_id, pl_auth_token, pl_src_number, pl_text, pl_destination, pl_api_url from ce_sms_configuration where sms_type = 'Plivo'";
        $result_pl = $GLOBALS['db']->query($sql_pl);
        $row_pl = $GLOBALS['db']->fetchByAssoc($result_pl);

        $ss->assign('PL_AUTH_ID', $row_pl['pl_auth_id']);
        $ss->assign('PL_AUTH_TOKEN', $row_pl['pl_auth_token']);
        $ss->assign('PL_SRC_NUMBER', $row_pl['pl_src_number']);
        $ss->assign('PL_TEXT', $row_pl['pl_text']);
        $ss->assign('PL_DESTINATION', $row_pl['pl_destination']);
        $ss->assign('PL_API_URL', $row_pl['pl_api_url']);

        $ss->assign('MOD', $GLOBALS['mod_strings']);
        $ss->assign('APP', $GLOBALS['app_strings']);
        echo $ss->fetch('modules/CE_SMS_Configuration/tpls/ceconfig.tpl');
    }

}
