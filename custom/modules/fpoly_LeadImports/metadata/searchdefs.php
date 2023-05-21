<?php
$module_name = 'fpoly_LeadImports';
$searchdefs [$module_name] = 
array (
  'layout' => 
  array (
    'basic_search' => 
    array (
      'name' => 
      array (
        'name' => 'name',
        'default' => true,
      ),
      'current_user_only' => 
      array (
        'name' => 'current_user_only',
        'label' => 'LBL_CURRENT_USER_FILTER',
        'type' => 'bool',
        'default' => true,
      ),
    ),
    'advanced_search' => 
    array (
      'name' => 
      array (
        'name' => 'name',
        'default' => true,
        'width' => '10%',
      ),
      'phone_mobile' => 
      array (
        'type' => 'phone',
        'label' => 'LBL_PHONE_MOBILE',
        'width' => '10%',
        'default' => true,
        'name' => 'phone_mobile',
      ),
      'topic_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_TOPIC',
        'width' => '10%',
        'name' => 'topic_c',
      ),
      'area1_c' => 
      array (
        'type' => 'enum',
        'default' => true,
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
        'default' => true,
        'name' => 'school',
      ),
      'graduation_year_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
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
        'default' => true,
        'name' => 'status',
      ),
      'rating' => 
      array (
        'type' => 'enum',
        'studio' => 'visible',
        'label' => 'LBL_RATING',
        'width' => '10%',
        'default' => true,
        'name' => 'rating',
      ),
      'facebook' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_FACEBOOK',
        'width' => '10%',
        'default' => true,
        'name' => 'facebook',
      ),
      'expected_job' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_EXPECTED_JOB',
        'width' => '10%',
        'default' => true,
        'name' => 'expected_job',
      ),
      'expected_major' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_EXPECTED_MAJOR',
        'width' => '10%',
        'default' => true,
        'name' => 'expected_major',
      ),
      'email' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_EMAIL',
        'width' => '10%',
        'default' => true,
        'name' => 'email',
      ),
      'class' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_CLASS',
        'width' => '10%',
        'default' => true,
        'name' => 'class',
      ),
      'lead_source' => 
      array (
        'type' => 'enum',
        'studio' => 'visible',
        'label' => 'LBL_LEAD_SOURCE',
        'width' => '10%',
        'default' => true,
        'name' => 'lead_source',
      ),
      'birthdate' => 
      array (
        'type' => 'date',
        'label' => 'LBL_BIRTHDATE',
        'width' => '10%',
        'default' => true,
        'name' => 'birthdate',
      ),
      'parent1_name' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_PARENT1_NAME',
        'width' => '10%',
        'default' => true,
        'name' => 'parent1_name',
      ),
      'phone_home' => 
      array (
        'type' => 'phone',
        'label' => 'LBL_PHONE_HOME',
        'width' => '10%',
        'default' => true,
        'name' => 'phone_home',
      ),
      'phone_other' => 
      array (
        'type' => 'phone',
        'label' => 'LBL_PHONE_OTHER',
        'width' => '10%',
        'default' => true,
        'name' => 'phone_other',
      ),
      'phone_work' => 
      array (
        'type' => 'phone',
        'label' => 'LBL_PHONE_WORK',
        'width' => '10%',
        'default' => true,
        'name' => 'phone_work',
      ),
      'date_entered' => 
      array (
        'type' => 'datetime',
        'label' => 'LBL_DATE_ENTERED',
        'width' => '10%',
        'default' => true,
        'name' => 'date_entered',
      ),
      'city' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_CITY',
        'width' => '10%',
        'default' => true,
        'name' => 'city',
      ),
      'district_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_DISTRICT',
        'width' => '10%',
        'name' => 'district_c',
      ),
      'created_by' => 
      array (
        'type' => 'assigned_user_name',
        'label' => 'LBL_CREATED',
        'width' => '10%',
        'default' => true,
        'name' => 'created_by',
      ),
      'duplicate_status' => 
      array (
        'type' => 'enum',
        'studio' => 'visible',
        'label' => 'LBL_DUPLICATE_STATUS',
        'width' => '10%',
        'default' => true,
        'name' => 'duplicate_status',
      ),
      'auto_assign_c' => 
      array (
        'type' => 'bool',
        'default' => true,
        'label' => 'LBL_AUTO_ASSIGN',
        'width' => '10%',
        'name' => 'auto_assign_c',
      ),
      'batch_name_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
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
        'default' => true,
        'width' => '10%',
      ),
      'program_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_PROGRAM',
        'width' => '10%',
        'name' => 'program_c',
      ),
      'barriers_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_BARRIERS',
        'width' => '10%',
        'name' => 'barriers_c',
      ),
      'dot_nhap_hoc_c' => 
      array (
        'type' => 'enum',
        'default' => true,
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
        'default' => true,
        'name' => 'current_user_only',
      ),
    ),
  ),
  'templateMeta' => 
  array (
    'maxColumns' => '3',
    'maxColumnsBasic' => '4',
    'widths' => 
    array (
      'label' => '10',
      'field' => '30',
    ),
  ),
);
;
?>
