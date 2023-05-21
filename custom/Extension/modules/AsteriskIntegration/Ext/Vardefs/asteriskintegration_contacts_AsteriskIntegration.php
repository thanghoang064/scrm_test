<?php

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
