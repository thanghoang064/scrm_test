<script src="modules/{$moduleName}/assets/js/jquery/jquery-1.8.3.min.js"></script>
<script src="modules/{$moduleName}/assets/js/legacy/startwith.js"></script>
<script src="modules/{$moduleName}/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="modules/{$moduleName}/assets/js/jquery/jquery.select2.min.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
</script>


<script src="modules/{$moduleName}/assets/js/ractive/Ractive.min.js"></script>
<script src="modules/{$moduleName}/assets/js/ractive/ractive-decorators-select2.min.js"></script>

<link href="modules/{$moduleName}/assets/css/{$moduleName}.css" rel="stylesheet" tye="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/ReportBuilder.css" rel="stylesheet" tye="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/jquery-ui/redmond/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/jquery.select2.css" rel="stylesheet" type="text/css" media="all" />

<script>
	var translated_labels = {$DICTIONARY};
	var urls = {$urlsJSON};
</script>

{include file="modules/$moduleName/templates/templates.tpl"}

<script src="modules/{$moduleName}/assets/js/ractive/ractive-decorators-select2.min.js"></script>
<!-- env:dev --#>
<script src="modules/{$moduleName}/assets/js/components/app.js"></script>
<script src="modules/{$moduleName}/assets/js/components/reports/shared.js"></script>
<script src="modules/{$moduleName}/assets/js/components/shared.js"></script>
<script src="modules/{$moduleName}/assets/js/components/reportManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/accessManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/scheduleManager.js"></script>
<!-- env:dev:end -->
<!-- env:prod -->
<script src="modules/{$moduleName}/assets/js/main.min.js"></script>
<!-- env:prod:end -->


<h1>{$MOD.reportingToolSettings}</h1>

<a class="ar-button" style="margin:5px;" href="index.php?module={$moduleName}&action=index">Back to reports</a>

