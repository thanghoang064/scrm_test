<?php
// include_once('modules/SecurityGroups/SecurityGroup.php');
class Common  {
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
    function array_key_last( $array ) {
        $key = NULL;

        if ( is_array( $array ) ) {

            end( $array );
            $key = key( $array );
        }

        return $key;
    }
   
}