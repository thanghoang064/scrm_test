<?php
$hook_array['before_save'][] = Array(4, 'Prevent Update Active Lead Status', 'custom/modules/Leads/beforeSave.php','BeforeSave', 'prevent_change_active_lead_status');