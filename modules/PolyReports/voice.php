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

        $sql = "SELECT call_date, created_by, duration_seconds,duration_minutes,duration_hours,status,parent_id FROM asteriskintegration WHERE deleted=0 AND date_entered>='$begin' AND date_entered<'$end' AND created_by IN ($list_telesale_str)";
     
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["call_date"=>$row['call_date'],"created_by"=>$row["created_by"],"duration_seconds"=>$row["duration_seconds"],"duration_minutes"=>$row["duration_minutes"],"duration_hours"=>$row["duration_hours"],"status"=>$row["status"],"parent_id"=>$row["parent_id"]]);
        }

        // Common::dd($data);
  
     
        return $data;
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
        $sql = "SELECT b.call_type_c, a.status FROM calls a,calls_cstm b WHERE a.deleted=0 AND a.id=b.id_c AND a.date_entered>='$begin' AND a.date_entered<'$end' AND a.created_by ='$list_lead' AND a.modified_user_id ='$list_lead'";
        // Common::dd($sql);
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["call_type_c"=>$row['call_type_c'], "status"=> $row["status"]]);
        }
        // Common::dd($data);
        return $data;
    }
    function getReportCallPerTelesale($list_telesale = [],$from,$to){
              
      
        $call_records = $this->getAllCallOfSecurityGroupAndPerTelesale($list_telesale,$from,$to);
        // Lấy ra danh sách bảng ghi theo lead rồi count và ghép vào 1 object chứa các info cần show ra
        // $key = 0;
        $my_report=[];
    //    var_dump($call_records);die;
        $total_held=0;
        $total_voice=0;
        $total_duration=0;
        $total_try_contact=0;
        $total_active_lead=0;
        $total_recall=0;
        $total_not_interested=0;
        $total_calls=0;
        $total_sms =0;
        $total_rate=0;
        foreach ($list_telesale as $key=>$telesale){
            // echo '[-'.$key.'-]';
            // $key++;

            // $tele = (object)['telesale'=>$telesale->user_name];
            $list_record_of_user=array();
            // Common::dd($telesale);
            $report = (object)[];
            $report->user_name=$telesale->user_name;
            foreach ($call_records as $key=>$record){
                if ($record->created_by == $telesale->user_id ){
           
                            array_push($list_record_of_user,$record);
                   
                } 
            }
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
            $calls= $this->getCalls($telesale->user_id,$from,$to);

            if( count($list_record_of_user)==0 && count($calls)==0){
                $report->empty = 1;
                // $this->dd($report);
            }else{
          
                    $report->empty = 0;
                    $call_held = 0;
                    $total_call=0;
                    $duration = 0;
                    $duration_held = 0;
                    //Chưa liên hệ thành công
                    $try_to_contact=0;
                    //Active Lead
                    $active_lead=0;
                    //Gọi chăm sóc lại
                    $recall=0;
                    //Không cần gọi lại
                    $not_interested=0;
                    //Không cần gọi lại
                    $record_calls=0;
                    //Tổng số sms
                    $sms_total=0;

                    //List string lead để query
                    $list_lead_str=""; 
                    $time_current = 0;
                    $time_held = 0;
        
                    foreach($list_record_of_user as $record){                    
                            $total_call++;
                            $total_voice++;
                            if($record->status == 'Held'){
                                $call_held++;
                                $total_held++;
                                $duration_held+=($record->duration_seconds+$record->duration_minutes*60+$record->duration_hours*3600);
                                $total_duration+=($record->duration_seconds+$record->duration_minutes*60+$record->duration_hours*3600);
                            }
                            // $duration += ($record->duration_seconds+$record->duration_minutes*60+$record->duration_hours*3600);
                          
                    }

                   
                     
                        foreach($calls as $call){
                            $record_calls++;
                            $total_calls++;
                            switch($call->call_type_c){
                                case "try_to_contact":
                                    $try_to_contact++;
                                    $total_try_contact++;
                                break;
                                case "active_lead":
                                    $active_lead++;
                                    $total_active_lead++;
                                break;  
                                case "recall":
                                    $recall++;
                                    $total_recall++;
                                break;
                                case "not_interested":
                                    $not_interested++;
                                    $total_not_interested++;
                                break;

                                default:
                                    ;
                            }

                            if($call->status == "Sent"){
                                $sms_total++;
                                $total_sms++;
                            }
                        }
                 
                    // Common::dd($list_lead_str);     
                  
                    if($call_held !=0){
                        $rate = floor($duration_held/$call_held);
            
                    }else{
                        $rate = 0;
                    }
        
                //    Common::dd($list_record_of_user);
                $report->data=[(object)['call_held'=>$call_held,'total_call'=>$total_call,'record_calls'=>$record_calls,'sms_total'=> $sms_total,'not_held'=>$total_call-$call_held,'duration_held'=> $this->convertSecondToFullTimeText($duration_held),'rate'=> $this->convertSecondToFullTimeText($rate),'try_to_contact'=>$try_to_contact,'active_lead'=>$active_lead,'recall'=>$recall,'not_interested'=>$not_interested]];
            
 
                // $this->dd($report->data);
                if(count($report->data)== 0 ){
                    $report->empty = 0;
                }
                
            }
            
        
 
            array_push($my_report, (object)['report'=>$report]);
         
        }
        $report = (object)[];
        $report->user_name='Tổng tất cả';
            if($total_held !=0){
                $total_rate = floor($total_duration/$total_held);
    
            }else{
                $total_rate = 0;
            }
   
        $report->data=[(object)['call_held'=>$total_held,'total_call'=>$total_voice,'record_calls'=>$total_calls,'sms_total'=> $total_sms,'not_held'=>$total_voice-$total_held,'duration_held'=> $this->convertSecondToFullTimeText($total_duration),'rate'=> $this->convertSecondToFullTimeText($total_rate),'try_to_contact'=>$total_try_contact,'active_lead'=>$total_active_lead,'recall'=>$total_recall,'not_interested'=>$total_not_interested]];
        array_push($my_report, (object)['report'=>$report]);
        
        // Common::dd($my_report);
        return $my_report;
    }

    function reportBuilderData($report_per_telesale=[],$from,$to){
  
  
        // Common::dd($report_per_telesale);
       return $report_per_telesale;
    }
}
