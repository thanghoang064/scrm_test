<?php 
 //WARNING: The contents of this file are auto-generated


// created: 2017-02-21 12:45:02
$dictionary["Lead"]["fields"]["accounts_leads_1"] = array (
  'name' => 'accounts_leads_1',
  'type' => 'link',
  'relationship' => 'accounts_leads_1',
  'source' => 'non-db',
  'module' => 'Accounts',
  'bean_name' => 'Account',
  'vname' => 'LBL_ACCOUNTS_LEADS_1_FROM_ACCOUNTS_TITLE',
  'id_name' => 'accounts_leads_1accounts_ida',
);
$dictionary["Lead"]["fields"]["accounts_leads_1_name"] = array (
  'name' => 'accounts_leads_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_ACCOUNTS_LEADS_1_FROM_ACCOUNTS_TITLE',
  'save' => true,
  'id_name' => 'accounts_leads_1accounts_ida',
  'link' => 'accounts_leads_1',
  'table' => 'accounts',
  'module' => 'Accounts',
  'rname' => 'name',
);
$dictionary["Lead"]["fields"]["accounts_leads_1accounts_ida"] = array (
  'name' => 'accounts_leads_1accounts_ida',
  'type' => 'link',
  'relationship' => 'accounts_leads_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'left',
  'vname' => 'LBL_ACCOUNTS_LEADS_1_FROM_ACCOUNTS_TITLE',
);



$dictionary["Lead"]["fields"]["asteriskintegration_leads"] = array(
    'name' => 'asteriskintegration_leads',
    'type' => 'link',
    'relationship' => 'asteriskintegration_leads',
    'source' => 'non-db',
    'module' => 'AsteriskIntegration',
    'bean_name' => false,
    'side' => 'right',
    'vname' => 'LBL_ASTERISKINTEGRATION_LEADS_FROM_ASTERISKINTEGRATION_TITLE',
);


// created: 2017-03-18 02:51:52
$dictionary["Lead"]["fields"]["fpoly_leadimports_leads_1"] = array (
  'name' => 'fpoly_leadimports_leads_1',
  'type' => 'link',
  'relationship' => 'fpoly_leadimports_leads_1',
  'source' => 'non-db',
  'module' => 'fpoly_LeadImports',
  'bean_name' => 'fpoly_LeadImports',
  'vname' => 'LBL_FPOLY_LEADIMPORTS_LEADS_1_FROM_FPOLY_LEADIMPORTS_TITLE',
);


// created: 2017-02-21 16:08:21
$dictionary["Lead"]["fields"]["leads_accounts_1"] = array (
  'name' => 'leads_accounts_1',
  'type' => 'link',
  'relationship' => 'leads_accounts_1',
  'source' => 'non-db',
  'module' => 'Accounts',
  'bean_name' => 'Account',
  'vname' => 'LBL_LEADS_ACCOUNTS_1_FROM_ACCOUNTS_TITLE',
);


// created: 2017-02-21 16:09:01
$dictionary["Lead"]["fields"]["leads_opportunities_1"] = array (
  'name' => 'leads_opportunities_1',
  'type' => 'link',
  'relationship' => 'leads_opportunities_1',
  'source' => 'non-db',
  'module' => 'Opportunities',
  'bean_name' => 'Opportunity',
  'vname' => 'LBL_LEADS_OPPORTUNITIES_1_FROM_OPPORTUNITIES_TITLE',
);


// created: 2017-02-21 16:10:19
$dictionary["Lead"]["fields"]["opportunities_leads_1"] = array (
  'name' => 'opportunities_leads_1',
  'type' => 'link',
  'relationship' => 'opportunities_leads_1',
  'source' => 'non-db',
  'module' => 'Opportunities',
  'bean_name' => 'Opportunity',
  'vname' => 'LBL_OPPORTUNITIES_LEADS_1_FROM_OPPORTUNITIES_TITLE',
  'id_name' => 'opportunities_leads_1opportunities_ida',
);
$dictionary["Lead"]["fields"]["opportunities_leads_1_name"] = array (
  'name' => 'opportunities_leads_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_OPPORTUNITIES_LEADS_1_FROM_OPPORTUNITIES_TITLE',
  'save' => true,
  'id_name' => 'opportunities_leads_1opportunities_ida',
  'link' => 'opportunities_leads_1',
  'table' => 'opportunities',
  'module' => 'Opportunities',
  'rname' => 'name',
);
$dictionary["Lead"]["fields"]["opportunities_leads_1opportunities_ida"] = array (
  'name' => 'opportunities_leads_1opportunities_ida',
  'type' => 'link',
  'relationship' => 'opportunities_leads_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_OPPORTUNITIES_LEADS_1_FROM_LEADS_TITLE',
);



