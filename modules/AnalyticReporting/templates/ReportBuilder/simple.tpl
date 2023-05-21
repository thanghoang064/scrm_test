<script src="modules/AnalyticReporting/assets/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    jQuery.noConflict();
</script>
<script src="modules/AnalyticReporting/assets/js/ractive/Ractive.min.js"></script>
<link href="modules/AnalyticReporting/assets/css/AnalyticReporting.css" rel="stylesheet" tye="text/css" media="all" />
<link href="modules/AnalyticReporting/assets/css/ReportBuilder.css" rel="stylesheet" tye="text/css" media="all" />

<a class="ar-button" style="margin:20px 0 0 20px;" href="{$SERVERURL}?module=AnalyticReporting&action=listview">Back to reports</a>
<a class="ar-button blue" style="margin:20px 0 0 20px;" href="{$SERVERURL}?module=AnalyticReporting&action=reportBuilder">Extended</a>
{include file="modules/AnalyticReporting/templates/ReportBuilder/templates.tpl"}

<div id="ar-report-builder-simple"></div>

{literal}
<script>
    //passed to reportBuilder
    var reportBuilderSimpleOptions = {
        //lists of predefined elements
        types:{
            {/literal}
            reportTypes:{$reportTypes},
            relationTypes:{$relationTypes},
            moduleTypes:{$modules},
            modulesFieldTypes:{$modulesFields},
            categoryTypes:{$categories},
            allRelationsParsed:{$allRelationsParsed},
            {literal}
        },
        //internal attributes, server urls, server response
        {/literal}
        internal:{$internal},
        {literal}
    };
</script>
<!-- env:dev --#>
    <script src="modules/AnalyticReporting/assets/js/components/reportBuilder.js"></script>
<!-- env:dev:end -->
<!-- env:prod -->
    <script src="modules/AnalyticReporting/assets/js/builder.min.js"></script>
<!-- env:prod:end -->
{/literal}