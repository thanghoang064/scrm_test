<?php
$viewdefs ['Leads'] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'buttons' => 
        array (
          0 => 'EDIT',
          2 => 'DELETE',
          3 => 
          array (
            'customCode' => '{if $bean->aclAccess("edit") && !$DISABLE_CONVERT_ACTION}<input title="{$MOD.LBL_CONVERTLEAD_TITLE}" accessKey="{$MOD.LBL_CONVERTLEAD_BUTTON_KEY}" type="button" class="button" onClick="document.location=\'index.php?module=Leads&action=ConvertLead&record={$fields.id.value}\'" name="convert" value="{$MOD.LBL_CONVERTLEAD}">{/if}',
            'sugar_html' => 
            array (
              'type' => 'button',
              'value' => '{$MOD.LBL_CONVERTLEAD}',
              'htmlOptions' => 
              array (
                'title' => '{$MOD.LBL_CONVERTLEAD_TITLE}',
                'accessKey' => '{$MOD.LBL_CONVERTLEAD_BUTTON_KEY}',
                'class' => 'button',
                'onClick' => 'document.location=\'index.php?module=Leads&action=ConvertLead&record={$fields.id.value}\'',
                'name' => 'convert',
                'id' => 'convert_lead_button',
              ),
              'template' => '{if $bean->aclAccess("edit") && !$DISABLE_CONVERT_ACTION}[CONTENT]{/if}',
            ),
          ),
          4 => 'FIND_DUPLICATES',
        ),
        'headerTpl' => 'modules/Leads/tpls/DetailViewHeader.tpl',
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
          'file' => 'modules/Leads/Lead.js',
        ),
      ),
      'useTabs' => false,
      'tabDefs' => 
      array (
        'LBL_CONTACT_INFORMATION' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_PANEL_ASSIGNMENT' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
      'syncDetailEditViews' => true,
    ),
    'panels' => 
    array (
      'LBL_CONTACT_INFORMATION' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'topic_c',
            'label' => 'LBL_TOPIC',
          ),
          1 => 
          array (
            'name' => 'last_name',
            'comment' => 'Last name of the contact',
            'label' => 'LBL_LAST_NAME',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'phone_mobile',
          ),
          1 => 
          array (
            'name' => 'birthdate',
            'comment' => 'The birthdate of the contact',
            'label' => 'LBL_BIRTHDATE',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'source_c',
            'studio' => 'visible',
            'label' => 'LBL_SOURCE',
          ),
          1 => 
          array (
            'name' => 'source_2_c',
            'studio' => 'visible',
            'label' => 'LBL_SOURCE_2',
          ),
        ),
        3 => 
        array (
          0 => 'lead_source',
          1 => 
          array (
            'name' => 'lead_source_2_c',
            'studio' => 'visible',
            'label' => 'LBL_LEAD_SOURCE_2',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'area_c',
            'studio' => 'visible',
            'label' => 'LBL_AREA',
          ),
          1 => '',
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'primary_address_city',
            'comment' => 'City for primary address',
            'label' => 'LBL_PRIMARY_ADDRESS_CITY',
          ),
          1 => 
          array (
            'name' => 'school_c',
            'label' => 'LBL_SCHOOL',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'primary_address_state',
            'comment' => 'State for primary address',
            'label' => 'LBL_PRIMARY_ADDRESS_STATE',
          ),
          1 => '',
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'time_to_study_c',
            'studio' => 'visible',
            'label' => 'LBL_TIME_TO_STUDY',
          ),
          1 => 
          array (
            'name' => 'alt_address_city',
            'comment' => 'City for alternate address',
            'label' => 'LBL_ALT_ADDRESS_CITY',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'phone_work',
          ),
          1 => 
          array (
            'name' => 'phone_home',
            'comment' => 'Home phone number of the contact',
            'label' => 'LBL_HOME_PHONE',
          ),
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'parent1_name_c',
            'label' => 'LBL_PARENT1_NAME',
          ),
          1 => 
          array (
            'name' => 'phone_other',
            'comment' => 'Other phone number for the contact',
            'label' => 'LBL_OTHER_PHONE',
          ),
        ),
        10 => 
        array (
          0 => 
          array (
            'name' => 'rating_c',
            'studio' => 'visible',
            'label' => 'LBL_RATING',
          ),
          1 => 'status',
        ),
        11 => 
        array (
          0 => 
          array (
            'name' => 'class_c',
            'label' => 'LBL_CLASS',
          ),
          1 => 
          array (
            'name' => 'follow_status_reason_c',
            'studio' => 'visible',
            'label' => 'LBL_FOLLOW_STATUS_REASON',
          ),
        ),
        12 => 
        array (
          0 => 
          array (
            'name' => 'email_c',
            'label' => 'LBL_EMAIL',
          ),
          1 => '',
        ),
        13 => 
        array (
          0 => 
          array (
            'name' => 'jjwg_maps_address_c',
            'label' => 'LBL_JJWG_MAPS_ADDRESS',
          ),
          1 => 
          array (
            'name' => 'facebook_c',
            'label' => 'LBL_FACEBOOK',
          ),
        ),
        14 => 
        array (
          0 => '',
          1 => '',
        ),
        15 => 
        array (
          0 => 
          array (
            'name' => 'expected_major_2_c',
            'studio' => 'visible',
            'label' => 'LBL_EXPECTED_MAJOR_2',
          ),
          1 => 
          array (
            'name' => 'expected_job_c',
            'label' => 'LBL_EXPECTED_JOB',
          ),
        ),
        16 => 
        array (
          0 => 
          array (
            'name' => 'number_of_calls_c',
            'label' => 'LBL_NUMBER_OF_CALLS',
          ),
          1 => 
          array (
            'name' => 'schedule_date_c',
            'label' => 'LBL_SCHEDULE_DATE',
          ),
        ),
        17 => 
        array (
          0 => 'description',
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
            'name' => 'note_c',
            'label' => 'LBL_NOTE_C',
          ),
          1 => 
          array (
            'name' => 'call_log_c',
            'label' => 'LBL_CALL_LOG',
          ),
        ),
        19 => 
        array (
          0 => 
          array (
            'name' => 'dup_c',
            'label' => 'LBL_DUP',
          ),
          1 => 
          array (
            'name' => 'last_dup_c',
            'label' => 'LBL_LAST_DUP',
          ),
        ),
        20 => 
        array (
          0 => 
          array (
            'name' => 'new_dup_c',
            'label' => 'LBL_NEW_DUP',
          ),
          1 => 
          array (
            'name' => 'program_c',
            'studio' => 'visible',
            'label' => 'LBL_PROGRAM',
          ),
        ),
        21 => 
        array (
          0 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_TO',
          ),
          1 => 
          array (
            'name' => 'assessor_c',
            'label' => 'LBL_ASSESSOR',
          ),
        ),
        22 => 
        array (
          0 => 
          array (
            'name' => 'created_by_name',
            'label' => 'LBL_CREATED',
          ),
          1 => '',
        ),
        23 => 
        array (
          0 => 
          array (
            'name' => 'gender_c',
            'studio' => 'visible',
            'label' => 'LBL_GENDER',
          ),
          1 => '',
        ),
      ),
      'LBL_PANEL_ASSIGNMENT' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'date_entered',
            'customCode' => '{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}',
          ),
          1 => 
          array (
            'name' => 'date_modified',
            'label' => 'LBL_DATE_MODIFIED',
            'customCode' => '{$fields.date_modified.value} {$APP.LBL_BY} {$fields.modified_by_name.value}',
          ),
        ),
      ),
    ),
  ),
);
;
?>
