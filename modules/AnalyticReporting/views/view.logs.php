<?php

/**
 * Log view
 */
class AnalyticReportingViewLogs extends SugarView {

	public function display() {
		foreach($this->view_object_map as $key => $value) {
			$this->ss->assign($key, $value);
		}

		echo $this->ss->fetch('modules/AnalyticReporting/templates/logs.tpl');
	}
}