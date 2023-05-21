<script src="modules/{$moduleName}/assets/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
</script>

<script src="modules/{$moduleName}/assets/js/ractive/Ractive.min.js"></script>
<script src="modules/{$moduleName}/assets/js/ractive/ractive-decorators-select2.min.js"></script>
<link href="modules/{$moduleName}/assets/css/{$moduleName}.css" rel="stylesheet" tye="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/ReportBuilder.css" rel="stylesheet" tye="text/css" media="all" />

{include file="modules/$moduleName/templates/ReportBuilder/templates.tpl"}

<div id="ar-container">
	<div id="ar-settings"></div>
</div>

{literal}
<script>

var loadedSettings = {
	types:{
		{/literal}
		moduleTypes:{$modules},
		manyToManyTypes:{$manyToManyConfig},
		{literal}
	},
};
</script>
{/literal}
<!-- env:dev --#>
<script src="modules/{$moduleName}/assets/js/components/reportBuilderSettings.js"></script>
<!-- env:dev:end -->
<!-- env:prod -->
<script src="modules/{$moduleName}/assets/js/builder.min.js"></script>
<!-- env:prod:end -->
