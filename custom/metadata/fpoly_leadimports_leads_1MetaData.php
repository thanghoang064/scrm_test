<?php
// created: 2017-03-18 02:51:52
$dictionary["fpoly_leadimports_leads_1"] = array (
  'true_relationship_type' => 'many-to-many',
  'relationships' => 
  array (
    'fpoly_leadimports_leads_1' => 
    array (
      'lhs_module' => 'fpoly_LeadImports',
      'lhs_table' => 'fpoly_leadimports',
      'lhs_key' => 'id',
      'rhs_module' => 'Leads',
      'rhs_table' => 'leads',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'fpoly_leadimports_leads_1_c',
      'join_key_lhs' => 'fpoly_leadimports_leads_1fpoly_leadimports_ida',
      'join_key_rhs' => 'fpoly_leadimports_leads_1leads_idb',
    ),
  ),
  'table' => 'fpoly_leadimports_leads_1_c',
  'fields' => 
  array (
    0 => 
    array (
      'name' => 'id',
      'type' => 'varchar',
      'len' => 36,
    ),
    1 => 
    array (
      'name' => 'date_modified',
      'type' => 'datetime',
    ),
    2 => 
    array (
      'name' => 'deleted',
      'type' => 'bool',
      'len' => '1',
      'default' => '0',
      'required' => true,
    ),
    3 => 
    array (
      'name' => 'fpoly_leadimports_leads_1fpoly_leadimports_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'fpoly_leadimports_leads_1leads_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'fpoly_leadimports_leads_1spk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'fpoly_leadimports_leads_1_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'fpoly_leadimports_leads_1fpoly_leadimports_ida',
        1 => 'fpoly_leadimports_leads_1leads_idb',
      ),
    ),
  ),
);