<?php
/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2018 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

if (!defined('SUITE_PHPUNIT_RUNNER')) {
    session_regenerate_id(false);
}
global $mod_strings;
$login_vars = $GLOBALS['app']->getLoginVars(false);

$user_name = isset($_REQUEST['user_name'])
    ? $_REQUEST['user_name'] : '';

$password = isset($_REQUEST['username_password'])
    ? $_REQUEST['username_password'] : '';
$authController->login($user_name, $password);
// authController will set the authenticated_user_id session variable
if (isset($_SESSION['authenticated_user_id'])) {
    // Login is successful
    if ($_SESSION['hasExpiredPassword'] == '1' && $_REQUEST['action'] != 'Save') {
        $GLOBALS['module'] = 'Users';
        $GLOBALS['action'] = 'ChangePassword';
        ob_clean();
        header("Location: index.php?module=Users&action=ChangePassword");
        sugar_cleanup(true);
    }
    global $record;
    global $current_user;
    global $sugar_config;

    global $current_user;
    global $db;

    // vinh custom lưu quyền, mã cơ sở - start
    $leader_id = "2671ebfb-7ac6-95fd-6005-58abcf1ca699";
    $campusIdToCampusCode = [
        'd38a052c-3bfe-7286-f088-589d417b1578' => 'HN',
        '4ad7e29a-c17e-eb4a-cb88-589d61641f51' => 'DN',
        'b9f05e38-7c48-2de3-721f-589d3ff27e78' => 'HCM',
        '9fd2a5c7-dad7-c0ff-1469-589d403d0ced' => 'TN',
        'c7708bb1-668d-ba86-7c91-5a94bf7f722c' => 'CT',
        'd7576688-99c0-52e4-b22f-6257cb378032' => 'HP',
        '724c8860-b55f-69e8-27b9-637b40a89488' => 'TH',
        'aed1f6fb-7364-653a-270d-637b4069ab85' => 'HNA',
        'b151efd4-969f-ffbc-4758-637b40674e6d' => 'QN',
        '4d47149e-448c-89fc-5ee8-63a18b4497eb' => 'TNG',
        'd9a88517-cb4f-d3a7-bb0d-63b7816f0f0a' => 'DNA',
        '7fe1a7a9-5b84-7447-0c37-592f97135c62' => 'KBHN',
        '390447ba-fc1c-9172-b894-592f97096458' => 'KBHCM',
        '65d0d089-2931-26a7-bd98-63ec90ae90b2' => 'KBCT',
    ];
//            unset($_SESSION['custom']);
    if (!isset($_SESSION['custom']['is_admin'])) {
        $_SESSION['custom']['is_admin'] = $current_user->is_admin;
    }
    if (!$_SESSION['custom']['is_admin'] && !isset($_SESSION['custom']['is_leader'])) {
        $campusCode = null;
        $sql1 = "
                        SELECT 
                            1 
                        FROM acl_roles_users as aclu
                        WHERE aclu.role_id = '{$leader_id}'
                        AND aclu.user_id = '{$current_user->id}'
                    ";
        $is_leader = $db->query($sql1)->num_rows == 1;
        $_SESSION['custom']['is_leader'] = $is_leader;
        if ($is_leader) {
            $sql2 = "
                        SELECT 
                            su.securitygroup_id 
                        FROM securitygroups_users as su
                        WHERE
                            su.user_id = '{$current_user->id}'
                            AND su.deleted = 0
                    ";
            $result = $db->query($sql2);
            foreach ($result as $item) {
                $campusId = $item['securitygroup_id'];
                if (!empty($campusIdToCampusCode[$campusId])) {
                    $campusCode = $campusIdToCampusCode[$campusId];
                }
                break;
            }
        }
        $_SESSION['custom']['campusCode'] = $campusCode;
    }
    // vinh custom lưu quyền, mã cơ sở - end

    if (isset($current_user) && empty($login_vars)) {
        if (!empty($GLOBALS['sugar_config']['default_module']) && !empty($GLOBALS['sugar_config']['default_action'])) {
            $url = "index.php?module={$GLOBALS['sugar_config']['default_module']}&action={$GLOBALS['sugar_config']['default_action']}";
        } else {
            $modListHeader = query_module_access_list($current_user);
            //try to get the user's tabs
            $tempList = $modListHeader;
            $idx = array_shift($tempList);
            if (!empty($modListHeader[$idx])) {
                $url = "index.php?module={$modListHeader[$idx]}&action=index";
            }
        }
    } else {
        $url = $GLOBALS['app']->getLoginRedirect();
    }
} else {
    // Login has failed
    if (isset($_POST['login_language']) && !empty($_POST['login_language'])) {
        $url = "index.php?module=Users&action=Login&login_language=" . $_POST['login_language'];
    } else {
        $url = "index.php?module=Users&action=Login";
    }

    if (!empty($login_vars)) {
        $url .= '&' . http_build_query($login_vars);
    }
}

// construct redirect url
$url = 'Location: ' . $url;

//adding this for bug: 21712.
if (!empty($GLOBALS['app'])) {
    $GLOBALS['app']->headerDisplayed = true;
}
if (!defined('SUITE_PHPUNIT_RUNNER')) {
    sugar_cleanup();
    header($url);
}
