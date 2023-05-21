<html>
<head>
	<title>{$CHARTTITLE}</title>
</head>
<body>	
	<script src="modules/{$moduleName}/assets/js/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		jQuery.noConflict();
	</script>
	<script src="modules/{$moduleName}/assets/js/nvd3/d3.js" charset="utf-8"></script>
	<script src="modules/{$moduleName}/assets/js/nvd3/nv.d3.js"></script>
	<script src="modules/{$moduleName}/assets/js/ractive/Ractive.min.js"></script>
	<script src="modules/{$moduleName}/assets/js/ractive/ractive-decorators-select2.min.js"></script>
	<script src="modules/{$moduleName}/assets/js/underscore.js"></script>
	<script src="modules/{$moduleName}/assets/js/d3-funnel.js"></script>
	<script src="modules/{$moduleName}/assets/js/d3-gauge.js"></script>
	<script src="modules/{$moduleName}/assets/js/d3-context-menu.js"></script>
	<script src="modules/{$moduleName}/assets/js/leaflet/leaflet.js"></script>
	<script src="modules/{$moduleName}/assets/js/leaflet/leaflet-providers.js"></script>
	<script src="modules/{$moduleName}/assets/js/leaflet/leaflet-dvf.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/countryData.min.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/states/statesData.min.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/states/usa.min.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/states/india.min.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/states/canada.min.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/states/brazil.min.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/cities/usa.cities.min.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/cities/ca.cities.min.js"></script>
    <script src="modules/{$moduleName}/assets/js/leaflet/data/cities/cities.min.js"></script>
	<link href="modules/{$moduleName}/assets/css/nvd3/nv.d3.css" rel="stylesheet" type="text/css">
	<link href="modules/{$moduleName}/assets/css/d3-gauge.css" rel="stylesheet" type="text/css">
	<link href="modules/{$moduleName}/assets/css/d3-context-menu.css" rel="stylesheet" type="text/css">
	<link href="modules/{$moduleName}/assets/css/leaflet/leaflet.css" rel="stylesheet" type="text/css" media="all" />
	<link href="modules/{$moduleName}/assets/css/leaflet/dvf.css" rel="stylesheet" type="text/css" media="all" />
	{* Include underscore.js and Ractive.js templates *}
	{include file="modules/$moduleName/templates/templates.tpl"}

	<script>
	$fullScreen = {$fullScreen}; // #4449
	{literal}
	jQuery(document).ready(function() {
		// If used in vTiger dashboard frame
		// if(jQuery(frameElement).length > 0) {
		// 	// Fixing iFrame size in vTiger
		// 	jQuery(frameElement).css({
		// 		"overflow":"hidden",
		// 		"overflow-x":"hidden",
		// 		"overflow-y":"hidden",
		// 		//"height":"100%",
		// 		height:"300px",
		// 		"width":"100%",
		// 		"position":"absolute",
		// 		//"top":"0px",
		// 		top: "25px",
		// 		"left":"0px",
		// 		"right":"0px",
		// 		"bottom":"0px",
		// 	});
		// 	// Remove scroll link from dashboard element
		// 	jQuery(frameElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement).find("table.scrollLink").remove();
		// }

		// #4449 [start] - If opened widget in fullscreen mode, expand chart
		if($fullScreen) {
			jQuery("svg").height(jQuery(document).height() - 50);
			jQuery("svg").width(jQuery(document).width() - 50);
			jQuery(window).trigger('resize');
		}

		// Open chart in larg window
		jQuery("#enlargeChart").click(function() {
			var height = jQuery(window.parent).height() - (jQuery(window.parent).height() / 3);
			var width = jQuery(window.parent).width() - (jQuery(window.parent).width() / 3);
			var url = "index.php?module={/literal}{$moduleName}{literal}&action=widget&record={/literal}{$REPORTID}{literal}&fullScreen=true&is_pdf=1";
			var popup = window.open(url,"Enlrage",'height='+height+',width='+width);
		});
		// #4449 [end]
	});
	{/literal}
	</script>

	<script type="text/javascript">
	var ReportData = {$REPORTDATA};

	var aggregatesDefinitions = {$aggregatesDefinitionsJSON};
	var aggregatesCheckBoxesChecked = {$aggregatesCheckBoxesChecked};
	var aggregatesCheckBoxesNotChecked = {$aggregatesCheckBoxesNotChecked};
	{literal}
	var translated_labels = {
		label_preview:"{/literal}{$MOD.label_preview}{literal}",
		label_stacked:"{/literal}{$MOD.label_stacked}{literal}",
	};
	var reportBtn = {
	};
	{/literal}
	var currentUser = {$currentUser};
	</script>

	<link href="modules/{$moduleName}/assets/css/{$moduleName}.css" rel="stylesheet" type="text/css" media="all" />
	<!-- env:dev --#>
	<script src="modules/{$moduleName}/assets/js/components/app.js"></script>
	<script src="modules/{$moduleName}/assets/js/components/shared.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/chartUtils.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/ChartView.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/BaseChartComponent.js"></script>
    <script src="modules/{$moduleName}/assets/js/components/chartViewer.js"></script>
    <script src="modules/{$moduleName}/assets/js/components/chartManager.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/barChart.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/horizontalBarChart.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/pieChart.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/lineChart.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/combinedChart.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/funnelChart.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/gaugeChart.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/mapChart.js"></script>
    <script src="modules/{$moduleName}/assets/js/shared/charts/areaChart.js"></script>
	<!-- env:dev:end -->
	<!-- env:prod -->
	<script src="modules/{$moduleName}/assets/js/widget.min.js"></script>
	<!-- env:prod:end -->
	{literal}
	<style>
		/* #5497 [start] - center gauge chart */
		{/literal}
		{if $CHARTTYPE eq '"gauge"'}
			body, html {ldelim}margin:auto auto;width:280px;padding:0;{rdelim}
		{else}
			body, html {ldelim}margin:0;padding:0;{rdelim}
		{/if}
		/* #5497 [end] */
		{literal}
		#chart1 {height:280px;width:100%;}
/*		#chart1.pie {height:320px !important;}
		#chart1.combined {height:350px !important;}
		#chart1.bar {height:350px !important;}
		#chart1.line {height:350px !important;}*/
		#chart1 > svg {width:100%;}
		.linkToReport {position:absolute;bottom:5px;left:5px;}
	</style>
	{/literal}

	<div style="position:relative">
		<div id="chart1" class="{$CHARTTYPE}"></div>
	
	{* #4023 [start] - Added link to report *}
	{if $fullScreen eq 'false'} {* #4449 [start] *}
	<div class="linkToReport copy">
		<a href="{$SERVERURL}?module={$moduleName}&action=report&record={$REPORTID}" style="font-size:11px;" target="_parent">Open Report</a>
		<a href="javascript:void(0)" id="enlargeChart" style="font-size:11px;">Enlarge</a>
	</div>
	{/if} {* #4449 [end] *}
	{* #4023 [end] *}
	</div>

	<script type="text/javascript">
        // Create fieldsByName and availableFields (filtered fields, without blocks)
        var availableFieldList = reportUtils.setFieldsByName();
	initChartView(false, ReportData);
	</script>
</body>
</html>