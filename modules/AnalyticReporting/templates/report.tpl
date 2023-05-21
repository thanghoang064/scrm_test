<script src="modules/{$moduleName}/assets/js/jquery/jquery-1.8.3.min.js"></script>
<script src="modules/{$moduleName}/assets/js/legacy/startwith.js"></script>
<script type="text/javascript">
    jQuery.noConflict();
    jQuery('link[rel="stylesheet"][href*="nvd3.css"]').attr('disabled', 'disabled');
    jQuery('link[rel="stylesheet"][href*="nvd3.css"]').remove();
</script>
{literal}
<script data-pace-options='{ "ajax": false }' src="modules/{/literal}{$moduleName}{literal}/assets/js/pace.js"></script>
{/literal}
<link href="modules/{$moduleName}/assets/css/pace.css" rel="stylesheet" type="text/css" media="all" />

<script src="modules/{$moduleName}/assets/js/jquery-ui/jquery-ui.min.js"></script>

<script src="modules/{$moduleName}/assets/js/jquery/jquery.select2.min.js"></script>
<script src="modules/{$moduleName}/assets/js/jquery/jquery.event.drag-2.2.js"></script>
<script src="modules/{$moduleName}/assets/js/nvd3/d3.js" charset="utf-8"></script>
<script src="modules/{$moduleName}/assets/js/nvd3/nv.d3.js"></script>
<script src="modules/{$moduleName}/assets/js/d3-funnel.js"></script>
<script src="modules/{$moduleName}/assets/js/d3-gauge.js"></script>
<script src="modules/{$moduleName}/assets/js/d3-context-menu.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/jsts/javascript.util.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/jsts/jsts.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/leaflet.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/leaflet-providers.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/leaflet-dvf.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/leaflet-image.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/countryData.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/states/statesData.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/states/usa.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/states/india.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/states/canada.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/states/brazil.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/states/china.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/cities/usa.cities.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/cities/ca.cities.min.js"></script>
<script src="modules/{$moduleName}/assets/js/leaflet/data/cities/cities.min.js"></script>
<script src="modules/{$moduleName}/assets/js/spectrum.js"></script>
 

<script src="modules/{$moduleName}/assets/js/moment.min.js"></script>

<script src="modules/{$moduleName}/assets/js/slickgrid/slick.core.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/slick.formatters.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/slick.editors.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/plugins/slick.cellrangedecorator.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/plugins/slick.cellrangeselector.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/plugins/slick.cellselectionmodel.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/slick.grid.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/slick.groupitemmetadataprovider.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/slick.dataview.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/controls/slick.pager.js"></script>
<script src="modules/{$moduleName}/assets/js/slickgrid/controls/slick.columnpicker.js"></script>
<script src="modules/{$moduleName}/assets/js/ractive/Ractive.min.js"></script>
<script src="modules/{$moduleName}/assets/js/ractive/ractive-decorators-select2.min.js"></script>
<script src="modules/{$moduleName}/assets/js/ractive/Ractive-decorators-sortable.js"></script>
<script src="modules/{$moduleName}/assets/js/underscore.js"></script>
<script src="modules/{$moduleName}/assets/js/jquery.doubleScroll.js"></script>

<link href="modules/{$moduleName}/assets/css/nvd3/nv.d3.css" rel="stylesheet" type="text/css">
<link href="modules/{$moduleName}/assets/css/d3-gauge.css" rel="stylesheet" type="text/css">
<link href="modules/{$moduleName}/assets/css/d3-context-menu.css" rel="stylesheet" type="text/css">
<link href="modules/{$moduleName}/assets/css/slickgrid/slick.grid.css" rel="stylesheet" type="text/css">
<link href="modules/{$moduleName}/assets/css/slickgrid/controls/slick.pager.css" rel="stylesheet" type="text/css">
<link href="modules/{$moduleName}/assets/css/slickgrid/controls/slick.columnpicker.css" rel="stylesheet" type="text/css">
<link href="modules/{$moduleName}/assets/css/slickgrid/default-theme.css" rel="stylesheet" type="text/css">
<link href="modules/{$moduleName}/assets/css/jquery.select2.css" rel="stylesheet" type="text/css" media="all" />

<link href="modules/{$moduleName}/assets/css/jquery-ui/redmond/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/leaflet/leaflet.css" rel="stylesheet" type="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/leaflet/dvf.css" rel="stylesheet" type="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/spectrum.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="modules/{$moduleName}/assets/js/saveSvgAsPng.js"></script>
{literal}
<style>
    #ar-rv-data-grid {
        /*max-height:500px;*/
        border:1px solid #ddd;
    }
    #reportDescription{
        margin-left:18px;
        display: none;
    }
