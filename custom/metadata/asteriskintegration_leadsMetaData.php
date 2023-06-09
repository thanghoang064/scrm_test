<?php

$dictionary["asteriskintegration_leads"] = array(
    'true_relationship_type' => 'one-to-many',
    'relationships' => array(
        'asteriskintegration_leads' => array(
            'lhs_module' => 'Leads',
            'lhs_table' => 'leads',
            'lhs_key' => 'id',
            'rhs_module' => 'AsteriskIntegration',
            'rhs_table' => 'asteriskintegration',
            'rhs_key' => 'id',
            'relationship_type' => 'many-to-many',
            'join_table' => 'asteriskintegration_leads',
            'join_key_lhs' => 'asteriskintegration_leadsleads_ida',
            'join_key_rhs' => 'asteriskintegration_leadsasteriskintegration_idb',
        ),
    ),
    'table' => 'asteriskintegration_leads',
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
            'name' => 'asteriskintegration_leadsleads_ida',
            'type' => 'varchar',
            'len' => 36,
        ),
        4 => array(
            'name' => 'asteriskintegration_leadsasteriskintegration_idb',
            'type' => 'varchar',
            'len' => 36,
        ),
    ),
    'indices' => array(
        0 => array(
            'name' => 'asteriskintegration_leadsspk',
            'type' => 'primary',
            'fields' => array(
                0 => 'id',
            ),
        ),
        1 => array(
            'name' => 'asteriskintegration_leads_ida1',
            'type' => 'index',
            'fields' => array(
                0 => 'asteriskintegration_leadsleads_ida',
            ),
        ),
        2 => array(
            'name' => 'asteriskintegration_leads_alt',
            'type' => 'alternate_key',
            'fields' => array(
                0 => 'asteriskintegration_leadsasteriskintegration_idb',
            ),
        ),
    ),
);
