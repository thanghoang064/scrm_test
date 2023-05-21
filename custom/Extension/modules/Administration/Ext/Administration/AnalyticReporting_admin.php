<?php

global $sugar_version;

$admin_option_defs=array();

if(preg_match( "/^6.*/", $sugar_version) ) {
    $admin_option_defs['Administration']['analyticreporting_info']= array('helpInline','LBL_ANALYTICREPORTING_LICENSE_TITLE','LBL_ANALYTICREPORTING_LICENSE','./index.php?module=AnalyticReporting&action=license');
} else {
    $admin_option_defs['Administration']['analyticreporting_info']= array('helpInline','LBL_ANALYTICREPORTING_LICENSE_TITLE','LBL_ANALYTICREPORTING_LICENSE','javascript:parent.SUGAR.App.router.navigate("#bwc/index.php?module=AnalyticReporting&action=license", {trigger: true});');
}

$admin_group_header[]= array('LBL_ANALYTICREPORTING','',false,$admin_option_defs, '');
