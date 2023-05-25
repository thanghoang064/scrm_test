<?php 
 //WARNING: The contents of this file are auto-generated


// created: 2019-11-26 17:05:10
$dictionary["Account"]["fields"]["accounts_cases_1"] = array (
  'name' => 'accounts_cases_1',
  'type' => 'link',
  'relationship' => 'accounts_cases_1',
  'source' => 'non-db',
  'module' => 'Cases',
  'bean_name' => 'Case',
  'vname' => 'LBL_ACCOUNTS_CASES_1_FROM_CASES_TITLE',
  'id_name' => 'accounts_cases_1cases_idb',
);
$dictionary["Account"]["fields"]["accounts_cases_1_name"] = array (
  'name' => 'accounts_cases_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_ACCOUNTS_CASES_1_FROM_CASES_TITLE',
  'save' => true,
  'id_name' => 'accounts_cases_1cases_idb',
  'link' => 'accounts_cases_1',
  'table' => 'cases',
  'module' => 'Cases',
  'rname' => 'name',
);
$dictionary["Account"]["fields"]["accounts_cases_1cases_idb"] = array (
  'name' => 'accounts_cases_1cases_idb',
  'type' => 'link',
  'relationship' => 'accounts_cases_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'left',
  'vname' => 'LBL_ACCOUNTS_CASES_1_FROM_CASES_TITLE',
);


