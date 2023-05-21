<?php 
 //WARNING: The contents of this file are auto-generated


function URLIsValid($URL)
{
    $exists = true;
    $file_headers = @get_headers($URL);
    $InvalidHeaders = array('404', '403', '500');
    foreach($InvalidHeaders as $HeaderVal)
    {
            if(strstr($file_headers[0], $HeaderVal))
            {
                    $exists = false;
                    break;
            }
    }
    return $exists;
}

function AsteriskIntegrationServersList()
{
    $query = "SELECT `name`, `server_ip`, `socket_port`, `ami_port` FROM `asteriskintegration_servers`";

    $result = $GLOBALS['db']->query($query, false);

    $list = array();
    $list[''] = '';

    while (($row = $GLOBALS['db']->fetchByAssoc($result)) != null)
    {
        $list[$row['server_ip'] . ":" . $row['socket_port']] = $row['name'];
    }

    return $list;
}

function AsteriskIntegrationGetUserIdFromExtension($extension)
{
    if (!empty($extension))
    {
        $sql = "SELECT id FROM `users` WHERE `asteriskintegration_extension` = '$extension' AND `deleted` = '0' ORDER BY `date_modified` LIMIT 1";
        $res = $GLOBALS['db']->query($sql);

        $numrows = $res->num_rows;

        if ($numrows > 0)
        {
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $user_id = $row['id'];
        }
        else
        {
            $user_id = -1;
        }
    }
    else
    {
        $user_id = -1;
    }

    return $user_id;
}

function AsteriskIntegrationTimeToString($totalseconds)
{
    $timestring = "";
    $hours = (int) ($totalseconds / 3600);
    $minutes = (int) (($totalseconds - ($hours * 3600)) / 60);
    $seconds = (int) ($totalseconds % 60);

    if ($hours !== 0)
    {
        $timestring .= $hours . " Hr, ";
    }
    if ($minutes !== 0)
    {
        $timestring .= $minutes . " Min, ";
    }
    $timestring .= $seconds . " Sec";

    return $timestring;
}

function AsteriskIntegrationConvertSecondsToHoursMinutesSeconds($totalseconds)
{
    $result = array();

    $hours = (int) ($totalseconds / 3600);
    $minutes = (int) (($totalseconds - ($hours * 3600)) / 60);
    $seconds = (int) ($totalseconds % 60);

    if ($minutes > 59)
    {
        $hours++;
        $minutes = $minutes - 60;
    }

    $result['hours'] = $hours;
    $result['minutes'] = $minutes;
    $result['seconds'] = $seconds;

    return $result;
}

function AsteriskIntegrationDatabaseTime($datetime)
{
    $gmdate = gmdate("Y-m-d H:i:s", strtotime($datetime));
    return $gmdate;
}

function AsteriskIntegrationClickToCallAddToDB()
{
    $user_id = $_REQUEST['user_id'];
    $module_name = $_REQUEST['module_name'];
    $record_id = $_REQUEST['record_id'];
    $number = substr(preg_replace(array('/\ /', '/\-/', '/\+/', '/\(/', '/\)/'), '', $_REQUEST['number']), -10);

    $insert_click_to_call = "INSERT INTO `asteriskintegration_clicktocall` (`id`, `user_id`, `module_name`, `record_id`, `number`) VALUES (NULL, '$user_id', '$module_name', '$record_id', '$number')";

    $GLOBALS['db']->query($insert_click_to_call);
}

function AsteriskIntegrationClickToCallRemoveFromDB()
{
    $user_id = $_REQUEST['user_id'];
    $number = substr(preg_replace(array('/\ /', '/\-/', '/\+/', '/\(/', '/\)/'), '', $_REQUEST['number']), -10);

    $del_click_to_call = "DELETE FROM `asteriskintegration_clicktocall` WHERE `user_id` = '$user_id' AND `number` = '$number'";
    $GLOBALS['db']->query($del_click_to_call);
}

