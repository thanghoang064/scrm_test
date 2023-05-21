<?php 
 //WARNING: The contents of this file are auto-generated


unset($module_menu);
if(ACLController::checkAccess('Leads', 'list', true))$module_menu[]=Array("index.php?module=Leads&action=index&return_module=Leads&return_action=DetailView", $mod_strings['LNK_LEAD_LIST'],"List", 'Leads');
$module_menu[]=Array("index.php?module=Leads&action=findexactlead", 'Find Exact Lead',"List", 'Leads');
?>