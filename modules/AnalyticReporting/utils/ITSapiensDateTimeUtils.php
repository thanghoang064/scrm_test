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
class ITSapiensDateTimeUtils{
	/**
	* @param string $timeZone - timezone to convert (Ex. 'europe/berlin')
	* @return UTC offset of timezone (Ex. +01:00, -03:00)
	* @example covertTimeZoneStringToUTCOffset('europe/riga'); //+02:00
	* @static
	* 
*/
	public static function covertTimeZoneStringToUTCOffset($timeZone){
		$timeZone = new DateTimeZone($timeZone);
		$offset   = $timeZone->getOffset(new DateTime);
		$negativeOffset = $offset < 0 ? TRUE : FALSE;
		$offset = abs($offset);
		$offset = $negativeOffset ? "-".gmdate("H:i", $offset) : "+".gmdate("H:i", $offset);
		return $offset;
	}
    
}
