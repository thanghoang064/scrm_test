<?php
include_once 'custom/modules/Accounts/common.php';


class CustomAccountsController extends SugarController {

    function action_convertne() {
    	$this->view = 'convertne';
    }
    function action_convertedne() {
    	$this->view = 'convertedne';
    }
    function action_convertedneagain() {
    	$this->view = 'convertedneagain';
    }
    function action_fixne() {
    	$this->view = 'fixne';
    }
    function action_editcrm() {
    	$this->view = 'editcrm';
    }
    function action_peoplelist() {
    	$this->view = 'peoplelist';
    }
    function action_fixaccount() {
    	$this->view = 'fixaccount';
    }
    
    function action_attach_people_id() {
        $people_id = isset($_REQUEST['people_id'])?$_REQUEST['people_id']:'';
        $id_rc = isset($_REQUEST['id_rc'])?$_REQUEST['id_rc']:'';
        $crm_convert_ne_c = isset($_REQUEST['crm_convert_ne_c'])?$_REQUEST['crm_convert_ne_c']:'';
        $accounts=[];
        if($people_id != '' && $id_rc !=''){
            $db = DBManagerFactory::getInstance();        
            // $sql = "SELECT * FROM accounts_cstm WHERE id_c='$id_rc'";
            
            $sql = "UPDATE accounts_cstm SET crm_people_id_c='$people_id',converted_file_student_c='1',crm_convert_ne_c='$crm_convert_ne_c' WHERE id_c='$id_rc'";
            
            $result = $db->query($sql,true,"Error");
            // while($row = $result->fetch_assoc()) {
            //     array_push($accounts,(object) $row);
            // }  
         
            $json_response->data=(object)[
                "type"=>"success",
                "data"=>$accounts,
                "message"=>'Gắn hồ sơ thành công'
            ];
    
    
            echo json_encode($json_response);
            
          
        }
        die;
    }
    function action_removecrm() {
        $acc_id = isset($_REQUEST['people_id'])?$_REQUEST['people_id']:'';
        $accounts=[];
        if($acc_id != ''){
            $db = DBManagerFactory::getInstance();        
            // $sql = "SELECT * FROM accounts_cstm WHERE crm_people_id_c='$acc_id'";
            $sql = "UPDATE accounts_cstm SET crm_people_id_c='',converted_file_student_c='0' WHERE crm_people_id_c='$acc_id'";
       
            $result = $db->query($sql,true,"Error");
            // while($row = $result->fetch_assoc()) {
            //     array_push($accounts,$row);
            // }  
            $json_response->data=(object)[
                "type"=>"success",
                "data"=>$accounts
            ];
    
    
            echo json_encode($json_response);
            
          
        }
        die;
    }
    function action_convertagain() {
        $common = new CommonNE;
        function validate($data){
            $err= (object)[];
            $err->data=[];
            // var_dump($data);
            foreach($data as $field){
                // var_dump('--------');
                // var_dump('--------');
                if($field['value'] == '' || $field['value']==NULL){
                    array_push($err->data,(object)[
                        'name'=>$field['name'],
                        'value'=>$field['value']
                    ]);
                }
            }
            if(count($err->data)>0){
                $err->validate=false;
            }else{
                $err->validate=true;
            }
            return $err;
        }
        $roles= $common->getRoleUser();
			$access_role = false;
			foreach ($roles as $role){
				if($role->name == 'admin' || $role->name == 'Leader' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'){
				// Bảo trì
				// if($role->name == 'admin'){
					$access_role = true;
				}
			}
	   
			// Nếu không có quyền truy cập (role) thì hiển thị thông báo
			if(!$access_role ){
                $json_response->data=(object)[
                    "name"=>"Bạn không có quyền sử dụng chức năng này!"
                ];
                $json_response->status=false;
                $json_response->description="Bạn không có quyền sử dụng chức năng này";
				// echo "Đang bảo trì chức năng";  
		    }else{
                $json_response->description="Bạn có quyền sử dụng chức năng này";
            }
            $acc_id = isset($_REQUEST['id'])?$_REQUEST['id']:'';
            if($acc_id!=''){
                $data=$common->getInfoAccount($acc_id);
                $data=$data[0];
                $err = validate([
                    [
                        'name'=>'Tên',
                        'value'=>$data->first_name
                    ],
                    [
                        'name'=>'Họ và tên đệm',
                        'value'=>$data->last_name
                    ],
                    [
                        'name'=>'Chứng minh nhân dân',
                        'value'=>$data->id_passport_c
                    ],
                    [
                        'name'=>'Ngày cấp',
                        'value'=>$data->date_issued_c
                    ],
                    [
                        'name'=>'Nơi cấp',
                        'value'=>$data->place_issued_c
                    ],
                    [
                        'name'=>'Ngày sinh',
                        'value'=>$data->birthdate_c
                    ],
                    [
                        'name'=>'Giới tính',
                        'value'=>$data->gender_c
                    ],
                    [
                        'name'=>'Số điện thoại sinh viên (chính)',
                        'value'=>$data->phone1_c
                    ],
                    [
                        'name'=>'Số điện thoại phụ huynh (chính)',
                        'value'=>$data->phone2_c
                    ],
                    [
                        'name'=>'Năm tốt nghiệp',
                        'value'=>$data->year_graduated_c
                    ],
                    [
                        'name'=>'Đã tốt nghiệp',
                        'value'=>$data->graduated_c
                    ],
                    [
                        'name'=>'Địa chỉ',
                        'value'=>$data->address_c
                    ],
                    
                
                    
                ]);

                if($err->validate){
                    $json_response->status=true;
                    
                }else{
                    $json_response->status=false;
                    $json_response->description="Vui lòng điền chính xác kiểu dữ liệu bắt buộc";
                    $json_response->data=$err->data;
                }

            }else{
                $json_response->status=false;
                $json_response->description="Account không tồn tại";

            }
        echo json_encode($json_response);
        die;
    	// $this->view = 'convertedneapi';
    }
    function action_convertedneapi() {
        $common = new CommonNE;
        function validate($data){
            $err= (object)[];
            $err->data=[];
            // var_dump($data);
            foreach($data as $field){
                // var_dump('--------');
                // var_dump('--------');
                if($field['value'] == '' || $field['value']==NULL){
                    array_push($err->data,(object)[
                        'name'=>$field['name'],
                        'value'=>$field['value']
                    ]);
                }
            }
            if(count($err->data)>0){
                $err->validate=false;
            }else{
                $err->validate=true;
            }
            return $err;
        }
        $roles= $common->getRoleUser();
			$access_role = false;
			foreach ($roles as $role){
				if($role->name == 'admin' || $role->name == 'Leader' || $role->name == 'Assessor' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'|| $role->role_id == '7bf90ea1-2c00-10c3-9a0e-58abca3491d0'){
				// Bảo trì
				// if($role->name == 'admin'){
					$access_role = true;
				}
			}
	   
			// Nếu không có quyền truy cập (role) thì hiển thị thông báo
			if(!$access_role ){
                $json_response->data=(object)[
                    "name"=>"Bạn không có quyền sử dụng chức năng này!"
                ];
                $json_response->status=false;
                $json_response->description="Bạn không có quyền sử dụng chức năng này";
				// echo "Đang bảo trì chức năng";  
		    }else{
                $json_response->description="Bạn có quyền sử dụng chức năng này";
            }
            $acc_id = isset($_REQUEST['id'])?$_REQUEST['id']:'';
            if($acc_id!=''){
                $data=$common->getInfoAccount($acc_id);
                $data=$data[0];
                $err = validate([
                    [
                        'name'=>'Tên',
                        'value'=>$data->first_name
                    ],
                    [
                        'name'=>'Họ và tên đệm',
                        'value'=>$data->last_name
                    ],
                    [
                        'name'=>'Chứng minh nhân dân',
                        'value'=>$data->id_passport_c
                    ],
                    [
                        'name'=>'Ngày cấp',
                        'value'=>$data->date_issued_c
                    ],
                    [
                        'name'=>'Nơi cấp',
                        'value'=>$data->place_issued_c
                    ],
                    [
                        'name'=>'Ngày sinh',
                        'value'=>$data->birthdate_c
                    ],
                    [
                        'name'=>'Giới tính',
                        'value'=>$data->gender_c
                    ],
                    [
                        'name'=>'Số điện thoại sinh viên (chính)',
                        'value'=>$data->phone1_c
                    ],
                    [
                        'name'=>'Số điện thoại phụ huynh (chính)',
                        'value'=>$data->phone2_c
                    ],
                    [
                        'name'=>'Năm tốt nghiệp',
                        'value'=>$data->year_graduated_c
                    ],
                    [
                        'name'=>'Đã tốt nghiệp',
                        'value'=>$data->graduated_c
                    ],
                    [
                        'name'=>'Địa chỉ',
                        'value'=>$data->address_c
                    ],
                    
                
                    
                ]);

                if($err->validate){
                    $json_response->status=true;
                    
                }else{
                    $json_response->status=false;
                    $json_response->description="Vui lòng điền chính xác kiểu dữ liệu bắt buộc";
                    $json_response->data=$err->data;
                }

            }else{
                $json_response->status=false;
                $json_response->description="Account không tồn tại";

            }
        echo json_encode($json_response);
        die;
    	// $this->view = 'convertedneapi';
    }
    function action_savecrminfo() {
        $common = new CommonNE;
        function validate($data){
            $err= (object)[];
            $err->data=[];
            // var_dump($data);
            foreach($data as $field){
                // var_dump('--------');
                // var_dump('--------');
                if($field['value'] == '' || $field['value']==NULL){
                    array_push($err->data,(object)[
                        'name'=>$field['name'],
                        'value'=>$field['value']
                    ]);
                }
            }
            if(count($err->data)>0){
                $err->validate=false;
            }else{
                $err->validate=true;
            }
            return $err;
        }

        $roles= $common->getRoleUser();
      
        $access_role = false;
        foreach ($roles as $role){
            if($role->name == 'admin' || $role->name == 'Leader' || $role->name == 'Assessor' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'|| $role->role_id == '7bf90ea1-2c00-10c3-9a0e-58abca3491d0'){
            // Bảo trì
            // if($role->name == 'admin'){
                $access_role = true;
            }
        }
   
        // Nếu không có quyền truy cập (role) thì hiển thị thông báo
        if(!$access_role ){
            $json_response->data=(object)[
                "name"=>"Bạn không có quyền sử dụng chức năng này!"
            ];
            $json_response->status=false;
            $json_response->description="Bạn không có quyền sử dụng chức năng này";
            // echo "Đang bảo trì chức năng";  
        }else{
            $json_response->description="Bạn có quyền sử dụng chức năng này";
        }
       
        $acc_id = isset($_REQUEST['id'])?$_REQUEST['id']:'';
        $brand_id = isset($_REQUEST['brand_id'])?$_REQUEST['brand_id']:'';
        $campus_id = isset($_REQUEST['campus_id'])?$_REQUEST['campus_id']:'';
        $district_id = isset($_REQUEST['district_id'])?$_REQUEST['district_id']:'';
        $document_id = isset($_REQUEST['document_id'])?$_REQUEST['document_id']:'';
        $people_id = isset($_REQUEST['people_id'])?$_REQUEST['people_id']:'';
        $province_id = isset($_REQUEST['province_id'])?$_REQUEST['province_id']:'';
        $race_code = isset($_REQUEST['race_code'])?$_REQUEST['race_code']:'';
        $recruitment_id = isset($_REQUEST['recruitment_id'])?$_REQUEST['recruitment_id']:'';
        $school_id = isset($_REQUEST['school_id'])?$_REQUEST['school_id']:'';

        if($acc_id!=''){
            
            $err = validate([
                [
                    'name'=>'Ngành học',
                    'value'=> $brand_id
                ],
                [
                    'name'=>'Cơ sở',
                    'value'=>$campus_id
                ],
                [
                    'name'=>'Mã Chiến Dịch',
                    'value'=>$recruitment_id
                ],
           
            ]);
            
            if($err->validate){
                $json_response->status=true;
                $db = DBManagerFactory::getInstance();        
                $sql = "UPDATE accounts_cstm SET crm_province_id_c='$province_id',crm_school_id_c='$school_id',crm_people_id_c='$people_id',crm_district_id_c='$district_id',crm_document_id_c='$document_id',crm_race_code_c='$race_code',crm_campus_id_c='$campus_id',crm_brand_id_c='$brand_id',crm_recruitment_id_c='$recruitment_id' WHERE id_c='$acc_id'";
           
                $result = $db->query($sql,true,"Error");
                //Nếu = true , update tiếp nút đã chuyển hồ sơ;
                if($result){
                    $db = DBManagerFactory::getInstance();     
                    $sql = "UPDATE accounts_cstm SET converted_file_student_c=1 WHERE id_c='$acc_id'";
               
                    $result = $db->query($sql,true,"Error");
                    if($result){
                        $json_response->data= $result;
                        $json_response->status=true;
                        $json_response->description="Chuyển hồ sơ thành công!";
                    }
                }

            }else{
                $json_response->status=false;
                $json_response->description="Vui lòng điền chính xác kiểu dữ liệu bắt buộc";
                $json_response->data=$err->data;
            }
        }else{
                $json_response->status=false;
                $json_response->description="Account không tồn tại";

        }
        echo json_encode($json_response);
        die;
    }
    function action_savescrmaccount() {
        $common = new CommonNE;
     

        $roles= $common->getRoleUser();
      
        $access_role = false;
        foreach ($roles as $role){
            if($role->name == 'admin' || $role->name == 'Leader' || $role->name == 'Assessor' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'|| $role->role_id == '7bf90ea1-2c00-10c3-9a0e-58abca3491d0'){
            // Bảo trì
            // if($role->name == 'admin'){
                $access_role = true;
            }
        }
        $json_response = (object)[];
        // Nếu không có quyền truy cập (role) thì hiển thị thông báo
        if(!$access_role ){
            $json_response->data=(object)[
                "name"=>"Bạn không có quyền sử dụng chức năng này!"
            ];
            $json_response->status=false;
            $json_response->description="Bạn không có quyền sử dụng chức năng này";
            // echo "Đang bảo trì chức năng";  
        }else{
            $json_response->description="Bạn có quyền sử dụng chức năng này";
        }
        $data = json_decode(file_get_contents("php://input"));
        // $phone1 = isset($_REQUEST['phone'])?$_REQUEST['phone']:'';
        // $phone3 = isset($_REQUEST['telephone'])?$_REQUEST['telephone']:'';
        // $phone2 = isset($_REQUEST['parent1_mobile'])?$_REQUEST['parent1_mobile']:'';
        // $phone4 = isset($_REQUEST['parent2_mobile'])?$_REQUEST['parent2_mobile']:'';
        $error = [];
        $list_account  = [];
        $errorscrm = [];
        $null_queries = [];
        $another = [];
        foreach($data as $dt){
            $wherestr = "";
            if( $dt->telephone != ""){
                $wherestr .= " phone1_c='$dt->telephone'";
            }
            if(strlen($wherestr) > 8){
                if( $dt->parent1_mobile != ""){
                    $wherestr .= " OR phone2_c='$dt->parent1_mobile'";
                }
            }else{
                if( $dt->parent1_mobile != ""){
                    $wherestr .= " phone2_c='$dt->parent1_mobile'";
                }
            }
            if(strlen($wherestr) > 8){
                if( $dt->phone != ""){
                    $wherestr .= " OR phone3_c='$dt->phone'";
                }
            }else{
                if( $dt->phone != ""){
                    $wherestr .= " phone3_c='$dt->phone'";
                }
            }
   
            if(strlen($wherestr) > 8){
                if( $dt->parent2_mobile != ""){
                    $wherestr .= " OR phone4_c='$dt->parent2_mobile'";
                }
            }else{
                if( $dt->parent2_mobile != ""){
                    $wherestr .= " phone4_c='$dt->parent2_mobile'";
                }
            }
            
         
            if(strlen($wherestr) > 8){
                    $db = DBManagerFactory::getInstance();        
                    $sql = "SELECT id_c,phone1_c,phone2_c,phone3_c,phone4_c,COUNT(id_c) as total FROM accounts_cstm WHERE$wherestr";
                    $result = $db->query($sql,false,"Error");
                    if($result){
                        while($row = $result->fetch_assoc()) {
                            if($row['total']==0){
                                $null_queries[]=$dt;
                                // Thực thi update bên crm scrm_id = yes
                                $another[]=(object) ["id_c"=>$row['id_c'],"people_id"=>$dt->id,"phone1_c"=>$row['phone1_c'],"phone2_c"=>$row['phone2_c'],"phone3_c"=>$row['phone3_c'],"phone4_c"=>$row['phone4_c'],"total"=>$row['total']];

                            }else{
                                // Sử dụng $data lấy dữ liệu crm được lấy về đẩy vào hệ thống update
                                // Thực thi update bên scrm people_id của crm và file_convert = 1
                                // Thực thi update bên crm scrm_id = scrm_id vừa update
                                array_push($list_account,(object) ["id_c"=>$row['id_c'],"people_id"=>$dt->id,"phone1_c"=>$row['phone1_c'],"phone2_c"=>$row['phone2_c'],"phone3_c"=>$row['phone3_c'],"phone4_c"=>$row['phone4_c'],"total"=>$row['total']]);
                            }
                        }                    
                    }else{
                        $errorscrm[]=$dt;
                    }
            }else{
                array_push($error,$dt);
            }
            
        }
        if(count($list_account) > 0 ){
            foreach($list_account as $account){
                $db = DBManagerFactory::getInstance();        
                $sql = "UPDATE accounts_cstm  SET converted_file_student_c = 1,crm_people_id_c='$account->people_id' WHERE id_c = '$account->id_c'";
                $result = $db->query($sql,false,"Error");
            }
        }
       
        echo json_encode((object)[
            "data"=>$list_account,
            "error_crm"=>$error,
            "error_scrm"=>$errorscrm,
            "null_queries"=>$null_queries,
            "raw"=>$data,
            "another"=>$another,
            ]);
        die;
    }
}
?>