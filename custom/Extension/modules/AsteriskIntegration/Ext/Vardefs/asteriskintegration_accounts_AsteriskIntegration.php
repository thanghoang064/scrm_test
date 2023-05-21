<?php

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
