<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'modules/PolyReports/alnb.php';
class PolyReportsViewAlnb extends SugarView {

    public function display() {
		$ss = new Sugar_Smarty();
		$data = array('hoang');
		$alnb = new Alnb;
		$daily = $alnb->get_recent_daily_report();
		$ss->assign('data', $daily);
		$monthly = $alnb->get_monthly_report();
		$ss->assign('monthly', $monthly);
		$weekly = $alnb->get_weekly_report();
		$ss->assign('weekly', $weekly);
		$html = $ss->fetch('modules/PolyReports/tpls/alnb.tpl');
		echo $html;
    }

}
