<?php
include_once('modules/SecurityGroups/SecurityGroup.php');
class Voice  {
    //Lấy thông tin user hiện tại đang đăng nhập hệ thống
    //Output $user (object)
    function getCurrentUSer(){
        global $current_user;
        $user=$current_user;
        return $user;
    }
    function dd($var){
        echo '<pre>';
        var_dump($var);
        echo '</pre>';
        die;
    }
    //Lấy id các cơ sở mà user đang được join vào 
    // Input getCurrentUSer()
    // Output $data array [(object),(object)]  securitygroup_id, name
    function getGroupUser(){
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT a.securitygroup_id,b.name FROM securitygroups_users a, securitygroups b WHERE a.deleted=0 AND a.user_id='$currentUser' AND a.securitygroup_id = b.id";
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["securitygroup_id"=>$row['securitygroup_id'],"name"=>$row["name"]]);
        }
        // var_dump($data);
        // die;
        return $data;
    }
    function getAllSecurityGroup(){
        $db = DBManagerFactory::getInstance();
        $sql = "SELECT * FROM securitygroups  WHERE deleted=0";
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,$row);
        }
        return $data;
    }
    function getRoleUser(){
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT a.role_id,b.name FROM acl_roles_users a, acl_roles b WHERE a.deleted=0 AND b.deleted=0 AND a.user_id='$currentUser' AND a.role_id = b.id";
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["role_id"=>$row['role_id'],"name"=>$row["name"]]);
        }
        if($this->getCurrentUSer()->isAdmin()){
            array_push($data,(object) ["role_id"=>'-999',"name"=>'admin']);
        }
        return $data;
    }
    function getAllTelesaleInSecurityGroup($security_id){
        $telesale_role_id='b2b310ea-8def-b2e9-1f53-589d7be27fac';
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT a.user_id,b.user_name FROM securitygroups_users a, users b,acl_roles_users c  WHERE a.deleted=0 AND b.deleted=0 AND c.deleted=0 AND a.securitygroup_id='$security_id' AND a.user_id = b.id AND c.user_id = b.id AND c.role_id ='$telesale_role_id'";
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["user_id"=>$row['user_id'],"user_name"=>$row["user_name"]]);
        }
        // $this->dd($data);
        return $data;
    }
    function array_key_last( $array ) {
        $key = NULL;

        if ( is_array( $array ) ) {

            end( $array );
            $key = key( $array );
        }

        return $key;
    }
    function getAllCallOfSecurityGroupAndPerTelesale($list_telesale = []){
        $list_telesale_str= '';
      
        foreach ($list_telesale as $key=>$telesale) {
 
            if($key == $this->array_key_last($list_telesale)){
                $list_telesale_str.="'$telesale->user_id'";
            }
            else{
                $list_telesale_str.="'$telesale->user_id'".',';
            }
        }
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT call_date, created_by, duration_seconds, disposition, status,direction FROM asteriskintegration WHERE deleted=0 AND created_by IN ($list_telesale_str)";
     
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["call_date"=>$row['call_date'],"created_by"=>$row["created_by"],"duration_seconds"=>$row["duration_seconds"],"disposition"=>$row["disposition"],"status"=>$row["status"],"direction"=>$row["direction"]]);
        }
        // $this->dd($data);
        return $data;
    }
    function convertSecondToFullTimeText($seconds){
        $result = gmdate("H:i:s", $seconds);
      return $result;
    }
    function getReportCallPerTelesale($list_telesale = [],$from,$to){
              
      
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
              
                $call_held = 0;
                $report->data= [];
                foreach ($period as $dt) {
                    $date_str=$dt->format("Y-m-d");
                    $report->empty = 0;
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
                                $duration_held+=$record->duration_seconds;
                            }
                            if($record->disposition == 'Quan_Tam'){
                                $disposition_care ++; 
                                $disposition++;
                            }
                            if($record->disposition == 'Khong_Quan_Tam'){
                                $disposition_not_care ++; 
                                $disposition++;
                            }
                            
                            $duration += $record->duration_seconds;
                        }    
                    }
                    
                    if(count($date_arr)>0){
                        // array_push($report->data,(object)['date'=>$dt->format('d-m-Y'),'date_query'=>$date_str,'call_held'=>$call_held,'record'=>$date_arr]);
                        array_push($report->data,(object)['date'=>$dt->format('d-m-Y'),'date_query'=>$date_str,'call_held'=>$call_held,'total_call'=>$total_call,'duration_held'=> $this->convertSecondToFullTimeText($duration_held),'total_time_call'=> $this->convertSecondToFullTimeText($duration),'disposition_care'=>$disposition_care,'disposition_not_care'=>$disposition_not_care]);
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
        
        // $this->dd($my_report);
        return $my_report;
    }
    function reportBuilderData($report_per_telesale=[],$from,$to){
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
        // $this->dd($result);
       return $result;
    }
}