<?php
function console_log( $data ){
  echo '<script>';
  echo 'console.log('. json_encode( $data ) .')';
  echo '</script>';
}
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class LeadImportChecker {
	private function sanitizePhone($mobile) {
		$mobile = preg_replace('/[^\d]/','', $mobile);
		if(substr($mobile, 0, 1) != '0')
			$mobile = '0' . $mobile;
		return $mobile;
	}
	function mark_auto_assign_leads($bean, $event, $argument) {
		 global $current_user;
		if (empty($bean->fetched_row['id']) && ($bean->assigned_user_id == $current_user->id) || empty($bean->assigned_user_id)) {
			$bean->auto_assign_c = 1;
		}
	}
	function check_if_duplicate($bean, $event, $argument) {
		global $current_user, $db;
		$online_group_id = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';
		$group_id = '';
		$phone_mobile = $this->sanitizePhone($bean->phone_mobile);
		$phone_home = $this->sanitizePhone($bean->phone_home);
		$phone_work = $this->sanitizePhone($bean->phone_work);
		$phone_other = $this->sanitizePhone($bean->phone_other);
		$facebook = trim($bean->facebook);
		$email = trim($bean->email);
		
		$topic = trim($bean->topic_c);
		$source = trim($bean->source_c);
		$created_by=trim($bean->created_by);
		$lead_source = trim($bean->lead_source);
		
		
		if(empty($bean->fetched_row['id'])) {
			if(empty($email) && empty($phone_mobile) && empty($phone_home) && empty($facebook))
				$bean->duplicate_status = 'missing';
			elseif(strlen($phone_mobile) >10 ||  strlen($phone_home) >10  ||  strlen($phone_work) >10 ||  strlen($phone_other) >10){				
				$bean->duplicate_status = 'phone_11_number';
			}else {
				$phone_mobile = $this->sanitizePhone($bean->phone_mobile);
				$phone_home = $this->sanitizePhone($bean->phone_home);
				$phone_work = $this->sanitizePhone($bean->phone_work);
				$phone_other = $this->sanitizePhone($bean->phone_other);
				$phone_list = array();
				if(!empty($phone_home))
					$phone_list[] = $phone_home;
				if(!empty($phone_mobile))
					$phone_list[] = $phone_mobile;
				if(!empty($phone_work))
					$phone_list[] = $phone_work;
				if(!empty($phone_other))
					$phone_list[] = $phone_other;
				if(!empty($phone_list)) {
					$phone_list_string = implode("','", $phone_list);
					$sql = "SELECT * FROM leads WHERE deleted = 0 AND phone_mobile IN ('".$phone_list_string."') AND deleted = 0 OR phone_home IN ('".$phone_list_string."') AND deleted = 0 OR phone_work IN ('".$phone_list_string."') AND deleted = 0 OR phone_other IN ('".$phone_list_string."') ";
					//$sql = "SELECT COUNT(*) as `count` FROM leads a INNER JOIN securitygroups_records b ON a.id = b.record_id WHERE (a.phone_mobile IN ('".$phone_list_string."') OR a.phone_home IN ('".$phone_list_string."')) AND a.deleted = 0 AND b.deleted = 0 AND b.module = 'Leads' AND b.securitygroup_id = '$group_id'";
					//$sql = "SELECT * FROM leads a, leads_cstm b WHERE a.id=b.id_c AND (a.phone_mobile IN ('".$phone_list_string."') OR a.phone_home IN ('".$phone_list_string."') OR a.phone_work IN ('".$phone_list_string."') OR a.phone_other IN ('".$phone_list_string."')) AND a.deleted = 0";
						//$GLOBALS['log']->fatal($sql);
						$result = $db->query($sql);
						$count = $db->getRowCount($result);
						
						if($count > 0) {
							$row = $db->fetchByAssoc($result);
							$id_lead = $row['id'];
							
							$sql_leadcstm = "SELECT * FROM leads_cstm where id_c = '$id_lead'";
							$result_leadcstm = $db->query($sql_leadcstm);
							$row_leadcstm = $db->fetchByAssoc($result_leadcstm);
							

							$row = array_merge($row, $row_leadcstm);
							$lead_id = trim($row['id']);
							$topic_c=trim($row['topic_c']);
							$source_c=trim($row['source_c']);
							
							if($topic_c=='DATAMUA' && $bean->source_c == 'online'){
								if($bean->source_c == 'online') {
									$sql = "SELECT COUNT(*) as `count` FROM fpoly_leadimports a WHERE (a.phone_mobile IN ('".$phone_list_string."') OR a.phone_home IN ('".$phone_list_string."')) AND a.deleted = 0";
								} else {
									$sql = "SELECT COUNT(*) as `count` FROM fpoly_leadimports a INNER JOIN fpoly_leadimports_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('".$phone_list_string."') OR a.phone_home IN ('".$phone_list_string."')) AND b.source_c = 'online' AND a.deleted = 0";
								}
								$result_import = $db->query($sql);
								$row_import = $db->fetchByAssoc($result_import);
								$import_count = $row_import['count'];
								if($import_count > 0 && !empty($lead_id)) {
									$date_modified=date("Y-m-d H:i:s"); 
									//mysqli_query("UPDATE leads_cstm SET topic_c='$topic',source_c='$source' WHERE id_c='$lead_id'");
									$sql1="UPDATE leads SET created_by='$created_by',status='active_lead' WHERE id='$lead_id'";
									$GLOBALS['log']->fatal($sql1);
									$db->query($sql1);
									$sql="UPDATE leads_cstm SET topic_c='$topic',source_c='$source',rating_c='lead_online' WHERE id_c='$lead_id'";
									$GLOBALS['log']->fatal($sql);
									$db->query($sql);
									//insert securitygroup_id
									$sql2="INSERT INTO `securitygroups_records`(`securitygroup_id`, `record_id`, `module`, `date_modified`, `modified_user_id`, `created_by`) VALUES ('$online_group_id','$lead_id','Leads','$date_modified','$created_by','$created_by')";
									$GLOBALS['log']->fatal($sql2);
									$db->query($sql2);
									
									
									
									$lead = BeanFactory::getBean('Leads', $lead_id);
									$lead->update_date_modified = false;
									$lead->dup_c = $import_count;
									$lead->last_dup_c = TimeDate::getInstance()->getNow(true)->asDb();
									//$lead->topic_c = $a;
									//$lead->source_c = 'online';
									$lead->new_dup_c = 1;
									$lead->save();
								}
								$bean->dup_c = $import_count;
								$bean->duplicate_status = 'datamua_dup';


							}elseif($source_c=='offline' && $bean->source_c == 'online'){


								if($bean->source_c == 'online') {
									$sql = "SELECT COUNT(*) as `count` FROM fpoly_leadimports a WHERE (a.phone_mobile IN ('".$phone_list_string."') OR a.phone_home IN ('".$phone_list_string."')) AND a.deleted = 0";
								} else {
									$sql = "SELECT COUNT(*) as `count` FROM fpoly_leadimports a INNER JOIN fpoly_leadimports_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('".$phone_list_string."') OR a.phone_home IN ('".$phone_list_string."')) AND b.source_c = 'online' AND a.deleted = 0";
								}
								$result_import = $db->query($sql);
								$row_import = $db->fetchByAssoc($result_import);
								$import_count = $row_import['count'];
								if($import_count > 0 && !empty($lead_id)) {
									$date_modified=date("Y-m-d H:i:s"); 
									//mysqli_query("UPDATE leads_cstm SET topic_c='$topic',source_c='$source' WHERE id_c='$lead_id'");
									// $sql1="UPDATE leads SET created_by='$created_by',status='active_lead' WHERE id='$lead_id'";
									// $GLOBALS['log']->fatal($sql1);
									// $db->query($sql1);
									

									$sql="UPDATE leads_cstm SET source_2_c='$source',lead_source_2_c='$lead_source' WHERE id_c='$lead_id'";
									
									$GLOBALS['log']->fatal($sql);
									$db->query($sql);
									
									//insert securitygroup_id
							
									$online_group_id2 = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';
									$sql2="INSERT INTO `securitygroups_records`(`securitygroup_id`, `record_id`, `module`, `date_modified`, `modified_user_id`, `created_by`) VALUES ('$online_group_id2','$lead_id','Leads','$date_modified','$created_by','$created_by')";
									//echo $sql2;exit;
									$GLOBALS['log']->fatal($sql2);
									$db->query($sql2);
									//console_log($sql2);
									//echo $sql2;exit;
									$pr_group_id= '4d76ecb8-494c-86d6-4fdb-589d41939b5d';

									$lead = BeanFactory::getBean('Leads', $lead_id);
									if($lead){
										$lead->load_relationship('SecurityGroups');
										$lead->SecurityGroups->add($pr_group_id);
										$lead->update_date_modified = false;
										$lead->dup_c = $import_count;
										$lead->last_dup_c = TimeDate::getInstance()->getNow(true)->asDb();
										//$lead->topic_c = $a;
										//$lead->source_c = 'online';
										$lead->new_dup_c = 1;
										$lead->save();
									}
									
								}
								$bean->dup_c = $import_count;
								// $bean->duplicate_status = 'dup_dup';
								$bean->duplicate_status = 'global_dup';

								
							}else{

								if($bean->source_c == 'online') {
									$sql = "SELECT COUNT(*) as `count` FROM fpoly_leadimports a WHERE (a.phone_mobile IN ('".$phone_list_string."') OR a.phone_home IN ('".$phone_list_string."')) AND a.deleted = 0";
								} else {
									$sql = "SELECT COUNT(*) as `count` FROM fpoly_leadimports a INNER JOIN fpoly_leadimports_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('".$phone_list_string."') OR a.phone_home IN ('".$phone_list_string."')) AND b.source_c = 'online' AND a.deleted = 0";
								}
								$result_import = $db->query($sql);
								$row_import = $db->fetchByAssoc($result_import);
								$import_count = $row_import['count'];
							

								if($import_count > 0 && !empty($lead_id)) {
									$lead = BeanFactory::getBean('Leads', $lead_id);
									if($lead){
										$lead->update_date_modified = false;
										$lead->dup_c = $import_count;
										$lead->last_dup_c = TimeDate::getInstance()->getNow(true)->asDb();
										$lead->new_dup_c = 1;
										$lead->save();
									}
							
								}
								$bean->dup_c = $import_count;
								$bean->duplicate_status = 'global_dup';
							}
						
						} else
							$bean->duplicate_status = 'new';

				} else

					$bean->duplicate_status = 'new';
			}
		}
	}
}