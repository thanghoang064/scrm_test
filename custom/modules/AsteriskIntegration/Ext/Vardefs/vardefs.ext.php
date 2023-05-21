<?php 
 //WARNING: The contents of this file are auto-generated



$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_accounts"] = array(
    'name' => 'asteriskintegration_accounts',
    'type' => 'link',
    'relationship' => 'asteriskintegration_accounts',
    'source' => 'non-db',
    'module' => 'Accounts',
    'bean_name' => 'Account',
    'vname' => 'LBL_ASTERISKINTEGRATION_ACCOUNTS_FROM_ACCOUNTS_TITLE',
    'id_name' => 'asteriskintegration_accountsaccounts_ida',
);
$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_accounts_name"] = array(
    'name' => 'asteriskintegration_accounts_name',
    'type' => 'relate',
    'source' => 'non-db',
    'vname' => 'LBL_ASTERISKINTEGRATION_ACCOUNTS_FROM_ACCOUNTS_TITLE',
    'save' => true,
    'id_name' => 'asteriskintegration_accountsaccounts_ida',
    'link' => 'asteriskintegration_accounts',
    'table' => 'accounts',
    'module' => 'Accounts',
    'rname' => 'name',
);
$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_accountsaccounts_ida"] = array(
    'name' => 'asteriskintegration_accountsaccounts_ida',
    'type' => 'link',
    'relationship' => 'asteriskintegration_accounts',
    'source' => 'non-db',
    'reportable' => false,
    'side' => 'right',
    'vname' => 'LBL_ASTERISKINTEGRATION_ACCOUNTS_FROM_ASTERISKINTEGRATION_TITLE',
);



$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_contacts"] = array(
    'name' => 'asteriskintegration_contacts',
    'type' => 'link',
    'relationship' => 'asteriskintegration_contacts',
    'source' => 'non-db',
    'module' => 'Contacts',
    'bean_name' => 'Contact',
    'vname' => 'LBL_ASTERISKINTEGRATION_CONTACTS_FROM_CONTACTS_TITLE',
    'id_name' => 'asteriskintegration_contactscontacts_ida',
);
$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_contacts_name"] = array(
    'name' => 'asteriskintegration_contacts_name',
    'type' => 'relate',
    'source' => 'non-db',
    'vname' => 'LBL_ASTERISKINTEGRATION_CONTACTS_FROM_CONTACTS_TITLE',
    'save' => true,
    'id_name' => 'asteriskintegration_contactscontacts_ida',
    'link' => 'asteriskintegration_contacts',
    'table' => 'contacts',
    'module' => 'Contacts',
    'rname' => 'name',
    'db_concat_fields' =>
    array(
        0 => 'first_name',
        1 => 'last_name',
    ),
);
$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_contactscontacts_ida"] = array(
    'name' => 'asteriskintegration_contactscontacts_ida',
    'type' => 'link',
    'relationship' => 'asteriskintegration_contacts',
    'source' => 'non-db',
    'reportable' => false,
    'side' => 'right',
    'vname' => 'LBL_ASTERISKINTEGRATION_CONTACTS_FROM_ASTERISKINTEGRATION_TITLE',
);



$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_leads"] = array(
    'name' => 'asteriskintegration_leads',
    'type' => 'link',
    'relationship' => 'asteriskintegration_leads',
    'source' => 'non-db',
    'module' => 'Leads',
    'bean_name' => 'Lead',
    'vname' => 'LBL_ASTERISKINTEGRATION_LEADS_FROM_LEADS_TITLE',
    'id_name' => 'asteriskintegration_leadsleads_ida',
);
$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_leads_name"] = array(
    'name' => 'asteriskintegration_leads_name',
    'type' => 'relate',
    'source' => 'non-db',
    'vname' => 'LBL_ASTERISKINTEGRATION_LEADS_FROM_LEADS_TITLE',
    'save' => true,
    'id_name' => 'asteriskintegration_leadsleads_ida',
    'link' => 'asteriskintegration_leads',
    'table' => 'leads',
    'module' => 'Leads',
    'rname' => 'name',
    'db_concat_fields' =>
    array(
        0 => 'first_name',
        1 => 'last_name',
    ),
);
$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_leadsleads_ida"] = array(
    'name' => 'asteriskintegration_leadsleads_ida',
    'type' => 'link',
    'relationship' => 'asteriskintegration_leads',
    'source' => 'non-db',
    'reportable' => false,
    'side' => 'right',
    'vname' => 'LBL_ASTERISKINTEGRATION_LEADS_FROM_ASTERISKINTEGRATION_TITLE',
);

?>