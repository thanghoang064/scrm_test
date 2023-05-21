<?php

class CE_SMS_Class {

    function CE_SMS_Func($event, $arguments) {

        //echo $_REQUEST['module'];
        $mapping = array(
            'modules' =>
            array("Calendar", "AOR_Reports", "ModuleBuilder", "Home", "MergeRecords", "Emails", "Timesheets", "AOW_WorkFlow"),
            'actions' =>
            array("view_GanttChart", "EmailUIAjax", "getEditFieldHTML", "getValidationRules", "QuickEdit", "DynamicAction", "modulelistmenu", "favorites", "wizard", "SaveActivity"),
        );

        if ((!in_array($_REQUEST['action'], $mapping['actions'])) && (!in_array($_REQUEST['module'], $mapping['modules'])) && empty($_REQUEST['to_pdf']) && empty($_REQUEST['to_csv'])) {
            $ce_load_js = <<<MAKE
<script type="text/javascript" language="javascript" src="modules/CE_SMS_Configuration/CE_SMS_Configuration.js">
</script>
<link rel="stylesheet" href="modules/CE_SMS_Configuration/whatsapp.css">
MAKE;
            echo $ce_load_js;
        }

        if ($_REQUEST['module'] == "Contacts" && $_REQUEST['action'] == "index") {
            $lv_load_js = <<<MAKELV
                    <script type="text/javascript">
             $("#actionLinkTop ul").append('<li><a href="javascript:void(0);" onclick="sendbulksms(\'Contacts\');">Send Bulk SMS</a></li>');
                </script>
MAKELV;
            echo $lv_load_js;
        }

        if ($_REQUEST['module'] == "Accounts" && $_REQUEST['action'] == "index") {
            $lv_load_js = <<<MAKELV
                    <script type="text/javascript">
             $("#actionLinkTop ul").append('<li><a href="javascript:void(0);" onclick="sendbulksms(\'Accounts\');">Send Bulk SMS</a></li>');
                </script>
MAKELV;
            echo $lv_load_js;
        }

        if ($_REQUEST['module'] == "Leads" && $_REQUEST['action'] == "index") {
            $lv_load_js = <<<MAKELV
                    <script type="text/javascript">
             $("#actionLinkTop ul").append('<li><a href="javascript:void(0);" onclick="sendbulksms(\'Leads\');">Send Bulk SMS</a></li>');
                </script>
MAKELV;
            echo $lv_load_js;
        }
    }

}
