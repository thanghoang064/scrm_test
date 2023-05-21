<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

require_once("modules/Administration/Administration.php");

class Viewgooglesignin_config extends SugarView {

    public function preDisplay() {
        global $current_user;
        global $sugar_config;
        if (!is_admin($current_user)) {
            sugar_die("Unauthorized access to administration.");
        }
       require_once('modules/GoogleSignIn/license/GoogleSignInOutfittersLicense.php');
       $validate = GoogleSignInOutfittersLicense::isValid('GoogleSignIn');
       if ($validate != 1) {
           header('Location: index.php?module=GoogleSignIn&action=license');
       }
    }

    public function display() {

        require_once('include/Sugar_Smarty.php');
        global $sugar_config, $db;

        if (!is_admin($GLOBALS['current_user'])) {
            sugar_die('You do not have permission.');
        }

        $googlesignin_admin = new Administration();
        $googlesignin_ss = new Sugar_Smarty();
        

        if ((isset($_POST['save_googlesingin'])) && (!empty($_POST['save_googlesingin']))) {
            // Saving googlesignin configuration
            $googlesignin_admin->saveSetting('googlesignin_config', 'enabled_google', $_REQUEST['enabled_google']);
            $googlesignin_admin->saveSetting('googlesignin_config', 'client_id', $_REQUEST['client_id']);
            $googlesignin_admin->saveSetting('googlesignin_config', 'client_secret', $_REQUEST['client_secret']);
            $googlesignin_admin->saveSetting('googlesignin_config', 'redirect_url', $_REQUEST['redirect_url']);
            
            SugarApplication::redirect('index.php?module=GoogleSignIn&action=googlesignin_config');
            
        }else
        {
            $settings_googlesignin = $googlesignin_admin->retrieveSettings('googlesignin_config');
            if($settings_googlesignin->settings['googlesignin_config_enabled_google'] == "on")
            {
             $googlesignin_ss->assign('enabled_google', "checked");
            }else
            {
             $googlesignin_ss->assign('enabled_google', "");   
            }
            $googlesignin_ss->assign('client_id', $settings_googlesignin->settings['googlesignin_config_client_id']);
            $googlesignin_ss->assign('client_secret', $settings_googlesignin->settings['googlesignin_config_client_secret']);
            
            $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
            $redirect_to  = explode("?", $actual_link);
            
            if(empty($settings_googlesignin->settings['googlesignin_config_redirect_url']))
            {
              $finalurl = $redirect_to[0]."?entryPoint=GoogleSignIn_Options";    
            }else
            {
              $finalurl = $settings_googlesignin->settings['googlesignin_config_redirect_url'];  
            }

            $googlesignin_ss->assign('redirect_url', $finalurl);
            //$googlesignin_ss->assign('redirect_url', $settings_googlesignin->settings['googlesignin_config_redirect_url']);
        }

        $googlesignin_ss->assign('MOD', $GLOBALS['mod_strings']);
        $googlesignin_ss->assign('APP', $GLOBALS['app_strings']);
        echo $googlesignin_ss->fetch('modules/GoogleSignIn/tpls/googlesignin_config.tpl');
    }

}
