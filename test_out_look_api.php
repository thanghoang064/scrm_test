<?php
include 'vendor/autoload.php';
session_start();

use Microsoft\Graph\Graph;
use Microsoft\Graph\Model;
use League\OAuth2\Client\Provider\GenericProvider;

if (empty($_POST)) {
    return 0;
}

// Khởi tạo các thông tin cần thiết
date_default_timezone_set('Asia/Ho_Chi_Minh');
$client_id = "57d22cf4-0641-4fa1-9741-631406dd2e43";
$client_secret = "xdq8Q~jGhEf57ARza_VM1znFvvKPkK84Q9M.bcej";
$tenantId = "343a8928-da83-4867-bf61-c5ef20ac20ec";
$resource = "https://graph.microsoft.com";
$redirect_uri = 'http://localhost/api/test_outlook_api/';
$scopes = ['User.Read', 'User.Read.All', 'Calendars.ReadWrite', 'offline_access', 'openid', 'profile'];
$refresh_token = "M.C103_BAY.-CY4wieVSzwbQfvPUY222e0orL3NBhnavnGgPGYmQTDZZLyIvSpajRL6J5rHPIz6e8Tr97apXc*Ij7sCAl*cyTwKsZ4KweUMNY8Kx9AxhBbuyrMwJQ6HluUINtwhuNm6dPMJuyzgKfkqnD69nR9M35HJyDHN4DP6dmoPjBxn7CUsWj7KGOc442uVAqILQ5egDDk7f3arrp3zjY*b4WN7Pn4erea4C8!jlb!AZxFLGgq51SY2FK5XT1V8A8kmvnOZm!NNP*C7HxHn39fhM477yIP6awdBOK!4SVqe*IvCKrQK6LCSxmhhayivsz7QSTvkKv1lwHOe3fh8tT9V4dxbyBhM$";

// Tạo một đối tượng oauthClient bằng cách sử dụng thư viện Microsoft Graph SDK for PHP
$oauthClient = new GenericProvider([
    'clientId' => $client_id,
    'clientSecret' => $client_secret,
    'redirectUri' => $redirect_uri,
    'urlAuthorize' => 'https://login.microsoftonline.com/common/oauth2/v2.0/authorize',
    'urlAccessToken' => 'https://login.microsoftonline.com/common/oauth2/v2.0/token',
    'urlResourceOwnerDetails' => '',
    'scopes' => 'openid profile offline_access user.read calendars.readwrite'
]);

// Kiểm tra nếu có mã code từ azure ad
if (isset($_GET['code'])) {
    // Cố gắng lấy access token và refresh token bằng code
    $code = $_GET['code'];
    $accessToken = $oauthClient->getAccessToken('authorization_code', [
        'code' => $code
    ]);
    // Lưu trữ access token và refresh token vào session
    $_SESSION['access_token'] = $accessToken->getToken();
//    $_SESSION['refresh_token'] = $accessToken->getRefreshToken();
}
//if (!empty($_SESSION['access_token'])) {
//    unset($_SESSION['access_token']);
//}

// Kiểm tra nếu có access token trong session
if (isset($_SESSION['access_token']['token']) && $_SESSION['access_token']['expires'] > time()) {
    // Sử dụng access token để gọi microsoft api
    // Ví dụ: lấy thông tin người dùng
    $url = 'https://graph.microsoft.com/v1.0/me';
    $request = $oauthClient->getAuthenticatedRequest(
        'GET',
        $url,
        $_SESSION['access_token']['token']
    );
    $response = $oauthClient->getResponse($request);
//    echo '<pre>';
//    print_r($response);
} else {
    // Nếu không có access token, kiểm tra nếu có refresh token trong session
    if (isset($refresh_token)) {
        // Cố gắng lấy access token mới bằng refresh token
        $accessToken = $oauthClient->getAccessToken('refresh_token', [
            'refresh_token' => $refresh_token
        ]);
        // Lưu trữ access token và refresh token mới vào session
        $_SESSION['access_token'] = [
            'token' => $accessToken->getToken(),
            'expires' => $accessToken->getExpires(),
        ];
//        $_SESSION['access_token'] = $accessToken->getToken();
//        $_SESSION['refresh_token'] = $accessToken->getRefreshToken();
//        $refresh_token = $accessToken->getRefreshToken();
        // Chuyển hướng đến trang chủ
//        header('Location: index.php');
//        exit();
    } else {
        // Nếu không có refresh token, yêu cầu người dùng đăng nhập lại
//        echo '<a href="' . $oauthClient->getAuthorizationUrl() . '">Đăng nhập</a>';
        header("location: " . $oauthClient->getAuthorizationUrl());
    }
}
$today = date('Y-m-d');
$lead_data = json_decode($_POST['leads_data']);
$body = "
    <h3>" . date('d-m-Y') . " - bạn có " . count($lead_data) . " lead cần chăm sóc</h3>
    <table border='1'>
        <tr>
            <th>Đợt nhập học</th>
            <th>Tên</th>
            <th>Số điện thoại</th>
            <th>Ngành học mong muốn</th>
        </tr>
";
foreach ($lead_data as $key => $item) {
    if ($key == count($lead_data) - 1) $sep = '';
    $html = "
        <tr>
            <td>{$item->dot_nhap_hoc}</td>
            <td>{$item->name}</td>
            <td>{$item->phone_mobile}</td>
            <td>{$item->expected_major_2}</td>
        </tr>
    ";
    $body .= $html;
}
$body .= "</table>";

$graph = new Graph();
$graph->setAccessToken($_SESSION['access_token']['token']);

$subject = 'Nhắc lịch hẹn';
$body = [
    "contentType" => "HTML",
    "content" => $body,
];
$start = [
    'dateTime' => $today . 'T' . $_POST['date_start_hours'] . ':' . $_POST['date_start_minutes'] . ':00',
    "timeZone" => "Asia/Ho_Chi_Minh"
];
$end = [
    'dateTime' => $today . 'T' . $_POST['date_end_hours'] . ':' . $_POST['date_end_minutes'] . ':00',
    "timeZone" => "Asia/Ho_Chi_Minh"
];
$location = 'Địa điểm sự kiện';
$attendees = [
    [
        'emailAddress' => [
            'address' => $_POST['email']
        ],
        'type' => 'required'
    ]
];

// Tạo một đối tượng Event
$newEvent = new Model\Event();
$newEvent->setSubject($subject);
$newEvent->setBody(new Model\ItemBody($body));
$newEvent->setStart(new Model\DateTimeTimeZone($start));
$newEvent->setEnd(new Model\DateTimeTimeZone($end));
$newEvent->setLocation(new Model\Location([
    'displayName' => $location
]));
$newEvent->setAttendees($attendees);

// Gửi yêu cầu tạo sự kiện mới đến API Graph
try {
    $createdEvent = $graph->createRequest('POST', '/me/events')
        ->attachBody($newEvent)
        ->execute();
    echo 'Sự kiện mới đã được tạo thành công';
} catch (\Throwable $th) {
    echo 'Thất bại khi tạo sự kiện mới: ' . $th->getMessage();
}
header("Location: {$_SERVER['HTTP_REFERER']}");