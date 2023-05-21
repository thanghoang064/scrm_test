<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
class aftersavene {
		function save_ne($bean, $event, $argument) {
			global $db;
			$ne_c=$bean->enrollment_status_c;
			$account_id=$bean->id;
			//echo $ne_c;exit;
			
			 
			 
			$GLOBALS['log']->info($bean->fetched_row['enrollment_status_c']);
			 if (($bean->fetched_row['enrollment_status_c'] != 'enrolled') && ($bean->enrollment_status_c=='enrolled')){
				 //hungnv thêm khi chuyển NE thì đẩy sang crm
			$name=$bean->name;
			$phone1_c=$bean->phone1_c;
			$address_c=$bean->address_c;
			
			// $data = array("name" => "$name", "phone1_c" => "$phone1_c", "address_c" => "$address_c");
			// $ch = curl_init("http://crm.poly.edu.vn/crm/sugarcrm.php");

			// curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			// curl_setopt($ch, CURLOPT_POST, true);
			// curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
			// $output = curl_exec($ch); 
				 
			// 	 //kết thúc
				 
				 
				 
				 $sql="UPDATE leads_cstm a,leads b SET a.ne_c='1' WHERE a.id_c=b.id AND b.account_id='$account_id'";
				 $GLOBALS['log']->info($sql);
				 $db->query($sql);

			
			 }
	}
}
?>