

{literal}
    <script src="include/dateRangePicker/moment.min.js"></script>
    <script src="include/dateRangePicker/daterangepicker.min.js"></script>
    <link href="include/dateRangePicker/daterangepicker.css" rel="stylesheet" type="text/css">
{/literal}

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <label for="daterange">Thời gian : </label>
            <input type="text" name="daterange" id="daterange" value="" />
            <br>
            <span id="time_range" style="font-weight:bold;color:#534d64"></span>
        </div>
		  <div class="col-md-3">
            <label for="securitygroups">Cơ sở : </label>
            <select id="securitygroups" name="securitygroups">
                {foreach from=$security_groups key=k item=v}
                	<option value="{$v->securitygroup_id}">{$v->name}</option>
                {/foreach}
            </select>
        </div>
        <div class="col-md-6">
            <button id="search">Xem báo cáo</button>
        </div>
    </div>
</div>
<script type="text/javascript">
{literal}

     $('input[name="daterange"]').daterangepicker({
    opens: 'right',
    startDate: moment().startOf('month'),
    minYear: 2000,
    endDate: moment().endOf('month'),
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
	 let security_group= $('#securitygroups').val();
	console.log(from);
	console.log(to);
	let url_path = `?module=PolyReports&action=lead&sec=${security_group}&telesale=all&from=${from}&to=${to}`

   // console.log( window.location.pathname);
    //console.log(window.location.pathname + url_path );
	window.location.href= window.location.pathname + url_path;
  });
{/literal}
  
</script>