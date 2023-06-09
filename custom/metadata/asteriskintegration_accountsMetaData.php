<?php

$dictionary["asteriskintegration_accounts"] = array(
    'true_relationship_type' => 'one-to-many',
    'relationships' => array(
        'asteriskintegration_accounts' => array(
            'lhs_module' => 'Accounts',
            'lhs_table' => 'accounts',
            'lhs_key' => 'id',
            'rhs_module' => 'AsteriskIntegration',
            'rhs_table' => 'asteriskintegration',
            'rhs_key' => 'id',
            'relationship_type' => 'many-to-many',
            'join_table' => 'asteriskintegration_accounts',
            'join_key_lhs' => 'asteriskintegration_accountsaccounts_ida',
            'join_key_rhs' => 'asteriskintegration_accountsasteriskintegration_idb',
        ),
    ),
    'table' => 'asteriskintegration_accounts',
    'fields' => array(
        0 => array(
            'name' => 'id',
            'type' => 'varchar',
            'len' => 36,
        ),
        1 => array(
            'name' => 'date_modified',
            'type' => 'datetime',
        ),
        2 => array(
            'name' => 'deleted',
            'type' => 'bool',
            'len' => '1',
            'default' => '0',
            'required' => true,
        ),
        3 => array(
            'name' => 'asteriskintegration_accountsaccounts_ida',
            'type' => 'varchar',
            'len' => 36,
        ),
        4 => array(
            'name' => 'asteriskintegration_accountsasteriskintegration_idb',
            'type' => 'varchar',
            'len' => 36,
        ),
    ),
    'indices' => array(
        0 => array(
            'name' => 'asteriskintegration_accountsspk',
            'type' => 'primary',
            'fields' => array(
                0 => 'id',
            ),
        ),
        1 => array(
            'name' => 'asteriskintegration_accounts_ida1',
            'type' => 'index',
            'fields' => array(
                0 => 'asteriskintegration_accountsaccounts_ida',
            ),
        ),
        2 => array(
            'name' => 'asteriskintegration_accounts_alt',
            'type' => 'alternate_key',
            'fields' => array(
                0 => 'asteriskintegration_accountsasteriskintegration_idb',
            ),
        ),
    ),
);
