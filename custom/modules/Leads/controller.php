<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require('modules/Leads/controller.php');
include_once 'custom/modules/Leads/common.php';
class CustomLeadsController extends LeadsController {
	function action_findexactlead() {
		//var_dump($data);
		$this->view = 'findexactlead';
	}
	function action_search() {
		//var_dump($data);
		// echo 'Search';
		$this->view = 'search';
	}
	function action_returnsearch() {
		//var_dump($data);
		// echo 'Search';
		$common = new CommonNE;
		$txt_search = $_REQUEST['text_search'];
		$result= $common->searchNumber($txt_search);
		if(count($result)>0){
			$return = (object)[];
			$return->data = $result;
			$return->count = count($result);
			$return->message = 'success';
			echo json_encode($return);

		}else{
			$return = (object)[];
			$return->message = 'empty';
			echo json_encode($return);

		}

		die;
	}
	function action_returnsearchtext() {
		//var_dump($data);
		// echo 'Search';
		$common = new CommonNE;

		$txt_search = $_REQUEST['text_search'];
		$result= $common->searchText($txt_search);
		if(count($result)>0){
			$return = (object)[];
			$return->data = $result;
			$return->count = count($result);
			$return->message = 'success';
			echo json_encode($return);

		}else{
			$return = (object)[];
			$return->message = 'empty';
			echo json_encode($return);

		}

		die;
	}
	function action_leadfortelesale() {
		//var_dump($data);
		// echo 'Search';
	

		$this->view = 'leadfortelesale';
		
	}
}