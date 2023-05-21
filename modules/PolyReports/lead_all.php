<?php
include_once('modules/PolyReports/common.php');
class LeadAll {
    function getAllLeadOfSecurityGroupAndPerTelesale($list_telesale = [],$from,$to,$dot_nhap_hoc,$nodate){
        if(count($list_telesale) != 0){
        // var_dump($list_telesale);
        $list_telesale_str= $this->arrayTeletoString($list_telesale);
        $db = DBManagerFactory::getInstance();
        // $currentUser =  Common::getCurrentUSer()->id;
        $begin = new DateTime($from);
        $begin=$begin->format('Y-m-d H:i:s');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $end=$end->format('Y-m-d H:i:s');
        $str_dot_nhap_hoc=$this->arraytoString(explode(",",$dot_nhap_hoc));

        if(strlen($str_dot_nhap_hoc)>2 ){
            if($nodate=='all'){
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)";
            }else{
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.id = b.id_c AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)";

            }
            // Common::dd('Dev đang bảo trì và nâng cấp chức năng này');
        }else{
            if($nodate=='all'){
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";

            }else{
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";

            }
        }
        // var_dump($sql);
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["status"=>$row['status'],"assigned_user_id"=>$row["assigned_user_id"],"dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"],"converted"=>$row["converted"]]);
        }

        // Common::dd($data);
  
     
       
        return $data;
        }else{
            return 0;
        }
    }
    function getAllLeadActiveOfSecurityGroupAndPerTelesale($list_telesale = [],$from,$to,$dot_nhap_hoc,$nodate){
        if(count($list_telesale) != 0){
        $list_telesale_str= $this->arrayTeletoString($list_telesale);;
        $db = DBManagerFactory::getInstance();
        // $currentUser =  Common::getCurrentUSer()->id;
        $begin = new DateTime($from);
        $begin=$begin->format('Y-m-d H:i:s');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $end=$end->format('Y-m-d H:i:s');
        $str_dot_nhap_hoc=$this->arraytoString(explode(",",$dot_nhap_hoc));

        if(strlen($str_dot_nhap_hoc)>2){
            if($nodate=='all'){
            $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)";
            // Common::dd($sql);
            }else{
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted FROM leads a,leads_cstm b  WHERE a.deleted=0 AND b.date_activated_c>='$begin' AND b.date_activated_c<'$end' AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";
            }

        }else{
            if($nodate=='all'){
            $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted FROM leads a,leads_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";
            // Common::dd($sql);
            }else{
                $sql = "SELECT a.status,a.assigned_user_id,b.dot_nhap_hoc_c,a.converted FROM leads a,leads_cstm b  WHERE a.deleted=0 AND b.date_activated_c>='$begin' AND b.date_activated_c<'$end' AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)";
            }

        }
     
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["status"=>$row['status'],"assigned_user_id"=>$row["assigned_user_id"],"dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"],"converted"=>$row["converted"]]);
        }

        // Common::dd($data);
  
     
        return $data;}else{
            return 0;
        }
    }
    function getAllAccountOfSecurityGroupAndPerTelesale($list_telesale = [],$from,$to,$dot_nhap_hoc,$nodate){
        if(count($list_telesale) != 0){
            $begin = new DateTime($from);
            $begin=$begin->format('Y-m-d H:i:s');
            $end = new DateTime($to);
            $end->modify('+1 day');
            $end=$end->format('Y-m-d H:i:s');
            $db = DBManagerFactory::getInstance();
            $list_telesale_str= $this->arrayTeletoString($list_telesale);

            $str_dot_nhap_hoc=$this->arraytoString(explode(",",$dot_nhap_hoc));
            // var_dump($dot_nhap_hoc);
            // var_dump($str_dot_nhap_hoc);
            
            if(strlen($str_dot_nhap_hoc)>2){
                if($nodate=='all'){
                    $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.id = b.id_c  AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)"; 
                }else{
                    $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.id = b.id_c  AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)"; 
    
                }
                    
            }else{
                if($nodate=='all'){
                    $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0  AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)"; 
                }else{
                    $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)"; 
                    
                }
    
            }
            $result = $db->query($sql,true,"Error");
            $account_records = [];
            while($row = $result->fetch_assoc()) {
                array_push($account_records,(object) ["enrollment_status_c"=>$row['enrollment_status_c'],"assigned_user_id"=>$row["assigned_user_id"],"dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"]]);
            }
            return $account_records;
        }else{
            return 0;
        }
    }
    function getAllNEOfSecurityGroupAndPerTelesale($list_telesale = [],$from,$to,$dot_nhap_hoc,$nodate){
        if(count($list_telesale) != 0){
        $begin = new DateTime($from);
        $begin=$begin->format('Y-m-d H:i:s');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $end=$end->format('Y-m-d H:i:s');
        $db = DBManagerFactory::getInstance();
        $list_telesale_str= $this->arrayTeletoString($list_telesale);

        $str_dot_nhap_hoc=$this->arraytoString(explode(",",$dot_nhap_hoc));
        // var_dump($dot_nhap_hoc);
        //     var_dump($str_dot_nhap_hoc);

        if(strlen($str_dot_nhap_hoc)>2){
            if($nodate=='all'){
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND b.enrollment_status_c='enrolled' AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)"; 
            }else{
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.date_modified>='$begin' AND b.enrollment_status_c='enrolled' AND a.date_modified<'$end' AND a.id = b.id_c  AND b.dot_nhap_hoc_c IN ($str_dot_nhap_hoc) AND a.assigned_user_id IN ($list_telesale_str)"; 
            }
        }else{
            if($nodate=='all'){
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.id = b.id_c AND b.enrollment_status_c='enrolled' AND a.assigned_user_id IN ($list_telesale_str)"; 
            }else{
                $sql = "SELECT b.enrollment_status_c,a.assigned_user_id,b.dot_nhap_hoc_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.date_modified>='$begin' AND b.enrollment_status_c='enrolled' AND a.date_modified<'$end' AND a.id = b.id_c AND a.assigned_user_id IN ($list_telesale_str)"; 
            }

        }
        $result = $db->query($sql,true,"Error");
        $ne_records = [];
        while($row = $result->fetch_assoc()) {
            array_push($ne_records,(object) ["enrollment_status_c"=>$row['enrollment_status_c'],"assigned_user_id"=>$row["assigned_user_id"],"dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"]]);
        }
        return $ne_records;
    }else{
        return 0;
    }


    }
    function convertSecondToFullTimeText($seconds){
        $result = gmdate("H:i:s", $seconds);
        // $result=$seconds;
      return $result;
    }
   
    function getCalls($list_lead="",$from,$to){
        $begin = new DateTime($from);
        $begin=$begin->format('Y-m-d H:i:s');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $end=$end->format('Y-m-d H:i:s');
        $db = DBManagerFactory::getInstance();
        $sql = "SELECT b.call_type_c FROM calls a,calls_cstm b WHERE a.deleted=0 AND a.id=b.id_c AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.created_by ='$list_lead' AND a.modified_user_id ='$list_lead'";
        // Common::dd($sql);
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["call_type_c"=>$row['call_type_c']]);
        }
        // Common::dd($data);
        return $data;
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
        // var_dump('ok');
        $lead_records = $this->getAllLeadOfSecurityGroupAndPerTelesale($list_telesale,$from,$to,$dot_nhap_hoc,$nodate);
        // var_dump('ok');

        $lead_active_records = $this->getAllLeadActiveOfSecurityGroupAndPerTelesale($list_telesale,$from,$to,$dot_nhap_hoc,$nodate);
        // var_dump('ok');
        $account_records = $this->getAllAccountOfSecurityGroupAndPerTelesale($list_telesale,$from,$to,$dot_nhap_hoc,$nodate);
        $ne_records = $this->getAllNEOfSecurityGroupAndPerTelesale($list_telesale,$from,$to,$dot_nhap_hoc,$nodate);
        // Common::dd($lead_active_records);
        // Account per telesale , query lấy danh sách account theo đợt nhập học
       
        // Common::dd($account_records);
        // Lấy ra danh sách bảng ghi theo lead rồi count và ghép vào 1 object chứa các info cần show ra
        // $key = 0;
        $my_report=[];
    //    var_dump($call_records);die;
        $total_active_lead=0;
        $total_converted=0;
        $total_record = 0;
        $total_account=0;
        $total_ne=0;
        foreach ($list_telesale as $key=>$telesale){
            // echo '[-'.$key.'-]';
            // $key++;

            // $tele = (object)['telesale'=>$telesale->user_name];
            $list_record_of_user=array();
            // Common::dd($telesale);
            $report = (object)[];
            $report->user_name=$telesale->user_name;
            foreach ($lead_records as $key=>$record){
                if ($record->assigned_user_id == $telesale->user_id ){
           
                            array_push($list_record_of_user,$record);
                   
                } 
            }

            $list_lead_active_of_user=array();
            foreach ($lead_active_records as $key=>$record){
                if ($record->assigned_user_id == $telesale->user_id ){
                            array_push($list_lead_active_of_user,$record);
                } 
            }
            // if(count($list_lead_active_of_user)>0){
            //     Common::dd($list_lead_active_of_user);

            // }
            $list_acc_record_of_user=array();
            foreach($account_records as $key=>$record){
                if ($record->assigned_user_id == $telesale->user_id ){
           
                    array_push($list_acc_record_of_user,$record);
           
                }
            }

            $list_ne_record_of_user=array();
            foreach($ne_records as $key=>$record){
                if ($record->assigned_user_id == $telesale->user_id ){
                    array_push($list_ne_record_of_user,$record);
                }
            }
            // Common::dd($list_acc_record_of_user);
            // Nối chuỗi mỗi bản ghi có parent_id để query tại bảng call
            // if(count($list_record_of_user)>0){
            //     common::dd([$report->user_name,$list_record_of_user]);
            //     foreach($list_record_of_user as $record){
            
            //     }
            // }
            $report->data=[];
            // $from_date = date("d-m-Y", strtotime($from));  
  
            // $to_date = date("d-m-Y", strtotime($to)); 
            // Common::dd($list_record_of_user);
            // $calls= $this->getCalls($telesale->user_id,$from,$to);
            // if( count($list_record_of_user)==0){
            //     $report->empty = 1;
            //     // $this->dd($report);
            // }else{

                    $report->empty = 0;
                    $active_lead=0;
                    $converted=0;
                    $lead = 0;
                    $account=0;
                    $ne=0;
                    foreach($list_record_of_user as $record){  
                        $lead ++;
                        $total_record++;                  
                    }
                  
                    foreach($list_lead_active_of_user as $record){              
                        if($record->status == 'active_lead'){
                            $active_lead++;
                            $total_active_lead++;
                        }
                        if($record->converted == 1){
                            $converted++;
                            $total_converted++;
                        }
                    }
                    
                    foreach($list_acc_record_of_user as $record){
                        $total_account++;
                        $account++;
                       
                    }
                    foreach($list_ne_record_of_user as $record){
                        if($record->enrollment_status_c == 'enrolled'){
                           $total_ne++;
                           $ne++;
                        }
                    }
                     
                   
                 
                    // Common::dd($list_lead_str);     
                  
                    // if($call_held !=0){
                    //     $rate = floor($duration_held/$call_held);
            
                    // }else{
                    //     $rate = 0;
                    // }
        
                //    Common::dd($list_record_of_user);
                if($active_lead !=0){
                    $active_lead_rate= number_format($active_lead/$lead, 2, '.', '') * 100;
                }else{
                    $active_lead_rate = 0;
                }
                if($ne !=0){
                    $ne_rate= number_format($total_ne/$total_account, 2, '.', '') * 100;
                }else{
                    $ne_rate = 0;
                }
                
                if($converted !=0 && $active_lead !=0){
                    $converted_rate= number_format($account/$active_lead, 2, '.', '') * 100;
                }else{
                    $converted_rate = 0;
                }
                $report->data=[(object)['active_lead'=>$active_lead,'active_lead_rate'=>$active_lead_rate,'converted'=>$account,'converted_rate'=>$converted_rate,'ne_rate'=>$ne_rate,'ne'=>$ne,'lead'=>$lead]];
                    
 
                // Common::dd($report->data);
                if(count($report->data)== 0 ){
                    $report->empty = 1;
                }else{
                    $report->empty=0;
                }
            // }
        
            if( count($list_record_of_user)!=0){
                array_push($my_report, (object)['report'=>$report]);
            }
         
        }
        
        // Common::dd($my_report);
        $report = (object)[];
        $report->user_name='Tổng tất cả';
        if($total_active_lead !=0){
            $active_lead_rate= number_format($total_active_lead/$total_record, 2, '.', '') * 100;
        }else{
            $active_lead_rate = 0;
        }
        if($total_ne !=0){
            $ne_rate= number_format($total_ne/$total_account, 2, '.', '') * 100;
        }else{
            $ne_rate = 0;
        }
        if($total_converted !=0 && $total_active_lead !=0){
            $converted_rate= number_format($total_account/$total_active_lead, 2, '.', '') * 100;
        }else{
            $converted_rate = 0;
        }
        $report->data=[(object)['active_lead'=>$total_active_lead,'active_lead_rate'=>$active_lead_rate,'converted'=>$total_account,'converted_rate'=>$converted_rate,'ne'=>$total_ne,'ne_rate'=>$ne_rate,'lead'=>$total_record]];
        array_push($my_report, (object)['report'=>$report]);
        return $my_report;
    }

    function reportBuilderData($report_per_telesale=[],$from,$to){
  
  
        // Common::dd($report_per_telesale);
       return $report_per_telesale;
    }
}