<?php

/*** DOMAIN_CHECK ***/
 include_once "modules/AnalyticReporting/controllers/ARController.php";class ARSettingsController extends ARController{function settings(){global $mod_strings, $app_strings;$ZZZZZZZZZZZZZZZZZZZZZB11 = PlatformConnector::ZZZZZZZZZZZZZV2121();if(!$ZZZZZZZZZZZZZZZZZZZZZB11->ZZZZZZZV2121()){echo '<script type="text/javascript"> window.location = "index.php?module=AnalyticReporting&action=index";</script>';exit;} $ZZZZZZZR1717 = new ZZZZZZZS1818();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZH77 = ZZZZZZZZZZZZZz25::load('common', 'common');$ZZZZZZZZZB11 = new ZZZZZy24();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 0;if(isset($_REQUEST['call'])) {switch($_REQUEST['call']) {case 'downloadFontCheck': $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14();break;case 'downloadFont': $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZp15();break;}} $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['response'] = "";if(isset($_POST["submit"])) {if(isset($_POST["key"]) && !empty($_POST["key"])){$ZZZZZZZZZB11->setValue("key", $_POST["key"]);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 0;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['response'] = "Settings saved!";}} $dateFormat = array('1' => "Y.m.d", '2' => "d.m.Y", '3' => "m.d.Y", '4' => "Y.M.d", '5' => "d.M.Y", '6' => "M.d.Y", '7' => "Y/m/d", '8' => "d/m/Y", '9' => "m/d/Y", '10' => "Y/M/d", '11' => "d/M/Y", '12' => "M/d/Y", '13' => "Y-m-d", '14' => "d-m-Y", '15' => "m-d-Y", '16' => "Y-M-d", '17' => "d-M-Y", '18' => "M-d-Y",);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZn13 = array('1' => "yyyy.mm.dd", '2' => "dd.mm.yyyy", '3' => "mm.dd.yyyy", '4' => "yyyy.mmm.dd", '5' => "dd.mmm.yyyy", '6' => "mmm.dd.yyyy", '7' => "yyyy/mm/dd", '8' => "dd/mm/yyyy", '9' => "mm/dd/yyyy", '10' => "yyyy/mmm/dd", '11' => "dd/mmm/yyyy", '12' => "mmm/dd/yyyy", '13' => "yyyy-mm-dd", '14' => "dd-mm-yyyy", '15' => "mmm-dd-yyyy", '16' => "yyyy-mmm-dd", '17' => "dd-mmm-yyyy", '18' => "mmm-dd-yyyy",);if(isset($_POST["submit"])) {if(isset($_POST["dateformat"])){$ZZZZZZZZZB11->setValue("dateformat", $dateFormat[$_POST["dateformat"]]);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 1;}} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14 = array_search($ZZZZZZZZZB11->getValue("dateformat"), $dateFormat);if(!$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14 = 1;} if(isset($_REQUEST["records"]) && is_numeric($_REQUEST["records"])){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZp15 = abs(intval($_REQUEST["records"]));$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZp15 = ($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZp15)? $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZp15 : 1;$ZZZZZZZZZB11->setValue("limit", $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZp15);if($_REQUEST["overwriteAll"]){$ZZZZZZZZZZZA00 = new ZZZZZZZD33();$ZZZZZZZZZZZA00->ZZZZZZZG66($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZp15);} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 1;} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16 = false;if($ZZZZZZZZZB11->getValue("showNullValues") == true){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16 = true;} if(isset($_POST["showNullValuesForm"])) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16 = false;if(isset($_POST["showNullValues"]) && $_POST["showNullValues"] == "on"){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16 = true;} $ZZZZZZZZZB11->setValue("showNullValues", $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 1;} $ZZZZZZZZZZZZZZZZZZu20 = false;if($ZZZZZZZZZB11->getValue("builderPublicAccess")){$ZZZZZZZZZZZZZZZZZZu20 = true;} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14 = false;if($ZZZZZZZZZB11->getValue("reportTreeAdminAccess")){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14 = true;} if(isset($_POST["permissionsForm"])) {$ZZZZZZZZZZZZZZZZZZu20 = false;if(isset($_POST["builderPublicAccess"]) && $_POST["builderPublicAccess"] == "on"){$ZZZZZZZZZZZZZZZZZZu20 = true;} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14 = false;if(isset($_POST["reportTreeAdminAccess"]) && $_POST["reportTreeAdminAccess"] == "on"){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14 = true;} $ZZZZZZZZZB11->setValue("builderPublicAccess", $ZZZZZZZZZZZZZZZZZZu20);$ZZZZZZZZZB11->setValue("reportTreeAdminAccess", $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 2;} if(isset($_REQUEST["updateReportState"]) && $_REQUEST["updateReportState"] == "true"){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZr17 = array('reportEdit' => 'ar-rv-editor', 'report' => 'ar-rv-data', 'chartEdit' => 'ar-rv-chart-editor', 'chart' => 'ar-rv-chart-view',);$ZZZZZZZL1111 = array();foreach ($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZr17 as $Zr17 => $value) {$ZZZZZZZL1111[] = array("name" => $value, "collapsed" =>(isset($_REQUEST[$Zr17]) && $_REQUEST[$Zr17] == '1')? false : true);} $ZZZZZZZZZZZA00 = new ZZZZZZZD33();$ZZZZZZZZZZZA00->ZZZZZZZK1010($ZZZZZZZL1111);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 3;} if(isset($_REQUEST['ignoreTimeZoneForScheduler'])) {$ZZZZZZZZZB11->setValue("ignoreTimeZoneForScheduler", $_REQUEST['ignoreTimeZoneForScheduler']);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 5;} $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['ignoreTimeZoneForScheduler'] = $ZZZZZZZZZB11->getValue("ignoreTimeZoneForScheduler");$ZZZZZZZZZZZZZZZZZZZ2525 = new ZZZZZZZZZH77();$ZZZZZZZZZZZZZZZZZZZa0 = $ZZZZZZZZZZZZZZZZZZZ2525->ZZZZZZZZZI88();$ZZZZZZZZZZZZZZZZZZZb1 = new ZZZZZZZZZZZZZZZZZZZc2($ZZZZZZZZZZZZZZZZZZZa0);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['jobs'] = json_encode($ZZZZZZZZZZZZZZZZZZZb1->ZZZZZZZZZZZZZZZZZZZd3());$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['jobTypes'] = json_encode(ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZS1818::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZX2323());$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['jobDescriptors'] = json_encode(ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZS1818::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZV2121());$ZZZZZx23 = ZZZZZZZZZZZZZz25::load('common', 'common');$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZs18 = array('postUrl' => $ZZZZZx23['url']['withoutAction']."jobs");$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['internal'] = json_encode($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZs18);$ZZZZZZZZZZZZZZZZZZZZZZt19 = new ZZZZZZZZZo14();if(isset($_POST['templateUpload']) && $_FILES['template']['size'] > 0) {$ZZZZZZZZZZB11 = new ZZZZZZZZB11();$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG',"templateUpload",$_POST['templateUpload']);$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG',"Template Size", $_FILES['template']['size']);$ZZZZZZZZZZZZZZU2020 = $_FILES['template']['name'];$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19 = $_FILES['template']['tmp_name'];$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG', 'Filename', $ZZZZZZZZZZZZZZU2020);$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG', 'tmp_name', $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19);$ZZZZZZZZZq16 = FunctionWrapper::_file_get_contents($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19);$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG', 'content', $ZZZZZZZZZq16);$ZZZZZZZZZZZZZZZZZZZZZZt19->ZZZZZZZZZp15($ZZZZZZZZZZZZZZU2020, $ZZZZZZZZZq16);echo "<br>File $ZZZZZZZZZZZZZZU2020 uploaded<br>";$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 4;} if(isset($_POST['templateUpdate']) && $_POST['templateId'] > 0) {$ZZZZZZZZZq16 = "";if($_FILES['template']['size'] > 0){$ZZZZZZZZZZZZZZU2020 = $_FILES['template']['name'];$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19 = $_FILES['template']['tmp_name'];$ZZZZZZZZZq16 = FunctionWrapper::_file_get_contents($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19);} $ZZZZZZZZZu20 = (int)$_POST['templateId'];$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZu20 = $_POST['templateTitle'];$ZZZZZZZZZw22 = array('id' => $ZZZZZZZZZu20, 'name' => $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZu20);if(!empty($ZZZZZZZZZq16)){$ZZZZZZZZZw22['file'] = $ZZZZZZZZZq16;} $ZZZZZZZZZZZZZZZZZZZZZZt19->ZZZZZZZZZv21($ZZZZZZZZZw22);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 4;} if(isset($_POST['templateDelete']) && $_POST['templateId'] > 0) {$ZZZZZZZZZu20 = (int)$_POST['templateId'];$ZZZZZZZZZZZZZZZZZZZZZZt19->ZZZZZZZZZt19($ZZZZZZZZZu20);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12 = 4;} $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZa0 = $ZZZZZZZZZZZZZZZZZZZZZZt19->ZZZZZZZZZr17('id, name');$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZa0 = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZA00($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZa0, true);$ZZZZZZZZZZZA00 = new ZZZZZZZD33();$ZZZZZZZZZZX2323 = new ZZZZZZZZZZw22();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1 = $ZZZZZZZZZZZA00->ZZZZZZZP1515($ZZZZZZZZZZZZZZZZZZZZZB11);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1 = $ZZZZZZZR1717->ZZZZZZZZZZZZZZZZG66($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1, 0);array_unshift($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1, array('name'=>0, 'title'=>'Select report to send'));$ZZZZZZZR1717 = new ZZZZZZZS1818();$ZZZZZZZZZZZZZZZZZZZZS1818 = new ZZZZZZZZW2222($ZZZZZZZR1717);$ZZZZZZZZZZt19 = $ZZZZZZZZZZZZZZZZZZZZS1818->ZZZZZZZZZZZZh7();array_unshift($ZZZZZZZZZZt19, array('id'=>0, 'name'=>'Select User'));$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22["reportNames"] = json_encode($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZb1);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['availableOwners'] = json_encode($ZZZZZZZZZZt19);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['currentTime'] = date("Y-m-d H:i:s");$ZZZZZZZZZZZo14 = date_default_timezone_get();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZv21 = $ZZZZZZZZZZX2323->ZZZZZZZZZZy24();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['scheduledReports'] = json_encode($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZv21);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZw22 = date("Y-m-d H:i:s");$ZZZZZZZQ1616 = PlatformConnector::ZZZZZZZZZZZZZV2121();$ZZZZZZZZZZZo14 = date_default_timezone_get();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['currentServerTimeZone'] = $ZZZZZZZZZZZo14;date_default_timezone_set($ZZZZZZZQ1616->getTimeZone());$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZw22 = date("Y-m-d H:i:s");date_default_timezone_set($ZZZZZZZZZZZo14);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['userCurrentTime'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZw22;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['userCurrentTimeZone'] = $ZZZZZZZQ1616->getTimeZone();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZE44 = PlatformConnector::getUrl();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['SERVERURL'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZE44;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['MOD'] = $mod_strings;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['APP'] = $app_strings;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['DICTIONARY'] = json_encode($mod_strings);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['CURRENT_FORMAT_ID'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['DATE_FORMAT_LABELS'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZn13;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['RECORDSPERPAGE'] = $ZZZZZZZZZB11->getValue("limit");$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['commonConfig'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZH77;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['currentTab'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZm12;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['builderPublicAccess'] = $ZZZZZZZZZZZZZZZZZZu20;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['reportTreeAdminAccess'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['showNullValues'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZq16;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['excelTemplates'] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZa0;$Zr17 = $ZZZZZZZZZB11->getValue("key");$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZx23 = false;if($Zr17) {$ZZZZZZV2121 = new ZZZZZv21($ZZZZZZZZZB11, false, true, false, true);$ZZZZZZV2121->ZZZZl11($_SERVER);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['licenseData'] = $ZZZZZZV2121->ZZZZZU2020($Zr17);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZx23 = $ZZZZZZV2121->ZZZZZX2323($Zr17);} $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['licenseKey'] = $Zr17;$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['licenseUsers'] = PlatformConnector::ZZZZZZZZZZZZZZX2323($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZx23);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['uniqueKey'] = PlatformConnector::ZZZZZZZZZZZZZZZE44();} function dateFormat(){$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZy24 = array('1' => "Y.m.d", '2' => "d.m.Y", '3' => "m.d.Y", '4' => "Y.M.d", '5' => "d.M.Y", '6' => "M.d.Y", '7' => "Y/m/d", '8' => "d/m/Y", '9' => "m/d/Y", '10' => "Y/M/d", '11' => "d/M/Y", '12' => "M/d/Y", '13' => "Y-m-d", '14' => "d-m-Y", '15' => "m-d-Y", '16' => "Y-M-d", '17' => "d-M-Y", '18' => "M-d-Y",);if(isset($_REQUEST["select"])){echo date($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZy24[$_REQUEST["select"]]);} if(isset($_REQUEST["init"])){$db = PlatformConnector::ZZZZZZZZZZZZZZK1010();$ZZZZZZZZZB11 = new ZZZZZy24();$Zr17 = array_search ($ZZZZZZZZZB11->getValue("dateformat"), $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZy24);echo $Zr17;}} function ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZo14(){$db = PlatformConnector::ZZZZZZZZZZZZZZK1010();$ZZZZZZZZZB11 = new ZZZZZy24();$ZZZZZZZZZZf5 = array();if(!FunctionWrapper::_file_exists('modules/AnalyticReporting/lib/tcpdf/tcpdf.php')) {$ZZZZZZZZZZf5["status"] = true;echo json_encode($ZZZZZZZZZZf5);die;} $ZZZZZZZZZZB11 = new ZZZZZZZZB11();$ZZZZZZZZZZZZZZZZZZZZZW2222 = $ZZZZZZZZZB11->getValue('pdfFontFamily');$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG',"pdfFontFamily", $ZZZZZZZZZZZZZZZZZZZZZW2222);if($ZZZZZZZZZZZZZZZZZZZZZW2222) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 = "modules/AnalyticReporting/lib/tcpdf/fonts/";if(FunctionWrapper::_file_exists($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZW2222 . ".php")) {$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG',"File exists", $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZW2222 . ".php");$ZZZZZZZZZZZZZZZZZZZZZZZy24 = new ZZZZZZZZZZZZZZZZZZZZZZZz25();$ZZZZZZZZZZZZZZZZZZZZZZZy24->fetch($ZZZZZZZZZB11->getValue('apiEndpoint') . "fonts/list");$ZZZZZZZZZZZZZZZZZZZZZZZy24->ZZZZZZZZZZZZZZZZZZZZZZZA00(ZZZZZZZZZZZZZZZZZZZZZZZz25::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZH77);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00 = $ZZZZZZZZZZZZZZZZZZZZZZZy24->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZB11 = false;$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG',"Font list", json_encode($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00));foreach($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00['files'] as $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22 => $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33) {if(FunctionWrapper::_file_exists($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22)) {$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG',"Font exists", $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22);if(md5_file($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22) != $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33) {$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG',"Invalid font checksum", "Was: ".md5_file($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22) ." Expected: ". $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33);$ZZZZZZZZZZf5["messages"][] = "File {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25}{$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22} have invalid checksum ({$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33})";$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZB11 = true;}} else {$ZZZZZZZZZZB11->ZZZZZZZZC22('DEBUG',"Font does not exist", $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZB11 = true;}} if($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZB11) {$ZZZZZZZZZZf5["status"] = false;$ZZZZZZZZZZf5["error"] = "Fonts files should be downloaded, because checksum is different.";} else {$ZZZZZZZZZZf5["status"] = true;}} else {$ZZZZZZZZZZf5["status"] = false;$ZZZZZZZZZZf5["error"] = "Fonts files should be downloaded, because not found.";}} else if (isset($_SESSION["downloadFontProgress"]) && $_SESSION["downloadFontProgress"]) {$ZZZZZZZZZZf5["status"] = false;$ZZZZZZZZZZf5["error"] = "Font downloading failed. Please check module directory write permissions and try again.";unset($_SESSION["downloadFontProgress"]);} else {$ZZZZZZZZZZf5["status"] = false;$ZZZZZZZZZZf5["error"] = "Installation provided without PDF fonts, for smaller module file upload. Please download fonts, to successfully export PDF files.<br /><br /> This can take some time, depending on your internet connection.";} unset($_SESSION["downloadFontProgress"]);echo json_encode($ZZZZZZZZZZf5);die;} function ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZp15(){$ZZZZZZZZZB11 = new ZZZZZy24();$ZZZZZZZZZZf5 = array();$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZE44 = array();$_SESSION["downloadFontProgress"] = true;$ZZZZZZZZZZZZZZZZZZZZZZZy24 = new ZZZZZZZZZZZZZZZZZZZZZZZz25();$ZZZZZZZZZZZZZZZZZZZZZZZy24->fetch($ZZZZZZZZZB11->getValue('apiEndpoint') . "fonts/list");$ZZZZZZZZZZZZZZZZZZZZZZZy24->ZZZZZZZZZZZZZZZZZZZZZZZA00(ZZZZZZZZZZZZZZZZZZZZZZZz25::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZH77);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00 = $ZZZZZZZZZZZZZZZZZZZZZZZy24->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525();if(isset($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00['files']) && isset($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00['path'])) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 = "modules/AnalyticReporting/lib/tcpdf/fonts/";@FunctionWrapper::_chmod($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25, 0777);$ZZZZZZZq16 = 0;foreach($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00['files'] as $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22 => $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33) {if(!FunctionWrapper::_file_exists($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22)) {if(md5_file($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22) == $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZE44[] = "File {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25}{$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22} have valid checksum ({$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33})";continue;}} $ZZZZZZZZZZZZZZZZZZZZZZZy24->fetch($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00['path'] . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22);$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZF55 = $ZZZZZZZZZZZZZZZZZZZZZZZy24->ZZZZZZZZZZZZZZZZZZZZZZZC22();$P1515 = FunctionWrapper::_file_put_contents($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22, $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZF55);if(md5_file($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22) != $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33) {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZE44[] = "File {$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25}{$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22} have invalid checksum ({$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZD33})";$P1515 = false;} if(!$P1515) {$ZZZZZZZq16++;}}} if(isset($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00["fontFamily"]) && empty($ZZZZZZZq16)) {if(!FunctionWrapper::_is_file($ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz25 . $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00["fontFamily"] . ".php")) {return false;} $ZZZZZZZZZB11->setValue("pdfFontFamily", $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZA00["fontFamily"]);unset($_SESSION["downloadFontProgress"]);$ZZZZZZZZZZf5["status"] = true;} else {$ZZZZZZZZZZf5["status"] = false;} $ZZZZZZZZZZf5["messages"] = $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZE44;echo json_encode($ZZZZZZZZZZf5);die;} function ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZk10() {$ZZZZZZZZA00 = new ZZZZZZZZB11();$ZZZZZZZZZB11 = new ZZZZZy24();if(isset($_REQUEST['logging'])) {$ZZZZZZZZZB11->setValue("logging", $_REQUEST['logging']);} if(isset($_REQUEST['clear'])) {$ZZZZZZZZA00->ZZZZZZZZZE44();} $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['logging'] = $ZZZZZZZZZB11->getValue("logging");$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['entries'] = $ZZZZZZZZA00->ZZZZZZZZZF55();}}