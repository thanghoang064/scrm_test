<?php

/**
 * List view
 */
class AnalyticReportingViewReportbuilder extends SugarView {

	public function display() {

		foreach($this->view_object_map as $key => $value) {
			$this->ss->assign($key, $value);
		}
		if(isset($_REQUEST['parenttab']) && $_REQUEST['parenttab'] == "simple"){
			echo $this->ss->fetch('modules/AnalyticReporting/templates/ReportBuilder/simple.tpl');
			//default index view
		}else{
			echo $this->ss->fetch('modules/AnalyticReporting/templates/ReportBuilder/main.tpl');
		}
	}
}