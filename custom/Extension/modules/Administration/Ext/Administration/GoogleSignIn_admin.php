<?php

global $sugar_version;

$admin_option_defs=array();

if(preg_match( "/^6.*/", $sugar_version) ) {
    
	$admin_option_defs['Administration']['googlesignin_config']= array('','LBL_DTGOOGLESIGNIN_LICENSE_GOOGLE_CONFIGURATION','LBL_DTGOOGLESIGNIN_LICENSE_MESSAGE','./index.php?module=GoogleSignIn&action=googlesignin_config');

    $admin_option_defs['Administration']['googlesignin_info']= array('','LBL_DTGOOGLESIGNIN_LICENSE_TITLE','LBL_DTGOOGLESIGNIN_LICENSE','./index.php?module=GoogleSignIn&action=license');
    
} else {

	$admin_option_defs['Administration']['googlesignin_config']= array('','LBL_DTGOOGLESIGNIN_LICENSE_GOOGLE_CONFIGURATION','LBL_DTGOOGLESIGNIN_LICENSE_MESSAGE','#bwc/index.php?module=GoogleSignIn&action=googlesignin_config');

    $admin_option_defs['Administration']['googlesignin_info']= array('','LBL_DTGOOGLESIGNIN_LICENSE_TITLE','LBL_DTGOOGLESIGNIN_LICENSE','javascript:parent.SUGAR.App.router.navigate("#bwc/index.php?module=GoogleSignIn&action=license", {trigger: true});');
 
}

$admin_group_header[]= array('LBL_DTGOOGLESIGNIN','',false,$admin_option_defs, '');
