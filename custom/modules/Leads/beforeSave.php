<?php
ini_set('display_errors', 0);
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class BeforeSave
{
    private static $marTViet = array(
        "à",
        "á",
        "ạ",
        "ả",
        "ã",
        "â",
        "ầ",
        "ấ",
        "ậ",
        "ẩ",
        "ẫ",
        "ă",
        "ằ",
        "ắ",
        "ặ",
        "ẳ",
        "ẵ",
        "è",
        "é",
        "ẹ",
        "ẻ",
        "ẽ",
        "ê",
        "ề",
        "ế",
        "ệ",
        "ể",
        "ễ",
        "ì",
        "í",
        "ị",
        "ỉ",
        "ĩ",
        "ò",
        "ó",
        "ọ",
        "ỏ",
        "õ",
        "ô",
        "ồ",
        "ố",
        "ộ",
        "ổ",
        "ỗ",
        "ơ",
        "ờ",
        "ớ",
        "ợ",
        "ở",
        "ỡ",
        "ù",
        "ú",
        "ụ",
        "ủ",
        "ũ",
        "ư",
        "ừ",
        "ứ",
        "ự",
        "ử",
        "ữ",
        "ỳ",
        "ý",
        "ỵ",
        "ỷ",
        "ỹ",
        "đ",
        "À",
        "Á",
        "Ạ",
        "Ả",
        "Ã",
        "Â",
        "Ầ",
        "Ấ",
        "Ậ",
        "Ẩ",
        "Ẫ",
        "Ă",
        "Ằ",
        "Ắ",
        "Ặ",
        "Ẳ",
        "Ẵ",
        "È",
        "É",
        "Ẹ",
        "Ẻ",
        "Ẽ",
        "Ê",
        "Ề",
        "Ế",
        "Ệ",
        "Ể",
        "Ễ",
        "Ì",
        "Í",
        "Ị",
        "Ỉ",
        "Ĩ",
        "Ò",
        "Ó",
        "Ọ",
        "Ỏ",
        "Õ",
        "Ô",
        "Ồ",
        "Ố",
        "Ộ",
        "Ổ",
        "Ỗ",
        "Ơ",
        "Ờ",
        "Ớ",
        "Ợ",
        "Ở",
        "Ỡ",
        "Ù",
        "Ú",
        "Ụ",
        "Ủ",
        "Ũ",
        "Ư",
        "Ừ",
        "Ứ",
        "Ự",
        "Ử",
        "Ữ",
        "Ỳ",
        "Ý",
        "Ỵ",
        "Ỷ",
        "Ỹ",
        "Đ"
    );
    private static $marKoDau = array(
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "a",
        "e",
        "e",
        "e",
        "e",
        "e",
        "e",
        "e",
        "e",
        "e",
        "e",
        "e",
        "i",
        "i",
        "i",
        "i",
        "i",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "o",
        "u",
        "u",
        "u",
        "u",
        "u",
        "u",
        "u",
        "u",
        "u",
        "u",
        "u",
        "y",
        "y",
        "y",
        "y",
        "y",
        "d",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "A",
        "E",
        "E",
        "E",
        "E",
        "E",
        "E",
        "E",
        "E",
        "E",
        "E",
        "E",
        "I",
        "I",
        "I",
        "I",
        "I",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "O",
        "U",
        "U",
        "U",
        "U",
        "U",
        "U",
        "U",
        "U",
        "U",
        "U",
        "U",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "D"
    );
    private static $tohop = array(
        "à",
        "á",
        "ạ",
        "ả",
        "ã",
        "â",
        "ầ",
        "ấ",
        "ậ",
        "ẩ",
        "ẫ",
        "ă",
        "ằ",
        "ắ",
        "ặ",
        "ẳ",
        "ẵ",
        "è",
        "é",
        "ẹ",
        "ẻ",
        "ẽ",
        "ê",
        "ề",
        "ế",
        "ệ",
        "ể",
        "ễ",
        "ì",
        "í",
        "ị",
        "ỉ",
        "ĩ",
        "ò",
        "ó",
        "ọ",
        "ỏ",
        "õ",
        "ô",
        "ồ",
        "ố",
        "ộ",
        "ổ",
        "ỗ",
        "ơ",
        "ờ",
        "ớ",
        "ợ",
        "ở",
        "ỡ",
        "ù",
        "ú",
        "ụ",
        "ủ",
        "ũ",
        "ư",
        "ừ",
        "ứ",
        "ự",
        "ử",
        "ữ",
        "ỳ",
        "ý",
        "ỵ",
        "ỷ",
        "ỹ",
        "đ",
        "À",
        "Á",
        "Ạ",
        "Ả",
        "Ã",
        "Â",
        "Ầ",
        "Ấ",
        "Ậ",
        "Ẩ",
        "Ẫ",
        "Ă",
        "Ằ",
        "Ắ",
        "Ặ",
        "Ẳ",
        "Ẵ",
        "È",
        "É",
        "Ẹ",
        "Ẻ",
        "Ẽ",
        "Ê",
        "Ề",
        "Ế",
        "Ệ",
        "Ể",
        "Ễ",
        "Ì",
        "Í",
        "Ị",
        "Ỉ",
        "Ĩ",
        "Ò",
        "Ó",
        "Ọ",
        "Ỏ",
        "Õ",
        "Ô",
        "Ồ",
        "Ố",
        "Ộ",
        "Ổ",
        "Ỗ",
        "Ơ",
        "Ờ",
        "Ớ",
        "Ợ",
        "Ở",
        "Ỡ",
        "Ù",
        "Ú",
        "Ụ",
        "Ủ",
        "Ũ",
        "Ư",
        "Ừ",
        "Ứ",
        "Ự",
        "Ử",
        "Ữ",
        "Ỳ",
        "Ý",
        "Ỵ",
        "Ỷ",
        "Ỹ",
        "Đ"
    );

    function ucwords_extended($string, $encoding = 'UTF-8')
    {
        $return_string = mb_strtolower($string, $encoding);
        $words = explode(' ', $return_string);
        foreach ($words as $index => $word)
        {
            $words[$index] = mb_strtoupper(mb_substr($word, 0, 1, $encoding) , $encoding) . mb_substr($word, 1, mb_strlen($word, $encoding) , $encoding);
        }
        $return_string = implode(' ', $words);

        return $return_string;
    }

    function normalize($bean, $event, $argument)
    {
        $GLOBALS['log']->debug('normalize');
        // unicode to hop -> unicode dung san
        $bean->last_name = str_replace(self::$tohop, self::$marTViet, $bean->last_name);
        $bean->last_name = $this->ucwords_extended(mb_strtolower($bean->last_name, 'UTF-8'));
    }

    private function sanitizePhone($mobile)
    {
        $mobile = preg_replace('/[^\d]/', '', $mobile);
        if (substr($mobile, 0, 1) != '0') $mobile = '0' . $mobile;
        return $mobile;
    }

    function formatPhone($bean, $event, $argument)
    {
        $mobile = $this->sanitizePhone($bean->phone_mobile);
        $bean->phone_mobile = $mobile;
        $phone_home = $this->sanitizePhone($bean->phone_home);
        $bean->phone_home = $phone_home;
        $phone_work = $this->sanitizePhone($bean->phone_work);
        $bean->phone_work = $phone_work;
        $phone_other = $this->sanitizePhone($bean->phone_other);
        $bean->phone_other = $phone_other;
    }

    function prevent_change_active_lead_status($bean, $event, $argument)
    {
        //$new_status = $bean->status;
        if ($bean->fetched_row['status'] == 'active_lead')
        {
            $bean->status = $bean->fetched_row['status'];
        }
    }

    function prevent_change_lead_topic($bean, $event, $argument)
    {
        //$new_status = $bean->status;
		global $current_user;
		$GLOBALS['log']->fatal($current_user->is_admin);
        if (!empty($bean->fetched_row['id']) && $current_user->is_admin==0)
        {
            $bean->topic_c = $bean->fetched_row['topic_c'];
        }
    }

    function check_dup_phone($phone, $bean)
    {
        global $db;
        $exclude = '';
        $exclude_lead_id = $bean->id;
        if (!empty($exclude_lead_id)) $exclude .= " AND id != '$exclude_lead_id'";
        // $sql = "SELECT * FROM leads WHERE (phone_work='$phone' OR phone_mobile = '$phone' OR phone_home = '$phone' OR phone_other = '$phone') AND deleted != 1 $exclude";
        $sql = "SELECT count(id) as total FROM leads WHERE (phone_work='$phone' OR phone_mobile='$phone' OR phone_home='$phone' OR phone_other='$phone') AND deleted = 0";
        $sql .= $exclude;
        //$GLOBALS['log']->fatal($sql);
        $result = $db->query($sql);
        // $count = $db->getRowCount($result);
        $data = $db->fetchByAssoc($result);
        $count = $data['total'];
        if ($count >= 1) return true;
        // if ($count > 0) return true;
        return false;
    }

    function check_all_phone_numbers($bean, $event, $argument)
    {
        global $current_user, $db;
        $module = $_POST['module'];
        $action = $_POST['action'];
        $entryPoint = $_GET['entryPoint'];
        if(
            $entryPoint === "apiUpLeadWebsite" 
            || ($module === "Leads" && $action === "MassUpdate")
            || ($module === "Import" && $action === "Step4")

        ){
            return true;
        }
        $phone_work = $this->sanitizePhone($bean->phone_work);
        $phone_array = array();
        if (!empty($phone_work))
        {
            $phone_array[] = $phone_work;
            if ($this->check_dup_phone($phone_work, $bean))
            {
                if (!empty($bean->fetched_row['phone_work'])) $bean->phone_work = $bean->fetched_row['phone_work'];
                else $bean->phone_work = 0;
                $this->responseErrInlineSave();
                echo '<span style="color: red; font-weight: bold;">Trùng số!' . $phone_work . '</span> Đã chuyển lại về số cũ: ';
                // echo 'Số điện thoại sinh viên 2 bị trùng';
                sugar_die('Số điện thoại sinh viên 2 bị trùng');
                
            }
        }
        $phone_mobile = $this->sanitizePhone($bean->phone_mobile);
        if (!empty($phone_mobile))
        {
            $phone_array[] = $phone_mobile;
            if ($this->check_dup_phone($phone_mobile, $bean))
            {
                if (!empty($bean->fetched_row['phone_mobile'])) $bean->phone_mobile = $bean->fetched_row['phone_mobile'];
                else $bean->phone_mobile = 0;
                $this->responseErrInlineSave();
                echo '<span style="color: red; font-weight: bold;">Trùng số!' . $phone_mobile . '</span> Đã chuyển lại về số cũ: ';
                // echo 'Số Mobile bị trùng!';
                sugar_die('Số Mobile bị trùng!');
                
            }
        }
        $phone_home = $this->sanitizePhone($bean->phone_home);
        if (!empty($phone_home))
        {
            $phone_array[] = $phone_home;
            if ($this->check_dup_phone($phone_home, $bean))
            {
                if (!empty($bean->fetched_row['phone_home'])) $bean->phone_home = $bean->fetched_row['phone_home'];
                else $bean->phone_home = 0;
                $this->responseErrInlineSave();
                echo '<span style="color: red; font-weight: bold;">Trùng số!' . $phone_home . '</span> Đã chuyển lại về số cũ: ';
                // echo 'Số điện thoại phụ huynh 1 bị trùng!';
                sugar_die('Số điện thoại phụ huynh 1 bị trùng!');
                
            }
        }
        $phone_other = $this->sanitizePhone($bean->phone_other);
        if (!empty($phone_other))
        {
            $phone_array[] = $phone_other;
            if ($this->check_dup_phone($phone_other, $bean))
            {
                if (!empty($bean->fetched_row['phone_other'])) $bean->phone_other = $bean->fetched_row['phone_other'];
                else $bean->phone_other = 0;
                $this->responseErrInlineSave();
                echo 'Số điện thoại phụ huynh 2 bị trùng!';
                // echo '<span style="color: red; font-weight: bold;">Trùng số!' . $phone_other . '</span> Đã chuyển lại về số cũ: ';
                sugar_die('Số điện thoại phụ huynh 2 bị trùng!');
                
            }
        }

        $no_dup_phone_array = array_unique($phone_array);
        if (count($no_dup_phone_array) != count($phone_array)) {
            // echo 'Bốn số điện thoại của lead không được trùng nhau!';
            $this->responseErrInlineSave('Bốn số điện thoại của lead không được trùng nhau!');
            sugar_die('Bốn số điện thoại của lead không được trùng nhau!');
        }
        
    }

    function save_date_activated($bean, $event, $argument)
    {
		if($_REQUEST['action'] !='ConvertLead' && $_REQUEST['module'] != 'Import'){
			$GLOBALS['log']->fatal("Update Leads API"); 
			$GLOBALS['log']->fatal($_REQUEST); 
			include_once 'custom/api_ants.php';
			if(!empty($bean->fetched_row['id'])){
				$result=CreateLeadAPI($bean,'update');
				$GLOBALS['log']->fatal($result);
			}
		}
		
        if ($bean->fetched_row['status'] != 'active_lead' && $bean->status == 'active_lead')
        {
            $now_db = TimeDate::getInstance()->nowDb();
            $bean->date_activated_c = $now_db;
        }
    }

    function update_legacy_calls($bean, $event, $argument)
    {
        global $db, $current_user;
        include_once 'include/TimeDate.php';
        $timedate = new TimeDate($current_user);
        if (empty($bean->fetched_row['id']))
        {
            if (!empty($bean->description)) $bean->call_log_c = '1. ' . $bean->description;
        }

        // // Dup check
        // if($bean->new_dup_c == 1) {
        // if(strtotime($bean->date_modified) >= strtotime($bean->last_dup_c)) {
        // $bean->new_dup_c = 0;
        // }
        // }
        
    }

    function save_date_enrolled($bean, $event, $argument)
    {
        if ($bean->fetched_row['ne_c'] != 1 && $bean->ne_c == 1)
        {
            $now_db = TimeDate::getInstance()->nowDb();
            $bean->date_enrolled_c = $now_db;
        }
    }

    function mark_auto_assign_leads($bean, $event, $argument)
    {
        global $current_user;
        // if (empty($bean->fetched_row['id']))
        // $bean->description = $bean->description . ' | id: ' . $bean->assigned_user_id . ' | name: ' . $bean->assigned_user_name;
        if (empty($bean->fetched_row['id']) && $bean->assigned_user_id == $current_user->id)
        {
            $bean->auto_assign_c = 1;
        }
    }

    function log_lead($bean, $event, $argument)
    {
        global $db;
        //$bean->rating_c = 'hot';
        // $GLOBALS['log']->fatal("Event:");
        // $GLOBALS['log']->fatal($event);
        // $GLOBALS['log']->fatal("Args:");
        // $GLOBALS['log']->fatal($argument);
        // $GLOBALS['log']->fatal("Rows:");
        // $GLOBALS['log']->fatal($bean->fetched_row);
        if (!empty($bean->fetched_row['id'])) return;
        $bean->contacted_c = 1;
        $phone = $this->sanitizePhone($bean->phone_mobile);
        $name = htmlspecialchars($bean->last_name, ENT_QUOTES);
        if (isset($bean->abc_city_leadsabc_city_ida)) $city = $bean->abc_city_leadsabc_city_ida;
        else
        {
            $city = '';
        }
        $name = str_replace(self::$tohop, self::$marTViet, $name);
        $name = $this->ucwords_extended(mb_strtolower($name, 'UTF-8'));
        // $GLOBALS['log']->fatal("Bean:");
        // $GLOBALS['log']->fatal(var_export($bean, true));
        // $GLOBALS['log']->fatal("Args:");
        // $GLOBALS['log']->fatal(var_export($argument, true));
        $sql = "SELECT a.id FROM leads a 
            INNER JOIN leads_cstm b 
            ON a.id = b.id_c
            INNER JOIN abc_city_leads_c c
            ON a.id = c.abc_city_leadsleads_idb
            INNER JOIN abc_city d
            ON c.abc_city_leadsabc_city_ida = d.id
            WHERE a.phone_mobile = '$phone' 
            AND a.last_name = '$name'
            AND c.abc_city_leadsabc_city_ida = '$city'
            AND a.deleted = 0
            AND c.deleted = 0
            AND d.deleted = 0";
        //$GLOBALS['log']->fatal($sql);
        $result = $db->query($sql);
        //$GLOBALS['log']->fatal("Lead Count: " . var_export($db->getRowCount($result), true));
        if ($db->getRowCount($result) > 0)
        {
            while ($row = $db->fetchByAssoc($result))
            {
                $lead_id = $row['id'];
                // $sql = "SELECT * FROM fug_leadlogs WHERE lead_id_c = '$lead_id' AND deleted = 0";
                // $GLOBALS['log']->fatal($sql);
                // $result_log = $db->query($sql);
                // $count = $db->getRowCount($result_log);
                // $GLOBALS['log']->fatal('Lead Log Count: ', $count);
                $log = new fug_LeadLogs();
                $log->lead_id_c = $lead_id;
                $log->lead_name = $bean->last_name;
                $lead = BeanFactory::getBean('Leads', $lead_id);
                $lead->load_relationship('fug_leadlogs_leads');
                $log->load_relationship('fug_leadlogs_leads');
                $log_count = count($lead
                    ->fug_leadlogs_leads
                    ->getBeans());
                $number = ++$log_count;
                $log->number1 = $number;
                $log->lead_source = $bean->lead_source_name_c;
                $log->created_by = $bean->created_by;
                $log->save();

                $log
                    ->fug_leadlogs_leads
                    ->add($lead_id);
                // $lead = BeanFactory::getBean('Leads', $lead_id);
                // $lead->rating_c = 'hot';
                // $lead->number1_c = $number;
                // $lead->save();
                $sql = "UPDATE leads_cstm SET rating_c = 'hot', number1_c = '$number' WHERE id_c = '$lead_id'";
                //$GLOBALS['log']->fatal($sql);
                $db->query($sql);
            }
            $bean->deleted = 1; // don't save the duplicate lead
            
        }
    }

    function responseErrInlineSave($msg = 'Số điện thoại bị trùng!'){
        if($_SERVER['REQUEST_METHOD'] == "GET" 
                && ($_GET['module'] === "Home" && $_GET['action'] === "saveHTMLField")){
            echo json_encode([
                'status' => false,
                'msg' => $msg
            ]);
            die;
        }
    }
}
