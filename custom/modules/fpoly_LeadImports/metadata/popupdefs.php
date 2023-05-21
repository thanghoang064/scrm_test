<?php
$popupMeta = array (
    'moduleMain' => 'fpoly_LeadImports',
    'varName' => 'fpoly_LeadImports',
    'orderBy' => 'fpoly_leadimports.name',
    'whereClauses' => array (
  'name' => 'fpoly_leadimports.name',
  'phone_mobile' => 'fpoly_leadimports.phone_mobile',
  'topic_c' => 'fpoly_leadimports_cstm.topic_c',
  'area1_c' => 'fpoly_leadimports_cstm.area1_c',
  'school' => 'fpoly_leadimports.school',
  'graduation_year_c' => 'fpoly_leadimports_cstm.graduation_year_c',
  'status' => 'fpoly_leadimports.status',
  'rating' => 'fpoly_leadimports.rating',
  'facebook' => 'fpoly_leadimports.facebook',
  'expected_job' => 'fpoly_leadimports.expected_job',
  'expected_major_2_c' => 'fpoly_leadimports_cstm.expected_major_2_c',
  'email' => 'fpoly_leadimports.email',
  'class' => 'fpoly_leadimports.class',
  'lead_source' => 'fpoly_leadimports.lead_source',
  'birthdate' => 'fpoly_leadimports.birthdate',
  'parent1_name' => 'fpoly_leadimports.parent1_name',
  'phone_home' => 'fpoly_leadimports.phone_home',
  'phone_other' => 'fpoly_leadimports.phone_other',
  'phone_work' => 'fpoly_leadimports.phone_work',
  'date_entered' => 'fpoly_leadimports.date_entered',
  'city' => 'fpoly_leadimports.city',
  'district_c' => 'fpoly_leadimports_cstm.district_c',
  'created_by' => 'fpoly_leadimports.created_by',
  'duplicate_status' => 'fpoly_leadimports.duplicate_status',
  'auto_assign_c' => 'fpoly_leadimports_cstm.auto_assign_c',
  'batch_name_c' => 'fpoly_leadimports_cstm.batch_name_c',
  'assigned_user_id' => 'fpoly_leadimports.assigned_user_id',
  'program_c' => 'fpoly_leadimports_cstm.program_c',
  'dot_nhap_hoc_c' => 'fpoly_leadimports_cstm.dot_nhap_hoc_c',
  'current_user_only' => 'fpoly_leadimports.current_user_only',
),
    'searchInputs' => array (
  1 => 'name',
  3 => 'status',
  4 => 'phone_mobile',
  5 => 'topic_c',
  6 => 'area1_c',
  7 => 'school',
  8 => 'graduation_year_c',
  9 => 'rating',
  10 => 'facebook',
  11 => 'expected_job',
  12 => 'expected_major_2_c',
  13 => 'email',
  14 => 'class',
  15 => 'lead_source',
  16 => 'birthdate',
  17 => 'parent1_name',
  18 => 'phone_home',
  19 => 'phone_other',
  20 => 'phone_work',
  21 => 'date_entered',
  22 => 'city',
  23 => 'district_c',
  24 => 'created_by',
  25 => 'duplicate_status',
  26 => 'auto_assign_c',
  27 => 'batch_name_c',
  28 => 'assigned_user_id',
  29 => 'program_c',
  30 => 'dot_nhap_hoc_c',
  31 => 'current_user_only',
),
    'searchdefs' => array (
  'name' => 
  array (
    'name' => 'name',
    'width' => '10%',
  ),
  'phone_mobile' => 
  array (
    'type' => 'phone',
    'label' => 'LBL_PHONE_MOBILE',
    'width' => '10%',
    'name' => 'phone_mobile',
  ),
  'topic_c' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_TOPIC',
    'width' => '10%',
    'name' => 'topic_c',
  ),
  'area1_c' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_AREA1',
    'width' => '10%',
    'name' => 'area1_c',
  ),
  'school' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_SCHOOL',
    'width' => '10%',
    'name' => 'school',
  ),
  'graduation_year_c' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_GRADUATION_YEAR',
    'width' => '10%',
    'name' => 'graduation_year_c',
  ),
  'status' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_STATUS',
    'width' => '10%',
    'name' => 'status',
  ),
  'rating' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_RATING',
    'width' => '10%',
    'name' => 'rating',
  ),
  'facebook' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_FACEBOOK',
    'width' => '10%',
    'name' => 'facebook',
  ),
  'expected_job' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_EXPECTED_JOB',
    'width' => '10%',
    'name' => 'expected_job',
  ),
  'expected_major_2_c' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_EXPECTED_MAJOR_2',
    'width' => '10%',
    'name' => 'expected_major_2_c',
  ),
  'email' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_EMAIL',
    'width' => '10%',
    'name' => 'email',
  ),
  'class' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_CLASS',
    'width' => '10%',
    'name' => 'class',
  ),
  'lead_source' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_LEAD_SOURCE',
    'width' => '10%',
    'name' => 'lead_source',
  ),
  'birthdate' => 
  array (
    'type' => 'date',
    'label' => 'LBL_BIRTHDATE',
    'width' => '10%',
    'name' => 'birthdate',
  ),
  'parent1_name' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_PARENT1_NAME',
    'width' => '10%',
    'name' => 'parent1_name',
  ),
  'phone_home' => 
  array (
    'type' => 'phone',
    'label' => 'LBL_PHONE_HOME',
    'width' => '10%',
    'name' => 'phone_home',
  ),
  'phone_other' => 
  array (
    'type' => 'phone',
    'label' => 'LBL_PHONE_OTHER',
    'width' => '10%',
    'name' => 'phone_other',
  ),
  'phone_work' => 
  array (
    'type' => 'phone',
    'label' => 'LBL_PHONE_WORK',
    'width' => '10%',
    'name' => 'phone_work',
  ),
  'date_entered' => 
  array (
    'type' => 'datetime',
    'label' => 'LBL_DATE_ENTERED',
    'width' => '10%',
    'name' => 'date_entered',
  ),
  'city' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_CITY',
    'width' => '10%',
    'name' => 'city',
  ),
  'district_c' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_DISTRICT',
    'width' => '10%',
    'name' => 'district_c',
  ),
  'created_by' => 
  array (
    'type' => 'assigned_user_name',
    'label' => 'LBL_CREATED',
    'width' => '10%',
    'name' => 'created_by',
  ),
  'duplicate_status' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_DUPLICATE_STATUS',
    'width' => '10%',
    'name' => 'duplicate_status',
  ),
  'auto_assign_c' => 
  array (
    'type' => 'bool',
    'label' => 'LBL_AUTO_ASSIGN',
    'width' => '10%',
    'name' => 'auto_assign_c',
  ),
  'batch_name_c' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_BATCH_NAME',
    'width' => '10%',
    'name' => 'batch_name_c',
  ),
  'assigned_user_id' => 
  array (
    'name' => 'assigned_user_id',
    'label' => 'LBL_ASSIGNED_TO',
    'type' => 'enum',
    'function' => 
    array (
      'name' => 'get_user_array',
      'params' => 
      array (
        0 => false,
      ),
    ),
    'width' => '10%',
  ),
  'program_c' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_PROGRAM',
    'width' => '10%',
    'name' => 'program_c',
  ),
  'dot_nhap_hoc_c' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_DOT_NHAP_HOC',
    'width' => '10%',
    'name' => 'dot_nhap_hoc_c',
  ),
  'current_user_only' => 
  array (
    'label' => 'LBL_CURRENT_USER_FILTER',
    'type' => 'bool',
    'width' => '10%',
    'name' => 'current_user_only',
  ),
),
);
