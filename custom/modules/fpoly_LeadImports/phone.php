<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class PhoneSanitizer {
	private function sanitizePhone($mobile) {
		$mobile = preg_replace('/[^\d]/','', $mobile);
		if(substr($mobile, 0, 1) != '0')
			$mobile = '0' . $mobile;
		return $mobile;
	}
	function formatPhone($bean, $event, $argument) {
			$bean->phone_mobile = $this->sanitizePhone($bean->phone_mobile); 
			$bean->phone_home = $this->sanitizePhone($bean->phone_home);
			$bean->phone_work = $this->sanitizePhone($bean->phone_work);
			$bean->phone_other = $this->sanitizePhone($bean->phone_other);
		}
}
?>