</style>
{/literal}
<div id="modalWindow" style="display:none;"></div>
<div id="ar-container">
    <div id="reportControls" style="margin-left:5px;"></div>
    <h2 style="margin-top:20px;margin-left:5px;color:#333;" id="reportTitleContainer">
    <span id="reportTitle">{$REPORTTITLE}</span>{if $CANEDIT eq 1}<a id="ar-rv-editor-title" href="#"><img src="modules/{$moduleName}/assets/img/slickgrid/pencil.gif"></a>{/if}
    </h2>
    <span id="reportDescription">{$REPORTDESCRIPTION}</span>
    <div id="ar-rv-editor" class="ar-rv-section">
        {assign var="sectionName" value="ar-rv-editor"}
        <h5><a href="#" class="toggle {if $REPORTSECTIONSTATES.$sectionName}desc{else}asc{/if}">{$MOD.label_report_editor}</a></h5>
		<div id="ar-rv-editor-tabs" class="ar-rv-tabs" {if $REPORTSECTIONSTATES.$sectionName}style="display:none"{/if}>
            <ul>
                <li><a href="#ar-rv-editor-filters">{$MOD.label_filters}</a></li>
                <li><a href="#ar-rv-editor-fields">{$MOD.label_fields}</a></li>
                {if $REPORTCOMBINED neq true} {* #5098 *}
                <li><a href="#ar-rv-editor-calcfields">{$MOD.label_calc_fields}</a></li>
                {/if}
                <li><a href="#ar-rv-editor-agregates">{$MOD.label_aggregates}</a></li>
                <li><a href="#ar-rv-editor-groupingsorting">{$MOD.label_grouping_sorting}</a></li>
                <li><a href="#ar-rv-editor-labels">{$MOD.label_labels}</a></li>
                <li><a href="#ar-rv-editor-templates">{$MOD.templates}</a></li>
                <li><a href="#ar-rv-editor-access">{$MOD.label_access}</a></li>
                {if $debugMode}
                <li><a href="#ar-rv-editor-debug">Debug</a></li>
                {/if}
            </ul>
        <div id="ar-rv-editor-filters"></div>
        <div id="ar-rv-editor-fields"></div>
        {if $REPORTCOMBINED neq true} {* #5098 *}
        <div id="ar-rv-editor-calcfields"></div>
        {/if}
        <div id="ar-rv-editor-agregates"></div>
        <div id="ar-rv-editor-groupingsorting"></div>
        <div id="ar-rv-editor-templates"></div>
        <div id="ar-rv-editor-labels"></div>
        <div id="ar-rv-editor-access">
            <strong>{$MOD.label_sharing}</strong><br>
            <div id="ar-rv-editor-access-sharing"></div><br>
            {if $CANEDIT eq 1 || $CANDELETE eq 1}
            <strong>{$MOD.label_scheduling}</strong><br>
            <div id="ar-rv-editor-access-scheduling"></div>
            {/if}
        </div>
            {if $debugMode}
                <div id="ar-rv-editor-debug">

                    <h2>Request</h2>
                    <textarea>{$debugReport}</textarea>

                    <div id="debugResponse"></div>
                    {literal}
                    <script>

                            var debugResponse = new Ractive({
                                el: '#debugResponse',
                                template: '<p><h2>Response</h2><textarea>{{response}}</textarea><p/><h2>Debug</h2><textarea>{{debug}}</textarea><h2>Query result data</h2><textarea>{{queryResult}}</textarea><h2>Query error</h2><textarea>{{queryError}}</textarea><h2>Query exection time</h2><textarea>{{queryTime}}</textarea><h2>Query result count</h2><textarea>{{queryCount}}</textarea><h2>Processor result count</h2><textarea>{{processorCount}}</textarea>',

                                data: {
                                    response:  false,
                                    debug: false,
                                    queryResult:false,
                                    queryError:false,
                                    queryTime:false,
                                    queryCount:false,
                                    processorCount:false
                                },
                                init: function () {

                                }
                            });

                    </script>
                    {/literal}
                </div>
            {/if}
        </div>
    </div>

    <div id="ar-rv-data" class="ar-rv-section">
        {assign var="sectionName" value="ar-rv-data"}
        <h5><a href="#" class="toggle {if $REPORTSECTIONSTATES.$sectionName}desc{else}asc{/if}">{$MOD.label_report}</a></h5>
        <div {if $REPORTSECTIONSTATES.$sectionName}style="display:none"{/if}>
            <div class="pagination" id="pagination-top"></div>

            <div id="displayData">
                <div id="ar-rv-data-grid"></div>
            </div>

            <div class="pagination" id="pagination-bottom"></div>

            <br />

            <span>
                {if $CANEDIT eq 1 || $CANEXPORT eq 1}
                <a href="javascript:void(0);" id="printReport">{$MOD.label_print_report}</a> |
                <a href="javascript:void(0);" id="printReportChart">{$MOD.label_print_reportChart}</a> |
                <a href="javascript:void(0);" class="loadPDF">{$MOD.label_export_pdf}</a> |
                <a href="javascript:void(0);" class="loadPDFXLS">{$MOD.label_export_pdf_from_xls}</a> |
                <a href="javascript:void(0);" class="loadXLSX">{$MOD.label_export_xlsx}</a> |
                <a href="javascript:void(0);" class="loadXLSXHeaders">{$MOD.label_export_xlsx_headers}</a>
                {/if}
            </span>
    </div>
	</div>

    <!-- REPORT VIEWER CHART EDITOR -->
    <div id="ar-rv-chart-editor" class="ar-rv-section">
        {assign var="sectionName" value="ar-rv-chart-editor"}
		<h5><a href="#" class="toggle {if $REPORTSECTIONSTATES.$sectionName}desc{else}asc{/if}">{$MOD.label_chart_editor}</a></h5>
		<div id="ar-rv-chart-editor-tabs" class="ar-rv-tabs" {if $REPORTSECTIONSTATES.$sectionName}style="display:none"{/if}>
            <ul>
                <li><a href="#ar-rv-chart-editor-type">{$MOD.label_chart_type}</a></li>
                <li><a href="#ar-rv-chart-editor-labels">{$MOD.label_legend_axis}</a></li>
            </ul>

            <div id="ar-rv-chart-editor-type"></div>
            <div id="ar-rv-chart-editor-labels"></div>
        </div>
    </div>
    <!-- // REPORT VIEWER CHART EDITOR -->

    <!-- REPORT VIEWER CHART VIEW -->
    <div id="ar-rv-chart-view" class="ar-rv-section">
        {assign var="sectionName" value="ar-rv-chart-view"}
		<h5><a href="#" class="toggle {if $REPORTSECTIONSTATES.$sectionName}desc{else}asc{/if}">{$MOD.label_chart}</a></h5>
		<div id="chart1" {if $REPORTSECTIONSTATES.$sectionName}style="display:none"{/if}></div>
    </div>
    <!-- // REPORT VIEWER CHART VIEW -->

</div>

{* Include underscore.js and Ractive.js templates *}
{include file="modules/$moduleName/templates/templates.tpl"}


<script>
/**
 * Define defaults for ReportGrid and ReportChart
 */
var ReportData = {$REPORTDATA};

//#5843 Adding widget to user and role is only allowed for the owner and admin
var current_user = {$CURRENTUSER};
//#3831 [start] - get report folders
var current_folder={$current_report_folder};
var report_folders=[];
{foreach from=$report_folders key=folder_key item=report_folder}
    report_folders[{$folder_key}] = "{$report_folder}";
{/foreach}
//#3831 [end]
var translated_labels = {$DICTIONARY}; // #5286 - Refactored to JSON object
ReportData.dictionary = translated_labels;
var excelTemplates = {$excelTemplates};
var reportNamesForTemplates = {$reportNamesForTemplates};
var canEdit = {$CANEDIT};
var urls = {$urlsJSON};

var aggregatesDefinitions = {$aggregatesDefinitionsJSON};
var aggregatesCheckBoxesChecked = {$aggregatesCheckBoxesChecked};
var aggregatesCheckBoxesNotChecked = {$aggregatesCheckBoxesNotChecked};

var currentUser = {$currentUser};

{if $debugMode}
    var reportDebugMode = true;
{/if}

{literal}
// #5141 - When SlickGrid is finally rendered add top scroll
jQuery(document).on("slickRenderCompleted", function(){
    // By default check for double scroll in left (main) pane
    jQuery(".slick-viewport-top.slick-viewport-left").doubleScroll({
        beforeElement: ".slick-header.slick-header-left:first",
        onlyIfScroll: false,
        resetOnWindowResize: true,
        timeToWaitForResize:0,
        scrollCss: {
            'overflow-x': 'scroll',
        },
        contentCss: {
            'overflow-x': 'scroll',
        },
    });
    // If there is some frozen columns, then add double scroll on second pane too
    if(ReportData.options.frozenColumn && ReportData.options.frozenColumn > 0) {
        jQuery(".slick-viewport-top.slick-viewport-right").doubleScroll({
            beforeElement: ".slick-header.slick-header-right:first",
            onlyIfScroll: false,
            resetOnWindowResize: true,
            timeToWaitForResize:0,
            scrollCss: {
                'overflow-x': 'scroll',
            },
            contentCss: {
                'overflow-x': 'scroll',
            },
        });
    }

});
{/literal}

{* #4538 [start] - Resize container by content width, else it will be as width as .slick-header-columns *}
{literal}
function resizeContainer() {
    var newWidth = jQuery("#content").width() - 40;
    jQuery("#ar-container").width(newWidth);    
}

jQuery(window).resize(function(){
    resizeContainer();
});
resizeContainer();
{/literal}
{* #4538 [end] *}
</script>

<script src="modules/{$moduleName}/assets/js/multiselect/jquery.multiselect.js"></script>
<link href="modules/{$moduleName}/assets/css/multiselect/jquery.multiselect.css" rel="stylesheet" type="text/css">
{if $REPORTCOMBINED eq true}
    <script type="text/javascript">
    {literal}
    for(var i = 0; i < ReportData.availableFields.length; i++) {
        for(var j = 0; j < ReportData.availableFields[i].fields.length; j++) {
            ReportData.availableFields[i].fields[j].moduleId = ReportData.availableFields[i].fields[j].name.split("_")[0];
        }
    }
    for(var i = 0; i < ReportData.selectableFields.length; i++) {
        for(var j = 0; j < ReportData.selectableFields[i].fields.length; j++) {
            ReportData.selectableFields[i].fields[j].moduleId = ReportData.selectableFields[i].fields[j].name.split("_")[0];
        }
    }
    
    // #5382 - After saving combined report, remove first level grouping elements from common grouping
    ReportData.fieldGroupingSorting = ReportData.fieldGroupingSorting.filter(function (el) {
        return el.showAggregates !== undefined;
    });
    {/literal}
    </script>
{/if}

<script type="text/javascript">
    var combineUrl = '{$combineUrl}';
    var $sugar_flavor = '{$sugar_flavor}';
    var $isSidecar = '{$isSidecar}';
    var $site_url = '{$site_url}';
</script>
<link href="modules/{$moduleName}/assets/css/{$moduleName}.css" rel="stylesheet" type="text/css" media="all" />
<!-- env:dev --#>
<script src="modules/{$moduleName}/assets/js/components/app.js"></script>
<script src="modules/{$moduleName}/assets/js/components/reports/shared.js"></script>
<script src="modules/{$moduleName}/assets/js/components/reports/standart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/shared.js"></script>
<script src="modules/{$moduleName}/assets/js/components/reportManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/filterManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/fieldManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/aggregateManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/TotalTable.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/calcColumns.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/SortingByField.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/SortingByCombinedField.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/SortingBy.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/SortingByCombined.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/groupingManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/templateManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/labelManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/accessManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/scheduleManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/calcFieldManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/paginationManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/reportViewer.js"></script>
<script src="modules/{$moduleName}/assets/js/components/chartManager.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/chartUtils.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/ChartView.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/BaseChartComponent.js"></script>
<script src="modules/{$moduleName}/assets/js/components/chartViewer.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/barChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/barChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/barChartReport.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/horizontalBarChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/horizontalBarChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/horizontalBarChartReport.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/pieChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/pieChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/pieChartReport.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/lineChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/lineChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/lineChartReport.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/combinedChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/combinedChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/combinedChartReport.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/funnelChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/funnelChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/funnelChartReport.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/gaugeChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/gaugeChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/gaugeChartReport.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/mapChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/mapChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/mapChartReport.js"></script>
<script src="modules/{$moduleName}/assets/js/shared/charts/areaChart.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/areaChartLegendManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/charts/areaChartReport.js"></script>
<!-- env:dev:end -->
<!-- env:prod -->
<script src="modules/{$moduleName}/assets/js/{$moduleName}.min.js"></script>
<!-- env:prod:end -->
<style media="print">{literal}
    #header, #footer, #bottomLinks, td>p.error {
        display: none;
    }
    #ar-container{
        display: block; !important;
    }
    #ar-container > * {
        display: none;
    }
    #reportTitleContainer > *{
        display: none;
    }
    #reportTitleContainer{
        display: block; !important;
    }
    #reportTitle{
        display: block; !important;
    }

    #ar-rv-data{
        display: block; !important;
    }
    #ar-rv-data > * {
        display: none;
    }

    #ar-rv-data > div{
        display: block !important;
    }
    #ar-rv-data > div > *{
        display: none;
    }
    #ar-rv-data > div > #displayData{
        display: block; !important;
    }
    #displayData{
        display: block; !important;
    }
    #ar-rv-data-grid {
        border: none;
    }
    #ar-rv-chart-view{
        display: block; !important;
        max-width: 250mm;
    }
    #ar-rv-chart-view > *{
        display: none;
    }
    #chart1{
        display: block; !important;
        max-width: 230mm;
    }
    #chart1 > div{
        display: none;
    }
    {/literal}
</style>