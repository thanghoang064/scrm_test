<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');

class LeadsViewFindExactLead extends SugarView {

	private function sanitizePhone($mobile) {
		$mobile = preg_replace('/[^\d]/','', $mobile);
		if(substr($mobile, 0, 1) != '0')
			$mobile = '0' . $mobile;
		return $mobile;
	}
	
	private function get_display_user_name($user_id) {
		global $db;
		$sql = "SELECT user_name, last_name FROM `users` WHERE id = '$user_id'";
		$result = $db->query($sql);
		$data = $db->fetchByAssoc($result);
		if(!empty($data['user_name']))
			return $data['user_name'] . ' - ' . $data['last_name'];
		return '';
	}
    public function display() {
		require_once('include/utils.php');
		global $db, $current_user;
		$ss = new Sugar_Smarty();
		$phone = $this->sanitizePhone($_REQUEST['phone']);
		$data = array();
		if(!empty($phone)) {
			$phone_list = implode("','", array($phone, '0' . $phone));
			$sql = "SELECT * FROM leads a INNER JOIN leads_cstm b ON a.id = b.id_c WHERE a.deleted = 0 AND (a.phone_mobile IN ('$phone_list') OR a.phone_home IN ('$phone_list') OR a.phone_work IN ('$phone_list') OR a.phone_other IN ('$phone_list'))";
			//var_dump($sql);
			$result = $db->query($sql);
			$row = $db->fetchByAssoc($result);
			if($row) {
				$creator = BeanFactory::getBean('Users', $row['created_by']);
				$date_created = new TimeDate();
				$date_created = $date_created->to_display_date_time($row['date_entered'], true, true, $current_user);
				$birthdate = new TimeDate();
				$birthdate = $birthdate->to_display_date($row['birthdate']);
				$source = '';
				if(!empty($row['source_c']))
					$source = translate('source_list', '', $row['source_c']);
				$lead_source = '';
				if(!empty($row['lead_source']))
					$lead_source = translate('lead_source_dom', '', $row['lead_source']);
				$rating = '';
				if(!empty($row['rating_c']))
					$rating = translate('rating_list', '', $row['rating_c']);
				$data = array(
					'area' => $row['area_c'],
					'id' => $row['id'],
					'name' => $row['last_name'],
					'lead_source' => $lead_source,
					'source' => $source,
					'rating' => $rating,
					'birthdate' => $birthdate,
					'phone1' => $row['phone_mobile'],
					'phone2' => $row['phone_home'],
					'phone3' => $row['phone_work'],
					'phone4' => $row['phone_other'],
					'email' => $row['email_c'],
					'facebook' => $row['facebook_c'],
					'date_entered' => $date_created,
					'created_by' => $creator->user_name . ' - ' . $creator->last_name,
					'telesales' => $this->get_display_user_name($row['assigned_user_id'])
				);
			}
			//var_dump($data);
		}
		$ss->assign('data', $data);
		$ss->assign('phone', $phone);
		$html = $ss->fetch('custom/modules/Leads/tpls/FindExactLead.tpl');
		echo $html;
	}
}