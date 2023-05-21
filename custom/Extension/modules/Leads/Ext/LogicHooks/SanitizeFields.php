<?php 
$hook_array['before_save'][] = Array(1, 'Normalize lead name', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'normalize'); 
$hook_array['before_save'][] = Array(3, 'Format mobile phone', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'formatPhone');