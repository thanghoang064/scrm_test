<?php
class PolyReportsController extends SugarController {

    function action_alnb() {
    	$this->view = 'alnb';
    }
	function action_voice(){
		$this->view = 'voice';
	}
	function action_single(){
		$this->view = 'single';
	}
	function action_index() {
		$this->view='list';
	}

	function action_lead() {
		$this->view='lead';
	}
	function action_voiceall() {
		$this->view='voiceall';
	}
	function action_leadall() {
		$this->view='leadall';
	}
	function action_source() {
		$this->view='source';
	}
	function action_sourceall() {
		$this->view='sourceall';
	}

}
?>