<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
 
return array('vtiger_activity' => 
		array(
			'time_end' => "(SUBSTRING(CONVERT_TZ(CONCAT({$tableAlias}.due_date,' ',{$tableAlias}.time_end),'+00:00',{$UTCoffset}), 11, 9))",
			'due_date' => "(SUBSTRING(CONVERT_TZ(CONCAT({$tableAlias}.due_date,' ',{$tableAlias}.time_end),'+00:00',{$UTCoffset}), 1, 10))",
			'time_start' => "(SUBSTRING(CONVERT_TZ(CONCAT({$tableAlias}.date_start,' ',{$tableAlias}.time_start),'+00:00',{$UTCoffset}), 11, 9))",
			'date_start' => "(SUBSTRING(CONVERT_TZ(CONCAT({$tableAlias}.date_start,' ',{$tableAlias}.time_start),'+00:00',{$UTCoffset}), 1, 10))"
		)

);