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
    function getAllTelesaleInSecurityGroup($security_id){
        $telesale_role_id='b2b310ea-8def-b2e9-1f53-589d7be27fac';
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT a.user_id,b.user_name FROM securitygroups_users a, users b,acl_roles_users c  WHERE a.deleted=0 AND b.deleted=0 AND c.deleted=0 AND b.status!='Inactive' AND a.securitygroup_id='$security_id' AND a.user_id = b.id AND c.user_id = b.id AND c.role_id ='$telesale_role_id'";
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["user_id"=>$row['user_id'],"user_name"=>$row["user_name"]]);
        }
        // $this->dd($data);
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
    function getAllSecurityGroupByAccountId($acc_id){
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT b.id,b.name FROM securitygroups_records a, securitygroups b  WHERE a.deleted=0 AND b.deleted=0 AND a.securitygroup_id=b.id AND a.record_id ='$acc_id' AND a.module='Accounts'";
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) ["id"=>$row['id'],"name"=>$row["name"]]);
        }
        // $this->dd($data);
        return $data;
    }
    function getInfoAccount($acc_id){
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT a.id,a.name,b.ethnicity_c,b.birthdate_c,b.gender_c,b.id_passport_c,b.date_issued_c,b.place_issued_c,b.study_time_c,b.school_c,b.graduated_c,b.year_graduated_c,b.major_c,b.campaign_c,b.email_c,b.address_c,b.parent1_name_c,b.postal_address_c,b.phone1_c,b.phone3_c,b.phone2_c,b.phone4_c,b.country_c,b.province_c,b.district_c,b.source_c,b.tshirt_size_c,b.program_c,b.converted_file_student_c FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.id=b.id_c AND a.id ='$acc_id'";
        $result = $db->query($sql,true,"Error");
        $data = [];
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) [
                "id"=>$row['id'],
                "name"=>$row["name"],
                "ethnicity_c"=>$row["ethnicity_c"],
                "birthdate_c"=>$row["birthdate_c"],
                "gender_c"=>$row["gender_c"],
                "id_passport_c"=>$row["id_passport_c"],
                "date_issued_c"=>$row["date_issued_c"],
                "place_issued_c"=>$row["place_issued_c"],
                "study_time_c"=>$row["study_time_c"],
                "school_c"=>$row["school_c"],
                "graduated_c"=>$row["graduated_c"],
                "year_graduated_c"=>$row["year_graduated_c"],
                "major_c"=>$row["major_c"],
                "campaign_c"=>$row["campaign_c"],
                "email_c"=>$row["email_c"],
                "address_c"=>$row["address_c"],
                "parent1_name_c"=>$row["parent1_name_c"],
                "postal_address_c"=>$row["postal_address_c"],
                "phone1_c"=>$row["phone1_c"],
                "phone3_c"=>$row["phone3_c"],
                "phone2_c"=>$row["phone2_c"],
                "phone4_c"=>$row["phone4_c"],
                "country_c"=>$row["country_c"],
                "province_c"=>$row["province_c"],
                "district_c"=>$row["district_c"],
                "source_c"=>$row["source_c"],
                "tshirt_size_c"=>$row["tshirt_size_c"],
                "program_c"=>$row["program_c"],
                "converted_file_student_c"=>$row["converted_file_student_c"],
                ]);
        }
            global $app_list_strings;
            // $this->dd($app_list_strings['major_list']);
            foreach($app_list_strings['major_list'] as $key=>$value){
                if($data[0]->major_c == $key){
                    $data[0]->major_name = $value;
                }
            }
            if($data[0]->graduated_c == 0){
                $data[0]->graduated_name = "Chưa tốt nghiệp";
            }else{
                $data[0]->graduated_name = "Đã tốt nghiệp";                
            }
            foreach($app_list_strings['country_list'] as $key=>$value){
                if($data[0]->country_c == $key){
                    $data[0]->country_name = $value;
                }
            }
            foreach($app_list_strings['lead_source_dom'] as $key=>$value){
                if($data[0]->source_c == $key){
                    $data[0]->source_name = $value;
                }
            }
            foreach($app_list_strings['program_list'] as $key=>$value){
                if($data[0]->program_c == $key){
                    $data[0]->program_name = $value;
                }
            }
            foreach($app_list_strings['province_list'] as $key=>$value){
                if($data[0]->province_c == $key){
                    $data[0]->province_name = $value;
                }
            }
            foreach($app_list_strings['campaign_list'] as $key=>$value){
                if($data[0]->campaign_c == $key){
                    $data[0]->campaign_name = $value;
                }
            }
            $array_name= explode(" ",$data[0]->name);
            $data[0]->first_name = $array_name [count($array_name) - 1];
            array_pop($array_name);
            $data[0]->last_name =implode(" ",$array_name);
            $data[0]->url=$_SERVER['HTTP_HOST'] . "/index.php?module=Accounts&action=DetailView&record=".$data[0]->id;
            $user = $this->getCurrentUSer();
            $data[0]->username=$user->user_name;
            $data[0]->email=$user->email1;
            $data[0]->user_url=$_SERVER['HTTP_HOST'] . "/index.php?module=Users&action=DetailView&record=".$user->id;
            $data[0]->record_id=$data[0]->id;
        return $data;
    }
    function getInfoAccount2($acc_id){
        $db = DBManagerFactory::getInstance();
        $currentUser = $this->getCurrentUSer()->id;
        $sql = "SELECT a.id,a.name,b.ethnicity_c,b.birthdate_c,b.gender_c,b.id_passport_c,b.date_issued_c,b.place_issued_c,b.study_time_c,b.school_c,b.graduated_c,b.year_graduated_c,b.major_c,b.campaign_c,b.email_c,b.address_c,b.parent1_name_c,b.postal_address_c,b.phone1_c,b.phone3_c,b.phone2_c,b.phone4_c,b.country_c,b.province_c,b.district_c,b.source_c,b.tshirt_size_c,b.program_c,b.converted_file_student_c,b.crm_brand_id_c,b.crm_campus_id_c,b.crm_district_id_c,b.crm_document_id_c,b.crm_people_id_c,b.crm_province_id_c,b.crm_race_code_c,b.crm_recruitment_id_c,b.crm_school_id_c,b.pro_name_c,a.assigned_user_id,b.dot_nhap_hoc_c,a.date_modified,a.date_entered FROM accounts a,accounts_cstm b  WHERE a.deleted=0 AND a.id=b.id_c AND a.id ='$acc_id'";
        $result = $db->query($sql,true,"Error");
        $data = [];
   
        while($row = $result->fetch_assoc()) {
            array_push($data,(object) [
                "id"=>$row['id'],
                "name"=>$row["name"],
                "ethnicity_c"=>$row["ethnicity_c"],
                "birthdate_c"=>$row["birthdate_c"],
                "gender_c"=>$row["gender_c"],
                "id_passport_c"=>$row["id_passport_c"],
                "date_issued_c"=>$row["date_issued_c"],
                "place_issued_c"=>$row["place_issued_c"],
                "study_time_c"=>$row["study_time_c"],
                "school_c"=>$row["school_c"],
                "graduated_c"=>$row["graduated_c"],
                "year_graduated_c"=>$row["year_graduated_c"],
                "major_c"=>$row["major_c"],
                "campaign_c"=>$row["campaign_c"],
                "email_c"=>$row["email_c"],
                "address_c"=>$row["address_c"],
                "parent1_name_c"=>$row["parent1_name_c"],
                "postal_address_c"=>$row["postal_address_c"],
                "phone1_c"=>$row["phone1_c"],
                "phone3_c"=>$row["phone3_c"],
                "phone2_c"=>$row["phone2_c"],
                "phone4_c"=>$row["phone4_c"],
                "country_c"=>$row["country_c"],
                "province_c"=>$row["province_c"],
                "district_c"=>$row["district_c"],
                "source_c"=>$row["source_c"],
                "tshirt_size_c"=>$row["tshirt_size_c"],
                "program_c"=>$row["program_c"],
                "converted_file_student_c"=>$row["converted_file_student_c"],
                "crm_brand_id_c"=>$row["crm_brand_id_c"],
                "crm_campus_id_c"=>$row["crm_campus_id_c"],
                "crm_district_id_c"=>$row["crm_district_id_c"],
                "crm_document_id_c"=>$row["crm_document_id_c"],
                "crm_people_id_c"=>$row["crm_people_id_c"],
                "crm_province_id_c"=>$row["crm_province_id_c"],
                "crm_race_code_c"=>$row["crm_race_code_c"],
                "crm_recruitment_id_c"=>$row["crm_recruitment_id_c"],
                "crm_school_id_c"=>$row["crm_school_id_c"],
                "pro_name_c"=>$row["pro_name_c"],
                "assigned_user_id"=>$row["assigned_user_id"],
                "dot_nhap_hoc_c"=>$row["dot_nhap_hoc_c"],
                "date_modified"=>$row["date_modified"],
                "date_entered"=>$row["date_entered"]

                ]);
        }
      
            global $app_list_strings;
            // $this->dd($app_list_strings['major_list']);
            foreach($app_list_strings['major_list'] as $key=>$value){
                if($data[0]->major_c == $key){
                    $data[0]->major_name = $value;
                }
            }
            if($data[0]->graduated_c == 0){
                $data[0]->graduated_name = "Chưa tốt nghiệp";
            }else{
                $data[0]->graduated_name = "Đã tốt nghiệp";                
            }
            if($data[0]->birthdate_c){
                $date = date_create($data[0]->birthdate_c);
                $data[0]->birthdate_c = date_format($date, 'd-m-Y');
            }
            if($data[0]->date_issued_c){
                $date = date_create($data[0]->date_issued_c);
                $data[0]->date_issued_c = date_format($date, 'd-m-Y');
            }
            if($data[0]->birthdate_c){
                $date = date_create($data[0]->date_modified);
                $data[0]->date_modified = date_format($date, 'd-m-Y H:i:s');
            }
            $data[0]->telesale=$this->getUserName($data[0]->assigned_user_id);

            $data[0]->telesale=$data[0]->telesale->user_name;
        
    
            switch($data[0]->gender_c){
                case 'female':
                $data[0]->gender_c='Nam';
                break;
                case 'male':
                $data[0]->gender_c='Nữ';
                break;

                default:
                $data[0]->gender_c='Không có';
            }

            switch($data[0]->study_time_c){
                case 'day':
                $data[0]->study_time_c='Ban ngày';
                break;
                case 'evening':
                $data[0]->study_time_c='Ban đêm';
                break;

                default:
                $data[0]->study_time_c='Không có';
            }
            
            
            foreach($app_list_strings['country_list'] as $key=>$value){
                if($data[0]->country_c == $key){
                    $data[0]->country_name = $value;
                }
            }
            foreach($app_list_strings['dotnhaphoc_list'] as $key=>$value){
                if($data[0]->dot_nhap_hoc_c == $key){
                    $data[0]->dot_nhap_hoc_name = $value;
                }
            }
        
            foreach($app_list_strings['lead_source_dom'] as $key=>$value){
                if($data[0]->source_c == $key){
                    $data[0]->source_name = $value;
                }
            }
            foreach($app_list_strings['program_list'] as $key=>$value){
                if($data[0]->program_c == $key){
                    $data[0]->program_name = $value;
                }
            }
            foreach($app_list_strings['province_list'] as $key=>$value){
                if($data[0]->province_c == $key){
                    $data[0]->province_name = $value;
                }
            }
            foreach($app_list_strings['campaign_list'] as $key=>$value){
                if($data[0]->campaign_c == $key){
                    $data[0]->campaign_name = $value;
                }
            }
            $array_name= explode(" ",$data[0]->name);
            $data[0]->first_name = $array_name [count($array_name) - 1];
            array_pop($array_name);
            $data[0]->last_name =implode(" ",$array_name);
            $data[0]->url=$_SERVER['HTTP_HOST'] . "/index.php?module=Accounts&action=DetailView&record=".$data[0]->id;
            $user = $this->getCurrentUSer();
            $data[0]->username=$user->user_name;
            $data[0]->email=$user->email1;
            $data[0]->user_url=$_SERVER['HTTP_HOST'] . "/index.php?module=Users&action=DetailView&record=".$user->id;
            $data[0]->record_id=$data[0]->id;
        // var_dump($data);
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