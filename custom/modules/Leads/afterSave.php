<?php
	if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

	class AfterSave {
		//Tripv Edit 9/12/2019 : Sửa lỗi không tìm thấy property của last_dup_c, check tồn tại
		function check_new_dup($bean, $event, $argument) {
			// if(isset($bean->last_dup_c)){
				// $GLOBALS['log']->fatal('New dup: ' . $bean->new_dup_c . '; Date modified: ' . $bean->date_modified . '; Last dup date: ' . $bean->last_dup_c);
			// }else{
				// $GLOBALS['log']->fatal('New dup: ' . $bean->new_dup_c . '; Date modified: ' . $bean->date_modified . '; Last dup date: ' . $bean->new_dup_c);
			// }
			
			
			//Dup check
			if($bean->new_dup_c == 1) {
				if(strtotime($bean->date_modified) >= strtotime($bean->last_dup_c)) {
					$bean->new_dup_c = 0;
					$bean->save();
				}
			}
		}
		
	}

?>