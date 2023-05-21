<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');


require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'custom/modules/Accounts/common.php';
class CustomAccountsViewPeoplelist extends SugarView
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
				if($role->name == 'admin'){
					// if($role->name == 'admin'){
				// Bảo trì
				// if($role->name == 'admin'){
					$access_role = true;
				}
			}
	   
			// Nếu không có quyền truy cập (role) thì hiển thị thông báo
			if(!$access_role ){
				echo "Bạn không có quyền sử dụng chức năng này, hoặc chức năng này đang được xây dựng, bạn không có quyền truy cập !!!";
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
			echo 'Hiển thị hồ sơ crm tại đây !';
			?>
			<script type="text/javascript">
				jQuery(function() {
					jQuery('.listViewBody table td[field="call_log_c"]').each(function() {
						var call_log = jQuery(this).text().replace(/\|/g, "<br />");
						jQuery(this).html(call_log);
					});
					jQuery('.actionmenulink').text('Danh sách account');
					jQuery('#actionMenuSidebar ul').append(`<li class="actionmenulinks" role="presentation">
													<a href="index.php?module=Accounts&action=peoplelist" data-action-name="peoplelist">
														<div class="side-bar-action-icon">
															<span class="suitepicon suitepicon-action-list"></span>
														</div>
														<div class="actionmenulink">Hồ sơ crm</div>
													</a>
												</li>`);
				});
			
			</script>
			<?php
		
            
		}
 	
 	
}