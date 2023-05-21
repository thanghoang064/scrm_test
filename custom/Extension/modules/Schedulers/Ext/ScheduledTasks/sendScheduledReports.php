<?php

/*** DOMAIN_CHECK ***/
 if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');$job_strings = array_merge($job_strings, array('sendScheduledReports',));function sendScheduledReports() {include_once "modules/AnalyticReporting/controllers/ARJobsController.php";$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZi8 = new ARJobsController();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZi8->sendScheduledReports();return true;} 