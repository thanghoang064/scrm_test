<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
$debug_file = 'autoUploadLead.log';
$time = time();
$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'POST') {
    require_once 'repository/class.check.php';
    require_once 'repository/class.import.php';

    $bean = BeanFactory::newBean('Leads');
    $request = json_decode(file_get_contents('php://input'), true);
    file_put_contents($debug_file, $request, true);

    $listSource = [
        'sms' => 'sms',
        'website' => 'website',
        'svnhl' => 'svnhl',
        'facebook' => 'facebook',
        'google' => 'google',
        'coccoc' => 'coccoc',
        'zalo' => 'zalo',
        'instagram' => 'instagram',
        'hotline' => 'hotline',
        'subiz' => 'subiz',
        'youtube' => 'youtube',
        'email' => 'email',
        'tiktok' => 'tiktok',
        'pr' => 'pr',
        'cdp' => 'cdp',
    ];


    $listMajors = [
        6 => 'Lập trình Web',
        7 => 'Marketing & Bán hàng',
        9 => 'Lập trình Mobile',
        10 => 'Thiết kế đồ họa',
        11 => 'Quản trị Nhà hàng',
        13 => 'Quản trị Khách sạn',
        14 => 'Hướng dẫn du lịch',
        21 => 'Digital Marketing',
        22 => 'Quan hệ công chúng & Tổ chức sự kiện',
        23 => 'Chăm sóc da và Spa',
        24 => 'Trang điểm nghệ thuật',
        25 => 'Phun thêu thẩm mỹ',
        26 => 'Công nghệ kỹ thuật cơ khí',
        27 => 'Công nghệ kỹ thuật điện, điện tử',
        28 => 'Công nghệ kỹ thuật điều khiển & Tự động hóa',
        31 => 'Điện công nghiệp',
        38 => 'Phát triển phần mềm',
        39 => 'Ứng dụng phần mềm',
        40 => 'Xử lý dữ liệu',
        41 => 'Logistics',
    ];

    $sourceChar = strtolower($request['source']);
    
    $source = array_search($sourceChar, $listSource);
    if (!$source) {
        $source = "website";
    }
    //var_dump($source);die;
    $majors = array_search($request['majors'], $listMajors);

    if (!$majors) {
        $majors = "";
    }

    $topic = "";
    switch ((int)$request['form']) {
        case 27:
            $topic = "2023_ĐKOL";
            break;
        case 18:
            $topic = "2023_XTOL";
            break;
        case 26:
            $topic = "2023_ĐKOL";
        case 28:
            $topic = "2023_ĐKOL";
            break;
        case 7:
            $topic = "2023_TTOL";
            break;
        case 16:
            $topic = "2023_XTOL";
            break;
    	case 32: 
    	case 42:
	        $topic = "2023_XTOL";
	        break;
        case 33: 
            $topic = "2023_ĐKOL";
	    break;
	case 34:
	    $topic = "2023_TSTT";
    	    break;	    
    }

    $bean->topic_c = $topic;
    $bean->last_name = $request['name'];
    $bean->created_by = "4960f722-109c-77ea-b770-62471acd2e60";
    $bean->assigned_user_id = "4960f722-109c-77ea-b770-62471acd2e60";
    $bean->modified_user_id = "4960f722-109c-77ea-b770-62471acd2e60";
    $bean->phone_mobile = $request['phone'] ?? "";
    $bean->facebook_c = $request['facebook'] ?? "";
    $bean->source_c = "online";
    $bean->area_c = $request['branch'] ?? "";
    $bean->lead_source = $source;
    $bean->dot_nhap_hoc_c = "May_2023";
    //var_dump($request);die;
    $bean->year_enrolled_c = $request['cccd_mt'] ?? "";
    $bean->batch_name_c = $request['cccd_ms'] ?? "";
    $bean->graduation_cer_c = $request['bang_tot_nghiep_img'] ?? "";
    $bean->content_c = $request['don_dang_ky_pdf'] ?? "";

    $bean->phone_home = $request['parent_phone'] ?? "";
    $bean->parent1_name_c = $request['parent_name'] ?? "";
    $bean->id_passport_c = $request['id_passport'] ?? "";
    $bean->gender_c = $request['gender'] ?? "";
    $bean->birthdate = $request['birth_date'] ?? "";

    $bean->ethnicity_c = $request['ethnicity'] ?? "";
    $bean->primary_address_city = trim(str_replace("Thành phố", "",str_replace("Tỉnh", "", $request['city'] ?? ""))); //thành phố
    $bean->primary_address_state = trim(str_replace("Thị xã", "", str_replace("Quận", "",str_replace("Huyện", "", $request['district'] ?? ""))));
    $bean->jjwg_maps_address_c = $request['address'] .", ". $request['district'] .", ".$request['city'];
    $bean->graduation_year_c = $request['graduation_year'] ?? "";
    $bean->school_c = $request['school'] ?? "";
    $bean->issue_date_c = $request['issue_date'] ?? "";
    $bean->place_of_issue_c = $request['issue_place'] ?? "";

    if ($topic == "2023_TTOL") {
        $bean->rating_c = "";
        $bean->status = "New";
    } else {
        $bean->rating_c = "lead_online";
        $bean->status = "active_lead";
    }
    $bean->description = $request['content'];
    $bean->email_c = $request['email'];
    $bean->expected_major_2_c = $majors;

    $check = new ApiLeadImportChecker();
    $leadImport = new ApiImportLead();
    $infoLead = $check->check_if_duplicate($bean);
//    dump($infoLead,true);
    $import = $leadImport->import_leads($infoLead);

    echo "Uplead sheet success";
} else {
    echo "404 Not Found";
}

function dump($variable, $exit = false)
{
    echo '<pre>';
    print_r($variable);
    echo '</pre>';
    if ($exit) {
        exit();
    }
}