// created: 2017-02-21 12:45:02
$dictionary["Account"]["fields"]["accounts_leads_1"] = array (
  'name' => 'accounts_leads_1',
  'type' => 'link',
  'relationship' => 'accounts_leads_1',
  'source' => 'non-db',
  'module' => 'Leads',
  'bean_name' => 'Lead',
  'vname' => 'LBL_ACCOUNTS_LEADS_1_FROM_LEADS_TITLE',
  'id_name' => 'accounts_leads_1leads_idb',
);
$dictionary["Account"]["fields"]["accounts_leads_1_name"] = array (
  'name' => 'accounts_leads_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_ACCOUNTS_LEADS_1_FROM_LEADS_TITLE',
  'save' => true,
  'id_name' => 'accounts_leads_1leads_idb',
  'link' => 'accounts_leads_1',
  'table' => 'leads',
  'module' => 'Leads',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["Account"]["fields"]["accounts_leads_1leads_idb"] = array (
  'name' => 'accounts_leads_1leads_idb',
  'type' => 'link',
  'relationship' => 'accounts_leads_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'left',
  'vname' => 'LBL_ACCOUNTS_LEADS_1_FROM_LEADS_TITLE',
);



$dictionary["Account"]["fields"]["asteriskintegration_accounts"] = array(
    'name' => 'asteriskintegration_accounts',
    'type' => 'link',
    'relationship' => 'asteriskintegration_accounts',
    'source' => 'non-db',
    'module' => 'AsteriskIntegration',
    'bean_name' => false,
    'side' => 'right',
    'vname' => 'LBL_ASTERISKINTEGRATION_ACCOUNTS_FROM_ASTERISKINTEGRATION_TITLE',
);


// created: 2017-02-21 16:08:21
$dictionary["Account"]["fields"]["leads_accounts_1"] = array (
  'name' => 'leads_accounts_1',
  'type' => 'link',
  'relationship' => 'leads_accounts_1',
  'source' => 'non-db',
  'module' => 'Leads',
  'bean_name' => 'Lead',
  'vname' => 'LBL_LEADS_ACCOUNTS_1_FROM_LEADS_TITLE',
);


 // created: 2017-04-20 09:38:02
$dictionary['Account']['fields']['address_c']['inline_edit']='1';
$dictionary['Account']['fields']['address_c']['labelValue']='Địa chỉ';

 

 // created: 2017-04-20 10:35:03
$dictionary['Account']['fields']['area_c']['inline_edit']='1';
$dictionary['Account']['fields']['area_c']['labelValue']='Cơ sở';

 

 // created: 2017-04-20 09:01:28
$dictionary['Account']['fields']['birthdate_c']['inline_edit']='1';
$dictionary['Account']['fields']['birthdate_c']['options']='date_range_search_dom';
$dictionary['Account']['fields']['birthdate_c']['labelValue']='Ngày sinh';
$dictionary['Account']['fields']['birthdate_c']['enable_range_search']='1';

 

 // created: 2017-03-16 11:01:21
$dictionary['Account']['fields']['call_log_c']['inline_edit']='';
$dictionary['Account']['fields']['call_log_c']['labelValue']='Lịch sử chăm sóc';

 

 // created: 2018-10-29 16:30:18
$dictionary['Account']['fields']['campaign_c']['inline_edit']='1';
$dictionary['Account']['fields']['campaign_c']['labelValue']='Chiến dịch tuyển sinh';

 

 // created: 2017-04-20 09:42:28
$dictionary['Account']['fields']['country_c']['inline_edit']='1';
$dictionary['Account']['fields']['country_c']['labelValue']='Quốc gia';

 

 // created: 2017-04-20 09:22:27
$dictionary['Account']['fields']['date_issued_c']['inline_edit']='1';
$dictionary['Account']['fields']['date_issued_c']['options']='date_range_search_dom';
$dictionary['Account']['fields']['date_issued_c']['labelValue']='Ngày cấp';
$dictionary['Account']['fields']['date_issued_c']['enable_range_search']='1';

 

 // created: 2017-04-24 11:38:14
$dictionary['Account']['fields']['description']['inline_edit']='';
$dictionary['Account']['fields']['description']['comments']='Full text of the note';
$dictionary['Account']['fields']['description']['merge_filter']='disabled';

 

 // created: 2017-04-20 09:49:48
$dictionary['Account']['fields']['district_c']['inline_edit']='1';
$dictionary['Account']['fields']['district_c']['labelValue']='Quận/Huyện';

 

 // created: 2017-07-03 15:19:43
$dictionary['Account']['fields']['dot_nhap_hoc_c']['inline_edit']='1';
$dictionary['Account']['fields']['dot_nhap_hoc_c']['labelValue']='Đợt nhập học';

 

 // created: 2017-07-17 06:59:36
$dictionary['Account']['fields']['dup_c']['inline_edit']='1';
$dictionary['Account']['fields']['dup_c']['options']='numeric_range_search_dom';
$dictionary['Account']['fields']['dup_c']['labelValue']='Nhập trùng';
$dictionary['Account']['fields']['dup_c']['enable_range_search']='1';

 

 // created: 2017-04-20 09:36:18
$dictionary['Account']['fields']['email_c']['inline_edit']='1';
$dictionary['Account']['fields']['email_c']['labelValue']='Email';

 

 // created: 2017-04-20 10:48:17
$dictionary['Account']['fields']['enrollment_status_c']['inline_edit']='1';
$dictionary['Account']['fields']['enrollment_status_c']['labelValue']='Trạng thái nhập học';

 

 // created: 2017-04-20 09:18:37
$dictionary['Account']['fields']['ethnicity_c']['inline_edit']='1';
$dictionary['Account']['fields']['ethnicity_c']['labelValue']='Dân tộc';

 

 // created: 2018-05-15 09:05:39
$dictionary['Account']['fields']['facebook_c']['inline_edit']='1';
$dictionary['Account']['fields']['facebook_c']['labelValue']='Facebook';

 

 // created: 2017-04-21 22:13:32
$dictionary['Account']['fields']['gender_c']['inline_edit']='1';
$dictionary['Account']['fields']['gender_c']['labelValue']='Giới tính';

 

 // created: 2017-04-20 10:01:34
$dictionary['Account']['fields']['graduated_c']['inline_edit']='1';
$dictionary['Account']['fields']['graduated_c']['labelValue']='Đã tốt nghiệp';

 

 // created: 2017-04-20 10:00:31
$dictionary['Account']['fields']['id_passport_c']['inline_edit']='1';
$dictionary['Account']['fields']['id_passport_c']['labelValue']='CMND/Hộ chiếu';

 

 // created: 2016-11-08 10:37:08
$dictionary['Account']['fields']['jjwg_maps_address_c']['inline_edit']=1;

 

 // created: 2016-11-08 10:37:08
$dictionary['Account']['fields']['jjwg_maps_geocode_status_c']['inline_edit']=1;

 

 // created: 2016-11-08 10:37:08
$dictionary['Account']['fields']['jjwg_maps_lat_c']['inline_edit']=1;

 

 // created: 2016-11-08 10:37:08
$dictionary['Account']['fields']['jjwg_maps_lng_c']['inline_edit']=1;

 

 // created: 2017-07-22 11:13:42
$dictionary['Account']['fields']['lead_rating_c']['inline_edit']='';
$dictionary['Account']['fields']['lead_rating_c']['labelValue']='Rating';

 

 // created: 2017-04-20 09:31:48
$dictionary['Account']['fields']['major_c']['inline_edit']='1';
$dictionary['Account']['fields']['major_c']['labelValue']='Chuyên ngành';

 

 // created: 2017-04-20 10:06:13
$dictionary['Account']['fields']['name']['inline_edit']=true;
$dictionary['Account']['fields']['name']['merge_filter']='disabled';

 

 // created: 2019-01-23 13:52:39
$dictionary['Account']['fields']['name_update_test_c']['inline_edit']='1';
$dictionary['Account']['fields']['name_update_test_c']['labelValue']='name update test';

 

 // created: 2017-04-14 14:19:57
$dictionary['Account']['fields']['ne_c']['inline_edit']='1';
$dictionary['Account']['fields']['ne_c']['labelValue']='NE';

 

 // created: 2017-07-22 11:06:07
$dictionary['Account']['fields']['nguon_c']['inline_edit']='';
$dictionary['Account']['fields']['nguon_c']['labelValue']='Nguồn';

 

 // created: 2017-04-20 10:00:00
$dictionary['Account']['fields']['parent1_name_c']['inline_edit']='1';
$dictionary['Account']['fields']['parent1_name_c']['labelValue']='Tên phụ huynh';

 

 // created: 2018-11-09 11:51:44
$dictionary['Account']['fields']['phone1_c']['inline_edit']='';
$dictionary['Account']['fields']['phone1_c']['labelValue']='SĐT sinh viên 1 (chính)';

 

 // created: 2018-11-09 11:53:04
$dictionary['Account']['fields']['phone2_c']['inline_edit']='';
$dictionary['Account']['fields']['phone2_c']['labelValue']='SĐT phụ huynh 1 (chính)';

 

 // created: 2018-11-09 11:52:51
$dictionary['Account']['fields']['phone3_c']['inline_edit']='';
$dictionary['Account']['fields']['phone3_c']['labelValue']='SĐT sinh viên 2 (phụ)';

 

 // created: 2018-11-09 11:52:11
$dictionary['Account']['fields']['phone4_c']['inline_edit']='';
$dictionary['Account']['fields']['phone4_c']['labelValue']='SĐT phụ huynh 2 (phụ)';

 

 // created: 2018-11-09 11:51:27
$dictionary['Account']['fields']['phone_fax']['inline_edit']='';
$dictionary['Account']['fields']['phone_fax']['comments']='The fax phone number of this company';
$dictionary['Account']['fields']['phone_fax']['merge_filter']='disabled';

 

 // created: 2018-11-09 11:51:19
$dictionary['Account']['fields']['phone_office']['inline_edit']='';
$dictionary['Account']['fields']['phone_office']['comments']='The office phone number';
$dictionary['Account']['fields']['phone_office']['merge_filter']='disabled';

 

 // created: 2017-04-20 09:24:39
$dictionary['Account']['fields']['place_issued_c']['inline_edit']='1';
$dictionary['Account']['fields']['place_issued_c']['labelValue']='Nơi cấp';

 

 // created: 2017-04-20 09:38:30
$dictionary['Account']['fields']['postal_address_c']['inline_edit']='1';
$dictionary['Account']['fields']['postal_address_c']['labelValue']='Địa chỉ bưu điện';

 

 // created: 2017-04-20 09:53:10
$dictionary['Account']['fields']['program_c']['inline_edit']='1';
$dictionary['Account']['fields']['program_c']['labelValue']='Hệ đào tạo';

 

 // created: 2017-07-18 13:06:35
$dictionary['Account']['fields']['promoter_c']['inline_edit']='';
$dictionary['Account']['fields']['promoter_c']['labelValue']='Promoter';

 

 // created: 2017-04-20 09:47:26
$dictionary['Account']['fields']['province_c']['inline_edit']='1';
$dictionary['Account']['fields']['province_c']['labelValue']='Tỉnh/Thành phố';

 

 // created: 2018-10-22 08:31:05
$dictionary['Account']['fields']['pro_id_c']['inline_edit']='1';
$dictionary['Account']['fields']['pro_id_c']['labelValue']='pro id';

 

 // created: 2018-10-22 08:30:20
$dictionary['Account']['fields']['pro_name_c']['inline_edit']='1';
$dictionary['Account']['fields']['pro_name_c']['labelValue']='pro name';

 

 // created: 2017-04-28 10:11:05
$dictionary['Account']['fields']['scheduled_date_c']['inline_edit']='1';
$dictionary['Account']['fields']['scheduled_date_c']['options']='date_range_search_dom';
$dictionary['Account']['fields']['scheduled_date_c']['labelValue']='Ngày hẹn';
$dictionary['Account']['fields']['scheduled_date_c']['enable_range_search']='1';

 

 // created: 2017-04-20 09:28:50
$dictionary['Account']['fields']['school_c']['inline_edit']='1';
$dictionary['Account']['fields']['school_c']['labelValue']='Trường THPT';

 

 // created: 2017-07-22 11:06:44
$dictionary['Account']['fields']['source_c']['inline_edit']='1';
$dictionary['Account']['fields']['source_c']['labelValue']='Lead Source';

 

 // created: 2017-04-20 10:52:38
$dictionary['Account']['fields']['student_code_c']['inline_edit']='1';
$dictionary['Account']['fields']['student_code_c']['labelValue']='Mã sinh viên';

 

 // created: 2017-04-20 09:27:19
$dictionary['Account']['fields']['study_time_c']['inline_edit']='1';
$dictionary['Account']['fields']['study_time_c']['labelValue']='Nguyện vọng học';

 

 // created: 2019-01-23 16:50:04
$dictionary['Account']['fields']['trang_thai_phi_c']['inline_edit']='';
$dictionary['Account']['fields']['trang_thai_phi_c']['labelValue']='Trạng thái học phí';

 

 // created: 2017-04-20 09:51:50
$dictionary['Account']['fields']['tshirt_size_c']['inline_edit']='1';
$dictionary['Account']['fields']['tshirt_size_c']['labelValue']='Cỡ áo';

 

 // created: 2017-07-18 13:06:35
$dictionary['Account']['fields']['user_id_c']['inline_edit']=1;

 

 // created: 2017-04-20 09:30:47
$dictionary['Account']['fields']['year_graduated_c']['inline_edit']='1';
$dictionary['Account']['fields']['year_graduated_c']['labelValue']='Năm tốt nghiệp';

 

 // created: 2020-04-12 20:55:29
$dictionary['Account']['fields']['converted_file_student_c']['inline_edit']='1';
$dictionary['Account']['fields']['converted_file_student_c']['labelValue']='Hồ sơ đã được gửi';

 

 // created: 2020-05-18 09:41:15
$dictionary['Account']['fields']['crm_brand_id_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_brand_id_c']['labelValue']='Mã CRM Chuyên Ngành';

 

 // created: 2020-05-18 09:44:25
$dictionary['Account']['fields']['crm_campus_id_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_campus_id_c']['labelValue']='Mã CRM Cơ Sở';

 

 // created: 2020-08-30 22:16:12
$dictionary['Account']['fields']['crm_convert_ne_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_convert_ne_c']['options']='date_range_search_dom';
$dictionary['Account']['fields']['crm_convert_ne_c']['labelValue']='Ngày chuyển NE';
$dictionary['Account']['fields']['crm_convert_ne_c']['enable_range_search']='1';

 

 // created: 2020-05-18 09:45:07
$dictionary['Account']['fields']['crm_district_id_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_district_id_c']['labelValue']='Mã CRM Quận,Huyện';

 

 // created: 2020-05-18 09:46:17
$dictionary['Account']['fields']['crm_document_id_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_document_id_c']['labelValue']='Mã CRM Hồ Sơ';

 

 // created: 2020-05-18 09:47:43
$dictionary['Account']['fields']['crm_people_id_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_people_id_c']['labelValue']='Mã CRM Thí Sinh';

 

 // created: 2020-05-18 09:48:26
$dictionary['Account']['fields']['crm_province_id_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_province_id_c']['labelValue']='Mã CRM Tỉnh, Thành Phố';

 

 // created: 2020-05-18 09:49:18
$dictionary['Account']['fields']['crm_race_code_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_race_code_c']['labelValue']='Mã CRM Dân Tộc';

 

 // created: 2020-05-18 09:50:07
$dictionary['Account']['fields']['crm_recruitment_id_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_recruitment_id_c']['labelValue']='Mã CRM Chiến Dịch';

 

 // created: 2020-05-18 09:50:42
$dictionary['Account']['fields']['crm_school_id_c']['inline_edit']='';
$dictionary['Account']['fields']['crm_school_id_c']['labelValue']='Mã CRM Trường THPT';

 

 // created: 2020-01-03 10:32:07
$dictionary['Account']['fields']['expected_major_2_c']['inline_edit']='1';
$dictionary['Account']['fields']['expected_major_2_c']['labelValue']='Ngành học mong muốn (d)';

 

 // created: 2020-06-25 17:53:29
$dictionary['Account']['fields']['id_passport_c']['inline_edit']='1';
$dictionary['Account']['fields']['id_passport_c']['labelValue']='CMND/Hộ chiếu';

 

 // created: 2023-05-24 23:24:15
$dictionary['Account']['fields']['jjwg_maps_address_c']['inline_edit']=1;

 

 // created: 2023-05-24 23:24:14
$dictionary['Account']['fields']['jjwg_maps_geocode_status_c']['inline_edit']=1;

 

 // created: 2023-05-24 23:24:14
$dictionary['Account']['fields']['jjwg_maps_lat_c']['inline_edit']=1;

 

 // created: 2023-05-24 23:24:14
$dictionary['Account']['fields']['jjwg_maps_lng_c']['inline_edit']=1;

 

 // created: 2023-02-02 14:29:52
$dictionary['Account']['fields']['province_c']['inline_edit']='1';
$dictionary['Account']['fields']['province_c']['labelValue']='Tỉnh/Thành phố';

 
?>