function AsteriskIntegrationGetRecordsFromNumber($limit = false, $number = "", $extension = "")
{
    global $app_list_strings;

    $result = array();

    if ($limit)
    {
        $number = $_REQUEST['number'];
        $extension = $_REQUEST['extension'];
    }

    $search_number = substr(preg_replace(array('/\ /', '/\-/', '/\+/', '/\(/', '/\)/'), '', $number), -10);

    //Search In Click To Call Tables
    $user_id = AsteriskIntegrationGetUserIdFromExtension($extension);
    $sql_click_to_call = "SELECT `record_id`, `module_name` FROM `asteriskintegration_clicktocall` WHERE `user_id` = '$user_id' AND `number` = '$search_number' ORDER BY `timestamp` DESC LIMIT 1";

    $res_click_to_call = $GLOBALS['db']->query($sql_click_to_call);
    $numrows_click_to_call = $res_click_to_call->num_rows;

    if ($numrows_click_to_call > 0)
    {
        $row_click_to_call = $GLOBALS['db']->fetchByAssoc($res_click_to_call);

        $module_name = $row_click_to_call['module_name'];
        $record_id = $row_click_to_call['record_id'];

        $key = $module_name . "_" . $record_id;

        switch ($module_name)
        {
            case "Contacts":
            case "Leads":
            case "Accounts":
                $module_bean = BeanFactory::getBean($module_name, $record_id);

                if (!array_key_exists($key, $result))
                {
                    $result[$key]['module_name'] = $module_bean->module_name;
                    $result[$key]['module_label'] = $app_list_strings['moduleListSingular'][$module_bean->module_name];
                    $result[$key]['record_id'] = $module_bean->id;
                    $result[$key]['record_name'] = $module_bean->name;
                    $result[$key]['parent_id'] = isset($module_bean->account_id) ? $module_bean->account_id : '';
                    $result[$key]['parent_name'] = isset($module_bean->account_name) ? $module_bean->account_name : '';
                    $result[$key]['primary_email'] = $module_bean->emailAddress->getPrimaryAddress($module_bean);
                }
                break;

            default:
                if (!array_key_exists($key, $result))
                {
                    $result[$key]['module_name'] = $module_bean->module_name;
                    $result[$key]['module_label'] = $app_list_strings['moduleListSingular'][$module_bean->module_name];
                    $result[$key]['record_id'] = $module_bean->id;
                    $result[$key]['record_name'] = $module_bean->name;
                    $result[$key]['parent_id'] = "";
                    $result[$key]['parent_name'] = "";
                    $result[$key]['primary_email'] = "";
                }
                break;
        }

        if ($limit)
        {
            $final_result = current($result);

            !isset($_REQUEST['number']) ?: $final_result['number'] = $_REQUEST['number'];
            !isset($_REQUEST['extension']) ?: $final_result['extension'] = $_REQUEST['extension'];
            !isset($_REQUEST['direction']) ?: $final_result['direction'] = $_REQUEST['direction'];
            !isset($_REQUEST['uniqueid']) ?: $final_result['uniqueid'] = $_REQUEST['uniqueid'];
            !isset($_REQUEST['hangup_channel']) ?: $final_result['hangup_channel'] = $_REQUEST['hangup_channel'];
            !isset($_REQUEST['redirect_channel']) ?: $final_result['redirect_channel'] = $_REQUEST['redirect_channel'];

            return $final_result;
        }
    }
	
	$limit=true;
    //Search In Contacts Module
//    $sql_contacts = "SELECT `id` FROM `contacts` WHERE (REPLACE(`phone_mobile`,'-','') LIKE '%$search_number%' or REPLACE(`phone_fax`,'-','') LIKE '%$search_number%' OR REPLACE(`phone_work`,'-','') LIKE '%$search_number%' OR REPLACE(`phone_home`,'-','') LIKE '%$search_number%' OR REPLACE(`phone_other`,'-','') LIKE '%$search_number%') AND deleted = '0' ORDER BY `date_modified` DESC";
    $sql_contacts = "SELECT `id` FROM `contacts` WHERE `phone_mobile` LIKE '%$search_number%' or `phone_fax` LIKE '%$search_number%' OR `phone_work` LIKE '%$search_number%' OR `phone_home` LIKE '%$search_number%' OR `phone_other` LIKE '%$search_number%' AND deleted = '0' ORDER BY `date_modified` DESC";

    if ($limit)
    {
        $sql_contacts .= " LIMIT 1";
    }

    $res_contacts = $GLOBALS['db']->query($sql_contacts);
    $numrows_contacts = $res_contacts->num_rows;

    if ($numrows_contacts > 0)
    {
        $module_name = "Contacts";

        while ($row_contacts = $GLOBALS['db']->fetchByAssoc($res_contacts))
        {
            $record_id = $row_contacts['id'];
            $module_bean = BeanFactory::getBean($module_name, $record_id);

            $key = $module_name . "_" . $record_id;

            if (!array_key_exists($key, $result))
            {
                $result[$key]['module_name'] = $module_bean->module_name;
                $result[$key]['module_label'] = $app_list_strings['moduleListSingular'][$module_bean->module_name];
                $result[$key]['record_id'] = $module_bean->id;
                $result[$key]['record_name'] = $module_bean->name;
                $result[$key]['parent_id'] = isset($module_bean->account_id) ? $module_bean->account_id : '';
                $result[$key]['parent_name'] = isset($module_bean->account_name) ? $module_bean->account_name : '';
                $result[$key]['primary_email'] = $module_bean->emailAddress->getPrimaryAddress($module_bean);
            }
        }

        if ($limit)
        {
            $final_result = current($result);

            !isset($_REQUEST['number']) ?: $final_result['number'] = $_REQUEST['number'];
            !isset($_REQUEST['extension']) ?: $final_result['extension'] = $_REQUEST['extension'];
            !isset($_REQUEST['direction']) ?: $final_result['direction'] = $_REQUEST['direction'];
            !isset($_REQUEST['uniqueid']) ?: $final_result['uniqueid'] = $_REQUEST['uniqueid'];
            !isset($_REQUEST['hangup_channel']) ?: $final_result['hangup_channel'] = $_REQUEST['hangup_channel'];
            !isset($_REQUEST['redirect_channel']) ?: $final_result['redirect_channel'] = $_REQUEST['redirect_channel'];

            return $final_result;
        }
    }

    //Search In Leads Module
//    $sql_leads = "SELECT `id` FROM `leads` WHERE (REPLACE(`phone_mobile`,'-','') LIKE '%$search_number%' or REPLACE(`phone_fax`,'-','') LIKE '%$search_number%' OR REPLACE(`phone_work`,'-','') LIKE '%$search_number%' OR REPLACE(`phone_home`,'-','') LIKE '%$search_number%' OR REPLACE(`phone_other`,'-','') LIKE '%$search_number%') AND deleted = '0' ORDER BY `date_modified` DESC";
    $sql_leads = "SELECT `id` FROM `leads` WHERE `phone_mobile` LIKE '%$search_number%' or `phone_fax` LIKE '%$search_number%' OR `phone_work` LIKE '%$search_number%' OR `phone_home` LIKE '%$search_number%' OR `phone_other` LIKE '%$search_number%' AND deleted = '0' ORDER BY `date_modified` DESC";

    if ($limit)
    {
        $sql_leads .= " LIMIT 1";
    }

    $res_leads = $GLOBALS['db']->query($sql_leads);
    $numrows_leads = $res_leads->num_rows;

    if ($numrows_leads > 0)
    {
        $module_name = "Leads";

        while ($row_leads = $GLOBALS['db']->fetchByAssoc($res_leads))
        {
            $record_id = $row_leads['id'];
            $module_bean = BeanFactory::getBean($module_name, $record_id);

            $key = $module_name . "_" . $record_id;

            if (!array_key_exists($key, $result))
            {
                $result[$key]['module_name'] = $module_bean->module_name;
                $result[$key]['module_label'] = $app_list_strings['moduleListSingular'][$module_bean->module_name];
                $result[$key]['record_id'] = $module_bean->id;
                $result[$key]['record_name'] = $module_bean->name;
                $result[$key]['parent_id'] = isset($module_bean->account_id) ? $module_bean->account_id : '';
                $result[$key]['parent_name'] = isset($module_bean->account_name) ? $module_bean->account_name : '';
                $result[$key]['primary_email'] = $module_bean->emailAddress->getPrimaryAddress($module_bean);
            }
        }

        if ($limit)
        {
            $final_result = current($result);

            !isset($_REQUEST['number']) ?: $final_result['number'] = $_REQUEST['number'];
            !isset($_REQUEST['extension']) ?: $final_result['extension'] = $_REQUEST['extension'];
            !isset($_REQUEST['direction']) ?: $final_result['direction'] = $_REQUEST['direction'];
            !isset($_REQUEST['uniqueid']) ?: $final_result['uniqueid'] = $_REQUEST['uniqueid'];
            !isset($_REQUEST['hangup_channel']) ?: $final_result['hangup_channel'] = $_REQUEST['hangup_channel'];
            !isset($_REQUEST['redirect_channel']) ?: $final_result['redirect_channel'] = $_REQUEST['redirect_channel'];

            return $final_result;
        }
    }

    //Search In Accounts Module
    $sql_accounts = "SELECT `id` FROM `accounts` WHERE (REPLACE(`phone_office`,'-','') LIKE '%$search_number%' or REPLACE(`phone_fax`,'-','') LIKE '%$search_number%' OR REPLACE(`phone_alternate`,'-','') LIKE '%$search_number%') AND deleted = '0' ORDER BY `date_modified` DESC";

    if ($limit)
    {
        $sql_accounts .= " LIMIT 1";
    }

    $res_accounts = $GLOBALS['db']->query($sql_accounts);
    $numrows_accounts = $res_accounts->num_rows;

    if ($numrows_accounts > 0)
    {
        $module_name = "Accounts";

        while ($row_accounts = $GLOBALS['db']->fetchByAssoc($res_accounts))
        {
            $record_id = $row_accounts['id'];
            $module_bean = BeanFactory::getBean($module_name, $record_id);

            $key = $module_name . "_" . $record_id;

            if (!array_key_exists($key, $result))
            {
                $result[$key]['module_name'] = $module_bean->module_name;
                $result[$key]['module_label'] = $app_list_strings['moduleListSingular'][$module_bean->module_name];
                $result[$key]['record_id'] = $module_bean->id;
                $result[$key]['record_name'] = $module_bean->name;
                $result[$key]['parent_id'] = isset($module_bean->account_id) ? $module_bean->account_id : '';
                $result[$key]['parent_name'] = isset($module_bean->account_name) ? $module_bean->account_name : '';
                $result[$key]['primary_email'] = $module_bean->emailAddress->getPrimaryAddress($module_bean);
            }
        }

        if ($limit)
        {
            $final_result = current($result);

            !isset($_REQUEST['number']) ?: $final_result['number'] = $_REQUEST['number'];
            !isset($_REQUEST['extension']) ?: $final_result['extension'] = $_REQUEST['extension'];
            !isset($_REQUEST['direction']) ?: $final_result['direction'] = $_REQUEST['direction'];
            !isset($_REQUEST['uniqueid']) ?: $final_result['uniqueid'] = $_REQUEST['uniqueid'];
            !isset($_REQUEST['hangup_channel']) ?: $final_result['hangup_channel'] = $_REQUEST['hangup_channel'];
            !isset($_REQUEST['redirect_channel']) ?: $final_result['redirect_channel'] = $_REQUEST['redirect_channel'];

            return $final_result;
        }
    }

    if ($limit)
    {
        $final_result = array();
        $final_result['module_name'] = "";
        $final_result['module_label'] = "";
        $final_result['record_id'] = "";
        $final_result['record_name'] = "";
        $final_result['parent_id'] = "";
        $final_result['parent_name'] = "";
        $final_result['primary_email'] = "";

        !isset($_REQUEST['number']) ?: $final_result['number'] = $_REQUEST['number'];
        !isset($_REQUEST['extension']) ?: $final_result['extension'] = $_REQUEST['extension'];
        !isset($_REQUEST['direction']) ?: $final_result['direction'] = $_REQUEST['direction'];
        !isset($_REQUEST['uniqueid']) ?: $final_result['uniqueid'] = $_REQUEST['uniqueid'];
        !isset($_REQUEST['hangup_channel']) ?: $final_result['hangup_channel'] = $_REQUEST['hangup_channel'];
        !isset($_REQUEST['redirect_channel']) ?: $final_result['redirect_channel'] = $_REQUEST['redirect_channel'];

        return $final_result;
    }

    return $result;
}

