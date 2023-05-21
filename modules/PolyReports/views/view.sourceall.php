<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'modules/PolyReports/common.php';
include_once 'modules/PolyReports/source.php';

class PolyReportsViewSourceall extends SugarView {

    public function display() {
		// ini_set('error_reporting', E_ALL);
        // ini_set('display_errors', 1);
        // global $db;
        // $query = $db;
        global $app_list_strings;
		$ss = new Sugar_Smarty();
        // Tạo class Voice chứa các function query 
        $lead = new Source;
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
        // Common::dd($list_security);
        $reports = [];
        $from = isset($_REQUEST['from'])?$_REQUEST['from']:'';
        $to = isset($_REQUEST['to'])?$_REQUEST['to']:'';
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
            global $app_list_strings;
            $lead_source_list = $app_list_strings['lead_source_dom'];
            $report_all=[];
            foreach($lead_source_list as $key => $value){
                $source = (object)[];
                $source->value = $key;
                $source->name=$value;
                $source->lead=0;
                $source->account=0;
                $source->active_lead=0;
                $source->converted=0;
                $source->ne=0;
                $source->active_lead_rate=0;
                $source->converted_rate=0;
                $source->ne_rate=0;
    
                array_push($report_all,$source);
            }
            // var_dump($report_all);
            $sources = (object)[];
            $sources->value = '';
            $sources->name='';
            $sources->lead=0;
            $sources->account=0;
            $sources->active_lead=0;
            $sources->converted=0;
            $sources->ne=0;
            $sources->active_lead_rate=0;
            $sources->converted_rate=0;
            $sources->ne_rate=0;
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
                    if(count($telesales)>0){

                   
                        $report_per_telesale= $lead->getReportLeadPerTelesale($telesales,$from,$to,$dot_nhap_hoc,$nodate);
                        
                        // Common::dd($report_per_telesale);
                        $security_name= $common->getNameSecurityGroup($security)[0]['name'];
                        $sec_id = $common->getNameSecurityGroup($security)[0]['id'];
                        // Common::dd($report_per_telesale);
                 
                            // Common::dd($total);
                            // var_dump($report_per_telesale[$endkey]);
                            // Common::dd($report_per_telesale[$endkey]->lead);
                            $src = (object)[];
                            $src->value = 'Tổng toàn quốc';
                            $src->name='Tổng toàn quốc';
                            $src->lead=0;
                            $src->account=0;
                            $src->active_lead=0;
                            $src->converted=0;
                            $src->ne=0;
                            $src->active_lead_rate=0;
                            $src->converted_rate=0;
                            $src->ne_rate=0;

                            
                            // var_dump($security_name);
                            
                            // var_dump($report_per_telesale[$endkey]->report->data[0]->call_held);
                            foreach ($report_per_telesale as $source){
                      


                                    foreach ($report_all as $key=>$source_all){

                                        if($source_all->name == $source->name){
                                // var_dump($source_all->name.'-'.$source->name);
                                // var_dump( $report_all[$key]->lead.'-'.$source->lead);

                                            $report_all[$key]->lead +=$source->lead;
                                            $report_all[$key]->active_lead +=$source->active_lead;
                                            $report_all[$key]->converted +=$source->converted;
                                            $report_all[$key]->ne +=$source->ne;

                                        }
                                    }
                                $src->lead +=$source->lead;
                                $src->active_lead +=$source->active_lead;
                                $src->converted +=$source->converted;
                                $src->ne +=$source->ne;
                                $sources->lead +=$source->lead;
                                $sources->active_lead +=$source->active_lead;
                                $sources->converted +=$source->converted;
                                $sources->ne +=$source->ne;
                            }
                            if($src->active_lead !=0 && $src->lead !=0){
                                $src->active_lead_rate = number_format($src->active_lead/$src->lead, 2, '.', '') * 100;
                            }
                            if($src->converted !=0 && $src->active_lead !=0){
                                $src->converted_rate = number_format($src->converted/$src->active_lead, 2, '.', '') * 100;
                            }
                            if($src->converted !=0 && $src->ne !=0){
                                $src->ne_rate = number_format($src->ne/$src->converted, 2, '.', '') * 100;
                            }
                            array_push($report_per_telesale,$src);
                            array_push($reports,(object)["data"=>$report_per_telesale,"security_group_name"=>$security_name,"sec_id"=>$sec_id]);
                    
                            
                        
                    }

            }
            // Common::dd($report_all);
            foreach ($report_all as $key=>$source_all){
                if($source_all->active_lead !=0 && $source_all->lead !=0){
                    $report_all[$key]->active_lead_rate = number_format($source_all->active_lead/$source_all->lead, 2, '.', '') * 100;
                }
                if($source_all->converted !=0 && $source_all->active_lead !=0){

                    $report_all[$key]->converted_rate = number_format($source_all->converted/$source_all->active_lead, 2, '.', '') * 100;


                }
                if($source_all->converted !=0 && $source_all->ne !=0){

                    $report_all[$key]->ne_rate = number_format($source_all->ne/$source_all->converted, 2, '.', '') * 100;

                }
            }
   
            if($sources->active_lead !=0 && $sources->lead !=0){
                $sources->active_lead_rate = number_format($sources->active_lead/$sources->lead, 2, '.', '') * 100;
            }
            if($sources->converted !=0 && $sources->active_lead !=0){
                $sources->converted_rate = number_format($sources->converted/$sources->active_lead, 2, '.', '') * 100;
            }
            if($sources->converted !=0 && $sources->ne !=0){
                $sources->ne_rate = number_format($sources->ne/$sources->converted, 2, '.', '') * 100;
            }
            // Common::dd($reports);        
            $ss->assign('report',$reports);
            $ss->assign('report_all',$report_all);
            $ss->assign('reportall',$sources);
            // Common::dd($reports[2]->data[0]->report->empty);   
            $html = $ss->fetch('modules/PolyReports/tpls/source_all-report.tpl');
        }else{
            $html = $ss->fetch('modules/PolyReports/tpls/source_all.tpl');  
        }
        // Common::dd($report);
        // Nếu request hiện tại đã có cơ sở thì tới trang tìm theo cơ sở với ngày với input from to và telesale là all ( tất cả của cơ sở đó)
        // Nếu không có security nào hiện ra trang tìm kiếm bao gồm field date range và chọn cở sở, telesale value là all
  
        
      
        
		echo $html;
	
    }

}