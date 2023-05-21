<?php
   $host = 'localhost';
    $dbname = 'newcrm';
    $username = 'newcrm';
    $password = 'mdQseNnCVuZD3Zu6';
try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password,array(
                PDO::ATTR_PERSISTENT => true,
                PDO::ATTR_ERRMODE    => PDO::ERRMODE_EXCEPTION,
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
            ));
	
    echo "Connected to $dbname at $host successfully.";
} catch (PDOException $pe) {
    die("Could not connect to the database $dbname :" . $pe->getMessage());
}			
			
				$first_name=$_REQUEST['first_name'];
				$last_name=$_REQUEST['last_name'];
				$gender=$_REQUEST['gender'];
				$dob=$_REQUEST['dob'];
				$cmt=$_REQUEST['cmt'];
				$cmt_provided_date=$_REQUEST['cmt_provided_date'];
				$cmt_provided_where=$_REQUEST['cmt_provided_where'];
				$pbrand_name_en=$_REQUEST['pbrand_name_en'];
				$paddress=$_REQUEST['paddress'];
				$pemail=$_REQUEST['pemail'];
				$pstatus=$_REQUEST['pstatus'];
				$pstudent_code=$_REQUEST['pstudent_code'];
				$pschool_name=$_REQUEST['pschool_name'];
				$graduated_year=$_REQUEST['graduated_year'];
				// $parent1_mobile=$_REQUEST['parent1_mobile'];
				// $race_name=$_REQUEST['race_name'];
				$account_sugar_id_s=$_REQUEST['account_sugar_id'];
				if($pstatus==3 || $pstatus==4){
					$trang_thai_phi="Đã hoàn thành";
				}else{
					$trang_thai_phi="Chưa hoàn thành";
				}
				if($gender==1){
					$gender_c="Nam";
				}else{
					$gender_c="Nữ";
				}
				if($account_sugar_id_s !=''){
				
				$sql="UPDATE accounts_cstm SET birthdate_c='$dob',id_passport_c='$cmt',date_issued_c='$cmt_provided_date',place_issued_c='$cmt_provided_where',major_c='$pbrand_name_en',gender_c='$gender_c',student_code_c='$pstudent_code',trang_thai_phi_c='$trang_thai_phi',school_c='$pschool_name',year_graduated_c='$graduated_year',address_c='$paddress',postal_address_c='$paddress' WHERE id_c='$account_sugar_id_s'";
				//$sql="UPDATE accounts_cstm SET name_update_test_c='$pstudent_code' WHERE id_c='$account_sugar_id_s'";
				//echo $sql;
				$conn->query($sql);
				
			}
			
			
			//mysqli_close($conn);
   ?>
//create by hoangld