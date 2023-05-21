<?php 
 //WARNING: The contents of this file are auto-generated


$hook_array['before_save'][] = Array(
    array(
        'module' => 'Accounts',
         'hook' => 'after_ui_frame',
        'order' => 99,
        'description' => 'Include Script Hook',
        'file' => 'custom/modules/<Module Name>/<Logic Hook File>.php',
        'class' => 'ListViewScriptHook',
        'function' => 'after_ui_frame',
    ),
);

 $hook_array['after_ui_frame'][] = Array(
        //Processing index. For sorting the array.
        1, 
        
        //Label. A string value to identify the hook.
        'Add custom JS script to Lead list view', 
        
        //The PHP file where your class is located.
        'custom/modules/Leads/custom_js.php', 
        
        //The class the method is in.
        'ListViewScriptHook', 
        
        //The method to call.
        'add_custom_js' 
    );

$hook_array['before_save'][] = Array(30, 'Check duplicate phone numbers', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'check_all_phone_numbers');


$hook_array['after_save'][] = Array(9, 'Check new dup', 'custom/modules/Leads/afterSave.php','AfterSave', 'check_new_dup');

$hook_array['before_save'][] = Array(4, 'Prevent Update Active Lead Status', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'prevent_change_active_lead_status');

$hook_array['before_save'][] = Array(4, 'Prevent Update lead topic', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'prevent_change_lead_topic');
 
$hook_array['before_save'][] = Array(1, 'Normalize lead name', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'normalize'); 
$hook_array['before_save'][] = Array(3, 'Format mobile phone', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'formatPhone');

$hook_array['before_save'][] = Array(5, 'Save the lead date activate', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'save_date_activated');

$hook_array['before_save'][] = Array(7, 'Save the date enrolled', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'save_date_enrolled');

//$hook_array['before_save'][] = Array(9, 'Mark auto assigned leads', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'mark_auto_assign_leads');
?>