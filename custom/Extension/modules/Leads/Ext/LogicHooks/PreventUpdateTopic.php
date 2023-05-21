<?php
$hook_array['before_save'][] = Array(4, 'Prevent Update lead topic', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'prevent_change_lead_topic');