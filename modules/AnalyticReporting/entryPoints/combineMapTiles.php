<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
include "modules/AnalyticReporting/models/ImageCombine.php";
session_start();
$response = "Nothing passed to combine, empty result";
if(isset($_REQUEST['sources'])) {
    $sources = $_REQUEST['sources'];

    // Combine Base64 encoded image strings into one image
    $images = new ImageCombine($sources);
    $images->combine();
    $data = $images->raw();
    // $images->save('test.png');

    // Save in session, to be used by bouncer.php
    $random = rand(1,1e7);
    $_SESSION["its_analyticreporting_img".$random] = $data;
    $response = $random;
}

echo $response;
die();