<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'POST') {
    require_once 'repository/class.check.php';
    require_once 'repository/class.import.php';

    $bean = BeanFactory::newBean('Leads');
    $request = json_decode(file_get_contents('php://input'), true);

    $listSource = [
        'facebook' => 'Facebook',
        'google' => 'Google',
        'zalo' => 'Zalo',
        'hotline' => 'Hotline',
        'subiz' => 'Subiz',
        'youtube' => 'Youtube',
        'tiktok' => 'Tiktok',
        'website' => 'Website'
    ];

    $source = array_search($request['source'], $listSource);
    $topic = "";
    switch ($request['source']) {
        case 'Tiktok':
            $topic = "2023_TTOL";
            break;
        case 'Google':
            $topic = "2023_PROL";
            break;
        case 'Subiz':
            $topic = "2023_OL";
            break;
        case 'Hotline':
            $topic = "2023_PROL";
            break;
        case 'Facebook':
            $topic = "2023_PROL";
            break;
        case 'Zalo':
            $topic = "2023_PROL";
            break;
        case 'Website':
            $topic = "2023_PROL";
            break;
        case 'CDP': 
            $topic = "2023_ĐKOL";
            break;
    }

    $bean->topic_c = $topic;
    $bean->last_name = $request['name'];
    $bean->created_by = "4960f722-109c-77ea-b770-62471acd2e60";
    $bean->assigned_user_id = "4960f722-109c-77ea-b770-62471acd2e60";
    $bean->modified_user_id = "4960f722-109c-77ea-b770-62471acd2e60";
    $bean->phone_mobile = $request['phone'];
    $bean->facebook_c = $request['facebook'];
    $bean->source_c = "online";
    $bean->area_c = $request['branch'];
    $bean->lead_source = $source;
    $bean->dot_nhap_hoc_c = "May_2023";
    $bean->rating_c = "lead_online";
    $bean->status = "active_lead";
    $bean->description = $request['content'];
    $bean->email_c = "";
    $bean->expected_major_2_c = "";
    $bean->year_enrolled_c = "";
    $bean->batch_name_c = "";
    $bean->graduation_cer_c = "";
    $bean->content_c = "";
    $bean->phone_home = "";
    $bean->parent1_name_c = "";
    $bean->id_passport_c = "";
    $bean->gender_c = "";
    $bean->birthdate = "";
    $bean->ethnicity_c = "";
    $bean->primary_address_city = "";
    $bean->primary_address_state = "";
    $bean->jjwg_maps_address_c = "";
    $bean->graduation_year_c = "";
    $bean->school_c = "";
    $bean->issue_date_c = "";
    $bean->place_of_issue_c = "";
    $check = new ApiLeadImportChecker();
    $leadImport = new ApiImportLead();

    $infoLead = $check->check_if_duplicate($bean);
    $import = $leadImport->import_leads($infoLead);

    echo "Uplead sheet success";
} else {
    echo "404 Not Found";
}

