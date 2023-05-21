<?php

$dictionary["asteriskintegration_contacts"] = array(
    'true_relationship_type' => 'one-to-many',
    'relationships' => array(
        'asteriskintegration_contacts' => array(
            'lhs_module' => 'Contacts',
            'lhs_table' => 'contacts',
            'lhs_key' => 'id',
            'rhs_module' => 'AsteriskIntegration',
            'rhs_table' => 'asteriskintegration',
            'rhs_key' => 'id',
            'relationship_type' => 'many-to-many',
            'join_table' => 'asteriskintegration_contacts',
            'join_key_lhs' => 'asteriskintegration_contactscontacts_ida',
            'join_key_rhs' => 'asteriskintegration_contactsasteriskintegration_idb',
        ),
    ),
    'table' => 'asteriskintegration_contacts',
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
            'name' => 'asteriskintegration_contactscontacts_ida',
            'type' => 'varchar',
            'len' => 36,
        ),
        4 => array(
            'name' => 'asteriskintegration_contactsasteriskintegration_idb',
            'type' => 'varchar',
            'len' => 36,
        ),
    ),
    'indices' => array(
        0 => array(
            'name' => 'asteriskintegration_contactsspk',
            'type' => 'primary',
            'fields' => array(
                0 => 'id',
            ),
        ),
        1 => array(
            'name' => 'asteriskintegration_contacts_ida1',
            'type' => 'index',
            'fields' => array(
                0 => 'asteriskintegration_contactscontacts_ida',
            ),
        ),
        2 => array(
            'name' => 'asteriskintegration_contacts_alt',
            'type' => 'alternate_key',
            'fields' => array(
                0 => 'asteriskintegration_contactsasteriskintegration_idb',
            ),
        ),
    ),
);
