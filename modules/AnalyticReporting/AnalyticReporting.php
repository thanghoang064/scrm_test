<?php

class AnalyticReporting extends Basic {
	var $new_schema = true;
	var $module_dir = 'AnalyticReporting';
	var $object_name = 'AnalyticReporting';
	var $table_name = 'analytic_reporting';
	var $importable = false;
	var $disable_row_level_security = true ; // to ensure that modules created and deployed under CE will continue to function under team security if the instance is upgraded to PRO
	var $id;
	var $name;
	var $date_entered;
	var $date_modified;
	var $modified_user_id;
	var $modified_by_name;
	var $created_by;
	var $created_by_name;
	var $description;
	var $deleted;
	var $created_by_link;
	var $modified_user_link;
	var $assigned_user_id;
	var $assigned_user_name;
	var $assigned_user_link;

    /**
     * Constructor for the AnalyticReporting bean.
     *
     * Override SugarBean's constructor
     */
    public function __construct()
    {
        parent::__construct();
        // In Sugar 7.8.0.0 this provides fatal error (Call to undefined method Basic::Basic())
        // parent::Basic();
    }
	
	function bean_implements($interface){
		switch($interface){
			case 'ACL': return true;
		}
		return false;
	}
	/*
	 * #6088 - function override, if $_REQUEST['record'] is set, this function fires. If not overridden parent function
	 * will be called, which in some cases causes php to fail without error message(problem was detected in suitecrm
	 * 7.6.1). Consult redmine ticket for more detail.
	*/
	function retrieve($id = -1, $encode = true, $deleted = true)
    {
        // TODO: Implement if needed
	}
}