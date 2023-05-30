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
        global $current_user, $db;
        $this->processSearchForm();
        $this->lv->searchColumns = $this->searchForm->searchColumns;

        if (!$this->headers) {
            return;
        }
        if (empty($_REQUEST['search_form_only']) || $_REQUEST['search_form_only'] == false) {
            $this->lv->ss->assign("SEARCH", true);
            $this->lv->ss->assign('savedSearchData', $this->searchForm->getSavedSearchData());
            $today = date('Y-m-d');

            // custom query lấy ra các lead có ngày hẹn là ngày hôm nay
            $leadBean = BeanFactory::getBean($this->module);
            $where = "
                DATE(schedule_date_c) = '{$today}'
                AND leads.id NOT IN (
                    SELECT 
                        DISTINCT calls_leads.lead_id 
                    FROM calls_leads 
                    WHERE calls_leads.call_id IN (
                        SELECT 
                            calls.id 
                        FROM calls 
                        WHERE DATE(calls.date_start) = '{$today}')) 
            ";
            if (!empty($current_user) && $current_user->is_admin != 1) {
                $where .= " 
                    AND leads.assigned_user_id = '{$current_user->id}' 
                ";
            }
//            $dataFirstTable = $leadBean->get_list('', $where, 0, 1000, 1000, 0);
            $sql = "
                SELECT
                    leads.id,
                    leads.last_name,
                    leads.phone_mobile,
                    leads.assigned_user_id,
                    leads.lead_source,
                    leads.status,
                    leads.date_entered,
                    leads.date_modified,
                    leads.created_by,
                    leads.converted,
                    leads_cstm.mark_as_viewed_c,
                    leads_cstm.rating_c,
                    leads_cstm.schedule_date_c,
                    leads_cstm.area_c,
                    leads_cstm.source_c,
                    leads_cstm.dot_nhap_hoc_c,
                    leads_cstm.call_log_c,
                    leads_cstm.number_of_calls_c,
                    leads_cstm.assessor_c,
                    leads_cstm.dup_c,
                    leads_cstm.expected_major_2_c,
                    jt1.user_name created_by_name,
                    jt2.user_name assigned_user_name
                FROM leads 
                LEFT JOIN leads_cstm ON leads.id = leads_cstm.id_c 
                LEFT JOIN users jt1 ON leads.created_by=jt1.id AND jt1.deleted=0 
                LEFT JOIN users jt2 ON leads.assigned_user_id=jt2.id AND jt2.deleted=0
                WHERE 
                    ({$where})
                    AND leads.deleted=0
                LIMIT 0,1000
            ";
            $dataFirstTable = $db->query($sql, true);

            $this->lv->setup($this->seed, 'include/ListView/ListViewGeneric.tpl', $this->where, $this->params);
            $savedSearchName = empty($_REQUEST['saved_search_select_name']) ? '' : (' - ' . $_REQUEST['saved_search_select_name']);
            echo $this->getLeadsByScheduleDateTitle();
            echo "
                <div style='max-height: 300px; overflow: auto'>
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
                                Ngày hẹn
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
                                Trạng thái xem
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
                                Ngày tạo
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Ngày cập nhật
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Assessor
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Nhập trùng
                            </th>
                            <th
                                style='background: #778591; color: white; border: 1px solid #ccc; padding: 10px; position: sticky; top: 0'
                            >
                                Promoter
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
            if (!empty($dataFirstTable)) {
                foreach ($dataFirstTable as $item) {
                    $isViewedToday = $item['mark_as_viewed_c'] == 1 ? true : false;
                    $color = $isViewedToday ? '' : 'blue';
                    $statusViewed = $isViewedToday ? 'Đã xem trong ngày' : 'Chưa xem trong ngày';
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
                                {$GLOBALS['app_list_strings']['dot_nhap_hoc_c_list'][$item['dot_nhap_hoc_c']]}
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
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['schedule_date_c']}</td>
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
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$statusViewed}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['call_log_c']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['lead_source_dom'][$item['lead_source']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                {$GLOBALS['app_list_strings']['lead_status_dom'][$item['status']]}
                            </td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['number_of_calls_c']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['date_entered']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['date_modified']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['assessor_c']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>{$item['dup_c']}</td>
                            <td style='border: 1px solid #ccc; padding: 10px;'>
                                <a
                                    href='?module=Employees&offset=&return_module=Employees&action=DetailView&record={$item['created_by']}'
                                >
                                    {$item['created_by_name']}
                                </a>
                            </td>
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
