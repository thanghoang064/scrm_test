<?php
class PolyReports extends Basic {
	//class PolyReports extends SugarBean {
	public $module_dir = 'PolyReports';
	public $module_name = 'PolyReports';
	public $disable_vardefs = true;
	public $object_name = 'PolyReports';
	public $table_name = 'PolyReports';
	
	public function __construct() {
		parent::__construct();
	}
	
	function bean_implements($interface){
		switch($interface){
			case 'ACL': return true;
		}
		return false;
	}
}