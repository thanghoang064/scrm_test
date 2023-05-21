<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
session_start();
if(isset($_POST["image"])){
    $random = rand(1,1e7);
    $_SESSION["its_analyticreporting_img".$random] = $_POST["image"];
    echo $random;
}elseif(isset($_GET["img"])){
    header("Content-Type:image/png");
    header("Content-Disposition: attachment; filename=chart.png");
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');

    // #6129 - Allow image display without decoding
    $img = $_SESSION["its_analyticreporting_img".$_GET["img"]];
    if(!isset($_GET["nobase"])) {
        $img = base64_decode(str_replace("data:image/png;base64,","", $img));
    }
    echo $img;
    //unset($_SESSION["its_analyticreporting_img".$_GET["img"]]);
}

exit();