$dictionary['Lead']['fields']['SecurityGroups'] = array (
  	'name' => 'SecurityGroups',
    'type' => 'link',
	'relationship' => 'securitygroups_leads',
	'module'=>'SecurityGroups',
	'bean_name'=>'SecurityGroup',
    'source'=>'non-db',
	'vname'=>'LBL_SECURITYGROUPS',
);






 // created: 2019-01-12 10:25:35
$dictionary['Lead']['fields']['account_id_2_c']['inline_edit']='1';
$dictionary['Lead']['fields']['account_id_2_c']['labelValue']='AccountID2';

 

 // created: 2017-06-01 13:37:32
$dictionary['Lead']['fields']['area_c']['inline_edit']='1';
$dictionary['Lead']['fields']['area_c']['labelValue']='Cơ sở';

 

 // created: 2017-02-16 09:02:43
$dictionary['Lead']['fields']['assessor_c']['inline_edit']='';
$dictionary['Lead']['fields']['assessor_c']['labelValue']='Assessor';

 

 // created: 2017-03-16 09:13:46
$dictionary['Lead']['fields']['auto_assign_c']['inline_edit']='1';
$dictionary['Lead']['fields']['auto_assign_c']['labelValue']='Chia tự động';

 

 // created: 2017-03-18 23:26:12
$dictionary['Lead']['fields']['batch_name_c']['inline_edit']='';
$dictionary['Lead']['fields']['batch_name_c']['labelValue']='Lô nhập liệu';

 

 // created: 2017-02-24 11:23:02
$dictionary['Lead']['fields']['birthdate']['inline_edit']=true;
$dictionary['Lead']['fields']['birthdate']['comments']='The birthdate of the contact';
$dictionary['Lead']['fields']['birthdate']['merge_filter']='disabled';
$dictionary['Lead']['fields']['birthdate']['enable_range_search']='1';
$dictionary['Lead']['fields']['birthdate']['options']='date_range_search_dom';

 

 // created: 2017-04-24 12:59:47
$dictionary['Lead']['fields']['call_log_c']['inline_edit']='';
$dictionary['Lead']['fields']['call_log_c']['labelValue']='Lịch sử chăm sóc';

 

 // created: 2017-02-24 23:18:17
$dictionary['Lead']['fields']['class_c']['inline_edit']='1';
$dictionary['Lead']['fields']['class_c']['labelValue']='Lớp';

 

 // created: 2017-04-22 11:17:01
$dictionary['Lead']['fields']['contacted_c']['inline_edit']='1';
$dictionary['Lead']['fields']['contacted_c']['labelValue']='Đã chăm sóc';

 

 // created: 2019-01-12 10:40:30
$dictionary['Lead']['fields']['convert_date_c']['inline_edit']='';
$dictionary['Lead']['fields']['convert_date_c']['options']='date_range_search_dom';
$dictionary['Lead']['fields']['convert_date_c']['labelValue']='Ngày Convert';
$dictionary['Lead']['fields']['convert_date_c']['enable_range_search']='1';

 

 // created: 2018-11-27 11:42:33
$dictionary['Lead']['fields']['created_by_name_c']['inline_edit']='1';
$dictionary['Lead']['fields']['created_by_name_c']['labelValue']='Created by Name';

 

 // created: 2017-03-09 10:23:07
$dictionary['Lead']['fields']['date_activated_c']['inline_edit']='';
$dictionary['Lead']['fields']['date_activated_c']['options']='date_range_search_dom';
$dictionary['Lead']['fields']['date_activated_c']['labelValue']='Ngày active';
$dictionary['Lead']['fields']['date_activated_c']['enable_range_search']='1';

 

 // created: 2017-03-10 15:34:17
