<?php

/*** DOMAIN_CHECK ***/
 include_once "modules/AnalyticReporting/controllers/ARController.php";class ARReportController extends ARController{function addToDashboard(){PlatformConnector::addToDashboard();} function bouncer(){session_start();if(isset($_POST["image"])){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZK1010 = rand(1,1e7);$_SESSION["its_advancedReports_img".$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZK1010] = $_POST["image"];echo $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZK1010;}elseif(isset($_GET["img"])){header("Content-Type:image/png");header("Content-Disposition: attachment;filename=chart.png");header('Cache-Control: must-revalidate, post-check=0, pre-check=0');$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZL1111 = $_SESSION["its_advancedReports_img".$_GET["img"]];if(!isset($_GET["nobase"])) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZL1111 = base64_decode(str_replace("data:image/png;base64,","", $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZL1111));} echo $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZL1111;} exit();} function combine(){session_start();$ZZZZZZZZZZf5 = "Nothing passed to combine, empty result";if(isset($_REQUEST['sources'])) {$ZZZZZZZZZZZZZZZZZZZZZZZL1111 = $_REQUEST['sources'];$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZM1212 = new ZZZZZZZZZZZZZZZZZZZZZZZK1010($ZZZZZZZZZZZZZZZZZZZZZZZL1111);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZM1212->combine();$p15 = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZM1212->ZZZZZZZZZZZZZZZZZZZZZZZQ1616();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZK1010 = rand(1,1e7);$_SESSION["its_advancedReports_img".$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZK1010] = $p15;$ZZZZZZZZZZf5 = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZK1010;} echo $ZZZZZZZZZZf5;die();} function loadPickLists(){$db = PlatformConnector::ZZZZZZZZZZZZZZK1010();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717 = ZZZZZZZZZZZZZZZZZZZv21::getInstance();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717->ZZZZZZZZZZZZZZZZZZZy24(new ZZZZZZZZZZZZZZZZZc2('{"enableCustomTables":true}'));$ZZZZZZZZZZf5 = array();$fieldName = $_REQUEST["fieldName"];list($ZZZZK1010, $moduleName, $fieldName) = explode("_", $fieldName, 3);$ZZZZZZZZZZZZM1212 = $db->ZZZZZZZZZZZZL1111($fieldName, $moduleName);if($ZZZZZZZZZZZZM1212) {foreach($ZZZZZZZZZZZZM1212 as $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZN1313) {$ZZZZZZZZZZf5[] = array("key" => $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZN1313, "value" => $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZN1313);}} echo json_encode($ZZZZZZZZZZf5);exit;} function loadReport($ZZZZZZy24){$db = PlatformConnector::ZZZZZZZZZZZZZZK1010();$ZZZZZZZR1717 = new ZZZZZZZS1818();$ZZZZZZZZZZZZZZZZZZZZZB11 = PlatformConnector::ZZZZZZZZZZZZZV2121();$ZZZZZZZZV2121 = new ZZZZZZZZW2222($ZZZZZZZR1717);$ZZZZZZS1818 = new ZZZZZy24();$ZZZZZZZZY2424 = $ZZZZZZZZV2121->ZZZZZZZZZ2525($ZZZZZZZZZZZZZZZZZZZZZB11, $ZZZZZZy24);if($ZZZZZZZZY2424 == 0){$ZZZZZZZR1717->ZZZZZZZZZa0();die();} $ZZZZZZZZZZZA00 = new ZZZZZZZD33();$report = $ZZZZZZZZZZZA00->ZZZZZZZZQ1616("*", "id = {$ZZZZZZy24}");$report = $report[0];$report = $ZZZZZZZR1717->ZZZZZZZZX2323($report, $_GET);$_REQUEST = $ZZZZZZZR1717->ZZZZZZZZX2323($_REQUEST, $_GET);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 = false;$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZO1414 = (isset($_GET["chart"]) && $_GET["chart"] == 1);if ($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZO1414) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 = true;$report = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZZr17($report);$_REQUEST = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZZr17($_REQUEST);$report['grouping'] = $_REQUEST['grouping'];} $report = new ARReport($report, $_REQUEST, $ZZZZZZZZY2424);$ZZZZZZZJ99 = $report->ZZZZZZZZZZZZZZZZZZZZt19();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717 = ZZZZZZZZZZZZZZZZZZZv21::getInstance();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717->ZZZZZZZZZZZZZZZZZZZy24($ZZZZZZZJ99);$ZZZZZZZZZZZZZZZZZf5 = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZZb1($ZZZZZZZJ99, $_REQUEST);$ZZZZZZZZZZZZZZZZZh7 = $report->retrieveData($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25, $ZZZZZZZZZZZZZZZZZf5, $ZZZZZZZZZZZZZZZZZZZZZB11, $ZZZZZZS1818, $ZZZZZZZR1717, $db);$ZZZZZZZZZZZZZZZZZh7 = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZZg6($ZZZZZZZZZZZZZZZZZh7, $_REQUEST);if ($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZO1414) {$ZZZZZZZZZZr17 = $report->ZZZZZZZZZZZZZZZZZZZZD33()->ZZZZZZj9();foreach ($ZZZZZZZZZZr17 as $ZZZZZZZZZZZZZZZZS1818) {if (!$ZZZZZZZZZZZZZZZZS1818['groupByRange']) {continue;} $ZZZZZZZZZZZZZZZZZh7['cols'][$ZZZZZZZZZZZZZZZZS1818['name']] = $ZZZZZZZZZZZZZZZZZh7['cols'][$ZZZZZZZZZZZZZZZZS1818['rangeName']];$count = count($ZZZZZZZZZZZZZZZZZh7['data']);for($ZZZZK1010 = 0;$ZZZZK1010<$count;$ZZZZK1010++){$ZZZZZZZZZZZZZZZZZh7['data'][$ZZZZK1010][$ZZZZZZZZZZZZZZZZS1818['name']] = $ZZZZZZZZZZZZZZZZZh7['data'][$ZZZZK1010][$ZZZZZZZZZZZZZZZZS1818['rangeName']];}}} $ZZZZZZZZZZZZZZZZZZZZZZK1010 = new ZZZZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZB11);$ZZZZZZZZZZZZZZZZZh7 = $ZZZZZZZZZZZZZZZZZZZZZZK1010->ZZZZZZZZZZZZZZZZZZZZZZM1212($ZZZZZZZZZZZZZZZZZh7, $report);if ($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZO1414) {if(isset($_REQUEST['chartSettings']) && $_REQUEST['chartSettings']['type'] == 'bar'){if(isset($_REQUEST['chartSettings']['chartShowPercents']) && $_REQUEST['chartSettings']['chartShowPercents'] == 'true'){$ZZZZZZZZZZZZZZZZZh7 = $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZP1515($ZZZZZZZZZZZZZZZZZh7, $_REQUEST['chartSettings']);}}} if($report->ZZZZZZZZZZZZZZZZZZZZZZJ99() && !$report->ZZZZZZZZZZZZZZZZZZZZt19()->ZZZZZZZZZZZZZZZZZe4()) {$ZZZZZZZZZZZZZZZZZh7 = $report->ZZZZZZZZZZZZZZZZZZZZy24()->ZZZZZZZZZZZZZZZZZZZZZZM1212($ZZZZZZZZZZZZZZZZZh7);} return $ZZZZZZZZZZZZZZZZZh7;} function ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZP1515($ZZZZZZZZZZZZZZZZZh7 = array(), $ZZZZZZZZw22 = array()) {if(count($ZZZZZZZZw22['chartAggregates']) == 0) {return $ZZZZZZZZZZZZZZZZZh7;} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZQ1616 = $ZZZZZZZZw22['chartAggregates'][0]['selectedField'];foreach ($ZZZZZZZZw22['chartAggregates'][0]['value'] as $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZR1717 => $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZc2) {if($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZc2 == 'false'){continue;} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZS1818 = ZZZZZZZZZZZZZZZZZZZZZZZZZr17::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZT1919 = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZS1818[$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZR1717]['namePostfix'];$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZU2020 = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZQ1616.$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZT1919."_total_percent_sum";foreach ($ZZZZZZZZZZZZZZZZZh7['data'] as $ZO1414 => $ZZZZZZZr17) {$ZZZZZZZZZZZZZZZZZh7['data'][$ZO1414][$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZQ1616.$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZT1919] = round(str_replace(',', '.',rtrim($ZZZZZZZZZZZZZZZZZh7['data'][$ZO1414][$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZU2020], "%")));}} return $ZZZZZZZZZZZZZZZZZh7;} function makePDF() {$ZZZZZZy24 = $_REQUEST['record'];$ZZZZZZZQ1616 = PlatformConnector::ZZZZZZZZZZZZZV2121();$ZZZZZx23 = new ZZZZZy24();$ZZZZZZZZZZZA00 = new ZZZZZZZD33();$ZZZZZZZZO1414 = $ZZZZZZZZZZZA00->ZZZZZZZZS1818($ZZZZZZy24);$report = $ZZZZZZZZZZZA00->ZZZZZZZZT1919($ZZZZZZy24, $ZZZZZZZQ1616, $ZZZZZZZZO1414, $_REQUEST);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16 = new ZZZZZZZZZZZZZZZZZZZZZZZh7($report, $ZZZZZZZQ1616, $ZZZZZx23);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16->ZZZZZZZZZZZZZZZZZZZZZZZx23(true);} function ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZl11() {$ZZZZZZy24 = $_REQUEST['record'];$ZZZZZZZQ1616 = PlatformConnector::ZZZZZZZZZZZZZV2121();$ZZZZZx23 = new ZZZZZy24();$ZZZZZZZZZZZA00 = new ZZZZZZZD33();$ZZZZZZZZO1414 = $ZZZZZZZZZZZA00->ZZZZZZZZS1818($ZZZZZZy24);$report = $ZZZZZZZZZZZA00->ZZZZZZZZT1919($ZZZZZZy24, $ZZZZZZZQ1616, $ZZZZZZZZO1414, $_REQUEST);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16 = new ZZZZZZZZZZZZZZZZZZZZZZZh7($report, $ZZZZZZZQ1616, $ZZZZZx23);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16->ZZZZZZZZZZZZZZZZZZZZZZZJ99(true);} function makeXLS() {$ZZZZZZy24 = $_REQUEST['record'];$ZZZZZZZQ1616 = PlatformConnector::ZZZZZZZZZZZZZV2121();$ZZZZZx23 = new ZZZZZy24();$ZZZZZZZZZZZA00 = new ZZZZZZZD33();$ZZZZZZZZO1414 = $ZZZZZZZZZZZA00->ZZZZZZZZS1818($ZZZZZZy24);$report = $ZZZZZZZZZZZA00->ZZZZZZZZT1919($ZZZZZZy24, $ZZZZZZZQ1616, $ZZZZZZZZO1414, $_REQUEST);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16 = new ZZZZZZZZZZZZZZZZZZZZZZZh7($report, $ZZZZZZZQ1616, $ZZZZZx23);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16->ZZZZZZZZZZZZZZZZZZZZZZZD33(true);} function getXLSWorksheets($ZZZZZZZZZu20) {$ZZZZZZZZZZZZZZZZE44 = ZZZZZZZZZZZZZZZZZZZZZX2323::ZZZZZZZZZZZZZZZZZZZZZZr17($ZZZZZZZZZu20, true);$ZZZZZZZZU2020 = array();if(!empty($ZZZZZZZZZZZZZZZZE44)){$ZZZZZZZZU2020['template'] = $ZZZZZZZZZZZZZZZZE44;} $ZZZZZZZZU2020 = base64_encode(serialize($ZZZZZZZZU2020));$ZZZZZZS1818 = new ZZZZZy24();$ZZZZZZZZZZZZZZZZZZZZZZZy24 = new ZZZZZZZZZZZZZZZZZZZZZZZz25();$url = $ZZZZZZS1818->getValue('apiEndpoint') . "generate/xls/worksheets";$ZZZZZZZZZZZZZZZZZZZZZZZy24->ZZZZZZZZZZZZZZZZZZZZZZZA00(ZZZZZZZZZZZZZZZZZZZZZZZz25::ZZZZZZZZZZZZZZZZZZZZZZZB11);$ZZZZZZZZZZZZZZZZZZZZZZZy24->fetch($url, array('request' => $ZZZZZZZZU2020));return $ZZZZZZZZZZZZZZZZZZZZZZZy24->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525();} function report(){global $mod_strings, $app_strings;$db = PlatformConnector::ZZZZZZZZZZZZZZK1010();$ZZZZZZZR1717 = new ZZZZZZZS1818();$ZZZZZZZZZZZZZZZZZZZZZB11 = PlatformConnector::ZZZZZZZZZZZZZV2121();$ZZZZZZZZV2121 = new ZZZZZZZZW2222($ZZZZZZZR1717);$ZZZZZZZZZZZZZZZZZZZZb1 = $ZZZZZZZZV2121->ZZZZZZZZZ2525($ZZZZZZZZZZZZZZZZZZZZZB11, $_REQUEST["record"]);if(!$ZZZZZZZZZZZZZZZZZZZZb1){$ZZZZZZZR1717->ZZZZZZZZZa0();die;} $ZZZZZZy24 = (int)$_REQUEST["record"];$ZZZZZZZZZZZA00 = new ZZZZZZZD33();$report = $ZZZZZZZZZZZA00->ZZZZZZZZQ1616("*", "id = {$ZZZZZZy24}");if(!$report || !isset($report[0])) {throw new Exception("No such report id: {$ZZZZZZy24}");} $report = $report[0];if(isset($this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['debugMode']) && $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['debugMode']){$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['debugReport'] = var_export($report, true);} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZV2121 = false;if(isset($_REQUEST["drilldown"])) {$report = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZO1414($report, $_REQUEST["drilldown"]);} $report = new ARReport($report, array(), $ZZZZZZZZZZZZZZZZZZZZb1);$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717 = ZZZZZZZZZZZZZZZZZZZv21::getInstance();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717->ZZZZZZZZZZZZZZZZZZZy24($report->ZZZZZZZZZZZZZZZZZZZZt19());$ZZZZZZZZZZZZZZZZZZZZo14 = new ZZZZZZZZZZZZZZZZZZZZn13($report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZS1818(), $report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222(), $db, $ZZZZZZZR1717, $report->ZZZZZZZZZZZZZZZZZZZF55());$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZr17 = $report->ZZZZZZZZZZZZZZZZZZZZC22();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222 = array();foreach ($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZr17['sectionStates'] as $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZX2323) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZY2424 = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZX2323['collapsed'];$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222[$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZX2323['name']] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZY2424;} $ZZZZZZZZZZZz25 = new ZZZZZZW2222();$P1515 = $ZZZZZZZZZZZz25->ZZZZZZZs18("id, title");$ZZZZZZZZZZZZZZZZW2222 = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZV2121($P1515);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525 = new ZZZZZZZZZZZZZZZZZZZA00(array(), false, $report);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZK1010(new ZZZZZy24());$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZm12($ZZZZZZZZZZZZZZZZZZZZo14));if($report->ZZZZZZZZZZZZZZZZZZZF55()) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZE44($report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222(), new ZZZZZZZZZZZZZZZZZZZZG66($db,$ZZZZZZZR1717, array(), $ZZZZZZZZZZZZZZZZZZZZZB11), $ZZZZZZZZZZZZZZZZZZZZo14));} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZO1414());$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZR1717($ZZZZZZZZV2121, new ZZZZZZZZZZn13(), new ZZZZZZZZZZw22(), $ZZZZZZZR1717, $ZZZZZZZZZZZZZZZZZZZZb1, $ZZZZZZZZZZZZZZZZZZZZZB11));$p15 = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->f5(true);$ZZZZZZZZZZZZZZZZZZZZZZt19 = new ZZZZZZZZZo14();$ZZZZZZZZZZZZZZZZZZZZZZt19->ZZZZZZZZZr17('id, name');$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZa0 = $ZZZZZZZZZZZZZZZZZZZZZZt19->ZZZZZZZZZr17('id, name');$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZa0 = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZA00($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZa0);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1 = $ZZZZZZZZZZZA00->ZZZZZZZP1515($ZZZZZZZZZZZZZZZZZZZZZB11);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1 = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZG66($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1, $report->ZZZZZZk10());$ZZZZZZZZZZZZZZZZZZL1111 = ZZZZZZZZZZZZZz25::load('reportBuilder', 'common');$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['MOD'] = $mod_strings;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['APP'] = $app_strings;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['DICTIONARY'] = json_encode($mod_strings);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["reportEditUrl"] = $ZZZZZZZZZZZZZZZZZZL1111['internal']['reportEditUrl'].$report->ZZZZZZk10();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["report_folders"] = $ZZZZZZZZZZZZZZZZW2222;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["current_report_folder"] = $report->ZZZZZZl11();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["excelTemplates"] = json_encode($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZa0);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["reportNamesForTemplates"] = json_encode($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["REPORTDATA"] = $p15;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["SHOW_DETAILS"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZC22;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["SHOW_TABLE"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZB11;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["CANEDIT"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZa0($ZZZZZZZZZZZZZZZZZZZZb1);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["CANDELETE"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZc2($ZZZZZZZZZZZZZZZZZZZZb1);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["CANEXPORT"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZR1717->ZZZZZZZZZZZZZZZZZZZz25()->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["REPORTCOMBINED"] = $report->ZZZZZZZZZZZZZZZZZZZF55();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["CURRENTUSER"] = json_encode(array("id"=>$ZZZZZZZZZZZZZZZZZZZZZB11->ZZZZZZk10(),"is_admin"=> $ZZZZZZZZZZZZZZZZZZZZZB11->ZZZZZZZV2121()));$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["REPORTSECTIONSTATES"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["REPORTTITLE"] = $report->getTitle();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["REPORTDESCRIPTION"] = $report->ZZZZZZo14();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZE44 = PlatformConnector::getUrl();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['SERVERURL'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZE44;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['isSidecar'] = PlatformConnector::ZZZZZZZZZZZZZZJ99()?1:0;} function ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZj9(){$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['debugMode'] = true;$this->report();} function saveReport(){$db = PlatformConnector::ZZZZZZZZZZZZZZK1010();$ZZZZZZZR1717 = new ZZZZZZZS1818();$ZZZZZZZZZZZZZZZZZZZZZB11 = PlatformConnector::ZZZZZZZZZZZZZV2121();$module = PlatformConnector::$moduleName;$ZZZZZZZZr17 = html_entity_decode($_POST['columns']);$filters = html_entity_decode($_POST['filters']);$ZZZZZZZZs18 = html_entity_decode($_POST['grouping']);$ZZZZZZZZt19 = html_entity_decode($_POST['aggregates']);$ZZZZZZZZu20 = html_entity_decode($_POST['totalAggregates']);$ZZZZZZZJ99 = html_entity_decode($_POST['options']);$ZZZZZZZZv21 = html_entity_decode($_POST['labels']);$ZZZZZZZZw22 = html_entity_decode($_POST['chartSettings']);$ZZZZZZZZz25 = (isset($_POST['calculatedColumns']))?$_POST['calculatedColumns']:"[]";$ZZZZZZZZV2121 = new ZZZZZZZZW2222($ZZZZZZZR1717);$ZZZZZZZZZZZZZZZZZZZZb1 = $ZZZZZZZZV2121->ZZZZZZZZZ2525($ZZZZZZZZZZZZZZZZZZZZZB11, (int)$_REQUEST["record"]);if($ZZZZZZZZZZZZZZZZZZZZb1<2){$ZZZZZZZR1717->ZZZZZZZZZa0();die;} function ZZZZZZZZZZZZZZZZZo14($ZZZZZZZZV2121,$id,$ZZZZZZZZp15){global $_POST;$ZZZZZZZZZZZZZZZZZp15 = $_POST["isScheduled"];$ZZZZZZZZZZX2323 = new ZZZZZZZZZZw22();if($ZZZZZZZZZZZZZZZZZp15 == "1"){$ZZZZZZZZZZZZZZZZZq16 = (isset($_POST["scheduledRecipients"]))?($_POST["scheduledRecipients"]):(array());$ZZZZZZZZZZK1010 = (isset($_POST["intervalOptions"]))?($_POST["intervalOptions"]):(array());$ZZZZZZZZZZQ1616 = array();if(is_array(end($ZZZZZZZZZZZZZZZZZq16))){$ZZZZZZZZZZQ1616 = array_pop($ZZZZZZZZZZZZZZZZZq16);} $ZZZZZZZZZZX2323->ZZZZZZZZZZG66($id,$_POST["interval"],$_POST["intervalH"],$_POST["intervalM"],$ZZZZZZZZZZK1010,$ZZZZZZZZp15,$_POST["scheduledFormats"]);$ZZZZZZZZZZX2323->ZZZZZZZZZZP1515($id,$ZZZZZZZZZZZZZZZZZq16,$ZZZZZZZZZZQ1616);}else{$ZZZZZZZZZZX2323->ZZZZZZZZZZF55($id);}} $ZZZZZZZZZZZA00 = new ZZZZZZZD33();if(isset($_REQUEST["saveAs"])&&$_REQUEST["saveAs"]==1){$title = $_POST['title'];$description = $_POST['description'];$ZZZZZZZZn13 = $_POST['globalSharing'];$ZZZZZZZZo14 = $_POST['globalSharingRights'];$ZZZZZZZZZZZZZZZZZm12 = json_decode($_POST['userSharing'],true);$ZZZZZZZZp15 = $_POST['owner'];$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZc2 = $ZZZZZZZZZZZA00->loadReport((int)$_REQUEST["record"]);$ZZZZZZZZG66 = '{}';$ZZZZZZZZx23 = (isset($_POST['calcFields']))?$_POST['calcFields']:"[]";$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZr17 = (isset($_POST['reportStates']))?$_POST['reportStates']:"[]";$isCombined = 0;if(isset($_REQUEST["combined"])&&$_REQUEST["combined"]==1){$ZZZZZZZZG66 = $_POST["combinedSelectedFields"];$isCombined = 1;} $id = $ZZZZZZZZZZZA00->ZZZZZZZZE44($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZc2["module"], $_POST["reportFolder"], json_encode($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZc2["related_data"]),$ZZZZZZZZr17, $filters, $ZZZZZZZZs18, $ZZZZZZZZt19, $ZZZZZZZZu20, $ZZZZZZZJ99, $ZZZZZZZZv21, $title, $description, $ZZZZZZZZw22,$ZZZZZZZZn13,$ZZZZZZZZo14,$ZZZZZZZZp15,$ZZZZZZZZx23,$isCombined,$ZZZZZZZZG66, $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZr17, $ZZZZZZZZz25);$ZZZZZZZZV2121->ZZZZZZZZZZZZZZZZZn13($id,$ZZZZZZZZZZZZZZZZZm12);ZZZZZZZZZZZZZZZZZo14($ZZZZZZZZV2121,$id,$ZZZZZZZZp15);echo json_encode(array("id" => $id, "msg" => "".$ZZZZZZZR1717->ZZZZZZZZZZZZZZZO1414('label_new_report_saved', $module)));exit;}elseif(isset($_REQUEST["changeTitle"])&&$_REQUEST["changeTitle"]==1){$id = $_REQUEST["record"];$ZZZZZZZZZZZA00->ZZZZZZZZP1515($id,$_REQUEST["title"],$_REQUEST["description"]);}else{$ZZZZZZZZn13 = $_POST['globalSharing'];$ZZZZZZZZo14 = $_POST['globalSharingRights'];$ZZZZZZZZZZZZZZZZZm12 = json_decode($_POST['userSharing'],true);$ZZZZZZZZp15 = $_POST['owner'];$id = (int) $_REQUEST["record"];$ZZZZZZZZx23 = (isset($_POST['calcFields']))?$_POST['calcFields']:"[]";$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZr17 = (isset($_POST['reportStates']))?$_POST['reportStates']:"[]";$ZZZZZZZZG66 = null;if(isset($_REQUEST["combined"])&&$_REQUEST["combined"]==1){$ZZZZZZZZG66 = $_POST["combinedSelectedFields"];} if(empty($ZZZZZZZJ99)){echo "Saving report failed. No data passed.";exit;} $ZZZZZZZZZZZA00->saveReport($id, $ZZZZZZZZr17, $filters, $ZZZZZZZZs18, $ZZZZZZZZt19, $ZZZZZZZZu20, $ZZZZZZZJ99, $ZZZZZZZZv21, $ZZZZZZZZw22,$ZZZZZZZZn13,$ZZZZZZZZo14,$ZZZZZZZZp15,$ZZZZZZZZx23,$ZZZZZZZZG66, $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZr17, $ZZZZZZZZz25);$ZZZZZZZZV2121->ZZZZZZZZZZZZZZZZZn13($id,$ZZZZZZZZZZZZZZZZZm12);ZZZZZZZZZZZZZZZZZo14($ZZZZZZZZV2121,$id,$ZZZZZZZZp15);echo $ZZZZZZZR1717->ZZZZZZZZZZZZZZZO1414('label_saved', $module);exit;}} function widget(){global $mod_strings, $app_strings;$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZd3 = 'false';if(isset($_REQUEST["fullScreen"]) && !empty($_REQUEST["fullScreen"])) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZd3 = 'true';} $db = PlatformConnector::ZZZZZZZZZZZZZZK1010();$ZZZZZZZR1717 = new ZZZZZZZS1818();$ZZZZZZZZV2121 = new ZZZZZZZZW2222($ZZZZZZZR1717);$ZZZZZZS1818 = new ZZZZZy24();$ZZZZZZZZZZZZZZZZZZZZZB11 = PlatformConnector::ZZZZZZZZZZZZZV2121();$ZZZZZZy24 = (int)$_REQUEST["record"];$ZZZZZZZZZZZZZZZZZZZZb1 = $ZZZZZZZZV2121->ZZZZZZZZZ2525($ZZZZZZZZZZZZZZZZZZZZZB11, $ZZZZZZy24);if(!$ZZZZZZZZZZZZZZZZZZZZb1){$ZZZZZZZR1717->ZZZZZZZZZa0();die;} $ZZZZZZZZZZZA00 = new ZZZZZZZD33();$report = $ZZZZZZZZZZZA00->ZZZZZZZZQ1616("*", "id = {$ZZZZZZy24}");$report = $report[0];$report = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZZ2525($report, $_REQUEST);$report = new ARReport($report, array(), $ZZZZZZZZZZZZZZZZZZZZb1);$ZZZZZZZJ99 = $report->ZZZZZZZZZZZZZZZZZZZZt19();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717 = ZZZZZZZZZZZZZZZZZZZv21::getInstance();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717->ZZZZZZZZZZZZZZZZZZZy24($ZZZZZZZJ99);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZe4 = $report->retrieveData(true, array(), $ZZZZZZZZZZZZZZZZZZZZZB11, $ZZZZZZS1818, $ZZZZZZZR1717, $db);$ZZZZZZZZZZr17 = $report->ZZZZZZZZZZZZZZZZZZZZD33()->ZZZZZZj9();foreach ($ZZZZZZZZZZr17 as $ZZZZZZZZZZZZZZZZS1818) {if($ZZZZZZZZZZZZZZZZS1818['groupByRange']){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZe4['cols'][$ZZZZZZZZZZZZZZZZS1818['name']] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZe4['cols'][$ZZZZZZZZZZZZZZZZS1818['rangeName']];$count = count($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZe4['data']);for($ZZZZK1010 = 0;$ZZZZK1010<$count;$ZZZZK1010++){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZe4['data'][$ZZZZK1010][$ZZZZZZZZZZZZZZZZS1818['name']] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZe4['data'][$ZZZZK1010][$ZZZZZZZZZZZZZZZZS1818['rangeName']];}}} $ZZZZZZZZZZZZZZZZZa0 = $report->ZZZZZZZZZZZZZZZZZZZZQ1616();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525 = new ZZZZZZZZZZZZZZZZZZZA00(array(), true, $report);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZK1010($ZZZZZZS1818);$ZZZZZZZZZZZZZZZZZZZZo14 = new ZZZZZZZZZZZZZZZZZZZZn13($report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZS1818(), $report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222(), $db, $ZZZZZZZR1717, $report->ZZZZZZZZZZZZZZZZZZZF55());$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZm12($ZZZZZZZZZZZZZZZZZZZZo14));if($report->ZZZZZZZZZZZZZZZZZZZF55()) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZE44($report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222(), new ZZZZZZZZZZZZZZZZZZZZG66($db,$ZZZZZZZR1717, array(), $ZZZZZZZZZZZZZZZZZZZZZB11), $ZZZZZZZZZZZZZZZZZZZZo14));} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZO1414());$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZR1717($ZZZZZZZZV2121, new ZZZZZZZZZZn13(), new ZZZZZZZZZZw22(), $ZZZZZZZR1717, $ZZZZZZZZZZZZZZZZZZZZb1, $ZZZZZZZZZZZZZZZZZZZZZB11));$p15 = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->f5(true);$p15 = json_decode($p15, true);$p15['chartData'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZe4;$p15 = json_encode($p15);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['fullScreen'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZd3;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['MOD'] = $mod_strings;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['APP'] = $app_strings;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["REPORTDATA"] = $p15;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["SHOW_DETAILS"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZC22;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["SHOW_TABLE"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZB11;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["REPORTID"] = $report->ZZZZZZk10();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["CHARTTYPE"] = $ZZZZZZZZZZZZZZZZZa0['chartType'];} function getWidgetData($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZB11, $ZZZZZZZZU2020 = array()){global $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZf5;$db = PlatformConnector::ZZZZZZZZZZZZZZK1010();$ZZZZZZS1818 = new ZZZZZy24();$ZZZZZZZZZZZZZZZZZZZZZB11 = PlatformConnector::ZZZZZZZZZZZZZV2121();$mod_strings = return_module_language($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZf5, 'AnalyticReporting');$ZZZZZZZR1717 = new ZZZZZZZS1818();$ZZZZZZZZV2121 = new ZZZZZZZZW2222($ZZZZZZZR1717);$ZZZZZZy24 = (int)$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZB11;$ZZZZZZZZZZZZZZZZZZZZb1 = $ZZZZZZZZV2121->ZZZZZZZZZ2525($ZZZZZZZZZZZZZZZZZZZZZB11, $ZZZZZZy24);if(!$ZZZZZZZZZZZZZZZZZZZZb1){} $ZZZZZZZZZZZA00 = new ZZZZZZZD33();$report = $ZZZZZZZZZZZA00->ZZZZZZZZQ1616("*", "id = {$ZZZZZZy24}");$report = $report[0];$report = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZZ2525($report, $_REQUEST);$report = new ARReport($report, $ZZZZZZZZU2020, $ZZZZZZZZZZZZZZZZZZZZb1);$ZZZZZZZZZZZZZZZZZZZZo14 = new ZZZZZZZZZZZZZZZZZZZZn13($report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZS1818(), $report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222(), $db, $ZZZZZZZR1717, $report->ZZZZZZZZZZZZZZZZZZZF55());if(isset($ZZZZZZZZU2020['addFilters'])) {$report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZX2323($ZZZZZZZZU2020, $ZZZZZZZZZZZZZZZZZZZZo14->ZZZZZZZZZZZZZZZZZZZZZZZZc2());} $ZZZZZZZJ99 = $report->ZZZZZZZZZZZZZZZZZZZZt19();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717 = ZZZZZZZZZZZZZZZZZZZv21::getInstance();$ZZZZZZZZZZZZZZZZZZZZZZZZZR1717->ZZZZZZZZZZZZZZZZZZZy24($ZZZZZZZJ99);$ZZZZZZZZO1414['chartData'] = $report->retrieveData(true, array(), $ZZZZZZZZZZZZZZZZZZZZZB11, $ZZZZZZS1818, $ZZZZZZZR1717, $db);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525 = new ZZZZZZZZZZZZZZZZZZZA00(array(), true, $report);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZK1010($ZZZZZZS1818);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZm12($ZZZZZZZZZZZZZZZZZZZZo14));$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZG66($mod_strings);if($report->ZZZZZZZZZZZZZZZZZZZF55()) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZE44($report->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZW2222(), new ZZZZZZZZZZZZZZZZZZZZG66($db,$ZZZZZZZR1717, array(), $ZZZZZZZZZZZZZZZZZZZZZB11), $ZZZZZZZZZZZZZZZZZZZZo14));} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZO1414());$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZL1111($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZZZZZZZZZZZZR1717($ZZZZZZZZV2121, new ZZZZZZZZZZn13(), new ZZZZZZZZZZw22(), $ZZZZZZZR1717, $ZZZZZZZZZZZZZZZZZZZZb1, $ZZZZZZZZZZZZZZZZZZZZZB11));$p15 = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525->f5(false);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZO1414 = true;$ZZZZZZZZZZZZZZZZZh7 = $ZZZZZZZZO1414['chartData'];if ($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZO1414) {$ZZZZZZZZZZr17 = $report->ZZZZZZZZZZZZZZZZZZZZD33()->ZZZZZZj9();foreach ($ZZZZZZZZZZr17 as $ZZZZZZZZZZZZZZZZS1818) {if (!$ZZZZZZZZZZZZZZZZS1818['groupByRange']) {continue;} $ZZZZZZZZZZZZZZZZZh7['cols'][$ZZZZZZZZZZZZZZZZS1818['name']] = $ZZZZZZZZZZZZZZZZZh7['cols'][$ZZZZZZZZZZZZZZZZS1818['rangeName']];$count = count($ZZZZZZZZZZZZZZZZZh7['data']);for($ZZZZK1010 = 0;$ZZZZK1010<$count;$ZZZZK1010++){$ZZZZZZZZZZZZZZZZZh7['data'][$ZZZZK1010][$ZZZZZZZZZZZZZZZZS1818['name']] = $ZZZZZZZZZZZZZZZZZh7['data'][$ZZZZK1010][$ZZZZZZZZZZZZZZZZS1818['rangeName']];}}} $p15['chartData'] = $ZZZZZZZZZZZZZZZZZh7;return $p15;} function ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19(){$_REQUEST['calcField']['enableCustomSQL'] = false;$ZZZZZZZZZZZZZZZZZZZZZZZZZZz25 = new ZZZZZZZZZZZZZZZZZZZZZZZZZZW2222($_REQUEST['calcField']);echo $ZZZZZZZZZZZZZZZZZZZZZZZZZZz25->ZZZZZZZZZZZZZZZZZZZZZZZZZZX2323();die();}}