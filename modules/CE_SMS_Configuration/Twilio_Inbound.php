<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

require_once('modules/CE_SMS_Configuration/license/OutfittersLicense.php');
$validate = SMSOutfittersLicense::isValid('CE_SMS_Configuration');
if($validate == 1) {

global $timedate;
if (!empty($_REQUEST['From']) && !empty($_REQUEST['Body'])) {

    $From = trim($_REQUEST['From']);
    $From = str_replace("+", "", $From);
    $From = str_replace("-", "", $From);
    $From = substr($From, -10);

     $Contact_Query = "SELECT *  FROM contacts WHERE (phone_home LIKE '%" . $From . "%' OR phone_mobile LIKE '%" . $From . "%' OR phone_work LIKE '%" . $From . "%' OR phone_other LIKE '%" . $From . "%' OR phone_fax LIKE '%" . $From . "%') and deleted=0 Limit 1";

    $Result_Contact = $GLOBALS['db']->query($Contact_Query);
    $Row_Res = $GLOBALS['db']->fetchByAssoc($Result_Contact);

    $ParentID = $Row_Res['id'];
    $ParentType = "Contacts";
    $UserID = $Row_Res['assigned_user_id'];

    if(empty($ParentID))
    {

        $Leads_Query = "SELECT *  FROM leads WHERE (phone_home LIKE '%" . $From . "%' OR phone_mobile LIKE '%" . $From . "%' OR    phone_work LIKE '%" . $From . "%' OR phone_other LIKE '%" . $From . "%' OR phone_fax LIKE '%" . $From . "%') and deleted=0 Limit 1";

        $Result_Leads = $GLOBALS['db']->query($Leads_Query);
        $Row_Res_Leads = $GLOBALS['db']->fetchByAssoc($Result_Leads);

        $ParentID = $Row_Res_Leads['id'];
        $ParentType = "Leads";
        $UserID = $Row_Res_Leads['assigned_user_id'];

    }

     if(empty($ParentID))
    {

        $Account_Query = "SELECT *  FROM accounts WHERE (phone_fax LIKE '%" . $From . "%' OR phone_office LIKE '%" . $From . "%' OR phone_alternate LIKE '%" . $From . "%') and deleted=0 Limit 1";

        $Result_Account = $GLOBALS['db']->query($Account_Query);
        $Row_Res_Acc = $GLOBALS['db']->fetchByAssoc($Result_Account);

        $ParentID = $Row_Res_Acc['id'];
        $ParentType = "Accounts";
        $UserID = $Row_Res_Acc['assigned_user_id'];

    }

    $New_Call = BeanFactory::newBean("Calls");

    $direction = "Inbound";
    $subject = "InboundSMS From " . $_REQUEST['From'];

    $New_Call->status = "Held";
    $New_Call->name = $subject;
    $New_Call->date_start = $timedate->getInstance()->nowDb();
    $New_Call->direction = $direction;
    $New_Call->description = $_REQUEST['Body'];

    if (!empty($ParentID)) {
        $New_Call->parent_id = $ParentID;
        $New_Call->parent_type = $ParentType;
    }
    if (!empty($UserID)) {
        $New_Call->assigned_user_id = $UserID;
        $New_Call->modified_user_id = $UserID;
    } else {
        $New_Call->assigned_user_id = "1";
        $New_Call->modified_user_id = "1";
    }

    $New_Call->update_date_modified = false;
    $New_Call->update_modified_by = false;
    $New_Call->set_created_by = false;
    $New_Call->update_date_entered = false;

    $Save_Call = $New_Call->save();
    
    if(!empty($Save_Call)){
    $alert = BeanFactory::newBean('Alerts');
    $alert->name = $subject;
    $alert->description = $_REQUEST['Body'];
    $alert->url_redirect = 'index.php?module=Calls&action=DetailView&record='.$Save_Call;
    $alert->target_module = 'Calls';
    if (!empty($UserID)) {
        $alert->assigned_user_id = $UserID;
        $alert->modified_user_id = $UserID;
    } else {
        $alert->assigned_user_id = "1";
        $alert->modified_user_id = "1";
    }
    $alert->type = 'info';
    $alert->is_read = 0;
    $alert->save();
    }
    //Create Relationship
    if (!empty($ParentID)) {
        $Rel_Call = BeanFactory::getBean('Calls', $Save_Call);
        if ($ParentType == "Contacts") {
            $Rel_Call->load_relationship('contacts');
            $Rel_Call->contacts->add($ParentID);
        }
        if ($ParentType == "Leads") {
            $Rel_Call->load_relationship('leads');
            $Rel_Call->leads->add($ParentID);
        }

    }
} else {
    $GLOBALS['log']->fatal('Twilio Inbound SMS Failed.');
}
}
