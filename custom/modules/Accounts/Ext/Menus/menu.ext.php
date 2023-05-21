<?php 
 //WARNING: The contents of this file are auto-generated


unset($module_menu);
if(ACLController::checkAccess('Accounts', 'list', true))$module_menu[]=Array("index.php?module=Accounts&action=index&return_module=Accounts&return_action=DetailView", $mod_strings['LNK_ACCOUNT_LIST'],"List", 'Accounts');
?>