<?php
$hook_array['after_save'] = Array();
$hook_array['after_save'][] = Array(1, 'Collect call logs', 'custom/modules/Calls/call_log.php', 'CallLog', 'collect_call_logs');