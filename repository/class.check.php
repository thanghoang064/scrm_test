<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class ApiLeadImportChecker
{
    private function sanitizePhone($mobile)
    {
        $mobile = preg_replace('/[^\d]/', '', $mobile);
        if (substr($mobile, 0, 1) != '0')
            $mobile = '0' . $mobile;
        return $mobile;
    }

    function mark_auto_assign_leads($bean, $event, $argument)
    {
        global $current_user;
        if (empty($bean->fetched_row['id']) && ($bean->assigned_user_id == $current_user->id) || empty($bean->assigned_user_id)) {
            $bean->auto_assign_c = 1;
        }
    }

    private function if_exist($data)
    {
        if (isset($data)) {

            if ($data != '' && $data != null) {
                return $data;
            }
            return '';
        }
        return '';
    }

    function check_if_duplicate($bean)
    {
        global $db;
        $online_group_id = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';

        $phone_mobile = $this->sanitizePhone($bean->phone_mobile);
        $phone_home = $this->sanitizePhone($bean->phone_home);
        $phone_work = $this->sanitizePhone($bean->phone_work);
        $phone_other = $this->sanitizePhone($bean->phone_other);
        $facebook = trim($bean->facebook);
        $email = trim($bean->email);

        $topic = trim($bean->topic_c);
        $source = trim($bean->source_c);
        $created_by = trim($bean->created_by);
        $lead_source = trim($bean->lead_source);


        if (empty($bean->fetched_row['id'])) {
            if (empty($email) && empty($phone_mobile) && empty($phone_home) && empty($facebook))
                $bean->duplicate_status = 'missing';
            elseif (strlen($phone_mobile) > 10 || strlen($phone_mobile) < 10 ||  strlen($phone_home) > 10  ||  strlen($phone_work) > 10 ||  strlen($phone_other) > 10) {
                $bean->duplicate_status = 'phone_11_number';
            }else {
                $phone_mobile = $this->sanitizePhone($bean->phone_mobile);
                $phone_home = $this->sanitizePhone($bean->phone_home);
                $phone_work = $this->sanitizePhone($bean->phone_work);
                $phone_other = $this->sanitizePhone($bean->phone_other);
                $phone_list = array();
                if (!empty($phone_home))
                    $phone_list[] = $phone_home;
                if (!empty($phone_mobile))
                    $phone_list[] = $phone_mobile;
                if (!empty($phone_work))
                    $phone_list[] = $phone_work;
                if (!empty($phone_other))
                    $phone_list[] = $phone_other;
                if (!empty($phone_list)) {
                    $phone_list_string = implode("','", $phone_list);
                    $sql = "SELECT * FROM leads WHERE deleted = 0 AND phone_mobile IN ('" . $phone_list_string . "') AND deleted = 0 OR phone_home IN ('" . $phone_list_string . "') AND deleted = 0 OR phone_work IN ('" . $phone_list_string . "') AND deleted = 0 OR phone_other IN ('" . $phone_list_string . "') ";

                    $result = $db->query($sql);
                    $count = $db->getRowCount($result);

                    if ($count > 0) {
                        $row = $db->fetchByAssoc($result);
                        $id_lead = $row['id'];

                        $sql_leadcstm = "SELECT * FROM leads_cstm where id_c = '$id_lead'";
                        $result_leadcstm = $db->query($sql_leadcstm);
                        $row_leadcstm = $db->fetchByAssoc($result_leadcstm);

                        $lead_id = trim($row['id']);

                        $obj = [];

                        foreach ($row as $k => $v) {
                            if ($v === '' || $v === 'undefined' || $v === NULL || $v === '0') {
                                $obj[$k] = $v;
                            }
                        }
                        foreach ($row_leadcstm as $k => $v) {
                            if ($v === '' || $v === 'undefined' || $v === NULL || $v === '0') {
                                $obj[$k] = $v;
                            }
                        }
			
                        $arr_data_change_lead = ['phone_home' => $this->if_exist($bean->phone_home), 'phone_work' => $this->if_exist($bean->phone_work), 'phone_other' => $this->if_exist($bean->phone_other), 'last_name' => $this->if_exist($bean->name), 'status' => $this->if_exist($bean->status), 'primary_address_city' => $this->if_exist($bean->city), 'lead_source' => $this->if_exist($bean->lead_source)];
                        $arr_data_change_lead_c = ['content_c' => $this->if_exist($bean->content_c), 'class_c' => $this->if_exist($bean->class), 'school_c' => $this->if_exist($bean->school), 'email_c' => $this->if_exist($bean->email), 'facebook_c' => $this->if_exist($bean->facebook), 'expected_major_c' => $this->if_exist($bean->expected_major), 'expected_job_c' => $this->if_exist($bean->expected_job), 'jjwg_maps_address_c' => $this->if_exist($bean->address), 'dot_nhap_hoc_c' => $this->if_exist($bean->dot_nhap_hoc_c), 'parent1_name_c' => $this->if_exist($bean->parent1_name), 'rating_c' => $this->if_exist($bean->rating), 'batch_name_c' => $this->if_exist($bean->batch_name_c), 'year_enrolled_c' => $this->if_exist($bean->year_enrolled_c)];
                        isset($bean->program_c) ? $arr_data_change_lead_c['program_c'] = $this->if_exist($bean->program_c) : $arr_data_change_lead_c['program_c'] = '';
                        isset($bean->place_of_study_c) ? $arr_data_change_lead_c['place_of_study_c'] = $this->if_exist($bean->place_of_study_c) : $arr_data_change_lead_c['place_of_study_c'] = '';
                        isset($bean->time_to_study_c) ? $arr_data_change_lead_c['time_to_study_c'] = $this->if_exist($bean->time_to_study_c) : $arr_data_change_lead_c['time_to_study_c'] = '';
                        isset($bean->description) ? $arr_data_change_lead_c['call_log_c'] = $this->if_exist($bean->description) : $arr_data_change_lead_c['call_log_c'] = '';
                        isset($bean->birthdate) ? $arr_data_change_lead['birthdate'] = $this->if_exist($bean->birthdate) : $arr_data_change_lead['birthdate'] = '';
			            // thienth - begin cập nhật trùng lead
                        isset($bean->graduation_cer_c) ? $arr_data_change_lead_c['graduation_cer_c'] = $this->if_exist($bean->graduation_cer_c) : $arr_data_change_lead_c['graduation_cer_c'] = '';
                        // thienth - end cập nhật trùng lead
                        isset($bean->lead_import_marketing_c) ? $arr_data_change_lead_c['marketing_c'] = $this->if_exist($bean->lead_import_marketing_c) : $arr_data_change_lead_c['marketing_c'] = '';
                       
                        $sql_lead = "UPDATE leads SET ";
                        $sql_lead_c = "UPDATE leads_cstm SET ";
                        $c1 = 0;
                        $c2 = 0;

                        foreach ($obj as $key => $value) {
                            if (array_key_exists($key, $arr_data_change_lead)) {
                                if ($arr_data_change_lead[$key] != '' && $arr_data_change_lead[$key] != null) {
                                    $sql_lead .= "$key = '$arr_data_change_lead[$key]', ";
                                    $c1++;
                                }
                            }
                            if (array_key_exists($key, $arr_data_change_lead_c)) {
                                if ($arr_data_change_lead_c[$key] != '' && $arr_data_change_lead_c[$key] != null) {


                                    $sql_lead_c .= "$key = '$arr_data_change_lead_c[$key]', ";
                                    $c2++;
                                }
                            }
                        }
			
                        if ($c1 > 0) {
                            $sql_lead = rtrim($sql_lead, ", ");
                            $sql_lead .= " WHERE id = '$lead_id'";
                            $db->query($sql_lead);
                        }
                        if ($c2 > 0) {
                            $sql_lead_c = rtrim($sql_lead_c, ", ");
                            $sql_lead_c .= " WHERE id_c = '$lead_id'";

                            $db->query($sql_lead_c);
                        }

                        $row = array_merge($row, $row_leadcstm);

                        $lead_id = trim($row['id']);
                        $topic_c = trim($row['topic_c']);
                        $source_c = trim($row['source_c']);
                        if ($topic_c == 'DATAMUA' && $bean->source_c == 'online') {
                            if ($bean->source_c == 'online') {
                                $sql = "SELECT dup_c as `count` FROM leads a INNER JOIN leads_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('" . $phone_list_string . "') OR a.phone_home IN ('" . $phone_list_string . "')) AND a.deleted = 0";
                            } else {
                                $sql = "SELECT dup_c as `count` FROM leads a INNER JOIN leads_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('" . $phone_list_string . "') OR a.phone_home IN ('" . $phone_list_string . "')) AND b.source_c = 'online' AND a.deleted = 0";
                            }
                            $result_import = $db->query($sql);
                            $row_import = $db->fetchByAssoc($result_import);
                            $import_count = $row_import['count'];
                            if ($import_count >= 0 && !empty($lead_id)) {
                                $date_modified = date("Y-m-d H:i:s");
                                $sql1 = "UPDATE leads SET created_by='$created_by',status='active_lead' WHERE id='$lead_id'";
                                $GLOBALS['log']->fatal($sql1);
                                $db->query($sql1);
                                $sql = "UPDATE leads_cstm SET topic_c='$topic',source_c='$source',rating_c='lead_online' WHERE id_c='$lead_id'";
                                $GLOBALS['log']->fatal($sql);
                                $db->query($sql);
                                //insert securitygroup_id
                                $sql2 = "INSERT INTO `securitygroups_records`(`securitygroup_id`, `record_id`, `module`, `date_modified`, `modified_user_id`, `created_by`) VALUES ('$online_group_id','$lead_id','Leads','$date_modified','$created_by','$created_by')";
                                $GLOBALS['log']->fatal($sql2);
                                $db->query($sql2);



                                $lead = BeanFactory::getBean('Leads', $lead_id);
                                $lead->update_date_modified = false;
                                $lead->dup_c = $import_count + 1;
                                $lead->last_dup_c = TimeDate::getInstance()->getNow(true)->asDb();

                                $lead->new_dup_c = 1;
                                $lead->save();
                            }
                            $bean->dup_c = $import_count;
                            $bean->duplicate_status = 'datamua_dup';
                        } elseif ($source_c == 'offline' && $bean->source_c == 'online') {


                            if ($bean->source_c == 'online') {
                                $sql = "SELECT dup_c as `count` FROM leads a INNER JOIN leads_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('" . $phone_list_string . "') OR a.phone_home IN ('" . $phone_list_string . "')) AND a.deleted = 0";
                            } else {
                                $sql = "SELECT dup_c as `count` FROM leads a INNER JOIN leads_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('" . $phone_list_string . "') OR a.phone_home IN ('" . $phone_list_string . "')) AND b.source_c = 'online' AND a.deleted = 0";
                            }
                            $result_import = $db->query($sql);
                            $row_import = $db->fetchByAssoc($result_import);
                            $import_count = $row_import['count'];
                            if ($import_count >= 0 && !empty($lead_id)) {
                                $date_modified = date("Y-m-d H:i:s");

                                $sql = "UPDATE leads_cstm SET source_2_c='$source',lead_source_2_c='$lead_source' WHERE id_c='$lead_id'";

                                $GLOBALS['log']->fatal($sql);
                                $db->query($sql);

                                //insert securitygroup_id

                                $online_group_id2 = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';
                                $sql2 = "INSERT INTO `securitygroups_records`(`securitygroup_id`, `record_id`, `module`, `date_modified`, `modified_user_id`, `created_by`) VALUES ('$online_group_id2','$lead_id','Leads','$date_modified','$created_by','$created_by')";
                                
                                $GLOBALS['log']->fatal($sql2);
                                $db->query($sql2);
                                
                                $pr_group_id = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';
                                $lead = BeanFactory::getBean('Leads', $lead_id);
                                if ($lead) {
                                    $lead->load_relationship('SecurityGroups');
                                    $lead->SecurityGroups->add($pr_group_id);
                                    $lead->update_date_modified = false;
                                    $lead->dup_c = $import_count + 1;
                                    $lead->last_dup_c = TimeDate::getInstance()->getNow(true)->asDb();
                                    
                                    $lead->new_dup_c = 1;
                                    $lead->save();
                                }
                            }
                            $bean->dup_c = $import_count;

                            $bean->duplicate_status = 'global_dup';
                        } else {

                            if ($bean->source_c == 'online') {
                                $sql = "SELECT dup_c as `count` FROM leads a INNER JOIN leads_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('" . $phone_list_string . "') OR a.phone_home IN ('" . $phone_list_string . "')) AND a.deleted = 0";
                            } else {
                                $sql = "SELECT dup_c as `count` FROM leads a INNER JOIN leads_cstm b ON a.id=b.id_c WHERE (a.phone_mobile IN ('" . $phone_list_string . "') OR a.phone_home IN ('" . $phone_list_string . "')) AND b.source_c = 'online' AND a.deleted = 0";
                            }
                            $result_import = $db->query($sql);
                            $row_import = $db->fetchByAssoc($result_import);
                            $import_count = $row_import['count'];

                            if ($import_count >= 0 && !empty($lead_id)) {
                                $lead = BeanFactory::getBean('Leads', $lead_id);
                                if ($lead) {
                                    $lead->update_date_modified = false;
                                    $lead->dup_c = $import_count + 1;
                                    $lead->last_dup_c = TimeDate::getInstance()->getNow(true)->asDb();
                                    $lead->new_dup_c = 1;
                                    $lead->save();
                                }
                            }
                            $bean->dup_c = $import_count;
                            $bean->duplicate_status = 'global_dup';
                        }
                    } else {
                        $bean->duplicate_status = 'new';
                    }
                } else {
                    $bean->duplicate_status = 'new';
                }
            }
        }
        return $bean;
    }
}
