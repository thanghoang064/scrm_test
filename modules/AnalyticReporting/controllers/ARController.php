<?php

/*** DOMAIN_CHECK ***/
 include_once "modules/AnalyticReporting/controllers/libs.php";class ARController {public $ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22 = array();function __construct() {$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['moduleName'] = PlatformConnector::$moduleName;$ZZZZZx23 = ZZZZZZZZZZZZZz25::load('common', 'common');$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['urls'] = $ZZZZZx23['url'];$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['urlsJSON'] = json_encode($ZZZZZx23['url']);$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['aggregatesDefinitionsJSON'] = json_encode(ZZZZZZZZZZZZZZZZZZZZZZZZZr17::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19());$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['aggregatesDefinitions'] = ZZZZZZZZZZZZZZZZZZZZZZZZZr17::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZt19();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['aggregatesCheckBoxesChecked'] = json_encode(ZZZZZZZZZZZZZZZZZZZZZZZZZr17::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525(true));$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['aggregatesCheckBoxesNotChecked'] = json_encode(ZZZZZZZZZZZZZZZZZZZZZZZZZr17::ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ2525(false));$ZZZZZZZZZZZZZZZZZZZZZB11 = PlatformConnector::ZZZZZZZZZZZZZV2121();$this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22['currentUser'] = json_encode($ZZZZZZZZZZZZZZZZZZZZZB11->ZZZZZZZZZZZZZZZZZZZZu20());} function getViewMapping(){return $this->ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZC22;}}