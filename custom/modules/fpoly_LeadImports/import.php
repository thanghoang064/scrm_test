<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
//Tripv Sửa lỗi không tồn tại các giá trị 9/12/2019
class LeadImporter
{
	private function move_data($import, $lead)
	{
		$lead->area_c = $import->area1_c;
		$lead->topic_c = $import->topic_c;
		$lead->source_c = $import->source_c;
		$lead->created_by = $import->created_by;
		$lead->assigned_user_id = $import->assigned_user_id;
		$lead->modified_user_id = $import->modified_user_id;
		$lead->phone_mobile = $import->phone_mobile;
		$lead->phone_home = $import->phone_home;
		$lead->phone_work = $import->phone_work;
		$lead->phone_other = $import->phone_other;
		$lead->description = $import->description;
		$lead->call_log_c = $import->description;
		$lead->last_name = $import->name;
		$lead->birthdate = $import->birthdate;
		$lead->status = $import->status;
		$lead->class_c = $import->class;
		$lead->school_c = $import->school;
		$lead->email_c = $import->email;
		$lead->facebook_c = $import->facebook;
		isset($import->program_c) ? $lead->program_c = $import->program_c : $lead->program_c = '';
		// $lead->program_c = $import->program_c; 
		isset($import->place_of_study_c) ? $lead->place_of_study_c = $import->place_of_study_c : $lead->place_of_study_c = '';
		//$lead->place_of_study_c = $import->place_of_study_c;
		$lead->expected_major_c = $import->expected_major;
		$lead->expected_job_c = $import->expected_job;
		$lead->jjwg_maps_address_c = $import->address;
		$lead->primary_address_city = $import->city;
		isset($import->dot_nhap_hoc_c) ? $lead->dot_nhap_hoc_c = $import->dot_nhap_hoc_c : $lead->dot_nhap_hoc_c = '';
		// $lead->dot_nhap_hoc_c = $import->dot_nhap_hoc_c;
		$lead->parent1_name_c = $import->parent1_name;
		$lead->lead_source = $import->lead_source;
		$lead->rating_c = $import->rating;
		isset($import->time_to_study_c) ? $lead->time_to_study_c = $import->time_to_study_c : $lead->time_to_study_c = '';
		//$lead->time_to_study_c = $import->time_to_study_c;
		$lead->batch_name_c = $import->batch_name_c;
		$lead->year_enrolled_c = $import->year_enrolled_c;
		$lead->primary_address_state = $import->district_c;

		//namnv
		$lead->follow_status_reason_c = $import->follow_status_reason_c;
		$lead->expected_major_2_c = isset($import->expected_major_2_c) ? $import->expected_major_2_c : "";
		$lead->barriers_c = $import->barriers_c;

		isset($import->content_c) ? $lead->content_c = $import->content_c : $lead->content_c = '';


		isset($import->lead_import_marketing_c) ? $lead->marketing_c = $import->lead_import_marketing_c : $lead->marketing_c = '';

		// $GLOBALS['log']->fatal($lead->expected_major_c);
		// $GLOBALS['log']->fatal($lead->expected_major_2_c);


		$lead->dup_c = $import->dup_c;
		$lead->update_date_modified = false;
		$lead->update_modified_by = false;
		$lead->set_created_by = false;
		$lead->update_date_entered = false;
	}
	private function check_if_pr($user_id)
	{
		global $db;
		$pr_group_id = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';
		$count = 0;
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
	function import_leads($bean, $event, $argument)
	{

		include_once 'custom/api_ants.php';
		// unset($bean);
		if (empty($bean->fetched_row['id'])) {
			$bean->date_entered = null;
			$bean->date_modified = null;

			$co_so = trim(strtolower($bean->area1_c));
			$dup = $bean->duplicate_status;

			$lead = BeanFactory::newBean('Leads');

			$hcm_group_id = 'b9f05e38-7c48-2de3-721f-589d3ff27e78';
			$hn_group_id = 'd38a052c-3bfe-7286-f088-589d417b1578';
			$pr_group_id = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';
			$tn_group_id = '9fd2a5c7-dad7-c0ff-1469-589d403d0ced';
			$dn_group_id = '4ad7e29a-c17e-eb4a-cb88-589d61641f51';
			//$kbeauty_group_id = 'ca301f53-9ac6-40f6-931c-58ec4fc47110';
			$kbeauty_hn_group_id = '7fe1a7a9-5b84-7447-0c37-592f97135c62';
			$kbeauty_hcm_group_id = '390447ba-fc1c-9172-b894-592f97096458';
			$kbct_group_id = '65d0d089-2931-26a7-bd98-63ec90ae90b2';
			$ct_group_id = 'c7708bb1-668d-ba86-7c91-5a94bf7f722c';
			$dahn_group_id = '2958379b-c494-b93f-513b-5ae1a266a437';
			$dahcm_group_id = '5e425644-9cec-821e-7859-5ae1a255fcd3';
			$hp_group_id = 'd7576688-99c0-52e4-b22f-6257cb378032';
			$th_group_id = '724c8860-b55f-69e8-27b9-637b40a89488';
			$hna_group_id = 'aed1f6fb-7364-653a-270d-637b4069ab85';
			$qn_group_id = 'b151efd4-969f-ffbc-4758-637b40674e6d';
			$dna_group_id = 'd9a88517-cb4f-d3a7-bb0d-63b7816f0f0a';
			$tng_group_id = '4d47149e-448c-89fc-5ee8-63a18b4497eb';

			if ($dup == 'new') {

				//$GLOBALS['log']->fatal($bean);
				switch ($co_so) {
					case 'hcm':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($hcm_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'hn':
						$this->move_data($bean, $lead);
						// var_dump($lead);
						// die;
						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->SecurityGroups->add($hn_group_id);


							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
							break;
						} else {
							unset($lead);
						}

						break;
					case 'tn':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($tn_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();

							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'dn':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($dn_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							//var_dump($lead);
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'kbhn':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($kbeauty_hn_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'kbhcm':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($kbeauty_hcm_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'ct':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($ct_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'dahn':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($dahn_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'dahcm':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($dahcm_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'hp':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($hp_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'th':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($th_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'hna':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($hna_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;

					case 'qn':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($qn_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'dna':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($dna_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'tng':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($tng_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
					case 'kbct':
						$this->move_data($bean, $lead);

						if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
							$lead->save();
							$lead->load_relationship('SecurityGroups');
							$lead->SecurityGroups->add($kbct_group_id);
							if ($this->check_if_pr($bean->created_by)) {
								$lead->SecurityGroups->add($pr_group_id);
							}
							$lead->save();
							$result = CreateLeadAPI($lead);
							$GLOBALS['log']->fatal($result);
						} else {
							unset($lead);
						}

						break;
				}
			}
		}
	}
}
