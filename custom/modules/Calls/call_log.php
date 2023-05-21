<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
	   
class CallLog {

function collect_call_logs1($bean, $event, $arguments) {
    global $db, $current_user;
    include_once 'include/TimeDate.php';
    $timedate = new TimeDate($current_user);
    $sql = "SELECT date_entered, parent_id, description FROM calls WHERE deleted = 0 ORDER BY parent_id ASC, date_entered ASC";
    $calls = $db->query($sql);
    $call_list = array();
    while ($call = $db->fetchByAssoc($calls)) {
        $call_list[] = $call;
    }
    $call_count = array();
    $call_log = array();
    foreach ($call_list as $call) {
        $lead_id = $call['parent_id'];
        if(!isset($call_count[$lead_id])) {
            $call_count[$lead_id] = 0;
        }
        if(!isset($call_log[$lead_id])) {
            $call_log[$lead_id] = '';
        }
        $call_log[$lead_id] .= ++$call_count[$lead_id] . '. ';
        $call_log[$lead_id] .= $timedate->to_display_date_time($call['date_entered']);
        if (!empty($call['description'])) {
            $call_log[$lead_id] .= ": ";
            $call_log[$lead_id] .= $call['description'] . ' | ';
        }
    }
    foreach($call_log as $lead_id => $log) {
        $sql = "UPDATE leads_cstm SET call_log_c = '$log' WHERE id_c = '$lead_id' AND call_log_c = '\$call_log'";
        $db->query($sql);
    }
}
	function collect_call_logs($bean, $event, $arguments){
		global $db, $current_user;
		include_once 'include/TimeDate.php';
		$timedate = new TimeDate($current_user);
		$parent_id = $bean->parent_id;
		//$GLOBALS['log']->fatal($parent_id);
		$sql = "SELECT date_entered, description FROM calls WHERE parent_id = '$parent_id' AND deleted = 0 ORDER BY date_entered ASC";
		$calls = $db->query($sql);
		$call_log = "";
		$i = 0;
		$call_list = array();
		while($call = $db->fetchByAssoc($calls)) {
			$call_list[] = $call;
		}
		$number = 0;
		$bean->number1_c = 1 + count($call_list);
		foreach($call_list as $call) {
			$call_log .= ++$number . '. ';
			$call_log .= $timedate->to_display_date_time($call['date_entered']);
			if(!empty($call['description'])) {
				$call_log .= ": ";
				$call_log .= $call['description'];
			}
			if($i < (count($call_list) - 1))
				$call_log .= "|";
			$i++;
		}
		// if($number > 0)
			// $bean->contacted_c = 1;
		//$GLOBALS['log']->fatal($call_log);
		//$GLOBALS['log']->fatal(var_export($bean, true));
		switch($bean->parent_type) {
			case 'Leads':
			//	$db->query($sql);
$lead = BeanFactory::getBean('Leads', $parent_id);
$lead->contacted_c = 1;
$lead->call_log_c = $call_log;
$lead->number_of_calls_c = $number;
$lead->save();

				break;
			case 'Accounts':
				$sql = "UPDATE accounts_cstm SET call_log_c = '$call_log' WHERE id_c = '$parent_id'";
				$db->query($sql);
				//$GLOBALS['log']->fatal($sql);
				break;
		}
	}
}
?>