$dictionary['Lead']['fields']['date_enrolled_c']['inline_edit']='1';
$dictionary['Lead']['fields']['date_enrolled_c']['options']='date_range_search_dom';
$dictionary['Lead']['fields']['date_enrolled_c']['labelValue']='Ngày chuyển NE';
$dictionary['Lead']['fields']['date_enrolled_c']['enable_range_search']='1';

 

 // created: 2017-04-24 11:36:43
$dictionary['Lead']['fields']['description']['inline_edit']='';
$dictionary['Lead']['fields']['description']['comments']='Full text of the note';
$dictionary['Lead']['fields']['description']['merge_filter']='disabled';

 

 // created: 2017-02-07 16:44:38
$dictionary['Lead']['fields']['documents_finished_c']['inline_edit']='1';
$dictionary['Lead']['fields']['documents_finished_c']['labelValue']='Hồ sơ';

 

 // created: 2018-10-29 16:30:54
$dictionary['Lead']['fields']['dot_nhap_hoc_c']['inline_edit']='1';
$dictionary['Lead']['fields']['dot_nhap_hoc_c']['labelValue']='Đợt nhập học';

 

 // created: 2017-07-17 07:00:36
$dictionary['Lead']['fields']['dup_c']['inline_edit']='1';
$dictionary['Lead']['fields']['dup_c']['options']='numeric_range_search_dom';
$dictionary['Lead']['fields']['dup_c']['labelValue']='Nhập trùng';
$dictionary['Lead']['fields']['dup_c']['enable_range_search']='1';

 

 // created: 2017-03-28 17:26:13
$dictionary['Lead']['fields']['email_c']['inline_edit']='1';
$dictionary['Lead']['fields']['email_c']['labelValue']='Email';

 

 // created: 2017-02-07 16:43:38
$dictionary['Lead']['fields']['entry_exam_method_c']['inline_edit']='1';
$dictionary['Lead']['fields']['entry_exam_method_c']['labelValue']='Cụm thi';

 

 // created: 2016-11-08 11:24:14
$dictionary['Lead']['fields']['ethnicity_c']['inline_edit']='1';
$dictionary['Lead']['fields']['ethnicity_c']['labelValue']='Dân tộc';

 

 // created: 2017-02-24 11:18:25
$dictionary['Lead']['fields']['expected_job_c']['inline_edit']='1';
$dictionary['Lead']['fields']['expected_job_c']['labelValue']='Công việc mong muốn';

 

 // created: 2017-02-24 11:17:32
$dictionary['Lead']['fields']['expected_major_c']['inline_edit']='1';
$dictionary['Lead']['fields']['expected_major_c']['labelValue']='Ngành học mong muốn';

 

 // created: 2017-04-27 15:56:46
$dictionary['Lead']['fields']['facebook_c']['inline_edit']='1';
$dictionary['Lead']['fields']['facebook_c']['labelValue']='Facebook';

 

 // created: 2016-11-08 12:13:38
$dictionary['Lead']['fields']['first_name']['inline_edit']=true;
$dictionary['Lead']['fields']['first_name']['comments']='First name of the contact';
$dictionary['Lead']['fields']['first_name']['merge_filter']='disabled';

 

 // created: 2017-02-07 16:54:15
$dictionary['Lead']['fields']['follow_status_reason_c']['inline_edit']='1';
$dictionary['Lead']['fields']['follow_status_reason_c']['labelValue']='Follow status reason';

 

 // created: 2016-11-08 10:51:54
$dictionary['Lead']['fields']['gender_c']['inline_edit']='1';
$dictionary['Lead']['fields']['gender_c']['labelValue']='Giới tính';

 

 // created: 2016-11-08 11:37:08
$dictionary['Lead']['fields']['graduation_year_c']['inline_edit']='1';
$dictionary['Lead']['fields']['graduation_year_c']['labelValue']='Năm tốt nghiệp';

 

 // created: 2016-11-08 11:25:48
