<?php 
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
ini_set('display_errors',0);
error_reporting(0);
function CreateLeadAPI($data,$action="create"){
	include_once 'include/utils.php';
	global $current_user;
	
	if(!empty($data->assigned_user_name)){
		$telesales=$data->assigned_user_name;
	}else{
		$telesales=!empty($current_user->user_name)? $current_user->user_name:"";
	}
	//$GLOBALS['log']->fatal(var_export($data, true));
	$date=date("Y-m-d H:i:s");
	$curl = curl_init();
	$url='https://a.cdp.asia/event?portal_id=564888751&prop_id=564990348&resp_type=json';
	$userAgent = $_SERVER['HTTP_USER_AGENT'];
	$uid=!empty($data->phone_mobile)? md5($data->phone_mobile):"";
	$log_id=!empty($data->id)? $data->id:"";
	$time=strtotime($date)*1000;
	$id=!empty($data->id)? $data->id:"";
	$name=!empty($data->last_name)? html_entity_decode($data->last_name):"";
	$website=!empty($data->website)? $data->website:"";
	$fb_link=!empty($data->facebook_c)? $data->facebook_c:"";
	$email=!empty($data->email1)? $data->email1:$data->email_c;
	$cmnd=!empty($data->id_passport_c)? $data->id_passport_c:"";
	$phone=!empty($data->phone_mobile)? $data->phone_mobile:"";
	$phone_2=!empty($data->phone_work)? $data->phone_work:"";
	$parent_phone1=!empty($data->phone_home)? $data->phone_home:"";
	$parent_phone2=!empty($data->phone_other)? $data->phone_other:"";
	$gender=!empty($data->gender_c)? $data->gender_c:"";
	$address=!empty($data->jjwg_maps_address_c)? html_entity_decode($data->jjwg_maps_address_c):"";
	$district=!empty($data->primary_address_state)? html_entity_decode($data->primary_address_state):"";
	$city=!empty($data->primary_address_city)? html_entity_decode($data->primary_address_city):"";
	$country=!empty($data->country)? $data->country:"";
	$birthday=!empty($data->birthdate)? $data->birthdate:"";
	$lead_source=!empty($data->lead_source)? $GLOBALS['app_list_strings']['lead_source_dom'][$data->lead_source]:"";
	$lead_time=!empty($data->date_entered)? $data->date_entered:$date;
	$updated_date=!empty($data->date_modified)? $data->date_modified:$date;
	$status=!empty($data->status)? $data->status:"";
	$rating=!empty($data->rating_c)? $data->rating_c:"";
	$converted=!empty($data->converted)? $data->converted:"";
	$date_converted=!empty($data->convert_date_c)? $data->convert_date_c:"";
	$account_id=!empty($data->account_id_2_c)? $data->account_id_2_c:"";
	$flag_call=!empty($data->flag_call_c)? $data->flag_call_c:"";
	$num_of_calls=!empty($data->number_of_calls_c)? $data->number_of_calls_c:"";
	$graduation_status=!empty($data->graduation_status_c)? html_entity_decode($data->graduation_status_c):"";
	$dot_nhap_hoc=!empty($data->dot_nhap_hoc_c)? html_entity_decode($data->dot_nhap_hoc_c):"";
	$major=!empty($GLOBALS['app_list_strings']['expected_major_2_list'][$data->expected_major_2_c])? $GLOBALS['app_list_strings']['expected_major_2_list'][$data->expected_major_2_c]:html_entity_decode($data->expected_major_2_c);
	$location=!empty($data->area_c)? $data->area_c:"";
	$topic=!empty($data->topic_c)? $data->topic_c:"";
	
	$school_c=!empty($data->school_c)? html_entity_decode($data->school_c):"";
	$nganhhoc_mongmuon=!empty($data->expected_major_c)? html_entity_decode($data->expected_major_c):"";
	$facebook_c=!empty($data->facebook_c)? html_entity_decode($data->facebook_c):"";
	$call_log_c=!empty($data->call_log_c)? html_entity_decode($data->call_log_c):"";
	$call_log_c= str_replace( array('"', '<', '>' ), "'", $call_log_c);
	$follow_status_reason_c=!empty($GLOBALS['app_list_strings']['follow_status_reason_list'][$data->follow_status_reason_c])? $GLOBALS['app_list_strings']['follow_status_reason_list'][$data->follow_status_reason_c]:"";
	$source=$GLOBALS['app_list_strings']['source_list'][$data->source_c];
	
	if($action=="create"){
		$param='{
			"uid": "'.$uid.'",
			"log_id": "'.$log_id.'",
			"ec": "lead",
			"ea": "'.$action.'",
			"items": [
				{
					"type": "lead",
					"id": "'.$id.'",
					"name": "'.$name.'",
					"website": "'.$website.'",
					"fb_link": "'.$fb_link.'",
					"email": "'.$email.'",
					"cmnd": "'.$cmnd.'",
					"phone": "'.$phone.'",
					"phone_2": "'.$phone_2.'",
					"parent_phone1": "'.$parent_phone1.'",
					"parent_phone2": "'.$parent_phone2.'",
					"gender": "'.$gender.'",
					"district": "'.$district.'",
					"city": "'.$city.'",
					"country": "'.$country.'",
					"address": "'.$address.'",
					"birthday": "'.$birthday.'",
					"lead_event": "'.$action.'",
					"lead_source": "'.$lead_source.'",
					"lead_time": "'.$lead_time.'",
					"updated_date": "'.$date.'",
					"status": "'.$status.'",
					"rating": "'.$rating.'",
					"converted": "'.$converted.'",
					"date_converted":"'.$date_converted.'",
					"account_id": "'.$account_id.'",
					"flag_call": "'.$flag_call.'",
					"num_of_calls": "'.$num_of_calls.'",
					"graduation_status": "'.$graduation_status.'",
					"dot_nhap_hoc": "'.$dot_nhap_hoc.'",
					"major": "'.$major.'",
					"location": "'.$location.'",
					"topic":"'.$topic.'",
					"campaign_id":"",
					"high_school":"'.$school_c.'",
					"nganhhoc_mongmuon":"'.$nganhhoc_mongmuon.'",
					"date_active":"'.$date.'",
					"from_source":"'.$source.'",
					"follow_status_reason":"'.$follow_status_reason_c.'",
					"history_of_care":"'.$call_log_c.'", 
					"facebook":"'.$facebook_c.'",
					"nganhhoc_mongmuon_d":"'.$major.'",
					"telesales": "'.$telesales.'",
					"is_crm": "true"     
				}
			],
			"extra": {
				"created_date": "'.$lead_time.'",
				"lead_status": "Tiềm năng",
				"lead_telesales": "'.$telesales.'",
				"identify_id": "'.$uid.'",
				"identify_name": "'.$name.'",
				"identify_fb_link": "'.$fb_link.'",
				"identify_email": "'.$email.'",
				"identify_cmnd": "'.$cmnd.'",
				"identify_phone": "'.$phone.'",
				"identify_gender": "'.$gender.'",
				"identify_district": "'.$district.'",
				"identify_city": "'.$city.'",
				"identify_country": "'.$country.'",
				"identify_address": "'.$address.'",
				"identify_birthday": "'.$birthday.'",
				"identify_major": "'.$major.'",
				"identify_location": "'.$location.'",
				"is_lead": "true",
				"is_crm": "true"
			}
		}';
	}else{
		$param='{
			"uid": "'.$uid.'",
			"log_id": "'.$log_id.'",
			"ec": "lead",
			"ea": "'.$action.'",
			"items": [
				{
					"type": "lead",
					"id": "'.$id.'",
					"name": "'.$name.'",
					"website": "'.$website.'",
					"fb_link": "'.$fb_link.'",
					"email": "'.$email.'",
					"cmnd": "'.$cmnd.'",
					"phone": "'.$phone.'",
					"phone_2": "'.$phone_2.'",
					"parent_phone1": "'.$parent_phone1.'",
					"parent_phone2": "'.$parent_phone2.'",
					"gender": "'.$gender.'",
					"district": "'.$district.'",
					"city": "'.$city.'",
					"country": "'.$country.'",
					"address": "'.$address.'",
					"birthday": "'.$birthday.'",
					"lead_event": "'.$action.'",
					"lead_source": "'.$lead_source.'",
					"updated_date": "'.$date.'",
					"status": "'.$status.'",
					"rating": "'.$rating.'",
					"converted": "'.$converted.'",
					"date_converted":"'.$date_converted.'",
					"account_id": "'.$account_id.'",
					"flag_call": "'.$flag_call.'",
					"num_of_calls": "'.$num_of_calls.'",
					"graduation_status": "'.$graduation_status.'",
					"dot_nhap_hoc": "'.$dot_nhap_hoc.'",
					"major": "'.$major.'",
					"location": "'.$location.'",
					"topic":"'.$topic.'",
					"campaign_id":"",
					"high_school":"'.$school_c.'",
					"nganhhoc_mongmuon":"'.$nganhhoc_mongmuon.'",
					"date_active":"'.$date.'",
					"from_source":"'.$source.'",
					"follow_status_reason":"'.$follow_status_reason_c.'",
					"history_of_care":"'.$call_log_c.'", 
					"facebook":"'.$facebook_c.'",
					"nganhhoc_mongmuon_d":"'.$major.'",
					"telesales": "'.$telesales.'",
					"is_crm": "true"     
				}
			],
			"extra": {
				"created_date": "'.$lead_time.'",
				"lead_status": "Tiềm năng",
				"lead_telesales": "'.$telesales.'",
				"identify_id": "'.$uid.'",
				"identify_name": "'.$name.'",
				"identify_fb_link": "'.$fb_link.'",
				"identify_email": "'.$email.'",
				"identify_cmnd": "'.$cmnd.'",
				"identify_phone": "'.$phone.'",
				"identify_gender": "'.$gender.'",
				"identify_district": "'.$district.'",
				"identify_city": "'.$city.'",
				"identify_country": "'.$country.'",
				"identify_address": "'.$address.'",
				"identify_birthday": "'.$birthday.'",
				"identify_major": "'.$major.'",
				"identify_location": "'.$location.'",
				"is_lead": "true",
				"is_crm": "true"
			}
		}';
	}
	$GLOBALS['log']->fatal($param);
	curl_setopt_array($curl, array(
	  CURLOPT_URL => $url,
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_ENCODING => '',
	  CURLOPT_MAXREDIRS => 10,
	  CURLOPT_TIMEOUT => 0,
	  CURLOPT_USERAGENT	=> $userAgent,
	  CURLOPT_FOLLOWLOCATION => true,
	  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	  CURLOPT_CUSTOMREQUEST => 'POST',
	  CURLOPT_POSTFIELDS =>$param,
	  CURLOPT_HTTPHEADER => array(
		'Content-Type: application/json'
	  ),
	));

	$response = curl_exec($curl);

	curl_close($curl);
	return $response;
}	


