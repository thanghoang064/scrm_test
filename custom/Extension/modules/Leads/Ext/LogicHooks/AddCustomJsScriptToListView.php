<?php
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