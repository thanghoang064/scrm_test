<?php
ini_set('display_errors', 1);
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class BeforeSaveAccount
{
    
    function save_api($bean, $event, $argument)
    {
		 
		if($_REQUEST['action'] !='ConvertLead' && $_REQUEST['module'] != 'Import' ){
			$GLOBALS['log']->fatal("Update Account API");
			$GLOBALS['log']->fatal($_REQUEST);
			include_once 'custom/api_ants.php';
			if(!empty($bean->fetched_row['id'])){
				$result=CreateAccountAPI($bean,'update');
				$GLOBALS['log']->fatal($result);
				$GLOBALS['log']->fatal('xx999');
			}
		}
    }
}