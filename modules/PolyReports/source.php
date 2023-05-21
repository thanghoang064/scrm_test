<?php
include_once('modules/PolyReports/common.php');
class Source {
    function getAllLeadOfSecurityGroupAndPerTelesale($list_telesale = [],$from,$to,$dot_nhap_hoc,$nodate){
        $list_telesale_str= $this->arrayTeletoString($list_telesale);
        $db = DBManagerFactory::getInstance();
        // $currentUser =  Common::getCurrentUSer()->id;
        $begin = new DateTime($from);
        $begin=$begin->format('Y-m-d H:i:s');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $end=$end->format('Y-m-d H:i:s');
        $str_dot_nhap_hoc=$this->arraytoString(explode(",",$dot_nhap_hoc));


       
            if(strlen($dot_nhap_hoc)>2 && isset($dot_nhap_hoc)){
                if($nodate=='all'){
                    $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted,a.lead_source FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)";
                }else{
                    $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted,a.lead_source FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.id = b.id_c AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)";

                }
                // Common::dd('Dev đang bảo trì và nâng cấp chức năng này');
                }else{
                if($nodate=='all'){
                    $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted,a.lead_source FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";

                }else{
                    $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted,a.lead_source FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";

                }
            }
        
            $result = $db->query($sql,true,"Error");
            $data = [];
            while($row = $result->fetch_assoc()) {
                array_push($data,(object) ["status"=>$row['status'],"source_c"=>$row['lead_source'],"assigned_user_id"=>$row["assigned_user_id"],"dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"],"converted"=>$row["converted"]]);
            }
        
        // Common::dd($data);
  
     
        return $data;
    }
    function getAllLeadActiveOfSecurityGroupAndPerTelesale($list_telesale = [],$from,$to,$dot_nhap_hoc,$nodate){
        $list_telesale_str= $this->arrayTeletoString($list_telesale);;
        $db = DBManagerFactory::getInstance();
        // $currentUser =  Common::getCurrentUSer()->id;
        $begin = new DateTime($from);
        $begin=$begin->format('Y-m-d H:i:s');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $end=$end->format('Y-m-d H:i:s');
        $str_dot_nhap_hoc=$this->arraytoString(explode(",",$dot_nhap_hoc));

        if(strlen($dot_nhap_hoc)>2 && isset($dot_nhap_hoc)){
            if($nodate=='all'){
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted,a.lead_source FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND a.status = 'active_lead' AND b.dot_nhap_hoc_c  IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)";

            }else{
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted,a.lead_source FROM leads a,leads_cstm b  WHERE a.deleted=0 AND b.date_activated_c>='$begin' AND b.date_activated_c<'$end' AND b.dot_nhap_hoc_c  IN ($str_dot_nhap_hoc) AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";


            }

            // Common::dd($sql);
        }else{
            if($nodate=='all'){
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted,a.lead_source FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND a.status = 'active_lead' AND a.assigned_user_id IN ($list_telesale_str)";

            }else{
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted,a.lead_source FROM leads a,leads_cstm b  WHERE a.deleted=0 AND b.date_activated_c>='$begin' AND b.date_activated_c<'$end' AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";


            }

        }
     
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["status"=>$row['status'],"source_c"=>$row['lead_source'],"assigned_user_id"=>$row["assigned_user_id"],"dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"],"converted"=>$row["converted"]]);
        }

        // Common::dd($data);
    
     
        return $data;
    }
    function convertSecondToFullTimeText($seconds){
        $result = gmdate("H:i:s", $seconds);
        // $result=$seconds;
      return $result;
    }
   
 
    function arrayTeletoString($array_telesales){
        $list_telesale_str= '';
      
        foreach ($array_telesales as $key=>$telesale) {
 
            if($key == Common::array_key_last($array_telesales)){
                $list_telesale_str.="'$telesale->user_id'";
            }
            else{
                $list_telesale_str.="'$telesale->user_id'".',';
            }
        }
        return $list_telesale_str;
    }
    function arraytoString($array){
        $str= '';
      
        foreach ($array as $key=>$value) {
 
            if($key == Common::array_key_last($array)){
                $str.="'$value'";
            }
            else{
                $str.="'$value'".',';
            }
        }
        return $str;
    }
    function getReportLeadPerTelesale($list_telesale = [],$from,$to,$dot_nhap_hoc,$nodate){
        // Common::dd($dot_nhap_hoc);
      
        $lead_records = $this->getAllLeadOfSecurityGroupAndPerTelesale($list_telesale,$from,$to,$dot_nhap_hoc,$nodate);
        $lead_active_records = $this->getAllLeadActiveOfSecurityGroupAndPerTelesale($list_telesale,$from,$to,$dot_nhap_hoc,$nodate);
        // Common::dd($lead_active_records);
        // Account per telesale , query lấy danh sách account theo đợt nhập học
        $begin = new DateTime($from);
        $begin=$begin->format('Y-m-d H:i:s');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $end=$end->format('Y-m-d H:i:s');
        $db = DBManagerFactory::getInstance();
        $list_telesale_str= $this->arrayTeletoString($list_telesale);
        global $app_list_strings;
        $lead_source_list = $app_list_strings['lead_source_dom'];
        $lead_report=[];
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

            array_push($lead_report,$source);
        }
        // Common::dd($lead_report);
        // var_dump($lead_source_list);
        $str_dot_nhap_hoc=$this->arraytoString(explode(",",$dot_nhap_hoc));
 
        if(strlen($dot_nhap_hoc)>2 && isset($dot_nhap_hoc)){
            if($nodate=='all'){
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c,b.source_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.id = b.id_c  AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)"; 
            }else{
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c,b.source_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.id = b.id_c  AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)"; 

            }
                
        }else{
            if($nodate=='all'){
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c,b.source_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0  AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)"; 
            }else{
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c,b.source_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)"; 
                
            }

        }
        $result = $db->query($sql,true,"Error");
        $account_records = [];
        while($row = $result->fetch_assoc()) {
            array_push($account_records,(object) ["enrollment_status_c"=>$row['enrollment_status_c'],"source_c"=>$row['source_c'],"assigned_user_id"=>$row["assigned_user_id"],"dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"]]);
        }
  
   
        if(strlen($dot_nhap_hoc)>2 && isset($dot_nhap_hoc)){
            if($nodate='all'){
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c,b.source_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND b.enrollment_status_c='enrolled' AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)"; 
            }else{
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c,b.source_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.date_modified>='$begin' AND a.date_modified<'$end' AND a.id = b.id_c AND b.enrollment_status_c='enrolled' AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)"; 
            }
        }else{
            if($nodate=='all'){
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c,b.source_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND b.enrollment_status_c='enrolled' AND a.assigned_user_id IN ($list_telesale_str)"; 
            }else{
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c,b.source_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.date_modified>='$begin' AND b.enrollment_status_c='enrolled' AND a.date_modified<'$end' AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)"; 
            }

        }
        $result = $db->query($sql,true,"Error");
        $ne_records = [];
        while($row = $result->fetch_assoc()) {
            array_push($ne_records,(object) ["enrollment_status_c"=>$row['enrollment_status_c'],"source_c"=>$row['source_c'],"assigned_user_id"=>$row["assigned_user_id"],"dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"]]);
        }
  
        // Common::dd($account_records);
        // Lấy ra danh sách bảng ghi theo lead rồi count và ghép vào 1 object chứa các info cần show ra
        // $key = 0;
        $my_report=[];
    //    var_dump($call_records);die;

        foreach ($lead_records as $key=>$record){
            foreach ($lead_report as $index=>$source){
                if($record->source_c == $source->value){
                    $lead_report[$index]->lead ++;
                  }
            }
        }
        foreach ($lead_active_records as $key=>$record){
            foreach ($lead_report as $index=>$source){
                if($record->source_c == $source->value){
                    $lead_report[$index]->active_lead ++;
                  }
            }
        }
        foreach($account_records as $key=>$record){
            foreach ($lead_report as $index=>$source){
                if($record->source_c == $source->value){
                    $lead_report[$index]->converted ++;
                  }
            }
        }
        foreach($ne_records as $key=>$record){
            foreach ($lead_report as $index=>$source){
                if($record->source_c == $source->value){
                    $lead_report[$index]->ne ++;
                  }
            }
        }
                
        // Common::dd($lead_report);
        foreach ($lead_report as $index=>$source){
            if($source->active_lead !=0 && $source->lead !=0){
                $lead_report[$index]->active_lead_rate= number_format($source->active_lead/$source->lead, 2, '.', '') * 100;
            }
            if($source->converted !=0 && $source->active_lead !=0){
                $lead_report[$index]->converted_rate= number_format($source->converted/$source->active_lead, 2, '.', '') * 100;
            }
            if($source->ne !=0 && $source->converted !=0){
                $lead_report[$index]->ne_rate= number_format($source->ne/$source->converted, 2, '.', '') * 100;
            }
        }
   
        // Common::dd($lead_report);
        return $lead_report;
    }

    function reportBuilderData($report_per_telesale=[],$from,$to){
  
  
        // Common::dd($report_per_telesale);
       return $report_per_telesale;
    }
}