<?php

$admin_option_defs = array();

$admin_option_defs['Administration']['CE_SMS_Config'] = array('32','LBL_CE_SMS_CON','LBL_CE_SMS_DESC','./index.php?module=CE_SMS_Configuration&action=ceconfig'
);

$admin_option_defs['Administration']['CE_SMS_Configuration_Activation'] = array('32', 'LBL_CE_SMS_CONFIG_LICENSE_TITLE', 'LBL_CE_SMS_CONFIG_LICENSE', './index.php?module=CE_SMS_Configuration&action=license');

$admin_group_header[]= array('LBL_CE_ADDON','',false,$admin_option_defs, '');



?>
