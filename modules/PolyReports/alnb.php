<?php
class Alnb {
	function get_recent_daily_report_by_area($area = '') {
		global $db;
		date_default_timezone_set('Asia/Ho_Chi_Minh');
		//$today = new DateTime();
		//var_dump($today->format('Y-m-d'));
		//$seven_days_before = $today->sub(new DateInterval('P6D'));
		$today = date('Y-m-d');
		$seven_days_before = date ("Y-m-d", strtotime("-6 day", strtotime($today)));
		//var_dump($seven_days_before->format('Y-m-d'));
		$date = $seven_days_before;
		$data = array();
		while (strtotime($date) <= strtotime($today)) {
			$data[$date] = 0;
			$date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
		}
		//var_dump($data);
		$where = '';
		if(!empty($area))
			$where = "AND b.area_c = '$area'";
		//$sql = "SELECT b.date_activated_c, COUNT(a.id) as `count` FROM leads a INNER JOIN leads_cstm b ON a.id = b.id_c WHERE a.deleted = 0 AND b.date_activated_c >= SUBDATE(CURDATE(), 6) AND b.date_activated_c <= CURDATE() $where GROUP BY b.date_activated_c ORDER BY  b.date_activated_c ASC ";
		$sql = "SELECT b.date_activated_c, COUNT(a.id) as `count` FROM leads a INNER JOIN leads_cstm b ON a.id = b.id_c WHERE a.deleted = 0 AND b.date_activated_c >= '$seven_days_before' AND b.date_activated_c <= '$today' $where GROUP BY b.date_activated_c ORDER BY  b.date_activated_c ASC ";
		//var_dump($sql);
		$result = $db->query($sql);
		while($row = $db->fetchByAssoc($result)) {
			$data[$row['date_activated_c']] = $row['count'];
		}
		
		return $data;
	}
	
	function get_weekly_data_by_area($area = '', $from_date) {
		global $db;
		date_default_timezone_set('Asia/Ho_Chi_Minh');
		// $today = new DateTime();
		//var_dump($today->format('Y-m-d'));
		//$seven_days_before = $today->sub(new DateInterval('P6D'));
		$to_date = date ("Y-m-d", strtotime("+6 day", strtotime($from_date)));
		//var_dump($seven_days_before->format('Y-m-d'));
		$date = $to_date ;
		$data = array();
		// while (strtotime($date) <= strtotime($today)) {
        //         $data[$date] = 0;
        //         $date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
		// }
		$where = '';
		if(!empty($area))
			$where = "AND b.area_c = '$area'";
		$sql_hn = "SELECT COUNT(a.id) as `count` FROM leads a INNER JOIN leads_cstm b ON a.id = b.id_c WHERE a.deleted = 0 AND b.date_activated_c >= '$from_date' AND b.date_activated_c <= '$to_date' $where";
		$result = $db->query($sql_hn);
		$row = $db->fetchByAssoc($result);		
		return $row['count'];
	}
	
	function get_weekly_report_by_area($area = '') {
		global $db;
		date_default_timezone_set('Asia/Ho_Chi_Minh');
		$w = 1;
		$current_week = date('W');
		$current_year = date('Y');
		$weekly = array();
		while($w <= $current_week) {
			$week_num = sprintf("%02d", $w);
			$week_start_date = date('Y-m-d',strtotime($current_year . 'W' . $week_num));
			//var_dump($week_start_date);
			$week_end_date = date ("Y-m-d", strtotime("+6 day", strtotime($week_start_date)));
			$weekly[$w]['start_date'] = $week_start_date;
			$weekly[$w]['end_date'] = $week_end_date;
			$weekly[$w]['data'] = $this->get_weekly_data_by_area($area, $week_start_date);
			$w++;
		}
		return $weekly;
	}
	
	function get_monthly_report_by_area($area = '') {
		global $db;
		$where = '';
		$data = array();
		for($i = 1; $i <= date('m'); $i++) {
			$data[$i] = 0;
		}
		if(!empty($area))
			$where = "AND b.area_c = '$area'";
		$sql_hn = "SELECT MONTH(b.date_activated_c) as `month`, COUNT(a.id) as `count` FROM leads a INNER JOIN leads_cstm b ON a.id = b.id_c WHERE a.deleted = 0 AND b.date_activated_c != '' AND b.date_activated_c IS NOT NULL $where GROUP BY MONTH(b.date_activated_c)";
		$result = $db->query($sql_hn);
		while($row = $db->fetchByAssoc($result)) {
			$data[$row['month']] = $row['count'];
		}
		
		return $data;
	}
	
