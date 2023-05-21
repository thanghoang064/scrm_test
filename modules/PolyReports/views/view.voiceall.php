<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
include_once 'modules/PolyReports/common.php';
include_once 'modules/PolyReports/voice_all.php';

class PolyReportsViewVoiceAll extends SugarView {

    public function display() {
		// ini_set('error_reporting', E_ALL);
        // ini_set('display_errors', 1);
        // global $db;
        // $query = $db;
        global $app_list_strings;
		$ss = new Sugar_Smarty();
        // Tạo class Voice chứa các function query 
        $voice = new VoiceAll;
        $common = new Common;
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
            $total_held=0;
            $total_voice=0;
            $total_calls=0;
            $duration_held=0;
            $rate=0;
            $total_try_contact=0;
            $total_active_lead=0;
            $total_recall=0;
            $total_not_interested=0;
            $total_duration=0;
            foreach ($list_security as $security ) {
            //  $voice->dd($security);

                // if($security_now == $security){
                //     $access_security= true;
                // }

                    $telesales = $common->getAllTelesaleInSecurityGroup($security);
                    $report_per_telesale= $voice->getReportCallPerTelesale($telesales,$from,$to);
                    $security_name= $common->getNameSecurityGroup($security)[0]['name'];
                    $sec_id = $common->getNameSecurityGroup($security)[0]['id'];
                    // Common::dd($report_per_telesale);
                       $endkey = Common::array_key_last($report_per_telesale);
                        // Common::dd($total);
                        // var_dump($report_per_telesale[$endkey]);
                    if($report_per_telesale[$endkey]->report->data[0]->call_held>0){
                        array_push($reports,(object)["data"=>$report_per_telesale,"security_group_name"=>$security_name,"sec_id"=>$sec_id]);
                        // var_dump($security_name);
                        
                        // var_dump($report_per_telesale[$endkey]->report->data[0]->call_held);
                        $total_report++;
                        $total_held+=$report_per_telesale[$endkey]->report->data[0]->call_held;
                        $total_voice+=$report_per_telesale[$endkey]->report->data[0]->total_call;
                        $total_calls+=$report_per_telesale[$endkey]->report->data[0]->record_calls;
                        $total_duration+=$report_per_telesale[$endkey]->report->data[0]->duration_held_raw;
       
                        $total_try_contact+=$report_per_telesale[$endkey]->report->data[0]->try_to_contact;
                        $total_active_lead+=$report_per_telesale[$endkey]->report->data[0]->active_lead;
                        $total_recall+=$report_per_telesale[$endkey]->report->data[0]->recall;
                        $total_not_interested+=$report_per_telesale[$endkey]->report->data[0]->not_interested;
                        
                    }

            }
            if($total_held !=0){
                $total_rate = floor($total_duration/$total_held);
    
            }else{
                $total_rate = 0;
            }
   
            $report_all =[(object)['call_held'=>$total_held,'total_call'=>$total_voice,'record_calls'=>$total_calls,'not_held'=>$total_voice-$total_held,'duration_held'=> $voice->convertSecondToFullTimeTextAll($total_duration),'rate'=> $voice->convertSecondToFullTimeText($total_rate),'duration_held_raw'=> $total_duration,'rate_raw'=> $total_rate,'try_to_contact'=>$total_try_contact,'active_lead'=>$total_active_lead,'recall'=>$total_recall,'not_interested'=>$total_not_interested]];
        
            // var_dump($total_report);        
            $ss->assign('report',$reports);
            $ss->assign('report_all',$report_all[0]);
            // Common::dd($reports);   
            $html = $ss->fetch('modules/PolyReports/tpls/voice_all-report.tpl');
        }else{
            $html = $ss->fetch('modules/PolyReports/tpls/voice_all.tpl');  
        }
        // Common::dd($report);
        // Nếu request hiện tại đã có cơ sở thì tới trang tìm theo cơ sở với ngày với input from to và telesale là all ( tất cả của cơ sở đó)
        // Nếu không có security nào hiện ra trang tìm kiếm bao gồm field date range và chọn cở sở, telesale value là all
  
        
      
        
		echo $html;
	
    }

}