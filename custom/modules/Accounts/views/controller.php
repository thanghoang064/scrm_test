<?php
include_once 'custom/modules/Accounts/common.php';


class CustomAccountsController extends SugarController {

    function action_convertne() {
    	$this->view = 'convertne';
    }
    function action_convertedne() {
    	$this->view = 'convertedne';
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
}
?>