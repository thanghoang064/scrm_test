<?php

//require_once('include/MVC/View/views/view.list.php');
require_once('modules/Leads/views/view.list.php');
require_once('modules/Leads/LeadsListViewSmarty.php');

class CustomLeadsViewList extends LeadsViewList
{

    public $isLeadsModule = true;

    public function display()
    {
        ?>
        <script type="text/javascript">
            jQuery(function () {
                jQuery('.listViewBody table td[field="call_log_c"]').each(function () {
                    var call_log = jQuery(this).text().replace(/\|/g, "<br />");
                    jQuery(this).html(call_log);
                });
                jQuery('.listViewBody table tr').has("td[field=new_dup_c] input.checkbox:checked").find("td[field=last_name] > a").css({
                    "color": "red",
                    "font-weight": "bold"
                });
            });
        </script>
        <?php
        $num = $GLOBALS['sugar_config']['list_max_entries_per_page'];
        $_SESSION['loi'] = "";
        $_SESSION['num'] = "";
        if (isset($_POST['listview_item']) and (int)$_POST['listview_item'] > 1001) {
            $_SESSION['loi'] = "Max là 1000 bản ghi trên một trang";
            $num['num'] = 1001;
            setcookie('num', 1001, time() + 3600, "/");
        } elseif (isset($_POST['listview_item']) and (int)$_POST['listview_item'] < 1001) {
            $num = isset($_POST['listview_item']) ? (int)$_POST['listview_item'] : $_COOKIE['num'];
            setcookie('num', $_POST['listview_item'], time() + 3600, "/");
        } else {
            $num = isset($_COOKIE['num']) ? $_COOKIE['num'] : $GLOBALS['sugar_config']['list_max_entries_per_page'];
        }

        $num_lvp = $_POST['listview_item'] ? $_POST['listview_item'] : $num;
        echo "<form action='' method='post' style='width: 100%;background: #534d64;color: #f08377;padding: 5px;margin-top: -30px;'>
                <label style='font-weight: bold;'>Nhập số bản ghi hiển thị trên 1 trang: </label>
                <input type='text' name='listview_item' value='$num_lvp' placeholder='Nhập số bản ghi hiển thị trên 1 trang'>&nbsp;(Max 1000)&nbsp;&nbsp;
                <input type='submit' name='sm_listview_item' value='view'>
        </form>";
        echo "<span style='color:red;text-align:center;display: block;'>" . $_SESSION['loi'] . "</span>";
        $GLOBALS['sugar_config']['list_max_entries_per_page'] = $num_lvp;

        if (!$this->bean || !$this->bean->ACLAccess('list')) {
            ACLController::displayNoAccess();
        } else {
            $this->listViewPrepare();
            $this->listViewProcess();
        }
    }

    function listViewPrepare()
    {
        if (empty($_REQUEST['orderBy'])) {

            $_REQUEST['orderBy'] = strtoupper('NEW_DUP_C');

            $_REQUEST['sortOrder'] = 'desc';
        }
        parent::listViewPrepare();
    }


