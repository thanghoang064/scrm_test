<?php

$viewdefs['base']['view']['analyticreporting'] = array(
	'dashlets' => array(
		array(
			'label' => 'LBL_ANALYTIC_REPORTING_DASHLET',
			'description' => 'LBL_ANALYTIC_REPORTING_DASHLET_DESCRIPTION',
			'config' => array(
			),
			'preview' => array(
			),
			'filter' => array(
			)
		),
	),
	'config' => array(
		// Define available fields in config view
		'fields' => array(
			// Field with available parameters
			'reportId' => array(
				'name' => 'reportId',
				'label' => 'LBL_ANALYTIC_REPORTING_DASHLET_REPORT_SELECTION',
				'type' => 'enum',
				'view' => 'edit',
				'options' => array(),
			),
		),
		// Show or hide dashlet front toolbar
		'showToolbar' => false,
		// Show or hide footer panel
		'showFooter' => false,
		// Open report with following URL
		'openReportUrl' => '#bwc/index.php?module=AnalyticReporting&action=report&record=',
		// Open "enlarged" widget URL
		'openWidgetUrl' => 'index.php?module=AnalyticReporting&action=widget&fullScreen=true&is_pdf=1&record=',
	),
);