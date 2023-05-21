<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.

 * SuiteCRM is an extension to SugarCRM Community Edition developed by Salesagility Ltd.
 * Copyright (C) 2011 - 2014 Salesagility Ltd.
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
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for  technical reasons, the Appropriate Legal Notices must
 * display the words  "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 ********************************************************************************/

//require_once('modules/Accounts/views/view.edit.php');
class fpoly_LeadImportsViewEdit extends ViewEdit
{
	public function __construct()
	{
		parent::__construct();
		// $this->useForSubpanel = true;
		// $this->useModuleQuickCreateTemplate = true;
	}

	public function display()
	{
		if (!empty($_REQUEST['record'])) {
			echo '<div class="alert alert-danger">Chức năng chỉnh sửa bản ghi trong module <strong>Lead Imports</strong> đã bị vô hiệu hóa.<br />Module <strong>Lead Imports</strong> được thiết kế để lưu lại lịch sử nhập lead lên CRM nhằm tham chiếu lại sau này nên không cho phép sửa đổi.';
		} else {
			$this->ev->process();
			echo $this->ev->display($this->showTitle);
			if ($this->getPermissions()) {
				echo $this->showDefaultField();
			}
		}
	}

	private function showDefaultField()
	{
		$script = '<script type="text/javascript">';
		$script .= "
			$('#source_c option[value=online]').attr('selected','selected');
			$('#rating option[value=lead_online]').attr('selected','selected');
			$('#status option[value=active_lead]').attr('selected','selected');
			$('#dot_nhap_hoc_c option[value=May_2023]').attr('selected','selected');
		  ";
		$script .= '</script>';
		return $script;
	}

	private function getPermissions()
	{
		global $db;
		$user_id = $this->bean->assigned_user_id;
		$pr_group_id = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';
		$sql = "SELECT COUNT(*) as `count` FROM `securitygroups_users` WHERE `user_id` = '$user_id' AND `securitygroup_id`  = '$pr_group_id' AND deleted = 0";
		$result = $db->query($sql);

		if ($db->getRowCount($result) > 0) {
			$row = $db->fetchByAssoc($result);
			$count = $row['count'];
			if ($count > 0)
				return true;
		}
		return false;
	}
}
