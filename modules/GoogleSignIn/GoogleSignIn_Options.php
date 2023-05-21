<?php

require_once 'modules/GoogleSignIn/GoogleSignIn_Utils.php';
require_once('modules/GoogleSignIn/license/GoogleSignInOutfittersLicense.php');


global $record;
global $current_user;
global $sugar_config;

$code  = trim($_REQUEST['code']);

$validate = GoogleSignInOutfittersLicense::isValid('GoogleSignIn');
if ($validate != 1) {
    $_SESSION['login_error'] = 'Sorry, Google SignIn add-on license is not valid.';
	header('Location: '."index.php?module=Users&action=Login");
	die();
}

$GoogleSignInClass = new GoogleSignInClass();
$accessToken = $GoogleSignInClass->get_accesstoken();
$get_email = $GoogleSignInClass->get_email($accessToken); 
$login = $GoogleSignInClass->login($get_email);

$login_result = json_decode($login,true);

if($login_result['code'] == "1")
{
header('Location: '."index.php?module=Home&action=index");
}

if($login_result['code'] == "0") 
{
$_SESSION['login_error'] = $login_result['message'];
header('Location: '."index.php?module=Users&action=Login");
}