$dictionary['Lead']['fields']['id_passport_c']['inline_edit']='1';
$dictionary['Lead']['fields']['id_passport_c']['labelValue']='CMND/Hộ chiếu';

 

 // created: 2017-05-31 10:56:56
$dictionary['Lead']['fields']['import_number_c']['inline_edit']='1';
$dictionary['Lead']['fields']['import_number_c']['labelValue']='Số lần nhập';

 

 // created: 2016-11-08 11:27:09
$dictionary['Lead']['fields']['issue_date_c']['inline_edit']='1';
$dictionary['Lead']['fields']['issue_date_c']['options']='date_range_search_dom';
$dictionary['Lead']['fields']['issue_date_c']['labelValue']='Ngày cấp';
$dictionary['Lead']['fields']['issue_date_c']['enable_range_search']='1';

 

 // created: 2016-11-08 12:11:48
$dictionary['Lead']['fields']['jjwg_maps_address_c']['inline_edit']='1';
$dictionary['Lead']['fields']['jjwg_maps_address_c']['labelValue']='Địa chỉ';

 

 // created: 2016-11-08 10:37:09
$dictionary['Lead']['fields']['jjwg_maps_geocode_status_c']['inline_edit']=1;

 

 // created: 2016-11-08 10:37:09
$dictionary['Lead']['fields']['jjwg_maps_lat_c']['inline_edit']=1;

 

 // created: 2016-11-08 10:37:09
$dictionary['Lead']['fields']['jjwg_maps_lng_c']['inline_edit']=1;

 

 // created: 2018-03-12 15:20:50
$dictionary['Lead']['fields']['last_assign_date_c']['inline_edit']='';
$dictionary['Lead']['fields']['last_assign_date_c']['options']='date_range_search_dom';
$dictionary['Lead']['fields']['last_assign_date_c']['labelValue']='Ngày Assign';
$dictionary['Lead']['fields']['last_assign_date_c']['enable_range_search']='1';

 

 // created: 2017-07-17 09:25:36
$dictionary['Lead']['fields']['last_dup_c']['inline_edit']='';
$dictionary['Lead']['fields']['last_dup_c']['options']='date_range_search_dom';
$dictionary['Lead']['fields']['last_dup_c']['labelValue']='Trùng gần nhất';
$dictionary['Lead']['fields']['last_dup_c']['enable_range_search']='1';

 

 // created: 2017-03-17 14:18:22
$dictionary['Lead']['fields']['last_name']['inline_edit']=true;
$dictionary['Lead']['fields']['last_name']['comments']='Họ và tên lead';
$dictionary['Lead']['fields']['last_name']['merge_filter']='disabled';
$dictionary['Lead']['fields']['last_name']['audited']=true;
$dictionary['Lead']['fields']['last_name']['required']=false;

 

 // created: 2017-03-09 09:55:43
$dictionary['Lead']['fields']['lead_source']['required']=true;
$dictionary['Lead']['fields']['lead_source']['inline_edit']=true;
$dictionary['Lead']['fields']['lead_source']['massupdate']='1';
$dictionary['Lead']['fields']['lead_source']['comments']='Lead source (ex: Web, print)';
$dictionary['Lead']['fields']['lead_source']['merge_filter']='disabled';

 

 // created: 2019-04-02 15:22:05
$dictionary['Lead']['fields']['lead_source_2_c']['inline_edit']='';
$dictionary['Lead']['fields']['lead_source_2_c']['labelValue']='Lead Source 2';

 

 // created: 2016-11-08 12:12:55
$dictionary['Lead']['fields']['mailing_address_c']['inline_edit']='1';
$dictionary['Lead']['fields']['mailing_address_c']['labelValue']='Địa chỉ bưu điện';

 

 // created: 2016-11-08 11:44:43
$dictionary['Lead']['fields']['major_c']['inline_edit']='1';
$dictionary['Lead']['fields']['major_c']['labelValue']='Chuyên ngành';

 

 // created: 2017-07-17 09:41:20
$dictionary['Lead']['fields']['new_dup_c']['inline_edit']='';
$dictionary['Lead']['fields']['new_dup_c']['labelValue']='Trùng mới';

 

 // created: 2017-03-10 15:30:55
