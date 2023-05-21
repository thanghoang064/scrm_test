<h1>Báo cáo số active lead theo ngày</h1>
<table class="list view table">
	<thead>
		<tr>
			<th>Cơ sở/Ngày</th>
			{foreach from=$data.HN.data item=count key=date}
			<th>{$date|date_format:"%d/%m/%Y"}</th>
			{/foreach}
		</tr>
	</thead>
	<tbody>
		{foreach from=$data item=area key=area_code}
		<tr>
			<td>{$area.name}</td>
				{foreach from=$area.data item=count key=date}
				<td>{$count}</td>
				{/foreach}
		</tr>
		{/foreach}
	</tbody>
</table>
<br />
<h1>Báo cáo số active lead theo tuần</h1>
<table class="list view table">
	<thead>
		<tr>
			<th>Cơ sở/Tuần</th>
			{foreach from=$weekly.HN.data item=week key=week_num}
			<th>W{$week_num}<br />{$week.start_date|date_format:"%d/%m"}-{$week.end_date|date_format:"%d/%m"}</th>
			{/foreach}
		</tr>
	</thead>
	<tbody>
		{foreach from=$weekly item=area key=area_code}
		<tr>
			<td>{$area.name}</td>
				{foreach from=$area.data item=week key=week_number}
				<td>{$week.data}</td>
				{/foreach}
		</tr>
		{/foreach}
	</tbody>
</table>
<br />
<h1>Báo cáo số active lead theo tháng</h1>
<table class="list view table">
	<thead>
		<tr>
			<th>Cơ sở/Tháng</th>
			{foreach from=$monthly.HN.data item=count key=month}
			<th>Tháng {$month}</th>
			{/foreach}
		</tr>
	</thead>
	<tbody>
		{foreach from=$monthly item=area key=area_code}
		<tr>
			<td>{$area.name}</td>
				{foreach from=$area.data item=count key=date}
				<td>{$count}</td>
				{/foreach}
		</tr>
		{/foreach}
	</tbody>
</table>