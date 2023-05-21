<?php

if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
/* * *******************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
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
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
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
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 * ****************************************************************************** */




/**
 * This file is used to control the authentication process. 
 * It will call on the user authenticate and controll redirection 
 * based on the users validation
 *
 */
require_once('modules/Users/authentication/SugarAuthenticate/SugarAuthenticate.php');

class GMailAuthenticate extends SugarAuthenticate {

    var $userAuthenticateClass = 'GMailAuthenticateUser';
    var $authenticationDir = 'GMailAuthenticate';

    /**
     * Constructs EmailAuthenticate
     * This will load the user authentication class
     *
     * @return GMailAuthenticate
     */
    function GMailAuthenticate() {

        parent::SugarAuthenticate();
    }

    function loginAuthenticate($user_email, $password, $fallback = false, $PARAMS = array()) {

        global $mod_strings;
        unset($_SESSION['login_error']);
        $usr = new user();
		$user_email = $_SESSION['user_email'];
        $usr = $usr->retrieve_by_email_address($user_email);
		$GLOBALS['log']->fatal($usr->loggedIn);
        $_SESSION['login_error'] = '';
        $_SESSION['waiting_error'] = '';
        $_SESSION['hasExpiredPassword'] = '0';
        if ($this->userAuthenticate->loadUserOnLogin($user_email, $password, $fallback, $PARAMS)) {
            // now that user is authenticated, reset loginfailed
            if ($usr->getPreference('loginfailed') != '' && $usr->getPreference('loginfailed') != 0) {
                $usr->setPreference('loginfailed', '0');
                $usr->savePreferencesToDB();
            }
            return $this->postLoginAuthenticate();
        } else {
            if (!empty($usr_id) && $res['lockoutexpiration'] > 0) {
                if (($logout = $usr->getPreference('loginfailed')) == '')
                    $usr->setPreference('loginfailed', '1');
                else
                    $usr->setPreference('loginfailed', $logout + 1);
                $usr->savePreferencesToDB();
            }
        }
        if (strtolower(get_class($this)) != 'sugarauthenticate') {
            $sa = new SugarAuthenticate();
            $error = (!empty($_SESSION['login_error'])) ? $_SESSION['login_error'] : '';
            if ($sa->loginAuthenticate($user_email, $password, true, $PARAMS)) {
                return true;
            }
            $_SESSION['login_error'] = $error;
        }
		
		unset($_SESSION['user_name']);
		unset($_SESSION['user_email']);
        if (empty($_SESSION['login_error'])) {
            $_SESSION['login_error'] = translate('ERR_INVALID_PASSWORD', 'Users');
        }

        return false;
    }

}
