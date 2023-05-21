<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');


require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'custom/modules/Accounts/common.php';
class CustomAccountsViewEditcrm extends AccountsViewEdit
{
		function display(){
			global $app_list_strings;
			$ss = new Sugar_Smarty();
			// Tạo class Voice chứa các function query 
			$common = new CommonNE;
			// $bean = ViewEdit::getVardefsData('Leads')[0];
			// $bean = $app_list_strings['dotnhaphoc_list'];
			// $bean = BeanFactory::newBean('Leads');
			// Common::dd($bean);
			// Lấy ra danh sách security group của user
			$security_groups=[];
			$security_groups = $common->getGroupUser();
			
			// Lấy ra danh sách role của user và kiểm tra role có đạt quyền dể xem ko
			$roles= $common->getRoleUser();
			$access_role = false;
			foreach ($roles as $role){
				if($role->name == 'admin' || $role->name == 'Leader' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'|| $role->role_id == '7bf90ea1-2c00-10c3-9a0e-58abca3491d0'){
				// Bảo trì
				// if($role->name == 'admin'){
					$access_role = true;
				}
			}
	   
			// Nếu không có quyền truy cập (role) thì hiển thị thông báo
			if(!$access_role ){
				echo "Bạn không có quyền sử dụng chức năng này";
				// echo "Đang bảo trì chức năng";  
				die;
			}
			// }else{
			// 	echo "Bạn có quyền sử dụng chức năng này";
			// 	// echo "Đang bảo trì chức năng";  
			// 	// die;
			// }
			// $voice->dd($roles);
	
			// $voice->dd($voice->getAllSecurityGroup());
			//Gọi hàm getAllSecurityGroup query lấy hết bản ghi cơ sở, trả vào mảng id của từng cơ sở
			$list_security = [];
			
			foreach ($common->getAllSecurityGroup() as $sec){
				array_push($list_security,$sec['id']);
			}
			// $voice->dd($list_security);
			// Kiểm tra request hiện tại xem có match với 1 cơ sở nào không, nếu không có trả về danh sách cơ sở, nếu ko có quyền truy cập các cơ sở thì hiển thị không có quyền truy cập
			$record_id = isset($_REQUEST['record_id'])?$_REQUEST['record_id']:'';
			$list_secs = $common->getAllSecurityGroupByAccountId($record_id);
			// Input security_groups vào đếm nếu có nhiều không có cơ sở nào thì thông báo ko có quyền
			if(count($security_groups)==0){
					echo "Bạn không có quyền sử dụng chức năng này";
					die;
			}
			// Kiểm tra request hiện tại đang có id của 1 cơ sở nào không 
			$access_security = false;
			foreach ($list_security as $security ) {
			//  $voice->dd($security);
			// var_dump($security);
				foreach ($list_secs as $sec){
					if ($security == $sec->id){
						$access_security= true;

					}
				}
				
			}
			if($access_security){
				// echo "Bạn có quyền sử dụng chức năng này!";
				$url= $_SERVER['HTTP_HOST'];
				$record= $common->getInfoAccount2($record_id);
				if($record[0]->converted_file_student_c == 0){
					echo 'Hồ sơ chưa được convert, bạn không thể truy cập địa chỉ này!';
					die;
				}
				if($record[0]->converted_file_student_c == 1){
					// var_dump($record);
					$ss->assign('record',$record[0]);
					$ss->assign('record_json',json_encode($record[0]));
					$ss->assign('url',$url);
					$html = $ss->fetch('custom/modules/Accounts/tpls/editcrm.tpl');
					echo $html;
				}else{
					echo 'Có lỗi xảy ra';
					die;
				}
				

			}else{
				echo "Bạn không có quyền sử dụng chức năng này";
			}

		}
 	
 	
}