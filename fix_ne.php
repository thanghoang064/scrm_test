<?php

header("Access-Control-Allow-Origin: https://crm.poly.edu.vn");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Access-Control-Allow-Credentials: true");

$username = 'scrm';
$password = 'e7WHTRHKffaSqhgJ';
$database = 'scrm';
$people_id = $_GET['people_id'];
// $username = 'root';
// $password = '';
// $database = 'scrms';
$account=[];
$list_people=[];
// $mysqli = new mysqli("localhost", "crm", "1dKugvknAJXFHiTT", "crm");
$curl = curl_init();

// $domain = 'http://localhost:81/public_html/public_html/';
$resp = file_get_contents("https://crm.poly.edu.vn/crm/get_list_account.php");
// echo $resp;
// $domain = 'http://crm.poly.edu.vn/crm/';
// curl_setopt_array($curl, array(
//     CURLOPT_RETURNTRANSFER =>0,
//     CURLOPT_HEADER =>0,
//     CURLOPT_URL => $domain . 'get_list_account.php',
//     CURLOPT_USERAGENT => 'cURL Request',
//     CURLOPT_SSL_VERIFYPEER => false
// ));

// $resp = curl_exec($curl);

// // $ress = json_decode($resp);
// // var_dump($ress);
// // var_dump(json_decode($resp));
$res = json_decode($resp);
// var_dump($res);
// $string = "(";
foreach ($res as $people) {

    // var_dump($people->id);
    // var_dump($people->status_changed_date);
    // die;

    $people_id = $people->id;
    $people_status_changed_date= $people->status_changed_date;

   $mysqli = new mysqli("localhost", $username, $password, $database);
        // if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='unenrolled',b.ne_c = '0' WHERE c.account_id=a.id_c AND b.id_c = c.id AND crm_people_id_c IN $string")) {
        if ($result = $mysqli->query("UPDATE accounts_cstm  SET crm_convert_ne_c= '$people_status_changed_date' WHERE  crm_people_id_c = '$people_id'")) {
        // if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='dropout',b.ne_c = '0' WHERE c.account_id=a.id_c AND b.id_c = c.id AND crm_people_id_c IN $string")) {
            // while($row = $result->fetch_assoc()) {
            //         array_push($account,$row);
            //         }
    
        }else{
            echo mysqli_error($mysqli);
        }
    $mysqli->close();



    // $mysqli = new mysqli("localhost", $username, $password, $database);
    //     // if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='unenrolled',b.ne_c = '0' WHERE c.account_id=a.id_c AND b.id_c = c.id AND crm_people_id_c IN $string")) {
    //     if ($result = $mysqli->query("UPDATE accounts_cstm  SET crm_convert_ne_c= '$people_status_changed_date' WHERE  crm_people_id_c = '$people_id'")) {
    //     // if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='dropout',b.ne_c = '0' WHERE c.account_id=a.id_c AND b.id_c = c.id AND crm_people_id_c IN $string")) {
    //         // while($row = $result->fetch_assoc()) {
    //         //         array_push($account,$row);
    //         //         }
    
    //     }else{
    //         echo mysqli_error($mysqli);
    //     }
    // $mysqli->close();





    // $string .= "'".$people->id."',";
}
// $string= rtrim($string, ", ");
// $string .=")";
// echo "SELECT enrollment_status_c FROM accounts_cstm WHERE crm_people_id_c IN $string";


// $mysqli = new mysqli("localhost", $username, $password, $database);
//         // if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='unenrolled',b.ne_c = '0' WHERE c.account_id=a.id_c AND b.id_c = c.id AND crm_people_id_c IN $string")) {
//         if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='enrolled',b.ne_c = '1' WHERE c.account_id=a.id_c AND b.id_c = c.id AND crm_people_id_c IN $string")) {
//         // if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='dropout',b.ne_c = '0' WHERE c.account_id=a.id_c AND b.id_c = c.id AND crm_people_id_c IN $string")) {
//             // while($row = $result->fetch_assoc()) {
//             //         array_push($account,$row);
//             //         }
    
//         }else{
//             echo mysqli_error($mysqli);
//         }
//     $mysqli->close();




    
    // $mysqli = new mysqli("localhost", $username, $password, $database);
    // if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='unenrolled',b.ne_c = '0' WHERE c.account_id=a.id_c AND b.id_c = c.id ")) {
    //     // while($row = $result->fetch_assoc()) {
    //     //         array_push($account,$row);
    //     //         }

    // }else{
    //     echo mysqli_error($mysqli);
    // }
    // $mysqli->close();



    // var_dump($account);
// // var_dump(json_decode($resp));
// // //Dữ liệu thời tiết ở dạng JSON
// // $weather = json_decode($resp);
// // var_dump($weather);

// curl_close($curl);
// $response = get_web_page("http://crm.poly.edu.vn/crm/get_list_account.php");
// if($people_id != NULL){
//     $mysqli = new mysqli("localhost", $username, $password, $database);
//         if ($result = $mysqli->query("SELECT id_c FROM accounts_cstm WHERE crm_people_id_c='$people_id'")) {
//             while($row = $result->fetch_assoc()) {
//                     array_push($account,$row);
//                     }
    
//         }
//     $mysqli->close();
  
//     if(count($account)>0){
//         // echo json_encode($account[0]['id_c']);
//         // die;
//         if($account[0]['id_c'] != NULL){
//             $account_id = $account[0]['id_c'];
//             // echo "UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='enrolled',b.ne_c = '1' WHERE b.id_c=c.id AND c.account_id='$account_id'";
//             // die;
//                 $mysqli = new mysqli("localhost", $username, $password, $database);
               
                 
//                     if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c SET a.enrollment_status_c='enrolled',b.ne_c = '1' WHERE b.id_c=c.id AND a.id_c='$account_id' AND c.account_id='$account_id'")) {
                        
//                         die;
//                     }else{
//                         // echo mysqli_error($mysqli);
//                         die;
//                     }
//                 $mysqli->close();
             
                
//         }
//     }
// }else{
//     die;
// }

// echo json_encode($people_id);
// echo "SELECT ne_c,id_c FROM accounts_cstm WHERE crm_people_id_c='$people_id'";
// die;
// var_dump($_GET);

?>