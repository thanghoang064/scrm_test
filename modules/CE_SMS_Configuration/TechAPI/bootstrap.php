<?php
require_once realpath(__DIR__) . '/Autoload.php';

TechAPIAutoloader::register();

use TechAPI\Constant;
use TechAPI\Client;
use TechAPI\Auth\ClientCredentials;

// config api
Constant::configs(array(
    //'mode'            => Constant::MODE_LIVE,
    'mode'            => Constant::MODE_SANDBOX,
    'connect_timeout' => 15,
    'enable_cache'    => false,
    'enable_log'      => true,
    'log_path'    => realpath(__DIR__) . '/logs'
));


// config client and authorization grant type
function getTechAuthorization()
{    
    $client = new Client(
        //'YOUR_CLIENT_ID',
        //'YOUR_CLIENT_SECRET',
        //'e615D85fc918f252e1754Ce2391c8Ef923AAB401',
        //'663642d023602e28784F8789dC939f14a54ece5f588848beBdd6314fab8c274de8B618a4',
        '155ca26b98e58c2F9154224162f3eb8fbe672E7e',
        'dddD5e1f0da6aba71C3F5Fc52c2a930e06C7c8c05560e8953cb72c7d22383dcb27a8511c',
        array('send_mt_active') // array('send_brandname', 'send_brandname_otp')
    );
    
    return new ClientCredentials($client);
}