$dictionary['Lead']['fields']['ne_c']['inline_edit']='1';
$dictionary['Lead']['fields']['ne_c']['labelValue']='NE';

 

 // created: 2017-12-28 09:23:48
$dictionary['Lead']['fields']['note_c']['inline_edit']='1';
$dictionary['Lead']['fields']['note_c']['labelValue']='Ghi chú';

 

 // created: 2017-04-22 09:08:48
$dictionary['Lead']['fields']['number_of_calls_c']['inline_edit']='';
$dictionary['Lead']['fields']['number_of_calls_c']['labelValue']='Số cuộc gọi';

 

 // created: 2016-11-08 11:46:17
$dictionary['Lead']['fields']['parent1_name_c']['inline_edit']='1';
$dictionary['Lead']['fields']['parent1_name_c']['labelValue']='Tên phụ huynh';

 

 // created: 2017-03-16 08:40:24
$dictionary['Lead']['fields']['phone_home']['inline_edit']=true;
$dictionary['Lead']['fields']['phone_home']['comments']='SĐT phụ huynh 1';
$dictionary['Lead']['fields']['phone_home']['merge_filter']='disabled';
$dictionary['Lead']['fields']['phone_home']['audited']=true;

 

 // created: 2017-03-18 15:16:39
$dictionary['Lead']['fields']['phone_mobile']['required']=false;
$dictionary['Lead']['fields']['phone_mobile']['inline_edit']=true;
$dictionary['Lead']['fields']['phone_mobile']['comments']='Mobile phone number of the contact';
$dictionary['Lead']['fields']['phone_mobile']['merge_filter']='disabled';
$dictionary['Lead']['fields']['phone_mobile']['audited']=true;
$dictionary['Lead']['fields']['phone_mobile']['importable']='required';
$dictionary['Lead']['fields']['phone_mobile']['duplicate_merge']='enabled';
$dictionary['Lead']['fields']['phone_mobile']['duplicate_merge_dom_value']='1';

 

 // created: 2017-03-16 08:40:33
$dictionary['Lead']['fields']['phone_other']['inline_edit']=true;
$dictionary['Lead']['fields']['phone_other']['comments']='Other phone number for the contact';
$dictionary['Lead']['fields']['phone_other']['merge_filter']='disabled';
$dictionary['Lead']['fields']['phone_other']['audited']=true;

 

 // created: 2016-11-08 11:48:40
$dictionary['Lead']['fields']['phone_work']['inline_edit']=true;
$dictionary['Lead']['fields']['phone_work']['comments']='SĐT sinh viên 2';
$dictionary['Lead']['fields']['phone_work']['merge_filter']='disabled';

 

 // created: 2016-11-08 11:28:17
$dictionary['Lead']['fields']['place_of_issue_c']['inline_edit']='1';
$dictionary['Lead']['fields']['place_of_issue_c']['labelValue']='Nơi cấp';

 

 // created: 2017-02-07 16:42:23
$dictionary['Lead']['fields']['place_of_study_c']['inline_edit']='1';
$dictionary['Lead']['fields']['place_of_study_c']['labelValue']='Dự định học tại';

 

 // created: 2016-11-08 11:50:24
$dictionary['Lead']['fields']['primary_address_city']['audited']=true;
$dictionary['Lead']['fields']['primary_address_city']['inline_edit']=true;
$dictionary['Lead']['fields']['primary_address_city']['comments']='City for primary address';
$dictionary['Lead']['fields']['primary_address_city']['merge_filter']='disabled';

 

 // created: 2016-11-08 11:49:34
$dictionary['Lead']['fields']['primary_address_country']['inline_edit']=true;
$dictionary['Lead']['fields']['primary_address_country']['comments']='Country for primary address';
$dictionary['Lead']['fields']['primary_address_country']['merge_filter']='disabled';

 

 // created: 2016-11-08 11:50:58
$dictionary['Lead']['fields']['primary_address_state']['inline_edit']=true;
$dictionary['Lead']['fields']['primary_address_state']['comments']='Quận/Huyện';
$dictionary['Lead']['fields']['primary_address_state']['merge_filter']='disabled';

 

 // created: 2016-11-08 11:53:03
