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
        $this->processSearchForm();
        $this->lv->searchColumns = $this->searchForm->searchColumns;

        if (!$this->headers) {
            return;
        }
        if (empty($_REQUEST['search_form_only']) || $_REQUEST['search_form_only'] == false) {
            $this->lv->ss->assign("SEARCH", true);
            $this->lv->ss->assign('savedSearchData', $this->searchForm->getSavedSearchData());
            $this->params2 = $this->params;
            $today = date('Y-m-d');

//            $this->params2['custom_from'] = " LEFT JOIN calls_leads ON leads.id = calls_leads.lead_id ";
//            $this->params2['custom_from'] .= " LEFT JOIN calls ON calls_leads.call_id = calls.id AND DATE(calls.date_start) = '{$today}' ";

            // custom query lấy ra các lead có ngày hẹn là ngày hôm nay
            $this->params2['custom_where'] = " AND DATE(schedule_date_c) = '{$today}' ";

            // custom query lấy ra các lead chưa có log call trong ngày hôm nay
//            $this->params2['custom_where'] .= " AND calls_leads.lead_id IS NULL ";
            $this->params2['custom_where'] .=
                " 
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
            $this->lv2 = clone $this->lv;
            $this->lv->setup($this->seed, 'include/ListView/ListViewGeneric.tpl', $this->where, $this->params);
//            $this->lv->setup($this->seed, 'custom/modules/Leads/tpls/Test.tpl', $this->where, $this->params);
            $this->lv2->setup($this->seed, 'include/ListView/ListViewGeneric.tpl', $this->where, $this->params2);
//            $this->lv2->setup($this->seed, 'custom/modules/Leads/tpls/Test.tpl', $this->where, $this->params2);
            $savedSearchName = empty($_REQUEST['saved_search_select_name']) ? '' : (' - ' . $_REQUEST['saved_search_select_name']);
            echo $this->getLeadsByScheduleDateTitle();
            echo $this->lv2->display();
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
