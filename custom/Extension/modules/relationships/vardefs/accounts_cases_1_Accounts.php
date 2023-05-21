<?php
// created: 2019-11-26 17:05:10
$dictionary["Account"]["fields"]["accounts_cases_1"] = array (
  'name' => 'accounts_cases_1',
  'type' => 'link',
  'relationship' => 'accounts_cases_1',
  'source' => 'non-db',
  'module' => 'Cases',
  'bean_name' => 'Case',
  'vname' => 'LBL_ACCOUNTS_CASES_1_FROM_CASES_TITLE',
  'id_name' => 'accounts_cases_1cases_idb',
);
$dictionary["Account"]["fields"]["accounts_cases_1_name"] = array (
  'name' => 'accounts_cases_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_ACCOUNTS_CASES_1_FROM_CASES_TITLE',
  'save' => true,
  'id_name' => 'accounts_cases_1cases_idb',
  'link' => 'accounts_cases_1',
  'table' => 'cases',
  'module' => 'Cases',
  'rname' => 'name',
);
$dictionary["Account"]["fields"]["accounts_cases_1cases_idb"] = array (
  'name' => 'accounts_cases_1cases_idb',
  'type' => 'link',
  'relationship' => 'accounts_cases_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'left',
  'vname' => 'LBL_ACCOUNTS_CASES_1_FROM_CASES_TITLE',
);