$dictionary['Lead']['fields']['program_c']['inline_edit']='1';
$dictionary['Lead']['fields']['program_c']['labelValue']='Hệ đào tạo';

 

 // created: 2018-10-19 10:58:39
$dictionary['Lead']['fields']['promo_name_c']['inline_edit']='1';
$dictionary['Lead']['fields']['promo_name_c']['labelValue']='promo name';

 

 // created: 2016-11-08 11:31:04
$dictionary['Lead']['fields']['school_c']['inline_edit']='1';
$dictionary['Lead']['fields']['school_c']['labelValue']='Trường THPT';

 

 // created: 2019-04-01 15:54:56
$dictionary['Lead']['fields']['source_2_c']['inline_edit']='';
$dictionary['Lead']['fields']['source_2_c']['labelValue']='Nguồn 2';

 

 // created: 2017-08-02 14:27:40
$dictionary['Lead']['fields']['source_c']['inline_edit']='';
$dictionary['Lead']['fields']['source_c']['labelValue']='Nguồn';

 

 // created: 2017-02-07 16:46:44
$dictionary['Lead']['fields']['status']['required']=true;
$dictionary['Lead']['fields']['status']['inline_edit']=true;
$dictionary['Lead']['fields']['status']['massupdate']='1';
$dictionary['Lead']['fields']['status']['comments']='Status of the lead';
$dictionary['Lead']['fields']['status']['merge_filter']='disabled';

 

 // created: 2016-11-08 12:14:59
$dictionary['Lead']['fields']['study_status_c']['inline_edit']='1';
$dictionary['Lead']['fields']['study_status_c']['labelValue']='Trạng thái tốt nghiệp';

 

 // created: 2017-03-19 01:08:20
$dictionary['Lead']['fields']['time_to_study_c']['inline_edit']='1';
$dictionary['Lead']['fields']['time_to_study_c']['labelValue']='Nguyện vọng học';

 

 // created: 2017-03-23 18:07:16
$dictionary['Lead']['fields']['topic_c']['inline_edit']='';
$dictionary['Lead']['fields']['topic_c']['labelValue']='Topic';

 

 // created: 2017-02-07 16:35:43
$dictionary['Lead']['fields']['year_enrolled_c']['inline_edit']='1';
$dictionary['Lead']['fields']['year_enrolled_c']['labelValue']='Năm nhập học';

 

 // created: 2021-03-18 17:08:55
$dictionary['Lead']['fields']['barriers_c']['inline_edit']='1';
$dictionary['Lead']['fields']['barriers_c']['labelValue']='Rào cản lớn nhất';

 

 // created: 2022-06-17 16:39:42
$dictionary['Lead']['fields']['batch_name_c']['inline_edit']='';
$dictionary['Lead']['fields']['batch_name_c']['labelValue']='CCCD mặt sau';

 

 // created: 2022-06-20 15:19:53
$dictionary['Lead']['fields']['content_c']['inline_edit']='';
$dictionary['Lead']['fields']['content_c']['labelValue']='Phiếu đăng ký học';

 

 // created: 2020-07-16 15:01:16
$dictionary['Lead']['fields']['converted']['importable']='true';

 

 // created: 2020-07-16 14:49:13
$dictionary['Lead']['fields']['date_reviewed']['inline_edit']=true;
$dictionary['Lead']['fields']['date_reviewed']['massupdate']=0;
$dictionary['Lead']['fields']['date_reviewed']['merge_filter']='disabled';
$dictionary['Lead']['fields']['date_reviewed']['enable_range_search']=false;

 

 // created: 2020-03-20 10:47:56
$dictionary['Lead']['fields']['dot_nhap_hoc_c']['inline_edit']='1';
$dictionary['Lead']['fields']['dot_nhap_hoc_c']['labelValue']='Đợt nhập học';

 

 // created: 2021-03-18 17:04:46
$dictionary['Lead']['fields']['expected_major_2_c']['inline_edit']='1';
$dictionary['Lead']['fields']['expected_major_2_c']['labelValue']='Ngành học mong muốn (d)';

 

 // created: 2020-03-20 10:45:40