<div class="settings-wrap">
	<div id="ar-rv-editor" class="ar-rv-section">
		<div id="ar-rv-editor-tabs" class="ar-rv-tabs">
			<ul>
				<li><a href="#ar-rv-editor-license-managment">{$MOD.licenseManagment}</a></li>
				<li><a href="#ar-rv-editor-format-settings">{$MOD.formatSettings}</a></li>
				<li><a href="#ar-rv-editor-report-builder">{$MOD.permissions}</a></li>
				<li><a href="#ar-rv-editor-section-states">{$MOD.sectionStates}</a></li>
				<li><a href="#ar-rv-editor-templates">{$MOD.templates}</a></li>
				<li><a href="#ar-rv-editor-processes">{$MOD.processes}</a></li>
				<li><a href="#ar-rv-editor-scheduler-debug">Test Scheduler</a></li>
				<li><a href="#ar-rv-editor-logs">Logs</a></li>
			</ul>
			<div id="ar-rv-editor-license-managment">
				<form action="index.php" method="post" enctype="multipart/form-data">

					<input type="hidden" name="module" value="{$moduleName}" />
					<input type="hidden" name="action" value="settings" />
					<h2 style="color:#333;font-size:1.5em;text-align:left;">{$MOD.licenseManagment}</h2>

					<div style="padding:5px;">
						<table>
							<tr>
								<td style="vertical-align: top;">
									<textarea id="license" name="key" style="font-family: mono; width: 600px; height: 130px;">{$licenseKey}</textarea>
								</td>
								<td>
									<div style="margin-left:7px;">
										{foreach from=$licenseData item=test}
											<p>{$test.title}: <b>{$test.value}</b></p>
										{/foreach}

										{* Added unique key for server instance identification *}
										<p>Unique key: <b>{$uniqueKey}</b></p>
									<div>
								</td>
							</tr>
						</table>
					</div>

					<div id="ar-license-users-table">
						<table>
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>User Type</th>
								<th>Access Type</th>
							</tr>
							{foreach from=$licenseUsers item=user}
							<tr>
								<td><a href="{$user.linkTo}">{$user.first_name}</a></td>
								<td><a href="{$user.linkTo}">{$user.last_name}</a></td>
								<td>Regular</td>
								<td>{$user.accessName}</td>
							</tr>
							{/foreach}
						</table>
					</div>

					<input class="ar-button green" type="submit" name="submit" value="{$MOD.label_save}" />
					{$response}

				</form>
			</div>
			<div id="ar-rv-editor-format-settings">
				<form action="index.php" method="post" enctype="multipart/form-data">

					<input type="hidden" name="module" value="{$moduleName}" />
					<input type="hidden" name="action" value="settings" />

					<h2>Date Format</h2>
					<div class="ui-helper-clearfix">
						<div style="float:left;width:200px;font-size:1.4em; padding:5px;margin-right:20px;">
							<label for="license" >Date Format Settings</label>
						</div>
						{html_options name=dateformat options=$DATE_FORMAT_LABELS selected=$CURRENT_FORMAT_ID}

					</div>
					<input class="ar-button green" type="submit" name="submit" value="Save" />


				</form>

				{* #5562 [START] Set default number of records to show per page *}
				<p>
					<form action="index.php" method="post">
						<input type="hidden" name="module" value="{$moduleName}" />
						<input type="hidden" name="action" value="settings" />
						<br/>
						<h2 style="color:#333;font-size:1.5em;text-align:left;">{$MOD.label_update_records_per_page}</h2>
						<span>
							{$MOD.label_show} <input value="{$RECORDSPERPAGE}" name="records" size="3" maxlength="3" /> {$MOD.label_records_per_page}
							(<input id="overwriteAll"type="checkbox" name="overwriteAll" /><label for="overwriteAll">{$MOD.label_overwrite_all}</label>)
						</span>
				<p>
					<input class="ar-button green" type="submit" value="{$MOD.label_save}" />
				</p>

				</form>
				</p>
				{* #5562 [END] *}
			</div>
			<div id="ar-rv-editor-report-builder">
				<form id="reportbuilder" action="index.php" method="post">
					<input type="hidden" name="module" value="{$moduleName}" />
					<input type="hidden" name="action" value="settings" />
					<input type="hidden" name="permissionsForm" value="permissionsForm" />

                    <h2 style="color:#333;font-size:1.5em;text-align:left;">{$MOD.permissions}</h2>
                    <p>
                        <input id="report-builder-public-access" type="checkbox" name="builderPublicAccess" {if $builderPublicAccess eq true}checked="checked"{/if} />
                        <label style="font-size:1em;" for="report-builder-public-access">{$MOD.reportBuilderPublicAccess}</label>
                        <a class="ar-button" href="{$SERVERURL}?module={$moduleName}&action=reportBuilder">{$MOD.open} {$MOD.reportBuilder}</a>
                    </p>
                    <p>
                        <input id="report-tree-admin-access" type="checkbox" name="reportTreeAdminAccess" {if $reportTreeAdminAccess eq true}checked="checked"{/if} />
                        <label style="font-size:1em;" for="report-tree-admin-access">{$MOD.reportTreeAdminAccess}</label>
                    </p>

					<p>
						<input class="ar-button green" type="submit" value="{$MOD.label_save}" />
					</p>

				</form>
			</div>
			<div id="ar-rv-editor-section-states">
				{* #5868 [START] Update all report collapsed/expanded states *}

				<form id="updateReportState" action="index.php" method="post">
					<input type="hidden" name="module" value="{$moduleName}" />
					<input type="hidden" name="action" value="settings" />
					<input type="hidden" name="updateReportState" value="true" />
					<h2 style="color:#333;font-size:1.5em;text-align:left;">{$MOD.label_report_state_settings}</h2>
					<table class="report-state">
						<tr>
							<th></th><th>{$MOD.label_expanded}</th><th>{$MOD.label_collapsed}</th>
						</tr>
						<tr>
							<td><h3>{$MOD.label_report_editor}</h3></td>
							<td><input type="radio" name="reportEdit" value="1" checked></td>
							<td><input type="radio" name="reportEdit" value="0"></td>
						</tr>
						<tr>
							<td><h3>{$MOD.label_report}</h3></td>
							<td><input type="radio" name="report" value="1" checked></td>
							<td><input type="radio" name="report" value="0"></td>
						</tr>
						<tr>
							<td><h3>{$MOD.label_chart_editor}</h3></td>
							<td><input type="radio" name="chartEdit" value="1" checked></td>
							<td><input type="radio" name="chartEdit" value="0"></td>
						</tr>
						<tr>
							<td><h3>{$MOD.label_chart}</h3></td>
							<td><input type="radio" name="chart" value="1" checked></td>
							<td><input type="radio" name="chart" value="0"></td>
						</tr>
					</table>
					<input class="ar-button green" type="submit" name="saveCollapsedExpandedStates" value="{$MOD.label_save}" />
				</form>

				{* #5868 [END] *}
			</div>

			<div id="ar-rv-editor-templates">
				<h2 style="color:#333;font-size:1.5em;text-align:left;">{$MOD.templateManagement}</h2>
				<label style="font-size:1.4em;">{$MOD.uploadNewTemplate}</label>
				<form method="post" enctype="multipart/form-data">
					<input type="hidden" name="module" value="{$moduleName}" />
					<input type="hidden" name="action" value="settings" />
					<table width="350" border="0" cellpadding="1" cellspacing="1" class="box">
						<tr>
							<td width="246">
								<input name="template" type="file">
							</td>
							<td width="80"><input class="ar-button green" name="templateUpload" type="submit" class="box" value=" Upload "></td>
						</tr>
					</table>
				</form>
				<br/><br/>
				<label style="font-size:1.4em;">{$MOD.editExistingTemplate}</label>
				<table>
					<thead>
					<tr>
						<th>{$MOD.label_title}</th>
						<th>{$MOD.updateTemplate}</th>
						<th></th>
						<th></th>
					</tr>
					</thead>
					<tbody>
					{foreach from=$excelTemplates key=k item=v}
						<form method="post" enctype="multipart/form-data">
							<input type="hidden" name="module" value="{$moduleName}" />
							<input type="hidden" name="action" value="settings" />
							<input type="hidden" name="templateId" value="{$v.name}">
							<tr>
								<td>
									<input name="templateTitle" value="{$v.title}" >
								</td>
								<td>
									<input name="template" type="file">
								</td>
								<td><input class="ar-button green" name="templateUpdate" type="submit" class="box" value=" Update "></td>
								<td><input class="ar-button red" name="templateDelete" type="submit" class="box" value=" Delete "></td>
							</tr>
						</form>
					{/foreach}


					</tbody>
				</table>

			</div>

			<div id="ar-rv-editor-processes">
				{* #6198 [START] *}
				{include file="modules/$moduleName/templates/settings/processes.tpl"}
				{* #6198 [END] *}
			</div>

			<div id="ar-rv-editor-scheduler-debug">
				{include file="modules/$moduleName/templates/settings/scheduler.tpl"}
			</div>
			<div id="ar-rv-editor-logs">
				<h2 style="color:#333;font-size:1.5em;text-align:left;">Logs</h2>
				<a class="ar-button green" style="margin:5px;" href="index.php?module={$moduleName}&action=logs">Open</a>
			</div>
		</div>
	</div>
</div>
<script>
	//TODO: move to external script
	{literal}
	jQuery("#ar-rv-editor-tabs").tabs({
		{/literal}
		active: {$currentTab}
		{literal}
	});
	{/literal}
</script>
