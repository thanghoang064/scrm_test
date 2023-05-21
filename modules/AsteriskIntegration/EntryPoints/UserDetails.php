<?php

// ini_set("display_errors", true);
// error_reporting(1);

if (!defined('sugarEntry') || !sugarEntry)
{
    die('Not A Valid Entry Point');
}

global $current_user;

$asteriskintegration_user_id = $current_user->id;
$asteriskintegration_show_notification = $current_user->asteriskintegration_show_notification;
$asteriskintegration_server_ip_socket_port = $current_user->asteriskintegration_server_ip;
$asteriskintegration_extension = $current_user->asteriskintegration_extension;
$asteriskintegration_context = $current_user->asteriskintegration_context;

if (!empty($asteriskintegration_server_ip_socket_port))
{
    list($asteriskintegration_server_ip, $asteriskintegration_socket_port) = explode(":", $asteriskintegration_server_ip_socket_port);
}
else
{
    $asteriskintegration_server_ip = "";
    $asteriskintegration_socket_port = "";
}

$asteriskintegration_user_details_array = array();
$asteriskintegration_user_details_array['asteriskintegration_user_id'] = $asteriskintegration_user_id;
$asteriskintegration_user_details_array['asteriskintegration_show_notification'] = $asteriskintegration_show_notification;
$asteriskintegration_user_details_array['asteriskintegration_server_ip'] = $asteriskintegration_server_ip;
$asteriskintegration_user_details_array['asteriskintegration_extension'] = $asteriskintegration_extension;
$asteriskintegration_user_details_array['asteriskintegration_context'] = $asteriskintegration_context;
$asteriskintegration_user_details_array['asteriskintegration_socket_port'] = $asteriskintegration_socket_port;
$asteriskintegration_user_details_array['asteriskintegration_toggle_status'] = "Minimized";

echo json_encode($asteriskintegration_user_details_array);
die();