function AsteriskIntegrationLogCall()
{
    $source = $_REQUEST['source'];
    $destination = $_REQUEST['destination'];
    $disposition = $_REQUEST['disposition'];
    $duration = $_REQUEST['duration'];
    $starttime = $_REQUEST['starttime'];
	$answertime = $_REQUEST['answertime'];
    $uniqueid = $_REQUEST['uniqueid'];
    $server_ip = $_REQUEST['server_ip'];
    $socket_port = $_REQUEST['socket_port'];
    $recordinglink_ip = $_REQUEST['recordinglink_ip'];
    $recordinglink_port = $_REQUEST['recordinglink_port'];
    $recordinglink_protocol = "http";
    $recordinglink_protocol_ip_port = $recordinglink_protocol . "://" . $recordinglink_ip . ":" . $recordinglink_port;
    list($starttime_date, $starttime_time) = explode(" ", $starttime);
	list($answertime_date,$answertime_time) = explode(" ", $answertime);
    list($recordinglink_date_y, $recordinglink_date_m, $recordinglink_date_d) = explode("-", $starttime_date);
    $recordinglink_date_ymd = $recordinglink_date_y . $recordinglink_date_m . $recordinglink_date_d;
    $recordinglink_date_his = implode("", explode(":", $starttime_time));
	$recordinglink_date_his2  = implode("", explode(":", $answertime_time));
    $dbstarttime = AsteriskIntegrationDatabaseTime($starttime);
    $duration_string = AsteriskIntegrationTimeToString($duration);
    $converted_duration = AsteriskIntegrationConvertSecondsToHoursMinutesSeconds($duration);
    $duration_hours = $converted_duration['hours'];
    $duration_minutes = $converted_duration['minutes'];
    $duration_seconds = $converted_duration['seconds'];

    if (strlen($source) >= 7 && strlen($destination) < 7)
    {
        $direction = "Inbound";
        $number = $source;
        $extension = $destination;
        $recordinglink = $recordinglink_protocol_ip_port . "/recordings/" . $recordinglink_date_y . "/" . $recordinglink_date_m . "/" . $recordinglink_date_d . "/in-" . $extension . "-" . $number . "-" . $recordinglink_date_ymd . "-" . $recordinglink_date_his . "-" . $uniqueid . ".wav";
		$check= URLIsValid($recordinglink);
		if($check !=1){
			$recordinglink = $recordinglink_protocol_ip_port . "/recordings/" . $recordinglink_date_y . "/" . $recordinglink_date_m . "/" . $recordinglink_date_d . "/in-" . $extension . "-" . $number . "-" . $recordinglink_date_ymd . "-" . $recordinglink_date_his2 . "-" . $uniqueid . ".wav";
		}
	}
    elseif (strlen($destination) >= 7 && strlen($source) < 7)
    {
        $direction = "Outbound";
        $number = $destination;
        $extension = $source;
        $recordinglink = $recordinglink_protocol_ip_port . "/recordings/" . $recordinglink_date_y . "/" . $recordinglink_date_m . "/" . $recordinglink_date_d . "/out-" . $number . "-" . $extension . "-" . $recordinglink_date_ymd . "-" . $recordinglink_date_his . "-" . $uniqueid . ".wav";
		$check= URLIsValid($recordinglink);
		if($check !=1){
			$recordinglink = $recordinglink_protocol_ip_port . "/recordings/" . $recordinglink_date_y . "/" . $recordinglink_date_m . "/" . $recordinglink_date_d . "/out-" . $number . "-" . $extension . "-" . $recordinglink_date_ymd . "-" . $recordinglink_date_his2 . "-" . $uniqueid . ".wav";
		}
	}

    $number_details = AsteriskIntegrationGetRecordsFromNumber(false, $number, $extension);

    $user_id = AsteriskIntegrationGetUserIdFromExtension($extension);

    if (count($number_details) > 0)
    {
        $parent_details = current($number_details);
        $parent_type = $parent_details['module_name'];
        $parent_id = $parent_details['record_id'];
    }
    else
    {
        $parent_type = '';
        $parent_id = '';
    }

    if ((strlen($source) < 7 && strlen($destination) < 7) || (strlen($source) > 7 && strlen($destination) > 7))
    {
        $direction = "";
    }

    switch ($disposition)
    {
        case "ANSWERED":
            $status = "Held";
            break;

        default:
            $status = "Not Held";
            $duration = 0;
            break;
    }

    if ($direction !== "" && $user_id !== -1)
    {
        $bean = BeanFactory::newBean("AsteriskIntegration");
        $bean->number = $number;
        $bean->extension = $extension;
        $bean->direction = $direction;
        $bean->status = $status;
        $bean->call_date = $starttime_date;
        $bean->duration = $duration_string;
        $bean->duration_hours = $duration_hours;
        $bean->duration_minutes = $duration_minutes;
        $bean->duration_seconds = $duration_seconds;
        $bean->asterisk_server = $server_ip . ":" . $socket_port;
        $bean->assigned_user_id = $user_id;
        $bean->modified_user_id = $user_id;
        $bean->created_by = $user_id;
        $bean->date_entered = $dbstarttime;
        $bean->date_modified = $dbstarttime;
        $bean->update_date_modified = false;
        $bean->set_created_by = false;
        $bean->update_modified_by = false;
        $bean->update_date_entered = false;
        $bean->parent_type = $parent_type;
        $bean->parent_id = $parent_id;
        $bean->recording_link = $recordinglink;
        $bean->unique_id = $uniqueid;

        $call_id = $bean->save();

        foreach ($number_details as $number_array)
        {
            $module_name = $number_array['module_name'];
            $record_id = $number_array['record_id'];

            if ($module_name !== "" && $record_id !== "")
            {
                switch ($module_name)
                {
                    case "Contacts":
                        $bean->load_relationship('asteriskintegration_contacts');
                        $bean->asteriskintegration_contacts->add($record_id);
                        break;

                    case "Leads":
                        $bean->load_relationship('asteriskintegration_leads');
                        $bean->asteriskintegration_leads->add($record_id);
                        break;

                    case "Accounts":
                        $bean->load_relationship('asteriskintegration_accounts');
                        $bean->asteriskintegration_accounts->add($record_id);
                        break;
                }
            }
        }

        $result['call_id'] = $call_id;
        $result['extension'] = $extension;
        $result['uniqueid'] = $uniqueid;
        $result['duration'] = $duration;

        $click_to_call_del = array();
        $click_to_call_del['user_id'] = $user_id;
        $click_to_call_del['number'] = $number;

        AsteriskIntegrationClickToCallRemoveFromDB($click_to_call_del);

        return $result;
    }
}

function AsteriskIntegrationSaveDescription()
{
    $call_id = $_REQUEST['call_id'];
    $description = $_REQUEST['description'];
    $disposition = $_REQUEST['disposition'];

    $bean = BeanFactory::getBean("AsteriskIntegration", $call_id);

    if (strlen($description) > 100)
    {
        $subject = substr($description, 0, 97);
        $subject .= "...";
    }
    else
    {
        $subject = $description;
    }

    $bean->name = $subject;
    $bean->description = $description;
    $bean->disposition = $disposition;
    $bean->save();

    $result['status'] = 'saved';

    return $result;
}

function AsteriskIntegrationActivationStatus()
{
    require_once 'modules/AsteriskIntegration/outfitterslicense.php';

    if (AsteriskIntegrationOutfitters::isValid("AsteriskIntegration") !== true)
    {
        $result['status'] = false;
    }
    else
    {
        $result['status'] = true;
    }

    return $result;
}
?>