    public function listViewProcess()
    {
        global $current_user, $db, $sugar_config;
        $this->processSearchForm();
        $this->lv->searchColumns = $this->searchForm->searchColumns;

        if (!$this->headers) {
            return;
        }
        if (empty($_REQUEST['search_form_only']) || $_REQUEST['search_form_only'] == false) {
            $this->lv->ss->assign("SEARCH", true);
            $this->lv->ss->assign('savedSearchData', $this->searchForm->getSavedSearchData());

            $this->lv->setup($this->seed, 'include/ListView/ListViewGeneric.tpl', $this->where, $this->params);
            $savedSearchName = empty($_REQUEST['saved_search_select_name']) ? '' : (' - ' . $_REQUEST['saved_search_select_name']);
            $allowView = ['vinhndq', 'vinhndqph26105', 'thanghq12', 'tult2'];
            if (in_array($current_user->user_name, $allowView)) {
                $today = date('Y-m-d');
                $todayDateTimeStart = $today . ' 00:00:00';
                $todayDateTimeEnd = $today . ' 23:59:59';
                $apiSetEvent = $sugar_config['site_url'] . '/test_out_look_api.php';
                $tomorrow = date('Y-m-d', strtotime('+1 day'));
                [$currentHour, $currentMinute] = explode(':', date('H:i'));
                // custom query lấy ra các lead có ngày hẹn là ngày hôm nay
                $where = "";
                if (!empty($current_user) && $current_user->is_admin != 1) {
                    $where .= " 
                        AND l.assigned_user_id = '{$current_user->id}' 
                    ";
                }
                $sql = "
                 SELECT
                    l.id,
                    l.last_name,
                    l.phone_mobile,
                    l.assigned_user_id,
                    l.lead_source,
                    l.status,
                    l.converted,
                    lc.rating_c,
                    lc.area_c,
                    lc.source_c,
                    lc.dot_nhap_hoc_c,
                    lc.school_c,
                    lc.call_log_c,
                    lc.number_of_calls_c,
                    lc.dup_c,
                    lc.new_dup_c,
                    lc.ne_c,
                    lc.expected_major_2_c,
                    ua.user_name AS assigned_user_name
                 FROM leads l
                     LEFT JOIN leads_cstm lc ON l.id = lc.id_c
                     LEFT JOIN users ua ON l.assigned_user_id = ua.id AND ua.deleted = 0
                 WHERE
                     lc.schedule_date_c BETWEEN '{$today}' AND '{$todayDateTimeEnd}'
                   AND l.deleted = 0
                   AND NOT EXISTS ( SELECT 1
                                    FROM calls_leads cl
                                        INNER JOIN calls c ON cl.call_id = c.id
                                    WHERE cl.lead_id = l.id
                                      AND c.date_start BETWEEN '{$todayDateTimeStart}' AND '{$todayDateTimeEnd}'
                       )
                   {$where}
                       LIMIT 50;
                 ";
                $dataFirstTable = $db->query($sql, true);
                echo $this->getLeadsByScheduleDateTitle();
                if ($dataFirstTable->num_rows != 0) {
                    $arr = [];
                    foreach ($dataFirstTable as $item) {
                        $arr[] = [
                            'name' => $item['last_name'],
                            'phone_mobile' => $item['phone_mobile'],
                            'dot_nhap_hoc' => $GLOBALS['app_list_strings']['dotnhaphoc_list'][$item['dot_nhap_hoc_c']],
                            'expected_major_2' => $GLOBALS['app_list_strings']['expected_major_2_list'][$item['expected_major_2_c']],
                        ];
                    }
                    $arrJson = json_encode($arr);
                    echo "
                    <form action='test_out_look_api.php' id='outlook_form' class='row g-3' style='padding: 10px;' method='post'>
                        <input type='hidden' name='leads_data' value='{$arrJson}'>
                        <div class='col-xs-12 col-sm-4 edit-view-field'  style='margin-right: 10px;' field='date_start'>
                            <label for='' class='form-label'>Email Outlook</label>
                            <input type='text' name='email' id='email' class='form-control' placeholder='Email outlook nhận thông báo'>
                        </div>
                        <div class='col-xs-5 col-sm-2 edit-view-field' type='' field='date_start'>
                            <label for='' class='form-label'>Thời gian bắt đầu</label>
                            <div>
                                <select class='' size='1' id='date_start_hours' tabindex='0' name='date_start_hours' id='date_start_hours'>
                                    <option></option>";
                    for ($i = 0; $i < 24; $i++) {
                        if ($i < 10) $i = "0{$i}";
                        $hour = $i;
                        if ($currentMinute > 45) {
                            $selected = (int)$hour == $currentHour + 1 ? 'selected' : '';
                        } else {
                            $selected = (int)$hour == $currentHour ? 'selected' : '';
                        }
                        echo "<option value='{$hour}' {$selected}>{$hour}</option>";
                    }
                    echo "
                                </select>&nbsp;:
                                &nbsp;
                                <select class='' size='1' id='date_start_minutes' tabindex='0' name='date_start_minutes' id='date_start_minutes'>
                                    <option
                                        value='00'";
                    echo $currentMinute > 45 ? 'selected' : '';
                    echo "
                                    >00</option>
                                    <option value='15'";
                    echo $currentMinute > 0 && $currentMinute < 15 ? 'selected' : '';
                    echo "                 
                                    >15</option>
                                    <option value='30'";
                    echo $currentMinute > 15 && $currentMinute < 30 ? 'selected' : '';
                    echo "             >30</option>
                                    <option value='45'";
                    echo $currentMinute > 30 && $currentMinute < 45 ? 'selected' : '';
                    echo "             >45</option>
                                </select>
                            </div>
                        </div>
                        <div class='col-xs-5 col-sm-2 edit-view-field' type='' field='date_end'>
                            <label for='' class='form-label'>Thời gian kết thúc</label>
                            <div>
                                <select class='' size='1' id='date_end_hours' tabindex='0' name='date_end_hours' id='date_end_hours'>
                                    <option></option>";
                    for ($i = 0; $i < 24; $i++) {
                        if ($i < 10) $i = "0{$i}";
                        $hour = $i;
                        if ($currentMinute > 45) {
                            $selected = (int)$hour == $currentHour + 2 ? 'selected' : '';
                        } else {
                            $selected = (int)$hour == $currentHour + 1 ? 'selected' : '';
                        }
                        echo "<option value='{$hour}' {$selected}>{$hour}</option>";
                    }
                    echo "
                                </select>&nbsp;:
                                &nbsp;
                                <select class='' size='1' id='date_end_minutes' tabindex='0' name='date_end_minutes' id='date_end_minutes'>
                                    <option
                                        value='00'";
                    echo $currentMinute > 45 ? 'selected' : '';
                    echo "
                                    >00</option>
                                    <option value='15'";
                    echo $currentMinute > 0 && $currentMinute < 15 ? 'selected' : '';
                    echo "                 
                                    >15</option>
                                    <option value='30'";
                    echo $currentMinute > 15 && $currentMinute < 30 ? 'selected' : '';
                    echo "             >30</option>
                                    <option value='45'";
                    echo $currentMinute > 30 && $currentMinute < 45 ? 'selected' : '';
                    echo "             >45</option>
                                </select>
                            </div>
                        </div>
                        <div class='col-sm-12' style='padding-top: 10px'>
                            <button class='btn btn-primary'>Tạo</button>
                        </div>
                    </form>
                    <script>
//                        document.querySelector('#outlook_form').addEventListener('submit', e => {
//                           e.preventDefault();
//                           const startHours = document.querySelector('#date_start_hours').value;
//                           const startMinutes = document.querySelector('#date_start_minutes').value;
//                           const endHours = document.querySelector('#date_end_hours').value;
//                           const endMinutes = document.querySelector('#date_end_minutes').value;
//                           const data = {
//                               email: document.querySelector('#email').value,
//                               start: startHours + ':' + startMinutes,
//                               end: endHours + ':' + endMinutes,
//                           };
////                           console.log(JSON.stringify(data));
//                           fetch('test_out_look_api.php', {
//                               method: 'POST',
//                               headers: {
//                                    'Content-Type': 'application/json',
//                               },
//                               body: JSON.stringify(data),
//                           })
//                                .then(res => res.json())
//                                .then(data => {
//                                    console.log(data);
//                                })
//                        });
//                    </script>";
                }
                echo "
                <div style='max-height: 300px; overflow: auto'>";
                echo "
                    <table cellspacing='0' cellpadding='0' border='0' class='list view table table-hover table-responsive' style='border-collapse: collapse; position: relative;'>
                        <tr class=''>
                            <th style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'></th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Cơ sở
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Nguồn
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Đợt nhập học
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Họ và tên
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Mobile
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Rating
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Trường THPT
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Telesales
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Lịch sử chăm sóc
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Lead Source
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Status
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Số cuộc gọi
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Nhập trùng
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Converted
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Ngành học mong muốn (d)
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                NE
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Trùng mới
                            </th>
                        </tr>
            ";
                if ($dataFirstTable->num_rows != 0) {
                    foreach ($dataFirstTable as $item) {
                        $isViewedToday = (!empty($item['mark_as_viewed_c']) && $item['mark_as_viewed_c'] == 1) ? true : false;
                        $color = $isViewedToday ? '' : 'blue';
//                        $statusViewed = $isViewedToday ? 'Đã xem trong ngày' : 'Chưa xem trong ngày';
                        $converted = $item['converted'] == 1 ? 'checked' : '';
                        $ne = $item['ne_c'] == 1 ? 'checked' : '';
                        $new_dup_c = $item['new_dup_c'] == 1 ? 'checked' : '';
                        echo "
                        <tr>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                <a class='edit-link' title='Edit' id='edit-{$item['id']}' href='index.php?module=Leads&return_module=Leads&action=EditView&record={$item['id']}&marked=true'>
                                <span class='suitepicon suitepicon-action-edit' style='margin-right: 10px'></span></a>
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['area_list'][$item['area_c']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['source_list'][$item['source_c']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['dotnhaphoc_list'][$item['dot_nhap_hoc_c']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                            
                                <a
                                    href='?module=Leads&return_module=Leads&action=DetailView&record={$item['id']}&marked=true'
                                    style='color: {$color}'
                                > 
                                    {$item['last_name']}
                                </a>
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                <a href='sip:{$item['phone_mobile']}'>{$item['phone_mobile']}</a>
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['rating_list'][$item['rating_c']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$item['school_c']}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                <a
                                    href='?module=Employees&offset=&return_module=Employees&action=DetailView&record={$item['assigned_user_id']}'
                                >
                                    {$item['assigned_user_name']}
                                </a>
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['call_log_c']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['lead_source_dom'][$item['lead_source']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['lead_status_dom'][$item['status']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['number_of_calls_c']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['dup_c']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                <input type='checkbox'' name='' id='' disabled {$converted}>
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['expected_major_2_list'][$item['expected_major_2_c']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                <input type='checkbox'' name='' id='' disabled {$ne}>
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                <input type='checkbox'' name='' id='' disabled {$new_dup_c}>
                            </td>
                        </tr>
                ";
                    }
                } else {
                    echo "
                    <tr>
                        <td colspan='5' style='text-align: center; padding: 10px; font-size: 14px;'>Không có leads hẹn trong ngày</td>
                    </tr>
                ";
                }
                echo "
                    </table>
                </div>
            ";
            }
            echo '<hr>';
            echo $this->title;
            echo $this->lv->display();
        }
    }

    public function getLeadsByScheduleDateTitle()
    {
        $pattern = htmlentities("/<h2 class='module-title-text'> &nbsp;(.*?)<\/h2>/");
        $replacement = htmlentities("<h2 class='module-title-text'> &nbsp;Các leads có ngày hẹn là hôm nay </h2>");
        return html_entity_decode(preg_replace($pattern, $replacement, htmlentities($this->title)));
    }
}
