<?php
// created: 2019-11-26 17:05:10
$dictionary["accounts_cases_1"] = array (
  'true_relationship_type' => 'one-to-one',
  'from_studio' => true,
  'relationships' => 
  array (
    'accounts_cases_1' => 
    array (
      'lhs_module' => 'Accounts',
      'lhs_table' => 'accounts',
      'lhs_key' => 'id',
      'rhs_module' => 'Cases',
      'rhs_table' => 'cases',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'accounts_cases_1_c',
      'join_key_lhs' => 'accounts_cases_1accounts_ida',
      'join_key_rhs' => 'accounts_cases_1cases_idb',
    ),
  ),
  'table' => 'accounts_cases_1_c',
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
      'name' => 'accounts_cases_1accounts_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'accounts_cases_1cases_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'accounts_cases_1spk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'accounts_cases_1_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'accounts_cases_1accounts_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'accounts_cases_1_idb2',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'accounts_cases_1cases_idb',
      ),
    ),
  ),
);