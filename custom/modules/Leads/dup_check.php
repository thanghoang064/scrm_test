<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
$phone = trim($_REQUEST['phone']);
// thienth - 25/06/2022 - cập nhật lại logic check số điện thoại ở màn hình edit lead
$exclude = trim($_REQUEST['exclude']);
function sanitizePhone($mobile)
{
    $mobile = preg_replace('/[^\d]/', '', $mobile);
    if (substr($mobile, 0, 1) != '0')
        $mobile = '0' . $mobile;
    return $mobile;
}
function check_dup_phone($phone, $exclude)
{
    global $db;
    $phone = sanitizePhone($phone);
    if (empty($phone))
        echo 0;
    if (!empty($phone)) {
        // thienth - 25/06/2022 - cập nhật lại logic check số điện thoại ở màn hình edit lead
        $sql    = "SELECT count(*) as total FROM leads WHERE (phone_work='$phone' OR phone_mobile='$phone' OR phone_home='$phone' OR phone_other='$phone') AND deleted != 1 AND id != '$exclude'";
        // end thienth - 25/06/2022
        // $sql = "SELECT count(id) as total FROM leads WHERE (phone_work='$phone' OR phone_mobile='$phone' OR phone_home='$phone' OR phone_other='$phone') AND deleted = 0";
        $result = $db->query($sql);
        // $count  = $db->getRowCount($result);
        $data = $db->fetchByAssoc($result);
        $count = $data['total'] == 0 ? 0 : 1;
        // thienth - 25/06/2022 - cập nhật lại logic check số điện thoại ở màn hình edit lead
        echo $count;
        // end thienth - 25/06/2022
        // if ($count == 0) {
        // if ($count < 2) {
        //     echo 0;
        // } else{
        //     echo 1;
		// }
    }
}
check_dup_phone($phone, $exclude);