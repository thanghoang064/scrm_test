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
$server   = 'localhost';
$people_id = isset($_GET['people_id']) ? $_GET['people_id'] : null;

$account = [];
$list_people = [];

if ($people_id != NULL) {
    $mysqli = new mysqli($server, $username, $password, $database);
    if ($result = $mysqli->query("SELECT id_c FROM accounts_cstm WHERE crm_people_id_c='$people_id'")) {
        while ($row = $result->fetch_assoc()) {
            array_push($account, $row);
        }
    }
    $mysqli->close();

    if (count($account) > 0) {
        // check id isset
        if ($account[0]['id_c'] != NULL) {
            $account_id = $account[0]['id_c'];

            // connect mysql
            $mysqli = new mysqli($server, $username, $password, $database);

            // update NE and check value true and false
            if ($result = $mysqli->query("UPDATE accounts_cstm a,leads_cstm b, leads c,accounts d SET a.enrollment_status_c='enrolled',b.ne_c = '1',d.date_modified=NOW(),a.crm_convert_ne_c=DATE(NOW()) WHERE b.id_c=c.id AND d.id = a.id_c AND a.id_c='$account_id' AND c.account_id='$account_id'")) {
                // get info account
                $dataAccount = $mysqli->query("SELECT c.last_name as last_name, c.phone_mobile as phone_mobile, a.phone1_c as phone1_c, d.name as name FROM accounts_cstm a,leads_cstm b, leads c,accounts d WHERE b.id_c=c.id AND d.id = a.id_c AND a.id_c='$account_id' AND c.account_id='$account_id'");
                $data = $dataAccount->fetch_assoc();
                $userAgent = $_SERVER['HTTP_USER_AGENT'];
                $uid = empty($data['phone_mobile']) ? md5($data['phone1_c']) : md5($data['phone_mobile']);
                $phone = empty($data['phone_mobile']) ? $data['phone1_c'] : $data['phone_mobile'];
                $name = empty($data['name']) ? $data['last_name'] : $data['name'];
                
                // get time now
                $dateTime = date("Y-m-d H:i:s");
               
                //set data send api
                $params = '{
                    "uid": "' . $uid . '",
                    "log_id": "' . $account_id . '",
                    "ec": "account",
                    "ea": "update",
                    "items": [
                        {
                            "type": "account",
                            "id": "' . $account_id . '",
                            "name": "' . $name . '",
                            "event_source": "update",
                            "udate": "' . $dateTime . '",
                            "date_active":"' . $dateTime . '",
                            "ne":"1",
                            "is_crm": "true"     
                        }
                    ],
                    "extra": {
                        "identify_id": "'.$uid.'",
                        "identify_name": "' . $name . '",
                        "identify_phone": "' . $phone . '",
                        "identify_account_id": "' . $account_id . '",
                        "ne":"1",
                        "is_account": "true",
                        "is_crm": "true"
                    }
                }';

                $url = "https://a.cdp.asia/event?portal_id=564888751&prop_id=564990348&resp_type=json";
                // curl api
                $curl = curl_init($url);
                curl_setopt_array($curl, array(
                    CURLOPT_URL => $url,
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_USERAGENT    => $userAgent,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => $params,
                    CURLOPT_HTTPHEADER => array(
                        'Content-Type: application/json'
                    ),
                ));

                $response = curl_exec($curl);
                curl_close($curl);

                echo $params;
                die;
            } else {
                die;
            }
            $mysqli->close();
        }
    }
} else {
    die;
}