function CreateAccountAPI($data,$action="create"){
	global $current_user;
	//$GLOBALS['log']->fatal(var_export($data, true));
	if(!empty($data->assigned_user_name)){
		$telesales=$data->assigned_user_name;
	}else{
		$telesales=!empty($current_user->user_name)? $current_user->user_name:"";
	}
	$date=date("Y-m-d H:i:s");
	$curl = curl_init();
	$url='https://a.cdp.asia/event?portal_id=564888751&prop_id=564990348&resp_type=json';
	$userAgent = $_SERVER['HTTP_USER_AGENT'];
	$uid=!empty($data->phone_mobile)? md5($data->phone_mobile):md5($data->phone1_c);
	$log_id=!empty($data->account_id)? $data->account_id:$data->id;
	$time=strtotime($date)*1000;
	$id=!empty($data->account_id)? $data->account_id:$data->id;
	$name=!empty($data->last_name)? html_entity_decode($data->last_name):html_entity_decode($data->name);
	$website=!empty($data->website)? $data->website:"";
	$fb_link=!empty($data->facebook_c)? $data->facebook_c:"";
	$email=!empty($data->email1)? $data->email1:$data->email_c;
	$cmnd=!empty($data->id_passport_c)? $data->id_passport_c:"";
	$phone=!empty($data->phone_mobile)? $data->phone_mobile:$data->phone1_c;
	$phone_2=!empty($data->phone_work)? $data->phone_work:"";
	$parent_phone1=!empty($data->phone_home)? $data->phone_home:"";
	$parent_phone2=!empty($data->phone_other)? $data->phone_other:"";
	$gender=!empty($data->gender_c)? $data->gender_c:"";
	$address=!empty($data->jjwg_maps_address_c)? html_entity_decode($data->jjwg_maps_address_c):"";
	$district=!empty($data->primary_address_state)? html_entity_decode($data->primary_address_state):"";
	$city=!empty($data->primary_address_city)? html_entity_decode($data->primary_address_city):"";
	$country=!empty($data->country)? html_entity_decode($data->country):"";
	$birthday=!empty($data->birthdate)? $data->birthdate:"";
	$lead_source=!empty($data->lead_source)? $GLOBALS['app_list_strings']['lead_source_dom'][$data->lead_source]:"";
	$lead_time=!empty($data->date_entered)? $data->date_entered: $date;
	$updated_date=!empty($data->date_modified)? $data->date_modified:$date;
	$status=!empty($data->status)? $data->status:"";
	$rating=!empty($data->rating_c)? $data->rating_c:"";
	$converted=!empty($data->converted)? $data->converted:"";
	$date_converted=!empty($data->convert_date_c)? $data->convert_date_c:"";
	$account_id= $log_id;//!empty($data->account_id_2_c)? $data->account_id_2_c:"";
	$flag_call=!empty($data->flag_call_c)? $data->flag_call_c:"";
	$num_of_calls=!empty($data->number_of_calls_c)? $data->number_of_calls_c:"";
	$graduation_status=!empty($data->graduation_status_c)? $data->graduation_status_c:"";
	$he_dao_tao=!empty($data->he_dao_tao_c)? $data->he_dao_tao_c:"";
	$dot_nhap_hoc=!empty($data->dot_nhap_hoc_c)? $data->dot_nhap_hoc_c:"";
	$major=!empty($GLOBALS['app_list_strings']['expected_major_2_list'][$data->expected_major_2_c])? $GLOBALS['app_list_strings']['expected_major_2_list'][$data->expected_major_2_c]:html_entity_decode($data->expected_major_2_c);
	$source=!empty($GLOBALS['app_list_strings']['source_list'][$data->source_c])? $GLOBALS['app_list_strings']['source_list'][$data->source_c]:"";
	$location=!empty($data->area_c)? $data->area_c:"";
	$topic=!empty($data->topic_c)? $data->topic_c:"";
	$school_c=!empty($data->school_c)? html_entity_decode($data->school_c):"";
	$nganhhoc_mongmuon=!empty($data->expected_major_c)? html_entity_decode($data->expected_major_c):"";
	$facebook_c=!empty($data->facebook_c)? html_entity_decode($data->facebook_c):"";
	$follow_status_reason_c=!empty($GLOBALS['app_list_strings']['follow_status_reason_list'][$data->follow_status_reason_c])? $GLOBALS['app_list_strings']['follow_status_reason_list'][$data->follow_status_reason_c]:"";
	$ne=($data->enrollment_status_c=="enrolled")? 1:0;
	$call_log_c=!empty($data->call_log_c)? html_entity_decode($data->call_log_c):"";
	$call_log_c= str_replace( array('"', '<', '>' ), "'", $call_log_c);
	
	if($action=="create"){
		$param='{
			"uid": "'.$uid.'",
			"log_id": "'.$log_id.'",
			"ec": "account",
			"ea": "'.$action.'",
			"items": [
				{
					"type": "account",
					"id": "'.$id.'",
					"name": "'.$name.'",
					"website": "'.$website.'",
					"fb_link": "'.$fb_link.'",
					"email": "'.$email.'",
					"cmnd": "'.$cmnd.'",
					"phone": "'.$phone.'",
					"gender": "'.$gender.'",
					"district": "'.$district.'",
					"city": "'.$city.'",
					"country": "'.$country.'",
					"address": "'.$address.'",
					"birthday": "'.$birthday.'",
					"event_source": "'.$action.'",
					"lead_source": "'.$lead_source.'",
					"cdate": "'.$lead_time.'",
					"udate": "'.$date.'",
					"status": "'.$status.'",
					"rating": "'.$rating.'",
					"graduation_status": "'.$graduation_status.'",
					"he_dao_tao": "'.$he_dao_tao.'",
					"dot_nhap_hoc": "'.$dot_nhap_hoc.'",
					"major": "'.$major.'",
					"location": "'.$location.'",
					"topic":"'.$topic.'",
					"campaign_id":"",
					"high_school":"'.$school_c.'",
					"nganhhoc_mongmuon":"'.$nganhhoc_mongmuon.'",
					"date_active":"'.$date.'",
					"from_source":"'.$source.'",
					"follow_status_reason":"'.$follow_status_reason_c.'",
					"history_of_care":"'.$call_log_c.'",
					"facebook":"'.$facebook_c.'",
					"nganhhoc_mongmuon_d":"'.$major.'",
					"ne":"'.$ne.'",
					"is_crm": "true"     
				}
			],
			"extra": {
				"identify_id": "'.$uid.'",
				"identify_name": "'.$name.'",
				"identify_fb_link": "'.$fb_link.'",
				"identify_email": "'.$email.'",
				"identify_cmnd": "'.$cmnd.'",
				"identify_phone": "'.$phone.'",
				"identify_gender": "'.$gender.'",
				"identify_district": "'.$district.'",
				"identify_city": "'.$city.'",
				"identify_country": "'.$country.'",
				"identify_address": "'.$address.'",
				"identify_birthday": "'.$birthday.'",
				"identify_account_id": "'.$account_id.'",
				"identify_major": "'.$major.'",
				"identify_location": "'.$location.'",
				"ne":"'.$ne.'",
				"is_account": "true",
				"is_crm": "true"
			}
		}';
	}else{
		$param='{
			"uid": "'.$uid.'",
			"log_id": "'.$log_id.'",
			"ec": "account",
			"ea": "'.$action.'",
			"items": [
				{
					"type": "account",
					"id": "'.$id.'",
					"name": "'.$name.'",
					"website": "'.$website.'",
					"fb_link": "'.$fb_link.'",
					"email": "'.$email.'",
					"cmnd": "'.$cmnd.'",
					"phone": "'.$phone.'",
					"gender": "'.$gender.'",
					"district": "'.$district.'",
					"city": "'.$city.'",
					"country": "'.$country.'",
					"address": "'.$address.'",
					"birthday": "'.$birthday.'",
					"event_source": "'.$action.'",
					"lead_source": "'.$lead_source.'",
					"udate": "'.$date.'",
					"status": "'.$status.'",
					"rating": "'.$rating.'",
					"graduation_status": "'.$graduation_status.'",
					"he_dao_tao": "'.$he_dao_tao.'",
					"dot_nhap_hoc": "'.$dot_nhap_hoc.'",
					"major": "'.$major.'",
					"location": "'.$location.'",
					"topic":"'.$topic.'",
					"campaign_id":"",
					"high_school":"'.$school_c.'",
					"nganhhoc_mongmuon":"'.$nganhhoc_mongmuon.'",
					"date_active":"'.$date.'",
					"from_source":"'.$source.'",
					"follow_status_reason":"'.$follow_status_reason_c.'",
					"history_of_care":"'.$call_log_c.'",
					"facebook":"'.$facebook_c.'",
					"nganhhoc_mongmuon_d":"'.$major.'",
					"ne":"'.$ne.'",
					"is_crm": "true"     
				}
			],
			"extra": {
				"identify_id": "'.$uid.'",
				"identify_name": "'.$name.'",
				"identify_fb_link": "'.$fb_link.'",
				"identify_email": "'.$email.'",
				"identify_cmnd": "'.$cmnd.'",
				"identify_phone": "'.$phone.'",
				"identify_gender": "'.$gender.'",
				"identify_district": "'.$district.'",
				"identify_city": "'.$city.'",
				"identify_country": "'.$country.'",
				"identify_address": "'.$address.'",
				"identify_birthday": "'.$birthday.'",
				"identify_account_id": "'.$account_id.'",
				"identify_major": "'.$major.'",
				"identify_location": "'.$location.'",
				"ne":"'.$ne.'",
				"is_account": "true",
				"is_crm": "true"
			}
		}';
	}
	$GLOBALS['log']->fatal($param);
	curl_setopt_array($curl, array(
	  CURLOPT_URL => $url,
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_ENCODING => '',
	  CURLOPT_MAXREDIRS => 10,
	  CURLOPT_TIMEOUT => 0,
	  CURLOPT_USERAGENT	=> $userAgent,
	  CURLOPT_FOLLOWLOCATION => true,
	  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	  CURLOPT_CUSTOMREQUEST => 'POST',
	  CURLOPT_POSTFIELDS =>$param,
	  CURLOPT_HTTPHEADER => array(
		'Content-Type: application/json'
	  ),
	));

	$response = curl_exec($curl);

	curl_close($curl);
	return $response;
}	
