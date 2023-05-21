<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');


require_once('include/MVC/View/SugarView.php');
require_once('include/Sugar_Smarty.php');
class CustomAccountsViewFixne extends AccountsViewEdit
{
		function display(){
            ///  Kiểm tra  các ne bên account với ne bên lead có đúng ko, sai thì cập nhập lại
            $db = DBManagerFactory::getInstance();
            global $current_user;
            $currentUser = $current_user->id;
            $sql = "SELECT a.account_id,a.id,b.ne_c FROM leads a, leads_cstm b, accounts_cstm c WHERE a.deleted=0 AND a.id = b.id_c AND a.account_id=c.id_c AND a.account_id <> '' AND b.dot_nhap_hoc_c IN ('Jan_2020','Mar_2020','May_2020','Jul_2020','Sep_2020') AND b.ne_c=0 AND c.enrollment_status_c='enrolled' ";
            $result = $db->query($sql,true,"Error");
            $data = [];
            while($row = $result->fetch_assoc()) {
                array_push($data,(object) ["id"=>$row["id"]]);
            }
     
            // $this->dd($data);
            var_dump($data);
            foreach($data as $d){
                $id_c= $d->id;
                $db = DBManagerFactory::getInstance();     
                $sql = "UPDATE leads_cstm SET ne_c=1 WHERE id_c='$id_c'";
        
                $result = $db->query($sql,true,"Error");
            }
   
           
		}
 	
 	
}