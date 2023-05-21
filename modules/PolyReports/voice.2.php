<?php
//include_once('modules/PolyReports/common.php');
class Voice  {

    function getAllCallOfSecurityGroupAndPerTelesale($list_telesale = [],$from,$to){
        $list_telesale_str= '';
      
        foreach ($list_telesale as $key=>$telesale) {
 
            if($key == Common::array_key_last($list_telesale)){
                $list_telesale_str.="'$telesale->user_id'";
            }
            else{
                $list_telesale_str.="'$telesale->user_id'".',';
            }
        }
        $db = DBManagerFactory::getInstance();
        // $currentUser =  Common::getCurrentUSer()->id;
        $begin = new DateTime($from);
        $begin=$begin->format('Y-m-d H:i:s');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $end=$end->format('Y-m-d H:i:s');

        $sql = "SELECT call_date, created_by, duration_seconds,duration_minutes,duration_hours, disposition, status,direction FROM asteriskintegration WHERE deleted=0 AND date_entered>='$begin' AND date_entered<'$end' AND created_by IN ($list_telesale_str)";
     
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["call_date"=>$row['call_date'],"created_by"=>$row["created_by"],"duration_seconds"=>$row["duration_seconds"],"duration_minutes"=>$row["duration_minutes"],"duration_hours"=>$row["duration_hours"],"disposition"=>$row["disposition"],"status"=>$row["status"],"direction"=>$row["direction"]]);
        }
        // $this->dd($data);
        return $data;
    }
    function convertSecondToFullTimeText($seconds){
        $result = gmdate("H:i:s", $seconds);
      return $result;
    }
    function getReportCallPerTelesaleByDate($list_telesale = [],$from,$to){
              
      
        $call_records = $this->getAllCallOfSecurityGroupAndPerTelesale($list_telesale);
        // Lấy ra danh sách bảng ghi theo lead rồi count và ghép vào 1 object chứa các info cần show ra
        // $key = 0;
        $my_report=[];
        foreach ($list_telesale as $key=>$telesale){
            // echo '[-'.$key.'-]';
            // $key++;

            $tele = (object)['telesale'=>$telesale->user_name];
            $list_record_of_user=array();
            $report = (object)[];
            $report->user_name=$telesale->user_name;
            foreach ($call_records as $key=>$record){
                if ($record->created_by == $telesale->user_id && isset($record)){
                        if($record){
                            array_push($list_record_of_user,$record);
                        }
                } 
            }
            
            // $from_date = date("d-m-Y", strtotime($from));  
  
            // $to_date = date("d-m-Y", strtotime($to)); 
       
            if( count($list_record_of_user)==0){
                $report->empty = 1;
                // $this->dd($report);
            }else{
                $begin = new DateTime($from);
                $interval = DateInterval::createFromDateString('1 day');
                $end = new DateTime($to);
                $end->modify('+1 day');
                $period = new DatePeriod($begin, $interval,$end);

                $report->empty = 0;
              
            
                $report->data= [];
                foreach ($period as $dt) {
                    $date_str=$dt->format("Y-m-d");
                    $report->empty = 0;
                    $call_held = 0;
                    $total_call=0;
                    $duration = 0;
                    $duration_held = 0;
                    $disposition_care= 0;
                    $disposition_not_care = 0;
                    $disposition = 0;
                    $date_arr=[];
                    foreach($list_record_of_user as $record){
              
                        if($record->call_date == $date_str){
                            array_push($date_arr,$record);
                            $total_call++;
                            if($record->status == 'Held'){
                                $call_held++;
                                $duration_held+=($record->duration_seconds+$record->duration_minutes*60+$record->duration_hours*3600);
                            }
                            if($record->disposition == 'Quan_Tam'){
                                $disposition_care ++; 
                                $disposition++;
                            }
                            if($record->disposition == 'Khong_Quan_Tam'){
                                $disposition_not_care ++; 
                                $disposition++;
                            }
                            
                            $duration += ($record->duration_seconds+$record->duration_minutes*60+$record->duration_hours*3600);
                        }    
                    }
                    $not_held=$total_call-$call_held;
                    if(count($date_arr)>0){
                        // array_push($report->data,(object)['date'=>$dt->format('d-m-Y'),'date_query'=>$date_str,'call_held'=>$call_held,'record'=>$date_arr]);
                        array_push($report->data,(object)['date'=>$dt->format('d-m-Y'),'date_query'=>$date_str,'call_held'=>$call_held,'not_held'=>$not_held,'total_call'=>$total_call,'duration_held'=> $this->convertSecondToFullTimeText($duration_held),'total_time_call'=> $this->convertSecondToFullTimeText($duration),'disposition_care'=>$disposition_care,'disposition_not_care'=>$disposition_not_care]);
                        // $this->dd($report->total_call);
                    }
                   
                } 
 
                // $this->dd($report->data);
                if(count($report->data)== 0 ){
                    $report->empty = 0;
                }
                
            }
        
 
            array_push($my_report, (object)['report'=>$report]);
         
        }
        
        // Common::dd($my_report);
        return $my_report;
    }
    function getReportCallPerTelesale($list_telesale = [],$from,$to){
              
      
        $call_records = $this->getAllCallOfSecurityGroupAndPerTelesale($list_telesale,$from,$to);
        // Lấy ra danh sách bảng ghi theo lead rồi count và ghép vào 1 object chứa các info cần show ra
        // $key = 0;
        $my_report=[];
        foreach ($list_telesale as $key=>$telesale){
            // echo '[-'.$key.'-]';
            // $key++;

            // $tele = (object)['telesale'=>$telesale->user_name];
            $list_record_of_user=array();
            $report = (object)[];
            $report->user_name=$telesale->user_name;
            foreach ($call_records as $key=>$record){
                if ($record->created_by == $telesale->user_id && isset($record)){
                        if($record){
                            array_push($list_record_of_user,$record);
                        }
                } 
            }
            $report->data=[];
            // $from_date = date("d-m-Y", strtotime($from));  
  
            // $to_date = date("d-m-Y", strtotime($to)); 
       
            if( count($list_record_of_user)==0){
                $report->empty = 1;
                // $this->dd($report);
            }else{
          
                    $report->empty = 0;
                    $call_held = 0;
                    $total_call=0;
                    $duration = 0;
                    $duration_held = 0;
                    $disposition_care= 0;
                    $disposition_not_care = 0;
                    $dispostion_no_signal=0;
                    $dispostion_call_back=0;
                    $disposition = 0;
                    foreach($list_record_of_user as $record){                    
                            $total_call++;
                            if($record->status == 'Held'){
                                $call_held++;
                                $duration_held+=($record->duration_seconds+$record->duration_minutes*60+$record->duration_hours*3600);
                            }
                            if($record->disposition == 'Quan_Tam'){
                                $disposition_care ++; 
                                $disposition++;
                            }
                            if($record->disposition == 'Khong_Quan_Tam'){
                                $disposition_not_care ++; 
                                $disposition++;
                            }
                            if($record->disposition == 'Khong_lien_lac_duoc'){
                                $dispostion_no_signal ++; 
                                $disposition++;
                            }
                            if($record->disposition == 'Goi_Lai_Sau'){
                                $dispostion_call_back ++; 
                                $disposition++;
                            }
                            $duration += ($record->duration_seconds+$record->duration_minutes*60+$record->duration_hours*3600);
                       
                    }
                    if($duration != 0 && $call_held !=0){
                        $rate = floor($duration_held/$call_held);
                    }else{
                        $rate = 0;
                    }
        
                //    Common::dd($list_record_of_user);
                $report->data=[(object)['call_held'=>$call_held,'total_call'=>$total_call,'not_held'=>$total_call-$call_held,'duration_held'=> $this->convertSecondToFullTimeText($duration_held),'rate'=> $this->convertSecondToFullTimeText($rate),'total_time_call'=> $this->convertSecondToFullTimeText($duration),'disposition_care'=>$disposition_care,'disposition_not_care'=>$disposition_not_care,'disposition_no_signal'=>$dispostion_no_signal,'disposition_call_back'=>$dispostion_call_back]];
            
 
                // $this->dd($report->data);
                if(count($report->data)== 0 ){
                    $report->empty = 0;
                }
                
            }
        
 
            array_push($my_report, (object)['report'=>$report]);
         
        }
        
        // Common::dd($my_report);
        return $my_report;
    }
    function reportBuilderDataByDate($report_per_telesale=[],$from,$to){
        $begin = new DateTime($from);
        $interval = DateInterval::createFromDateString('1 day');
        $end = new DateTime($to);
        $end->modify('+1 day');
        $period = new DatePeriod($begin, $interval,$end);
        $result= [];
        foreach ($period as $dt) {
            $date_str = $dt->format("d-m-Y");
            foreach($report_per_telesale as $report){
                if($report->report->empty != 1){
                    foreach ($report->report->data as $report_date){
                        if($report_date->date == $date_str){
                            // $this->dd($report);
                            array_push($result, (object)['user_name'=>$report->report->user_name,'report'=>$report_date]);
                        }
                    }
                }
            }
        }
        // Common::dd($result);
       return $result;
    }
    function reportBuilderData($report_per_telesale=[],$from,$to){
  
  
        // Common::dd($report_per_telesale);
       return $report_per_telesale;
    }
}