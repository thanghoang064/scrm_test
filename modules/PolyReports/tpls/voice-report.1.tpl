
{literal}
    <script src="include/dateRangePicker/moment.min.js"></script>
    <script src="include/dateRangePicker/daterangepicker.min.js"></script>
    <link href="include/dateRangePicker/daterangepicker.css" rel="stylesheet" type="text/css">
{/literal}

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <label for="date-range">Thời gian : </label>
            <input type="text" name="daterange" id="daterange" value="" />
            <input type="hidden" id="from" value="{$from}">
            <input type="hidden" id="to" value="{$to}">
            <br>
            <span id="time_range" style="font-weight:bold;color:#534d64"></span>
        </div>
        <div class="col-md-3">
            <label for="telesale">Telesale : </label>
            <select id="telesale" name="telesale">
                <option value="all">Tất cả</option>
                {foreach from=$telesales key=k item=v}
                <option value="{$v->user_id}" {if $telesale==$v->user_id} selected {/if}>{$v->user_name}</option>
                {/foreach}
            </select>
        </div>
        <div class="col-md-6">
            <button id="search">Xem báo cáo</button>
        </div>
    </div>
</div>

<h1>Báo cáo hiệu quả cuộc gọi</h1>
<table class="list view table">
	<thead>
        <tr>
            <th style="background:#534d64;border-radius-top-left:10px;border-radius-top-right:10px;" colspan="8">Danh sách</th>
        </tr>
		<tr>
			<th>Danh sách ngày</th>
            <th >Tổng số cuộc gọi ra</th>
            <th>Telesales</th>
            <th>Cuộc gọi nhấc máy</th>
            <th>Thời lượng gọi</th>
            <th>Thời lượng đổ chuông</th>
            <th>Tổng khách hàng quan tâm</th>
            <th>Tổng khách hàng không quan tâm</th>
		</tr>
	</thead>
	<tbody>
          {foreach from=$report key=k item=v}
          <tr>
          	<td>{$v->report->date}</td>
            <td>{$v->report->total_call}</td>
            <td>{$v->user_name}</td>
            <td>{$v->report->call_held}</td>
            <td>{$v->report->total_time_call}</td>
            <td>{$v->report->duration_held}</td>
            <td>{$v->report->disposition_care}</td>
            <td>{$v->report->disposition_not_care}</td>
            <tr>
        {/foreach}
        
	</tbody>
    <style>
        {literal}
            td,th {text-align:center};
        {/literal}
    </style>
</table>
<a href="?module=PolyReports&action=voice">Trở về danh sách báo cáo voice</a>
<script type="text/javascript">
{literal}
     $('input[name="daterange"]').daterangepicker({
    opens: 'right',
    startDate: moment($('#from').val(), 'YYYY-MM-DD').format('MM-DD-YYYY'),
    minYear: 2000,
    endDate: moment($('#to').val(), 'YYYY-MM-DD').format('MM-DD-YYYY'),
  }, function(start, end, label) {
      $('#time_range').text(`Thời gian từ ${start.format('DD-MM-YY')} tới ${end.format('DD-MM-YY')}`)
    //console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });
  	 let from = $('#daterange').data('daterangepicker').startDate.format('DD-MM-YYYY');
	 let to = $('#daterange').data('daterangepicker').endDate.format('DD-MM-YYYY');
      $('#time_range').text(`Thời gian từ ${from} tới ${to}`)
    $('#search').click(function(){
	 let from = $('#daterange').data('daterangepicker').startDate.format('YYYY-MM-DD');
	 let to = $('#daterange').data('daterangepicker').endDate.format('YYYY-MM-DD');
     
     var url = new URL(window.location.href);
     //console.log(url);
    var security_group = url.searchParams.get("sec");
    var telesale = $('#telesale').val();
     //console.log(security);

	// let security_group= $('#securitygroups').val();
	console.log(from);
	console.log(to);
	let url_path = `?module=PolyReports&action=voice&sec=${security_group}&telesale=${telesale}&from=${from}&to=${to}`

   // console.log( window.location.pathname);
    //console.log(window.location.pathname + url_path );
	window.location.href= window.location.pathname + url_path;
  });
{/literal}
  
</script>
