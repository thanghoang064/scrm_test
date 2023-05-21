<?php
unset($module_menu);
if(ACLController::checkAccess('Accounts', 'list', true))$module_menu[]=Array("index.php?module=Accounts&action=index&return_module=Accounts&return_action=DetailView", $mod_strings['LNK_ACCOUNT_LIST'],"List", 'Accounts');