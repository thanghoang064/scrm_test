<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
/**
* @author IT Sapiens
*/
require_once 'modules/AnalyticReporting/utils/ITSapiensDateTimeUtils.php';

class ITSapiensReportModuleHooks{
	/**
	* 
	* @var loaded with configuration from external file
	* @static
	* 
	*/
	private static $configuration;
	/**
	* 
	* @param array $response
	* @param object $currentUser
	* @param string $tableName
	* @param string $tableAlias
	* @param string $columnName
	* @static
	* 
*/
	public static function replaceTableColumnName($response, $currentUser, $tableName, $tableAlias, $columnName){
		
		//Calculated fields
		$UTCoffset = ITSapiensDateTimeUtils::covertTimeZoneStringToUTCOffset($currentUser->column_fields["time_zone"]);
		$UTCoffset = "'".$UTCoffset."'";
		
		//Load configuration if not loaded
		if(!self::$configuration)self::$configuration = require 'modules/AnalyticReporting/config/hooks/reportModuleColumnName.php';
		
		if(isset(self::$configuration[$tableName][$columnName])){
			//reload configuration to update values in code snippets
			self::$configuration = require 'modules/AnalyticReporting/config/hooks/reportModuleColumnName.php';
			for($i=0;$i<count($response);$i++){
				$search= $tableAlias.".{$columnName}";
				$replace = self::$configuration[$tableName][$columnName];
				$response[$i] = str_replace($search,$replace,$response[$i]);
			}
		}
		return $response;
	}
	
    
}
