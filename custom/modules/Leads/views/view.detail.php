<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

/*********************************************************************************
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
 ********************************************************************************/

require_once('include/MVC/View/views/view.detail.php');

class LeadsViewDetail extends ViewDetail
{

    function display()
    {
        global $sugar_config;
        require_once('modules/AOS_PDF_Templates/formLetter.php');
        formLetter::DVPopupHtml('Leads');

        //If the convert lead action has been disabled for already converted leads, disable the action link.
        $disableConvert = ($this->bean->converted == 1 && !empty($sugar_config['disable_convert_lead'])) ? TRUE : FALSE;
        $this->ss->assign("DISABLE_CONVERT_ACTION", $disableConvert);
        parent::display();
    }

    public function preDisplay()
    {
        parent::preDisplay();
        if (!empty($_REQUEST['marked']) && $_REQUEST['marked'] && $this->bean->date_viewed_c != 1) {
            $this->bean->mark_as_viewed_c = 1;
            $this->bean->save();
        }
    }

    function listViewPrepare()
    {
        $module = $GLOBALS['module'];
        /* BEGIN - SECURITY GROUPS */
        $metadataFile = null;
        $foundViewDefs = false;
        if (empty($_SESSION['groupLayout'])) {
            //get primary group id of current user and check to see if a layout exists for that group
            require_once('modules/SecurityGroups/SecurityGroup.php');
            $primary_group_id = SecurityGroup::getPrimaryGroupID();
            if (!empty($primary_group_id) && file_exists('custom/modules/' . $this->module . '/metadata/' . $primary_group_id . '/listviewdefs.php')) {
                $_SESSION['groupLayout'] = $primary_group_id;
                $metadataFile = 'custom/modules/' . $this->module . '/metadata/' . $primary_group_id . '/listviewdefs.php';
            }
        } else {
            if (file_exists('custom/modules/' . $this->module . '/metadata/' . $_SESSION['groupLayout'] . '/listviewdefs.php')) {
                $metadataFile = 'custom/modules/' . $this->module . '/metadata/' . $_SESSION['groupLayout'] . '/listviewdefs.php';
            }
        }
        if (isset($metadataFile)) {
            $foundViewDefs = true;
        } else {
            $metadataFile = $this->getMetaDataFile();
        }
        /* END - SECURITY GROUPS */

        if (!file_exists($metadataFile))
            sugar_die($GLOBALS['app_strings']['LBL_NO_ACTION']);

        require($metadataFile);

        $this->listViewDefs = $listViewDefs;

        if (!empty($this->bean->object_name) && isset($_REQUEST[$module . '2_' . strtoupper($this->bean->object_name) . '_offset'])) {//if you click the pagination button, it will populate the search criteria here
            if (!empty($_REQUEST['current_query_by_page'])) {//The code support multi browser tabs pagination
                $blockVariables = array('mass', 'uid', 'massupdate', 'delete', 'merge', 'selectCount', 'request_data', 'current_query_by_page', $module . '2_' . strtoupper($this->bean->object_name) . '_ORDER_BY');
                if (isset($_REQUEST['lvso'])) {
                    $blockVariables[] = 'lvso';
                }
                $current_query_by_page = json_decode(html_entity_decode($_REQUEST['current_query_by_page']), true);
                foreach ($current_query_by_page as $search_key => $search_value) {
                    if ($search_key != $module . '2_' . strtoupper($this->bean->object_name) . '_offset' && !in_array($search_key, $blockVariables)) {
                        if (!is_array($search_value)) {
                            $_REQUEST[$search_key] = securexss($search_value);
                        } else {
                            foreach ($search_value as $key => &$val) {
                                $val = securexss($val);
                            }
                            $_REQUEST[$search_key] = $search_value;
                        }
                    }
                }
            }
        }
        if (!empty($_REQUEST['saved_search_select'])) {
            if ($_REQUEST['saved_search_select'] == '_none' || !empty($_REQUEST['button'])) {
                $_SESSION['LastSavedView'][$_REQUEST['module']] = '';
                unset($_REQUEST['saved_search_select']);
                unset($_REQUEST['saved_search_select_name']);

                //use the current search module, or the current module to clear out layout changes
                if (!empty($_REQUEST['search_module']) || !empty($_REQUEST['module'])) {
                    $mod = !empty($_REQUEST['search_module']) ? $_REQUEST['search_module'] : $_REQUEST['module'];
                    global $current_user;
                    //Reset the current display columns to default.
                    $current_user->setPreference('ListViewDisplayColumns', array(), 0, $mod);
                }
            } else if (empty($_REQUEST['button']) && (empty($_REQUEST['clear_query']) || $_REQUEST['clear_query'] != 'true')) {
                $this->saved_search = loadBean('SavedSearch');
                $this->saved_search->retrieveSavedSearch($_REQUEST['saved_search_select']);
                $this->saved_search->populateRequest();
            } elseif (!empty($_REQUEST['button'])) { // click the search button, after retrieving from saved_search
                $_SESSION['LastSavedView'][$_REQUEST['module']] = '';
                unset($_REQUEST['saved_search_select']);
                unset($_REQUEST['saved_search_select_name']);
            }
        }
        $this->storeQuery = new StoreQuery();
        if (!isset($_REQUEST['query'])) {
            $this->storeQuery->loadQuery($this->module);
            $this->storeQuery->populateRequest();
        } else {
            $this->storeQuery->saveFromRequest($this->module);
        }

        $this->seed = $this->bean;

        $displayColumns = array();
        if (!empty($_REQUEST['displayColumns'])) {
            foreach (explode('|', $_REQUEST['displayColumns']) as $num => $col) {
                if (!empty($this->listViewDefs[$module][$col]))
                    $displayColumns[$col] = $this->listViewDefs[$module][$col];
            }
        } else {
            foreach ($this->listViewDefs[$module] as $col => $this->params) {
                if (!empty($this->params['default']) && $this->params['default'])
                    $displayColumns[$col] = $this->params;
            }
        }
        $this->params = array('massupdate' => true);
        if (!empty($_REQUEST['orderBy'])) {
            $this->params['orderBy'] = $_REQUEST['orderBy'];
            $this->params['overrideOrder'] = true;
            if (!empty($_REQUEST['sortOrder'])) $this->params['sortOrder'] = $_REQUEST['sortOrder'];
        }
        $this->lv->displayColumns = $displayColumns;

        $this->module = $module;

        $this->prepareSearchForm();

        if (isset($this->options['show_title']) && $this->options['show_title']) {
            $moduleName = isset($this->seed->module_dir) ? $this->seed->module_dir : $GLOBALS['mod_strings']['LBL_MODULE_NAME'];


//BEGIN - SECURITY GROUPS - create rights
            /**
             * echo $this->getModuleTitle(true);
             */
            $show_create_link = false;
            if (ACLController::moduleSupportsACL($this->seed->module_dir) && !ACLController::checkAccess($this->seed->module_dir, 'create', true)) {
                $show_create_link = false;
            }
            echo $this->getModuleTitle($show_create_link);
//END - SECURITY GROUPS - create rights

        }
    }
}

?>
