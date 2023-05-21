<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'modules/PolyReports/common.php';
include_once 'modules/PolyReports/lead_all.php';

class PolyReportsViewLeadAll extends SugarView {

    public function display() {
		// ini_set('error_reporting', E_ALL);
        // ini_set('display_errors', 1);
        // global $db;
        // $query = $db;
        global $app_list_strings;
		$ss = new Sugar_Smarty();
        // Tạo class Voice chứa các function query 
        $lead = new LeadAll;
        $common = new Common;
        // $bean = ViewEdit::getVardefsData('Leads')[0];
        $dot_nhap_hoc_list = $app_list_strings['dotnhaphoc_list'];
        $ss->assign('dot_nhap_hoc_list', $dot_nhap_hoc_list);
        $nodate = isset($_REQUEST['nodate'])?$_REQUEST['nodate']:'';
        $dot_nhap_hoc=isset($_REQUEST['dot_nhap_hoc'])?$_REQUEST['dot_nhap_hoc']:'';
        // var_dump($dot_nhap_hoc);
        $arr_dot_nhap_hoc=explode(",",$dot_nhap_hoc);
        // var_dump($arr_dot_nhap_hoc);
        $ss->assign('nodate', $nodate);

        $ss->assign('dot_nhap_hoc', $arr_dot_nhap_hoc);
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
            if($role->name == 'admin' || $role->name == 'All Report'){
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
        $security_list=[];
        foreach ($common->getAllSecurityGroup() as $sec){
            $obj = (object)['id'=>$sec['id'],'name'=>$sec['name']];
            array_push($security_list,$obj);

            array_push($list_security,$sec['id']);
        }
        $ss->assign('security_list',$security_list);
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
        // Common::dd($list_security);
        $reports = [];
        $from = isset($_REQUEST['from'])?$_REQUEST['from']:'';
        $to = isset($_REQUEST['to'])?$_REQUEST['to']:'';
        $secs=isset($_REQUEST['sec'])?$_REQUEST['sec']:'all';
        if($secs != 'all'){
            $security=explode(",",$secs);
            foreach ($security as $sec){
                if($sec == 'all'){
                    $secs = 'all';        
                }
            }
        }
        // var_dump($secs);
        if($from !='' && $to != ''){
            $ss->assign('from', $from);
            $ss->assign('to', $to);
            $ss->assign('security','Toàn quốc');
            $total_report=0;
            $total_active_lead=0;
            $total_converted=0;
            $total_ne=0;
            $total_lead=0;
    
            $total_active_lead_rate=0;
            $total_converted_rate=0;
            $total_ne_rate=0;
            if($secs == 'all'){
                foreach ($list_security as $security ) {
                //  $voice->dd($security);

                    // if($security_now == $security){
                    //     $access_security= true;
                    // }
                        // var_dump(1);
                        // var_dump($security);
                        // var_dump($dot_nhap_hoc);
                        // var_dump($nodate);

                        $telesales = $common->getAllTelesaleInSecurityGroup($security);
                        // var_dump($telesales);
                        
                        $report_per_telesale= $lead->getReportLeadPerTelesale($telesales,$from,$to,$dot_nhap_hoc,$nodate);
                        // Common::dd($report_per_telesale);
                        $security_name= $common->getNameSecurityGroup($security)[0]['name'];
                        $sec_id = $common->getNameSecurityGroup($security)[0]['id'];
                        // Common::dd($report_per_telesale);
                        $endkey = Common::array_key_last($report_per_telesale);
                            // Common::dd($total);
                            // var_dump($report_per_telesale[$endkey]);
                        if($report_per_telesale[$endkey]->report->data[0]->lead>0){
                            array_push($reports,(object)["data"=>$report_per_telesale,"security_group_name"=>$security_name,"sec_id"=>$sec_id]);
                            // var_dump($security_name);
                            
                            // var_dump($report_per_telesale[$endkey]->report->data[0]->call_held);
                            $total_report++;
                            $total_active_lead+=$report_per_telesale[$endkey]->report->data[0]->active_lead;
                            $total_converted+=$report_per_telesale[$endkey]->report->data[0]->converted;
                            $total_ne+=$report_per_telesale[$endkey]->report->data[0]->ne;
                            $total_lead+=$report_per_telesale[$endkey]->report->data[0]->lead;
                            
                        }

                }
            }else{
                $securitys=explode(",",$secs);
                foreach ($securitys as $security ) {
                    //  $voice->dd($security);
    
                        // if($security_now == $security){
                        //     $access_security= true;
                        // }
                            // var_dump(1);
                            // var_dump($security);
                            // var_dump($dot_nhap_hoc);
                            // var_dump($nodate);
    
                            $telesales = $common->getAllTelesaleInSecurityGroup($security);
                            // var_dump($telesales);
                            
                            $report_per_telesale= $lead->getReportLeadPerTelesale($telesales,$from,$to,$dot_nhap_hoc,$nodate);
                            // Common::dd($report_per_telesale);
                            $security_name= $common->getNameSecurityGroup($security)[0]['name'];
                            $sec_id = $common->getNameSecurityGroup($security)[0]['id'];
                            // Common::dd($report_per_telesale);
                            $endkey = Common::array_key_last($report_per_telesale);
                                // Common::dd($total);
                                // var_dump($report_per_telesale[$endkey]);
                            if($report_per_telesale[$endkey]->report->data[0]->lead>0){
                                array_push($reports,(object)["data"=>$report_per_telesale,"security_group_name"=>$security_name,"sec_id"=>$sec_id]);
                                // var_dump($security_name);
                                
                                // var_dump($report_per_telesale[$endkey]->report->data[0]->call_held);
                                $total_report++;
                                $total_active_lead+=$report_per_telesale[$endkey]->report->data[0]->active_lead;
                                $total_converted+=$report_per_telesale[$endkey]->report->data[0]->converted;
                                $total_ne+=$report_per_telesale[$endkey]->report->data[0]->ne;
                                $total_lead+=$report_per_telesale[$endkey]->report->data[0]->lead;
                                
                            }
    
                    }
            }
            if($total_active_lead !=0 && $total_lead !=0){
                $total_active_lead_rate= number_format($total_active_lead/$total_lead, 2, '.', '') * 100;
            }else{
                $total_active_lead_rate = 0;
            }
            if($total_converted !=0 && $total_active_lead !=0){
                $total_converted_rate= number_format($total_converted/$total_active_lead, 2, '.', '') * 100;
            }else{
                $total_converted_rate = 0;
            }
            if($total_ne !=0 && $total_converted !=0){
                $total_ne_rate= number_format($total_ne/$total_converted, 2, '.', '') * 100;
            }else{
                $total_ne_rate = 0;
            }
            $report_all =[(object)['active_lead'=>$total_active_lead,'active_lead_rate'=>$total_active_lead_rate,'converted'=>$total_converted,'converted_rate'=>$total_converted_rate,'ne'=> $total_ne,'ne_rate'=> $total_ne_rate,'lead'=> $total_lead]];
            
            // Common::dd($report_all);        
            $ss->assign('report',$reports);
            $ss->assign('report_all',$report_all[0]);
            // Common::dd($reports[2]->data[0]->report->empty);   
            $html = $ss->fetch('modules/PolyReports/tpls/lead_all-report.tpl');
        }else{
            $html = $ss->fetch('modules/PolyReports/tpls/lead_all.tpl');  
        }
        // Common::dd($report);
        // Nếu request hiện tại đã có cơ sở thì tới trang tìm theo cơ sở với ngày với input from to và telesale là all ( tất cả của cơ sở đó)
        // Nếu không có security nào hiện ra trang tìm kiếm bao gồm field date range và chọn cở sở, telesale value là all
  
        
      
        
		echo $html;
	
    }

}