<?php
$searchdefs ['Leads'] = 
array (
  'layout' => 
  array (
    'basic_search' => 
    array (
      'search_name' => 
      array (
        'name' => 'search_name',
        'label' => 'LBL_NAME',
        'type' => 'name',
        'default' => true,
        'width' => '10%',
      ),
      'current_user_only' => 
      array (
        'name' => 'current_user_only',
        'label' => 'LBL_CURRENT_USER_FILTER',
        'type' => 'bool',
        'default' => true,
        'width' => '10%',
      ),
      'open_only' => 
      array (
        'name' => 'open_only',
        'label' => 'LBL_OPEN_ITEMS',
        'type' => 'bool',
        'default' => true,
        'width' => '10%',
      ),
      'expected_major_2_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_EXPECTED_MAJOR_2',
        'width' => '10%',
        'name' => 'expected_major_2_c',
      ),
    ),
    'advanced_search' => 
    array (
      'topic_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_TOPIC',
        'width' => '10%',
        'name' => 'topic_c',
      ),
      'source_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_SOURCE',
        'width' => '10%',
        'name' => 'source_c',
      ),
      'area_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_AREA',
        'width' => '10%',
        'name' => 'area_c',
      ),
      'lead_source' => 
      array (
        'name' => 'lead_source',
        'default' => true,
        'width' => '10%',
      ),
      'lead_source_2_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_LEAD_SOURCE_2',
        'width' => '10%',
        'name' => 'lead_source_2_c',
      ),
      'assigned_user_id' => 
      array (
        'name' => 'assigned_user_id',
        'type' => 'enum',
        'label' => 'LBL_ASSIGNED_TO',
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
      'created_by' => 
      array (
        'type' => 'assigned_user_name',
        'label' => 'LBL_CREATED',
        'width' => '10%',
        'default' => true,
        'name' => 'created_by',
      ),
      'status' => 
      array (
        'name' => 'status',
        'default' => true,
        'width' => '10%',
      ),
      'expected_major_2_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_EXPECTED_MAJOR_2',
        'width' => '10%',
        'name' => 'expected_major_2_c',
      ),
      'follow_status_reason_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_FOLLOW_STATUS_REASON',
        'width' => '10%',
        'name' => 'follow_status_reason_c',
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
      'email_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_EMAIL',
        'width' => '10%',
        'name' => 'email_c',
      ),
      'primary_address_city' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_PRIMARY_ADDRESS_CITY',
        'width' => '10%',
        'default' => true,
        'name' => 'primary_address_city',
      ),
      'school_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_SCHOOL',
        'width' => '10%',
        'name' => 'school_c',
      ),
      'class_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_CLASS',
        'width' => '10%',
        'name' => 'class_c',
      ),
      'source_2_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_SOURCE_2',
        'width' => '10%',
        'name' => 'source_2_c',
      ),
      'date_entered' => 
      array (
        'type' => 'datetime',
        'label' => 'LBL_DATE_ENTERED',
        'width' => '10%',
        'default' => true,
        'name' => 'date_entered',
      ),
      'date_activated_c' => 
      array (
        'type' => 'date',
        'default' => true,
        'label' => 'LBL_DATE_ACTIVATED',
        'width' => '10%',
        'name' => 'date_activated_c',
      ),
      'date_enrolled_c' => 
      array (
        'type' => 'datetimecombo',
        'default' => true,
        'label' => 'LBL_DATE_ENROLLED',
        'width' => '10%',
        'name' => 'date_enrolled_c',
      ),
      'dup_c' => 
      array (
        'type' => 'int',
        'default' => true,
        'label' => 'LBL_DUP',
        'width' => '10%',
        'name' => 'dup_c',
      ),
      'last_dup_c' => 
      array (
        'type' => 'datetimecombo',
        'default' => true,
        'label' => 'LBL_LAST_DUP',
        'width' => '10%',
        'name' => 'last_dup_c',
      ),
      'facebook_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_FACEBOOK',
        'width' => '10%',
        'name' => 'facebook_c',
      ),
      'converted' => 
      array (
        'type' => 'bool',
        'default' => true,
        'label' => 'LBL_CONVERTED',
        'width' => '10%',
        'name' => 'converted',
      ),
      'contacted_c' => 
      array (
        'type' => 'bool',
        'default' => true,
        'label' => 'LBL_CONTACTED',
        'width' => '10%',
        'name' => 'contacted_c',
      ),
      'ne_c' => 
      array (
        'type' => 'bool',
        'default' => true,
        'label' => 'LBL_NE',
        'width' => '10%',
        'name' => 'ne_c',
      ),
      'number_of_calls_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_NUMBER_OF_CALLS',
        'width' => '10%',
        'name' => 'number_of_calls_c',
      ),
      'convert_date_c' => 
      array (
        'type' => 'datetimecombo',
        'default' => true,
        'label' => 'LBL_CONVERT_DATE',
        'width' => '10%',
        'name' => 'convert_date_c',
      ),
      'date_modified' => 
      array (
        'type' => 'datetime',
        'label' => 'LBL_DATE_MODIFIED',
        'width' => '10%',
        'default' => true,
        'name' => 'date_modified',
      ),
      'marketing_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_MARKETING',
        'width' => '10%',
        'name' => 'marketing_c',
      ),
      'birthdate' => 
      array (
        'type' => 'date',
        'label' => 'LBL_BIRTHDATE',
        'width' => '10%',
        'default' => true,
        'name' => 'birthdate',
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
      'content_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_CONTENT',
        'width' => '10%',
        'name' => 'content_c',
      ),
    ),
  ),
  'templateMeta' => 
  array (
    'maxColumns' => '4',
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
