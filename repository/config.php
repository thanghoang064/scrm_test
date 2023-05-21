<?php

$username = 'admin';
$password = '1306';
$database = 'scrm';
$server   = 'localhost';

try {
    $dns = "mysql:host=$server;dbname=$database;charset=UTF8";
    $connect = new PDO($dns, $username, $password);
} catch (Exception $e) {
    die("Connection failed: " . $e->getMessage());
}
