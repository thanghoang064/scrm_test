<?php

header("Access-Control-Allow-Origin: https://crm.poly.edu.vn");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Access-Control-Allow-Credentials: true");

var_dump($_GET);


// $username = 'scrm';
// $password = 'e7WHTRHKffaSqhgJ';
// $database = 'scrm';
// $server   = 'localhost';

// // $username = 'root';
// // $password = '';
// // $database = 'scrm';
// // $server   = '139.59.231.135';
// $dns = "mysql:host=$server;dbname=$database";
// $connect = new PDO($dns, $username, $password);

// $page = isset($_GET['page']) ? $_GET['page'] : 0;

// $page *= 500;
// $query = "SELECT ls.account_id, ls.last_name, ls.phone_mobile, ac.phone1_c, a.name, ac.enrollment_status_c, lsc.ne_c, ls.date_entered FROM accounts a JOIN accounts_cstm ac ON a.id = ac.id_c JOIN leads ls ON ac.id_c = ls.account_id JOIN leads_cstm lsc ON ls.id=lsc.id_c WHERE ls.date_entered >= '2020-11-1 00:00:00' AND ls.date_entered <= '2021-07-25 00:00:00' LIMIT $page, 500";
// $stmt = $connect->prepare($query);
// $stmt->setFetchMode(PDO::FETCH_ASSOC);
// $stmt->execute();
// $data = $stmt->fetchAll();

// $userAgent = $_SERVER['HTTP_USER_AGENT'];

// // get time now
// $dateTime = date("Y-m-d H:i:s");
// $count = 0;
// foreach ($data as $value) {
//     $account_id = $value['account_id'];
//     $uid = empty($value['phone_mobile']) ? md5($value['phone1_c']) : md5($value['phone_mobile']);
//     $phone = empty($value['phone_mobile']) ? $value['phone1_c'] : $value['phone_mobile'];
//     $name = empty($value['name']) ? $value['last_name'] : $value['name'];
//     $ne = ($value['ne_c'] == 1 && $value['enrollment_status_c'] == "enrolled") ? 1 : 0;
//     $params = '{
//                 "uid": "' . $uid . '",
//                 "log_id": "' . $account_id . '",
//                 "ec": "account",
//                 "ea": "update",
//                 "items": [
//                     {
//                         "type": "account",
//                         "id": "' . $account_id . '",
//                         "name": "' . $name . '",
//                         "event_source": "update",
//                         "udate": "' . $dateTime . '",
//                         "date_active":"' . $dateTime . '",
//                         "ne":"' . $ne . '",
//                         "is_crm": "true"     
//                     }
//                 ],
//                 "extra": {
//                     "identify_id": "' . $uid . '",
//                     "identify_name": "' . $name . '",
//                     "identify_phone": "' . $phone . '",
//                     "identify_account_id": "' . $account_id . '",
//                     "ne":"' . $ne . '",
//                     "is_account": "true",
//                     "is_crm": "true"
//                 }
//             }';

//     callApi($params, $userAgent);
//     $count++;
// }

// echo "đã update $count Lead";

// function callApi($params, $userAgent)
// {
//     $url = "https://a.cdp.asia/event?portal_id=564888751&prop_id=564990348&resp_type=json";
//     $curl = curl_init($url);
//     curl_setopt_array($curl, array(
//         CURLOPT_URL => $url,
//         CURLOPT_RETURNTRANSFER => true,
//         CURLOPT_ENCODING => '',
//         CURLOPT_MAXREDIRS => 10,
//         CURLOPT_TIMEOUT => 0,
//         CURLOPT_USERAGENT    => $userAgent,
//         CURLOPT_FOLLOWLOCATION => true,
//         CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
//         CURLOPT_CUSTOMREQUEST => 'POST',
//         CURLOPT_POSTFIELDS => $params,
//         CURLOPT_HTTPHEADER => array(
//             'Content-Type: application/json'
//         ),
//     ));

//     curl_exec($curl);
//     curl_close($curl);
// }
?>