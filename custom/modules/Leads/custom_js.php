<?php
class ListViewScriptHook {

    public function add_custom_js($event, $arguments) {
        if (strtolower($_REQUEST['action']) == 'index' || strtolower($_REQUEST['action']) == 'listview') {
            echo '<script src="custom/modules/Leads/custom.js"></script>';
        }
    }

}