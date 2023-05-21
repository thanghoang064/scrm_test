<?php
// include_once('modules/SecurityGroups/SecurityGroup.php');
class CommonNE  {
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
    function getListLeadForTelesale(){
        global $db, $current_user;
        // var_dump($currentUser);
        $user_id=$current_user->id;
        $sql= "SELECT COUNT(id) as count FROM leads a, leads_cstm b WHERE a.assigned_user_id='$user_id' AND a.id=b.id_c "; 
        $result = $db->query($sql,true,"Error");
        while($row = $result->fetch_assoc()) {
            $total = $row['count'];
        }
        var_dump($total);
        $limit = $_REQUEST['limit'];
        var_dump($limit);
        $page = $_REQUEST['page'];
        var_dump($page);
      
 

        $sql= "SELECT a.id,b.area_c,b.source_c,a.account_name,b.contacted_c,a.account_id,a.converted,b.ne_c,b.topic_c,b.dot_nhap_hoc_c,a.last_name,a.phone_mobile,b.rating_c,b.school_c,a.assigned_user_id,a.lead_source,a.status,b.call_log_c,b.number_of_calls_c,a.date_entered,a.date_modified,b.assessor_c,b.dup_c,a.created_by,a.deleted FROM leads a, leads_cstm b WHERE a.assigned_user_id='$user_id' AND a.id=b.id_c ORDER BY b.contacted_c ASC LIMIT ". ( ( $page ) * $limit ).", $limit"; 
        // var_dump($sql);
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) $row);
           
        }
        $result=[];
        $security_now = $this->getGroupUser();
        //Kiểm tra quyền cơ sở từng lead 1 và lead đó phải là lead chưa bị xóa, kiểm tra cơ sở ok sẽ trả dữ liệu cho người dùng

        foreach($data as $d){

            if($d->deleted==0){
                $security_lead = $this->getSecurityOfLead($d->id);
                $access_security=false;
                foreach($security_lead as $sec){
                    foreach($security_now as $sec_now){
                        if($sec->securitygroup_id  == $sec_now->securitygroup_id){
                            $access_security = true;
                        }
                    }
                }
            

                if($access_security){
                    $d->assigned_user_name=$this->getUserName($d->assigned_user_id)->user_name;
                    $d->created_by_name=$this->getUserName($d->created_by)->user_name;
                    if(($d->account_name==NULL && strlen($d->account_id >0)) || ($d->account_name=='' && strlen($d->account_id >0))){
                        $account_id=$d->account_id;
                        $db = DBManagerFactory::getInstance();
                    
                        $sql= "SELECT name FROM accounts WHERE id='$account_id'";
                  
                        $result2 = $db->query($sql,true,"Error");
                        $account_name = [];
                     
                        while($row = $result2->fetch_assoc()) {
                            array_push($account_name,(object) $row);
                        }
                        $d->account_name=$account_name[0]->name;
                        $d->leng=$result2->lengths;
                        // if($result2->lengths != NULL){
                        //     $d->account_name=$account_name[0]['name'];
                        // }
                    }
                  
                    global $app_list_strings;
                    // $d->dot_nhap_hoc_c_name = $app_list_strings;
          
                    foreach($app_list_strings['dotnhaphoc_list'] as $key=>$value){
                 
                        if($d->dot_nhap_hoc_c == $key){
                            $d->dot_nhap_hoc_c_name = $value;
                        }
                    }
                    foreach($app_list_strings['lead_source_dom'] as $key=>$value){
                        if($d->lead_source == $key){
                            $d->lead_source_name = $value;
                        }
                    }
                    foreach($app_list_strings['rating_list'] as $key=>$value){
                        if($d->rating_c == $key){
                            $d->rating_c_name = $value;
                        }
                    }
                    foreach($app_list_strings['lead_status_dom'] as $key=>$value){
                        if($d->status == $key){
                            $d->status_name = $value;
                        }
                    }
                    foreach($app_list_strings['source_list'] as $key=>$value){
                        if($d->source_c == $key){
                            $d->source_c_name = $value;
                        }
                    }
                    
                    array_push($result,$d);
                }
                
            }
        }
        //
       
        $data_result = new stdClass();
        $data_result->result=$result;
        $page_now= $page*$limit + count($result);
        $data_result->page_now=$page_now;
        $data_result->limit=$limit;
        $data_result->page=$page;
        $data_result->total=$total;
        $data_result->page_start=$page*$limit;
    
        $data_result->count=count($result);
        return $data_result;
    }
    function searchNumber($number){

        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        // Lấy tất cả lead đúng trường hợp
        // $sql= "SELECT a.id,b.area_c,b.source_c,a.account_name,a.account_id,a.converted,b.ne_c,b.topic_c,b.dot_nhap_hoc_c,a.last_name,a.phone_mobile,b.rating_c,b.school_c,a.assigned_user_id,a.lead_source,a.status,b.call_log_c,b.number_of_calls_c,a.date_entered,a.date_modified,b.assessor_c,b.dup_c,a.created_by,a.deleted FROM leads a, leads_cstm b WHERE  a.phone_home='$number' AND a.id=b.id_c OR a.phone_mobile ='$number' AND a.id=b.id_c OR a.phone_work ='$number' AND a.id=b.id_c OR a.phone_other ='$number' AND a.id=b.id_c";
        $sql = "SELECT id, account_name, account_id, converted, last_name, phone_mobile, assigned_user_id, lead_source, status, date_entered, date_modified, created_by, deleted FROM leads WHERE phone_home='$number' OR phone_mobile ='$number' OR phone_work ='$number' OR phone_other ='$number'";
        $result = $db->query($sql,true,"Error");

        $data = [];
        while($row = $result->fetch_assoc()) {
            $id_c = $row['id'];
            $sql_cstm = "SELECT area_c, source_c, ne_c, topic_c, dot_nhap_hoc_c, call_log_c, number_of_calls_c, rating_c, school_c, assessor_c, dup_c FROM leads_cstm WHERE id_c='$id_c'";
            $result_cstm = $db->query($sql_cstm,true,"Error");
            $row_cstm = $result_cstm->fetch_assoc();
            $row = array_merge($row, $row_cstm);
            array_push($data,(object) $row);
        }
        $result=[];
        $security_now = $this->getGroupUser();
        //Kiểm tra quyền cơ sở từng lead 1 và lead đó phải là lead chưa bị xóa, kiểm tra cơ sở ok sẽ trả dữ liệu cho người dùng

        foreach($data as $d){

            if($d->deleted==0){
                $security_lead = $this->getSecurityOfLead($d->id);
                $access_security=false;
                foreach($security_lead as $sec){
                    foreach($security_now as $sec_now){
                        if($sec->securitygroup_id  == $sec_now->securitygroup_id){
                            $access_security = true;
                        }
                    }
                }
            

                if($access_security){
                    $d->assigned_user_name=$this->getUserName($d->assigned_user_id)->user_name;
                    $d->created_by_name=$this->getUserName($d->created_by)->user_name;
                    if(($d->account_name==NULL && strlen($d->account_id >0)) || ($d->account_name=='' && strlen($d->account_id >0))){
                        $account_id=$d->account_id;
                        $db = DBManagerFactory::getInstance();
                    
                        $sql= "SELECT name FROM accounts WHERE id='$account_id'";
                  
                        $result2 = $db->query($sql,true,"Error");
                        $account_name = [];
                     
                        while($row = $result2->fetch_assoc()) {
                            array_push($account_name,(object) $row);
                        }
                        $d->account_name=$account_name[0]->name;
                        $d->leng=$result2->lengths;
                        // if($result2->lengths != NULL){
                        //     $d->account_name=$account_name[0]['name'];
                        // }
                    }
                  
                    global $app_list_strings;
                    // $d->dot_nhap_hoc_c_name = $app_list_strings;
          
                    foreach($app_list_strings['dotnhaphoc_list'] as $key=>$value){
                 
                        if($d->dot_nhap_hoc_c == $key){
                            $d->dot_nhap_hoc_c_name = $value;
                        }
                    }
                    foreach($app_list_strings['lead_source_dom'] as $key=>$value){
                        if($d->lead_source == $key){
                            $d->lead_source_name = $value;
                        }
                    }
                    foreach($app_list_strings['rating_list'] as $key=>$value){
                        if($d->rating_c == $key){
                            $d->rating_c_name = $value;
                        }
                    }
                    foreach($app_list_strings['lead_status_dom'] as $key=>$value){
                        if($d->status == $key){
                            $d->status_name = $value;
                        }
                    }
                    foreach($app_list_strings['source_list'] as $key=>$value){
                        if($d->source_c == $key){
                            $d->source_c_name = $value;
                        }
                    }
                    
                    array_push($result,$d);
                }
                
            }
        }
        //
       
        return $result;
    }
    function searchText($text){

        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        // Lấy tất cả lead đúng trường hợp
        $sql= "SELECT a.id,b.area_c,b.source_c,a.account_name,a.account_id,a.converted,b.ne_c,b.topic_c,b.dot_nhap_hoc_c,a.last_name,a.phone_mobile,b.rating_c,b.school_c,a.assigned_user_id,a.lead_source,a.status,b.call_log_c,b.number_of_calls_c,a.date_entered,a.date_modified,b.assessor_c,b.dup_c,a.created_by,a.deleted FROM leads a, leads_cstm b WHERE last_name LIKE '%$text%' AND a.id=b.id_c";
        
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) $row);
        }
        $result=[];
        $security_now = $this->getGroupUser();
        //Kiểm tra quyền cơ sở từng lead 1 và lead đó phải là lead chưa bị xóa, kiểm tra cơ sở ok sẽ trả dữ liệu cho người dùng

        foreach($data as $d){

            if($d->deleted==0){
                $security_lead = $this->getSecurityOfLead($d->id);
          
                $access_security=false;
                foreach($security_lead as $sec){
                    foreach($security_now as $sec_now){
                        if($sec->securitygroup_id  == $sec_now->securitygroup_id){
                            $access_security = true;
                        }
                    }
                }

                if($access_security){
                    $d->assigned_user_name=$this->getUserName($d->assigned_user_id)->user_name;
                    $d->created_by_name=$this->getUserName($d->created_by)->user_name;

                    if(($d->account_name==NULL && strlen($d->account_id >0)) || ($d->account_name=='' && strlen($d->account_id >0))){
                        $account_id=$d->account_id;
                        $db = DBManagerFactory::getInstance();
                    
                        $sql= "SELECT name FROM accounts WHERE id='$account_id'";
                  
                        $result2 = $db->query($sql,true,"Error");
                        $account_name = [];
                     
                        while($row = $result2->fetch_assoc()) {
                            array_push($account_name,(object) $row);
                        }
                        $d->account_name=$account_name[0]->name;
                        $d->leng=$result2->lengths;
                        // if($result2->lengths != NULL){
                        //     $d->account_name=$account_name[0]['name'];
                        // }
                    }
                    global $app_list_strings;
                    // $d->dot_nhap_hoc_c_name = $app_list_strings;
          
                    foreach($app_list_strings['dotnhaphoc_list'] as $key=>$value){
                 
                        if($d->dot_nhap_hoc_c == $key){
                            $d->dot_nhap_hoc_c_name = $value;
                        }
                    }
                    foreach($app_list_strings['lead_source_dom'] as $key=>$value){
                        if($d->lead_source == $key){
                            $d->lead_source_name = $value;
                        }
                    }
                    foreach($app_list_strings['rating_list'] as $key=>$value){
                        if($d->rating_c == $key){
                            $d->rating_c_name = $value;
                        }
                    }
                    foreach($app_list_strings['lead_status_dom'] as $key=>$value){
                        if($d->status == $key){
                            $d->status_name = $value;
                        }
                    }
                    foreach($app_list_strings['source_list'] as $key=>$value){
                        if($d->source_c == $key){
                            $d->source_c_name = $value;
                        }
                    }
                    
                    array_push($result,$d);
                }
                
            }
        }
        //
        return $result;
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
    function getNameSecurityGroup($id){
        $db = DBManagerFactory::getInstance();
        $sql = "SELECT * FROM securitygroups  WHERE deleted=0 AND id='$id'";
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
   
    function getUserName($user_id){
       
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT user_name FROM users   WHERE deleted=0 AND status!='Inactive' AND id = '$user_id'";
    
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["user_name"=>$row["user_name"]]);
        }
        // $this->dd($data);
        return $data[0];
    }
    function getSecurityOfLead($lead_id){
        $db = DBManagerFactory::getInstance();
        $sql = "SELECT securitygroup_id FROM securitygroups_records WHERE deleted=0 AND record_id = '$lead_id'";
    
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) $row);
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
   
}