$dictionary['Lead']['fields']['first_name']['inline_edit']=true;
$dictionary['Lead']['fields']['first_name']['comments']='First name of the contact';
$dictionary['Lead']['fields']['first_name']['merge_filter']='disabled';
$dictionary['Lead']['fields']['first_name']['required']=true;

 

 // created: 2020-07-16 14:52:07
$dictionary['Lead']['fields']['gender_c']['inline_edit']='1';
$dictionary['Lead']['fields']['gender_c']['labelValue']='Giới tính';

 

 // created: 2022-06-20 15:21:48
$dictionary['Lead']['fields']['graduation_cer_c']['inline_edit']='1';
$dictionary['Lead']['fields']['graduation_cer_c']['labelValue']='Giấy tốt nghiệp';

 

 // created: 2020-07-16 15:03:53
$dictionary['Lead']['fields']['issue_date_c']['inline_edit']='1';
$dictionary['Lead']['fields']['issue_date_c']['options']='date_range_search_dom';
$dictionary['Lead']['fields']['issue_date_c']['labelValue']='Ngày cấp';
$dictionary['Lead']['fields']['issue_date_c']['enable_range_search']='1';

 

 // created: 2023-05-17 12:51:50
$dictionary['Lead']['fields']['jjwg_maps_address_c']['inline_edit']='1';
$dictionary['Lead']['fields']['jjwg_maps_address_c']['labelValue']='Địa chỉ';

 

 // created: 2023-05-17 12:51:49
$dictionary['Lead']['fields']['jjwg_maps_geocode_status_c']['inline_edit']=1;

 

 // created: 2023-05-17 12:51:49
$dictionary['Lead']['fields']['jjwg_maps_lat_c']['inline_edit']=1;

 

 // created: 2023-05-17 12:51:49
$dictionary['Lead']['fields']['jjwg_maps_lng_c']['inline_edit']=1;

 

 // created: 2020-03-20 10:45:25
$dictionary['Lead']['fields']['last_name']['inline_edit']=true;
$dictionary['Lead']['fields']['last_name']['comments']='Họ và tên lead';
$dictionary['Lead']['fields']['last_name']['merge_filter']='disabled';
$dictionary['Lead']['fields']['last_name']['audited']=true;
$dictionary['Lead']['fields']['last_name']['required']=true;

 

 // created: 2020-07-16 14:49:03
$dictionary['Lead']['fields']['lawful_basis']['default']='^^';
$dictionary['Lead']['fields']['lawful_basis']['massupdate']=0;
$dictionary['Lead']['fields']['lawful_basis']['merge_filter']='disabled';

 

 // created: 2020-07-16 14:49:22
$dictionary['Lead']['fields']['lawful_basis_source']['massupdate']=0;
$dictionary['Lead']['fields']['lawful_basis_source']['merge_filter']='disabled';

 

 // created: 2020-11-25 09:08:55
$dictionary['Lead']['fields']['marketing_c']['inline_edit']='1';
$dictionary['Lead']['fields']['marketing_c']['labelValue']='Lead Trùng';

 

 // created: 2023-05-20 12:22:36
$dictionary['Lead']['fields']['rating_c']['inline_edit']='1';
$dictionary['Lead']['fields']['rating_c']['labelValue']='Rating';

 

 // created: 2023-05-19 17:35:15
$dictionary['Lead']['fields']['schedule_date_c']['inline_edit']='1';
$dictionary['Lead']['fields']['schedule_date_c']['labelValue']='Ngày hẹn';

 

 // created: 2020-03-20 10:46:12
$dictionary['Lead']['fields']['source_2_c']['inline_edit']='';
$dictionary['Lead']['fields']['source_2_c']['labelValue']='Nguồn 2';

 

 // created: 2020-03-20 22:48:40
$dictionary['Lead']['fields']['source_c']['inline_edit']='';
$dictionary['Lead']['fields']['source_c']['labelValue']='Nguồn';

 

 // created: 2022-06-17 16:36:17
$dictionary['Lead']['fields']['year_enrolled_c']['inline_edit']='1';
$dictionary['Lead']['fields']['year_enrolled_c']['labelValue']='CCCD mặt trước';

 
?>