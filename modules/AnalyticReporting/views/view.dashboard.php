<?php

/**
 * Dashboard edit view
 */
class AnalyticReportingViewDashboard extends SugarView {

    public function display() {
        global $mod_strings, $app_strings, $sugar_flavor;

        $this->ss->assign('MOD', $mod_strings);
        $this->ss->assign('APP', $app_strings);
        $this->ss->assign('DICTIONARY', json_encode($mod_strings)); // #5286 - JSON object of translations (should merge with app_strings)
        $this->ss->assign('sugar_flavor', $sugar_flavor); // #6161
        $this->ss->assign('site_url', SugarConfig::getInstance()->get('site_url')); // #6161

        // Auto assign all view object map items to smarty
        foreach($this->view_object_map as $key => $value) {
            $this->ss->assign($key, $value);
        }

        echo $this->ss->fetch('modules/AnalyticReporting/templates/dashboard.tpl');
    }
}