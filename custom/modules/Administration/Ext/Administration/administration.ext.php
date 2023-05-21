<?php 
 //WARNING: The contents of this file are auto-generated



global $sugar_version;

$admin_option_defs=array();

if(preg_match( "/^6.*/", $sugar_version) ) {
    $admin_option_defs['Administration']['analyticreporting_info']= array('helpInline','LBL_ANALYTICREPORTING_LICENSE_TITLE','LBL_ANALYTICREPORTING_LICENSE','./index.php?module=AnalyticReporting&action=license');
} else {
    $admin_option_defs['Administration']['analyticreporting_info']= array('helpInline','LBL_ANALYTICREPORTING_LICENSE_TITLE','LBL_ANALYTICREPORTING_LICENSE','javascript:parent.SUGAR.App.router.navigate("#bwc/index.php?module=AnalyticReporting&action=license", {trigger: true});');
}

$admin_group_header[]= array('LBL_ANALYTICREPORTING','',false,$admin_option_defs, '');



$asterisk_integration_admin_option_defs = array();

$asterisk_integration_admin_option_defs['Administration']['AsteriskIntegrationConfiguration'] = array(
    "asterisk_integration_configuration_24",
    "LBL_ASTERISK_INTEGRATION_CONFIGURATION_TITLE",
    "LBL_ASTERISK_INTEGRATION_CONFIGURATION_DESCRIPTION",
    "index.php?module=AsteriskIntegration&action=configuration",
);

$asterisk_integration_admin_option_defs['Administration']['AsteriskIntegrationLicense'] = array(
    "asterisk_integration_license_24",
    "LBL_ASTERISK_INTEGRATION_LICENSE_TITLE",
    "LBL_ASTERISK_INTEGRATION_LICENSE_DESCRIPTION",
    "index.php?module=AsteriskIntegration&action=license",
);

$admin_group_header[] = array(
    'LBL_ASTERISK_INTEGRATION_TITLE',
    '',
    false,
    $asterisk_integration_admin_option_defs,
    'LBL_ASTERISK_INTEGRATION_DESCRIPTION',
);



$admin_option_defs = array();

$admin_option_defs['Administration']['CE_SMS_Config'] = array('32','LBL_CE_SMS_CON','LBL_CE_SMS_DESC','./index.php?module=CE_SMS_Configuration&action=ceconfig'
);

$admin_option_defs['Administration']['CE_SMS_Configuration_Activation'] = array('32', 'LBL_CE_SMS_CONFIG_LICENSE_TITLE', 'LBL_CE_SMS_CONFIG_LICENSE', './index.php?module=CE_SMS_Configuration&action=license');

$admin_group_header[]= array('LBL_CE_ADDON','',false,$admin_option_defs, '');







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

?>