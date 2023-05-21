<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'modules/PolyReports/common.php';
include_once 'modules/PolyReports/leadc.php';

class PolyReportsViewLead extends SugarView {

    public function display() {
		// ini_set('error_reporting', E_ALL);
        // ini_set('display_errors', 1);
        // global $db;
        // $query = $db;
        global $app_list_strings;
		$ss = new Sugar_Smarty();
        // Tạo class Voice chứa các function query 
        $lead = new Leadc;
        $common = new Common;
        // $bean = ViewEdit::getVardefsData('Leads')[0];
        $dot_nhap_hoc_list = $app_list_strings['dotnhaphoc_list'];
        $ss->assign('dot_nhap_hoc_list', $dot_nhap_hoc_list);
        // $bean = BeanFactory::newBean('Leads');
        // Common::dd($dot_nhap_hoc_list);
        // Lấy ra danh sách security group của user
        $security_groups=[];
        $security_groups = $common->getGroupUser();
        
        // Lấy ra danh sách role của user và kiểm tra role có đạt quyền dể xem ko
        $roles= $common->getRoleUser();
        $access_role = false;
        foreach ($roles as $role){
            if($role->name == 'admin' || $role->name == 'Leader' || $role->id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'){
            // Bảo trì
            // if($role->name == 'admin'){
                $access_role = true;
            }
        }
   
        // Nếu không có quyền truy cập (role) thì hiển thị thông báo
        if(!$access_role ){
            echo "Bạn không có quyền xem báo cáo loại này";
            // echo "Đang bảo trì chức năng";  
            die;
        }
        // $voice->dd($roles);

        // $voice->dd($voice->getAllSecurityGroup());
        //Gọi hàm getAllSecurityGroup query lấy hết bản ghi cơ sở, trả vào mảng id của từng cơ sở
        $list_security = [];
        
        foreach ($common->getAllSecurityGroup() as $sec){
            array_push($list_security,$sec['id']);
        }
        // $voice->dd($list_security);
        // Kiểm tra request hiện tại xem có match với 1 cơ sở nào không, nếu không có trả về danh sách cơ sở, nếu ko có quyền truy cập các cơ sở thì hiển thị không có quyền truy cập
        $security_now = isset($_REQUEST['sec'])?$_REQUEST['sec']:'';
        // Input security_groups vào đếm nếu có nhiều không có cơ sở nào thì thông báo ko có quyền

            if(count($security_groups)==0){
                echo "Bạn không có quyền xem cơ sở để xem báo cáo loại này";
                die;
            }
        // Kiểm tra request hiện tại đang có id của 1 cơ sở nào không 
        $access_security = false;
        foreach ($list_security as $security ) {
        //  $voice->dd($security);

            if($security_now == $security){
                $access_security= true;
            }
        }
    
        // Nếu request hiện tại đã có cơ sở thì tới trang tìm theo cơ sở với ngày với input from to và telesale là all ( tất cả của cơ sở đó)
        // Nếu không có security nào hiện ra trang tìm kiếm bao gồm field date range và chọn cở sở, telesale value là all
        if($access_security){
            //Lấy tất cả telesale theo security group id
            $telesales = $common->getAllTelesaleInSecurityGroup($security_now);
            // foreach($telesales as $p){
            //     echo '<p>';
            //     var_dump($p);
            //     echo '</p>';
            // }
   
            //Dán biến telesales vào biến ss
            $ss->assign('telesales', $telesales);
            $ss->assign('security_groups', $security_groups);
            //Dán biến from , to  vào biến ss thông qua lấy request từ page hiện tại
            $from = isset($_REQUEST['from'])?$_REQUEST['from']:'';
            $to = isset($_REQUEST['to'])?$_REQUEST['to']:'';
            $nodate = isset($_REQUEST['nodate'])?$_REQUEST['nodate']:'';
            $dot_nhap_hoc=isset($_REQUEST['dot_nhap_hoc'])?$_REQUEST['dot_nhap_hoc']:'';
            // var_dump($_REQUEST['dot_nhap_hoc']);
            $arr_dot_nhap_hoc=explode(",",$dot_nhap_hoc);
            // var_dump($arr_dot_nhap_hoc);

            $ss->assign('dot_nhap_hoc', $arr_dot_nhap_hoc);
            $ss->assign('nodate', $nodate);
            
            if($from !='' && $to != ''){
                $ss->assign('from', $from);
                $ss->assign('to', $to);
                $ss->assign('security',($common->getNameSecurityGroup($security_now))[0]['name']);
                // $common->dd();
                // Kiểm tra nếu request telesale tồn tại thì check request , nếu là all thì hiển thị báo cáo all , nếu không phải thì lấy id của request để hiển thị báo cáo theo telesale
                $report_per_telesale=[];
                if(isset($_REQUEST['telesale'])){
                    switch ($_REQUEST['telesale']) {
                        case 'all':
                            $report_per_telesale= $lead->getReportLeadPerTelesale($telesales,$from,$to,$dot_nhap_hoc,$nodate);
                            $ss->assign('telesale','all');
                            break;
                        default:
                            $this_telesale = (object)['user_id'=>$_REQUEST['telesale']];
                            foreach ($telesales as $telesale){
                                if ( $telesale->user_id == $_REQUEST['telesale']){
                                    $this_telesale->user_name = $telesale->user_name;
                                }
                            }
                            $report_per_telesale= $lead->getReportLeadPerTelesale([$this_telesale],$from,$to);
                            $ss->assign('telesale',$_REQUEST['telesale']);
                        
                    };
                }else{
                    $html = $ss->fetch('modules/PolyReports/tpls/lead.tpl');   
                    // die;
                }
       
                $builder_report = $lead->reportBuilderData($report_per_telesale,$from,$to);
                $ss->assign('report',$builder_report);
              
            }else{
                $html = $ss->fetch('modules/PolyReports/tpls/lead.tpl');  
                // die;
            }
            //
 
            // echo '<pre>';
            // var_dump($calls);
            // echo '</pre>';
            // die;
            //fetch biến ss vào view tpl để sử dụng 
            $html = $ss->fetch('modules/PolyReports/tpls/lead-report.tpl');
            // die;
        }else{
            $ss->assign('security_groups', $security_groups);
            $html = $ss->fetch('modules/PolyReports/tpls/lead.tpl');  
        }
        
      
        
		echo $html;
	
    }

}