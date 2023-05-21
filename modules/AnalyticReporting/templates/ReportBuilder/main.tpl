<script src="modules/{$moduleName}/assets/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
</script>
<script src="modules/{$moduleName}/assets/js/ractive/Ractive.min.js"></script>
<link href="modules/{$moduleName}/assets/css/{$moduleName}.css" rel="stylesheet" tye="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/ReportBuilder.css" rel="stylesheet" tye="text/css" media="all" />

<a class="ar-button" style="margin:20px 0 0 20px;" href="{$SERVERURL}?module={$moduleName}&action=listview">Back to reports</a>
{if empty($smarty.get.parentaction)}
	<a class="ar-button blue" style="margin:20px 0 0 20px;" href="{$SERVERURL}?module={$moduleName}&action=reportBuilder&parenttab=simple">Simple</a>
{/if}

{include file="modules/$moduleName/templates/ReportBuilder/templates.tpl"}

<div id="ar-report-builder"></div>

{literal}
<script>
//passed to reportBuilder
var reportBuilderOptions = {
	//lists of predefined elements
	types:{
		{/literal}
		reportTypes:{$reportTypes},
		relationTypes:{$relationTypes},
		moduleTypes:{$modules},
		modulesFieldTypes:{$modulesFields},
		categoryTypes:{$categories},
		manyToManyTypes:{$manyToManyConfig},
		{literal}
	},
	//internal attributes, server urls, server response
	{/literal}
	internal:{$internal},
	predefinedChildren:{$predefinedChildren},
	reportOptions:{$reportOptions},
	{literal}
};
</script>
{/literal}
<!-- env:dev --#>
<script src="modules/{$moduleName}/assets/js/components/reportBuilder.js"></script>
<!-- env:dev:end -->
<!-- env:prod -->
<script src="modules/{$moduleName}/assets/js/builder.min.js"></script>
<!-- env:prod:end -->
