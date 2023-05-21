<?php

if (!isset($hook_array) || !is_array($hook_array))
{
    $hook_array = array();
}
if (!isset($hook_array['after_ui_frame']) || !is_array($hook_array['after_ui_frame']))
{
    $hook_array['after_ui_frame'] = array();
}

$hook_array['after_ui_frame'][] = Array(100, 'CE SMS Connector', 'modules/CE_SMS_Configuration/CE_SMS_UIFrame.php', 'CE_SMS_Class', 'CE_SMS_Func');
