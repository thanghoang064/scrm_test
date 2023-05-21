<?php
$viewdefs ['Accounts'] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'buttons' => 
        array (
          0 => 'SAVE',
          1 => 'CANCEL',
        ),
      ),
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'includes' => 
      array (
        0 => 
        array (
          'file' => 'modules/Accounts/Account.js',
        ),
      ),
      'useTabs' => true,
      'tabDefs' => 
      array (
        'LBL_ACCOUNT_INFORMATION' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL1' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
      ),
      'syncDetailEditViews' => false,
    ),
    'panels' => 
    array (
      'lbl_account_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'name',
            'label' => 'LBL_NAME',
            'displayParams' => 
            array (
              'required' => true,
            ),
          ),
          1 => 
          array (
            'name' => 'birthdate_c',
            'label' => 'LBL_BIRTHDATE',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'gender_c',
            'studio' => 'visible',
            'label' => 'LBL_GENDER',
          ),
          1 => 
          array (
            'name' => 'ethnicity_c',
            'studio' => 'visible',
            'label' => 'LBL_ETHNICITY',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'id_passport_c',
            'label' => 'LBL_ID_PASSPORT',
          ),
          1 => 
          array (
            'name' => 'date_issued_c',
            'label' => 'LBL_DATE_ISSUED',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'place_issued_c',
            'label' => 'LBL_PLACE_ISSUED',
          ),
          1 => 
          array (
            'name' => 'study_time_c',
            'studio' => 'visible',
            'label' => 'LBL_STUDY_TIME',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'school_c',
            'label' => 'LBL_SCHOOL',
          ),
          1 => 
          array (
            'name' => 'graduated_c',
            'label' => 'LBL_GRADUATED',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'year_graduated_c',
            'label' => 'LBL_YEAR_GRADUATED',
          ),
          1 => 
          array (
            'name' => 'major_c',
            'studio' => 'visible',
            'label' => 'LBL_MAJOR',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'campaign_c',
            'studio' => 'visible',
            'label' => 'LBL_CAMPAIGN',
          ),
          1 => 
          array (
            'name' => 'email1',
            'studio' => 'false',
            'label' => 'LBL_EMAIL',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'address_c',
            'label' => 'LBL_ADDRESS',
          ),
          1 => 
          array (
            'name' => 'postal_address_c',
            'label' => 'LBL_POSTAL_ADDRESS',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'jjwg_maps_address_c',
            'label' => 'LBL_JJWG_MAPS_ADDRESS',
          ),
          1 => 
          array (
            'name' => 'phone_alternate',
            'comment' => 'An alternate phone number',
            'label' => 'LBL_PHONE_ALT',
          ),
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'phone2_c',
            'label' => 'LBL_PHONE2',
          ),
          1 => 
          array (
            'name' => 'phone4_c',
            'label' => 'LBL_PHONE4',
          ),
        ),
        10 => 
        array (
          0 => 
          array (
            'name' => 'phone1_c',
            'label' => 'LBL_PHONE1',
          ),
          1 => 
          array (
            'name' => 'phone3_c',
            'label' => 'LBL_PHONE3',
          ),
        ),
        11 => 
        array (
          0 => 
          array (
            'name' => 'country_c',
            'studio' => 'visible',
            'label' => 'LBL_COUNTRY',
          ),
          1 => 
          array (
            'name' => 'province_c',
            'studio' => 'visible',
            'label' => 'LBL_PROVINCE',
          ),
        ),
        12 => 
        array (
          0 => 
          array (
            'name' => 'district_c',
            'label' => 'LBL_DISTRICT',
          ),
          1 => 
          array (
            'name' => 'source_c',
            'studio' => 'visible',
            'label' => 'LBL_SOURCE',
          ),
        ),
        13 => 
        array (
          0 => 
          array (
            'name' => 'tshirt_size_c',
            'label' => 'LBL_TSHIRT_SIZE',
          ),
          1 => 
          array (
            'name' => 'program_c',
            'studio' => 'visible',
            'label' => 'LBL_PROGRAM',
          ),
        ),
        14 => 
        array (
          0 => 
          array (
            'name' => 'area_c',
            'studio' => 'visible',
            'label' => 'LBL_AREA',
          ),
          1 => 
          array (
            'name' => 'description',
            'label' => 'LBL_DESCRIPTION',
          ),
        ),
        15 => 
        array (
          0 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_TO',
          ),
          1 => 
          array (
            'name' => 'accounts_leads_1_name',
          ),
        ),
        16 => 
        array (
          0 => 
          array (
            'name' => 'enrollment_status_c',
            'studio' => 'visible',
            'label' => 'LBL_ENROLLMENT_STATUS',
          ),
          1 => 
          array (
            'name' => 'student_code_c',
            'label' => 'LBL_STUDENT_CODE',
          ),
        ),
        17 => 
        array (
          0 => 
          array (
            'name' => 'scheduled_date_c',
            'label' => 'LBL_SCHEDULED_DATE',
          ),
          1 => 
          array (
            'name' => 'dot_nhap_hoc_c',
            'studio' => 'visible',
            'label' => 'LBL_DOT_NHAP_HOC',
          ),
        ),
        18 => 
        array (
          0 => 
          array (
            'name' => 'expected_major_2_c',
            'studio' => 'visible',
            'label' => 'LBL_EXPECTED_MAJOR_2_C',
          ),
          1 => 
          array (
            'name' => 'facebook_c',
            'studio' => 'visible',
            'label' => 'LBL_FACEBOOK_C',
          ),
        ),
      ),
      'lbl_editview_panel1' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'accounts_cases_1_name',
            'label' => 'LBL_ACCOUNTS_CASES_1_FROM_CASES_TITLE',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
;
?>
