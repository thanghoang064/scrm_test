{literal}
<style>
.log-table {border:1px solid #efefef;}
.log-table th {padding:5px;text-align:left;}
.log-table td {padding:2px; border:1px solid #efefef;background:#fff;}
.log-table tr:hover td {background:#efefef;}
form {display:inline;}
</style>
{/literal}

<div style="padding:5px">
	<form action="" method="post">
	<label>
		<input type="checkbox" {if $logging eq 1}checked="checked"{/if} onclick="this.form.submit();" />
		<input type="hidden" name="logging" value="{if $logging eq 1}0{else}1{/if}" />
		Enable logging
	</label>
	</form>

	<form action="" method="post">
	<label>
		<input type="submit" name="clear" value="Clear logs" />
	</label>
	</form>
</div>

<table class="log-table" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>Created</th>
			<th>Level</th>
			<th>Message</th>
			<th>Variables</th>
		</tr>
	</thead>
	<tbody>
		{foreach from=$entries item=entry}
		<tr>
			<td>{$entry.created}</td>
			<td>{$entry.level}</td>
			<td>{$entry.message}</td>
			<td>{$entry.vars}</td>
		</tr>
		{/foreach}
	</tbody>
</table>
