<?php

$dictionary['AnalyticReporting'] = array(
	'table' => '',
	'fields' => array(),
	'relationships' => array(),
);

require_once('include/SugarObjects/VardefManager.php');
VardefManager::createVardef('AnalyticReporting','AnalyticReporting', array('basic','assignable'));