	function get_recent_daily_report() {
		$data = array();
		$data['HN']['name'] = 'Hà Nội';
		$data['HN']['data'] = $this->get_recent_daily_report_by_area('hn');
		$data['DN']['name'] = 'Đà Nẵng';
		$data['DN']['data'] = $this->get_recent_daily_report_by_area('dn');
		$data['TN']['name'] = 'Tây Nguyên';
		$data['TN']['data'] = $this->get_recent_daily_report_by_area('tn');
		$data['HCM']['name'] = 'Hồ Chí Minh';
		$data['HCM']['data'] = $this->get_recent_daily_report_by_area('hcm');
		$data['KBHN']['name'] = 'K-Beauty HN';
		$data['KBHN']['data'] = $this->get_recent_daily_report_by_area('kbhn');
		$data['KBHCM']['name'] = 'K-Beauty HCM';
		$data['KBHCM']['data'] = $this->get_recent_daily_report_by_area('kbhcm');
		$data['KBCT']['name'] = 'K-Beauty CT';
		$data['KBCT']['data'] = $this->get_recent_daily_report_by_area('kbct');
		$data['CT']['name'] = 'Cần Thơ';
		$data['CT']['data'] = $this->get_recent_daily_report_by_area('ct');
		$data['HP']['name'] = 'Hải Phòng';
		$data['HP']['data'] = $this->get_recent_daily_report_by_area('hp');
		$data['TH']['name'] = 'Thanh Hoá';
		$data['TH']['data'] = $this->get_recent_daily_report_by_area('th');
		$data['HNA']['name'] = 'Hà Nam';
		$data['HNA']['data'] = $this->get_recent_daily_report_by_area('hna');
		$data['QN']['name'] = 'Quy Nhơn';
		$data['QN']['data'] = $this->get_recent_daily_report_by_area('qn');
		$data['TNG']['name'] = 'Thái Nguyên';
		$data['TNG']['data'] = $this->get_recent_daily_report_by_area('tng');
		$data['DNA']['name'] = 'Đồng Nai';
		$data['DNA']['data'] = $this->get_recent_daily_report_by_area('dna');
		$data['total']['name'] = 'Tổng';
		$data['total']['data'] = $this->get_recent_daily_report_by_area();
		//var_dump($data['HN']);
		return $data;
	}
	
	function get_monthly_report() {
		$data = array();
		$data['HN']['name'] = 'Hà Nội';
		$data['HN']['data'] = $this->get_monthly_report_by_area('hn');
		$data['DN']['name'] = 'Đà Nẵng';
		$data['DN']['data'] = $this->get_monthly_report_by_area('dn');
		$data['TN']['name'] = 'Tây Nguyên';
		$data['TN']['data'] = $this->get_monthly_report_by_area('tn');
		$data['HCM']['name'] = 'Hồ Chí Minh';
		$data['HCM']['data'] = $this->get_monthly_report_by_area('hcm');
		$data['KBHN']['name'] = 'K-Beauty HN';
		$data['KBHN']['data'] = $this->get_monthly_report_by_area('kbhn');
		$data['KBHCM']['name'] = 'K-Beauty HCM';
		$data['KBHCM']['data'] = $this->get_monthly_report_by_area('kbhcm');
		$data['CT']['name'] = 'Cần Thơ';
		$data['CT']['data'] = $this->get_monthly_report_by_area('ct');
		$data['HP']['name'] = 'Hải Phòng';
		$data['HP']['data'] = $this->get_monthly_report_by_area('hp');
		$data['TH']['name'] = 'Thanh Hoá';
		$data['TH']['data'] = $this->get_monthly_report_by_area('th');
		$data['HNA']['name'] = 'Hà Nam';
		$data['HNA']['data'] = $this->get_monthly_report_by_area('hna');
		$data['QN']['name'] = 'Quy Nhơn';
		$data['QN']['data'] = $this->get_monthly_report_by_area('qn');
		$data['TNG']['name'] = 'Thái Nguyên';
		$data['TNG']['data'] = $this->get_monthly_report_by_area('tng');
		$data['DNA']['name'] = 'Đồng Nai';
		$data['DNA']['data'] = $this->get_monthly_report_by_area('dna');
		$data['total']['name'] = 'Tổng';
		$data['total']['data'] = $this->get_monthly_report_by_area();
		return $data;
	}
	function get_weekly_report() {
		$data = array();
		$data['HN']['name'] = 'Hà Nội';
		$data['HN']['data'] = $this->get_weekly_report_by_area('hn');
		$data['DN']['name'] = 'Đà Nẵng';
		$data['DN']['data'] = $this->get_weekly_report_by_area('dn');
		$data['TN']['name'] = 'Tây Nguyên';
		$data['TN']['data'] = $this->get_weekly_report_by_area('tn');
		$data['HCM']['name'] = 'Hồ Chí Minh';
		$data['HCM']['data'] = $this->get_weekly_report_by_area('hcm');
		$data['KBHN']['name'] = 'K-Beauty HN';
		$data['KBHN']['data'] = $this->get_weekly_report_by_area('kbhn');
		$data['KBHCM']['name'] = 'K-Beauty HCM';
		$data['KBHCM']['data'] = $this->get_weekly_report_by_area('kbhcm');
		$data['CT']['name'] = 'Cần Thơ';
		$data['CT']['data'] = $this->get_weekly_report_by_area('ct');
		$data['HP']['name'] = 'Hải Phòng';
		$data['HP']['data'] = $this->get_weekly_report_by_area('hp');
		$data['TH']['name'] = 'Thanh Hoá';
		$data['TH']['data'] = $this->get_weekly_report_by_area('th');
		$data['HNA']['name'] = 'Hà Nam';
		$data['HNA']['data'] = $this->get_weekly_report_by_area('hna');
		$data['QN']['name'] = 'Quy Nhơn';
		$data['QN']['data'] = $this->get_weekly_report_by_area('qn');
		$data['TNG']['name'] = 'Thái Nguyên';
		$data['TNG']['data'] = $this->get_weekly_report_by_area('tng');
		$data['DNA']['name'] = 'Đồng Nai';
		$data['DNA']['data'] = $this->get_weekly_report_by_area('dna');
		$data['total']['name'] = 'Tổng';
		$data['total']['data'] = $this->get_weekly_report_by_area();
		return $data;
	}
}