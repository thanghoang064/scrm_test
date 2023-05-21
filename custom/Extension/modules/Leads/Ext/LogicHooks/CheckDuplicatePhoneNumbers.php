<?php
$hook_array['before_save'][] = Array(30, 'Check duplicate phone numbers', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'check_all_phone_numbers');
