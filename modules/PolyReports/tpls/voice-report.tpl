
{literal}
    <script src="include/dateRangePicker/moment.min.js"></script>
    <script src="include/dateRangePicker/daterangepicker.min.js"></script>
    <link href="include/dateRangePicker/daterangepicker.css" rel="stylesheet" type="text/css">
{/literal}

<div class="container">
    <div class="row">
    <div class="col-md-12">
            <label for="daterange" style="float:left;line-height:32px;padding-right:10px">Thời gian : </label>
            {* <input type="text" name="daterange" id="daterange" value="" /> *}

            <button id="from" type="button" style="float:left" class="btn btn-danger"><span class="suitepicon suitepicon-module-calendar" alt="Enter Date"></span></button>
            <input type="text" name="from" style="width:100px;float:left;line-height:23px" disabled/> 
            <span style="font-weight:bold;color:#534d64;float:left;line-height:32px;padding-right:10px;padding-left:10px">Tới</span>

            <button id="to" type="button" style="float:left" class="btn btn-danger"><span class="suitepicon suitepicon-module-calendar" alt="Enter Date"></span></button>
            <input type="text" name="to" style="width:100px;float:left;line-height:23px" disabled/>
            {* <div style="clear:both"></div>
            <span id="time_range" style="font-weight:bold;color:#534d64"></span> *}
            <input type="hidden" id="from_val" value="{$from}">
            <input type="hidden" id="to_val" value="{$to}">
            <input type="hidden" id="telesale" value="all">
            <button id="search" class="btn btn-danger" style="margin-left:10px;visibility:visible">Xem báo cáo</button>

        </div>
 
        <input type="hidden" name="telesale" id="telesale" value="all">
 
    </div>
</div>

<h1>Báo cáo hiệu quả cuộc gọi cơ sở {$security}</h1>
<table class="list view table">
	<thead>
        <tr>
            <th style="background:#534d64;border-radius-top-left:10px;border-radius-top-right:10px;" colspan="12">Danh sách</th>
        </tr>
		<tr>
		       <th>Telesales</th>
            <th >Tổng số cuộc gọi ra</th>
            <th>Số nhấc máy</th>
            <th>Số không nhấc máy</th>

            <th>Tổng thời gian nhấc máy</th>
            <th>Thời gian TB nhấc máy</th>
            <th>Tổng log call</th>
            <th>Tổng SMS</th>
            <th>Chưa liên hệ thành công</th>
            <th>Active Lead</th>
            <th>Gọi chăm sóc lại</th>
            <th>Không cần gọi lại</th>
		</tr>
	</thead>
	<tbody>
          {foreach from=$report key=k item=v}
          {if $v->report->empty==0} 
          <tr>
            <td>{$v->report->user_name}</td>
            <td>{$v->report->data[0]->total_call}</td>
            <td>{$v->report->data[0]->call_held}</td>
            <td>{$v->report->data[0]->not_held}</td>

            <td>{$v->report->data[0]->duration_held}</td>
            <td>{$v->report->data[0]->rate} / cuộc gọi</td>
            <td>{$v->report->data[0]->record_calls}</td>
            <td>{$v->report->data[0]->sms_total}</td>
            <td>{$v->report->data[0]->try_to_contact}</td>
            <td>{$v->report->data[0]->active_lead}</td>
             <td>{$v->report->data[0]->recall}</td>
            <td>{$v->report->data[0]->not_interested}</td>
            <tr>
            {/if}
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
    var from,to; 
    $('#from').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        startDate: moment().startOf('month'),
    }, function(start, end, label) {
        setTimeout(function(){
            $('input[name="from"]').val(`${start.format('DD-MM-YYYY')}`)
        }, 0);
        from=start.format('YYYY-MM-DD')
    });

        $('#to').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        startDate: moment().endOf('month'),
    }, function(start, end, label) {
        setTimeout(function(){
            $('input[name="to"]').val(`${start.format('DD-MM-YYYY')}`)
        }, 0);
        to=start.format('YYYY-MM-DD')
    });
        $('input[name="from"]').val(`${ moment($("#from_val").val(), "YYYY-MM-DD").format('DD-MM-YYYY')}`)
        $('input[name="to"]').val(`${ moment($("#to_val").val(), "YYYY-MM-DD").format('DD-MM-YYYY')}`)
        from = `${ moment($('input[name="from"]').val(), "DD-MM-YYYY").format('YYYY-MM-DD')}`;
        to = `${ moment($('input[name="to"]').val(), "DD-MM-YYYY").format('YYYY-MM-DD')}`;
    $('#search').click(function(){
    
        
        var url = new URL(window.location.href);
        //console.log(url);
        var security_group = url.searchParams.get("sec");
        var telesale = $('#telesale').val();
        //console.log(security);

        // let security_group= $('#securitygroups').val();
        console.log(from);
        console.log(to);
        let url_path = `?module=PolyReports&action=voice&sec=${security_group}&telesale=${telesale}&from=${from}&to=${to}`;

    // console.log( window.location.pathname);
        //console.log(window.location.pathname + url_path );
     window.location.href= window.location.pathname + url_path;
    });
{/literal}
  
</script>
