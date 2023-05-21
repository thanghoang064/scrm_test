<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'modules/PolyReports/alnb.php';

class PolyReportsViewList extends SugarView {

    public function display() {
		// echo '
		// <br>
		// <a href="?module=PolyReports&action=alnb">Tổng kết báo cáo theo năm</a>
		// <br>';
		echo '
		<h1>Danh sách các báo cáo</h1>
		
		<a href="?module=PolyReports&action=voice">Báo cáo voice cơ sở</a>
		<br>
		<a href="?module=PolyReports&action=voiceall">Báo cáo voice toàn quốc</a>
		<br>
		<a href="?module=PolyReports&action=lead">Báo cáo active lead cơ sở</a>
		<br>
		<a href="?module=PolyReports&action=leadall">Báo cáo active lead toàn quốc</a>
		<br>
		<a href="?module=PolyReports&action=source">Báo cáo nguồn cơ sở</a>
		<br>
		<a href="?module=PolyReports&action=sourceall">Báo cáo nguồn toàn quốc</a>
		<br>
		<a href="?module=PolyReports&action=profile">Báo cáo cá nhân</a>

		';
		// echo 'Chức năng báo cáo tạm dừng hoạt động để cải thiện hiệu năng';
    }

}
