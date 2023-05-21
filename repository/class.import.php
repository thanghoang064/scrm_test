<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class ApiImportLead
{

    function import_leads($bean)
    {

        include_once 'custom/api_ants.php';

        if (empty($bean->fetched_row['id'])) {
            $bean->date_entered = null;
            $bean->date_modified = null;

            $co_so = trim(strtolower($bean->area_c));
            $dup = $bean->duplicate_status;

            $lead = BeanFactory::newBean('Leads');

            $lead->set_created_by = false;
            $lead->update_modified_by = false;

            $lead->topic_c = $bean->topic_c;
            $lead->created_by = $bean->created_by;
            $lead->assigned_user_id = $bean->assigned_user_id;
            $lead->modified_user_id = $bean->modified_user_id;
            $lead->phone_mobile = $bean->phone_mobile;
            $lead->phone_mobile = $bean->phone_mobile;
            $lead->facebook_c = $bean->facebook_c;
            $lead->source_c = $bean->source_c;
            $lead->lead_source = $bean->lead_source;
            $lead->dot_nhap_hoc_c = $bean->dot_nhap_hoc_c;
            $lead->rating_c = $bean->rating_c;
            $lead->status = $bean->status;
            $lead->last_name = $bean->last_name;
            $lead->area_c = $bean->area_c;
            $lead->email_c = $bean->email_c;
            $lead->expected_major_2_c = $bean->expected_major_2_c;
            $lead->year_enrolled_c = $bean->year_enrolled_c;
            $lead->batch_name_c = $bean->batch_name_c;
            $lead->graduation_cer_c = $bean->graduation_cer_c;
            $lead->content_c = $bean->content_c;

            $lead->phone_home = $bean->phone_home;
            $lead->parent1_name_c = $bean->parent1_name_c;
            $lead->id_passport_c = $bean->id_passport_c;
            $lead->gender_c = $bean->gender_c;
            $lead->birthdate = $bean->birthdate;

            // add new
            //dân tộc
            $lead->ethnicity_c = $bean->ethnicity_c;
            // tỉnh
            $lead->primary_address_city = $bean->primary_address_city;
            // huyện
            $lead->primary_address_state = $bean->primary_address_state;
            // địa chỉ
            $lead->jjwg_maps_address_c = $bean->jjwg_maps_address_c;
            // năm tốt nghiệp
            $lead->graduation_year_c = $bean->graduation_year_c;
            // trường THPT
            $lead->school_c = $bean->school_c;
            // ngày cấp
            $lead->issue_date_c = $bean->issue_date_c;
            //nơi cấp
            $lead->place_of_issue_c = $bean->place_of_issue_c;

            $hcm_group_id = 'b9f05e38-7c48-2de3-721f-589d3ff27e78';
            $hn_group_id = 'd38a052c-3bfe-7286-f088-589d417b1578';
            $pr_group_id = '4d76ecb8-494c-86d6-4fdb-589d41939b5d';
            $tn_group_id = '9fd2a5c7-dad7-c0ff-1469-589d403d0ced';
            $dn_group_id = '4ad7e29a-c17e-eb4a-cb88-589d61641f51';
            $kbeauty_hn_group_id = '7fe1a7a9-5b84-7447-0c37-592f97135c62';
            $kbeauty_hcm_group_id = '390447ba-fc1c-9172-b894-592f97096458';
            $ct_group_id = 'c7708bb1-668d-ba86-7c91-5a94bf7f722c';
            $hp_group_id = 'd7576688-99c0-52e4-b22f-6257cb378032';
            $th_group_id = '724c8860-b55f-69e8-27b9-637b40a89488';
            $hna_group_id = 'aed1f6fb-7364-653a-270d-637b4069ab85';
            $qn_group_id = 'b151efd4-969f-ffbc-4758-637b40674e6d';
            $dna_group_id = 'd9a88517-cb4f-d3a7-bb0d-63b7816f0f0a';
            $tng_group_id = '4d47149e-448c-89fc-5ee8-63a18b4497eb';
            $kbct_group_id = '65d0d089-2931-26a7-bd98-63ec90ae90b2';
            
            if ($dup == 'new') {

                switch ($co_so) {
                    case 'hcm':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($hcm_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'hn':
                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {

                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($pr_group_id);
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

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($tn_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'dn':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($dn_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'kbhn':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($kbeauty_hn_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'kbhcm':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($kbeauty_hcm_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();
                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'ct':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($ct_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'hp':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($hp_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'th':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($th_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'hna':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($hna_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'qn':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($qn_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'dna':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($dna_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'tng':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($tng_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

                            $lead->save();

                            $result = CreateLeadAPI($lead);
                            $GLOBALS['log']->fatal($result);
                        } else {
                            unset($lead);
                        }

                        break;
                    case 'kbct':

                        if ($lead->last_name != '' && $lead->topic_c != '' && $lead->source_c != '' && $lead->lead_source != '' && $lead->dot_nhap_hoc_c != '') {
                            $lead->save();
                            $lead->load_relationship('SecurityGroups');

                            //add group
                            $lead->SecurityGroups->add($kbct_group_id);
                            $lead->SecurityGroups->add($pr_group_id);

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
