<?php

if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once 'modules/AnalyticReporting/controller.php';

$controller = new AnalyticReportingController();
$controller->action_widget();
