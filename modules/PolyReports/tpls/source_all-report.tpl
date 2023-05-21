
{literal}
    <script src="include/dateRangePicker/moment.min.js"></script>
    <script src="include/dateRangePicker/daterangepicker.min.js"></script>
    <link href="include/dateRangePicker/daterangepicker.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="include/dateRangePicker/datatables.min.css"/>
{/literal}

<div class="container">
    <div class="row">
     <div class="col-md-12">
            <label for="daterange" style="float:left;line-height:32px;padding-right:10px">Thời gian : </label>
            {* <input type="text" name="daterange" id="daterange" value="" /> *}

            <button id="from" type="button" style="float:left" class="btn btn-danger"><span class="suitepicon suitepicon-module-calendar" alt="Enter Date"></span></button>
            <input type="text" name="from" value="10/24/1984" style="width:100px;float:left;line-height:23px" disabled/> 
            <span style="font-weight:bold;color:#534d64;float:left;line-height:32px;padding-right:10px;padding-left:10px">Tới</span>
           <input type="hidden" id="from_val" value="{$from}">
            <input type="hidden" id="to_val" value="{$to}">
            <input type="hidden" id="telesale" value="all">
            <button id="to" type="button" style="float:left" class="btn btn-danger"><span class="suitepicon suitepicon-module-calendar" alt="Enter Date"></span></button>
            <input type="text" name="to" value="10/24/1984"  style="width:100px;float:left;line-height:23px" disabled/>
            {* <div style="clear:both"></div>
            <span id="time_range" style="font-weight:bold;color:#534d64"></span> *}
     

        </div>
        <div class="col-md-12">
          <div style="padding-top:20px"> 
            <label for="dot_nhap_hoc">Đợt nhập học : </label>
            <select id="dot_nhap_hoc" style="line-height:32px;height:100px;margin-top:-10px;padding-right:20px" name="dot_nhap_hoc[]" multiple="multiple">
                {foreach from=$dot_nhap_hoc_list key=k item=v}
                	<option value="{$k}" {foreach from=$dot_nhap_hoc key=o item=p} {if $p==$k} selected="selected" {/if} {/foreach}>{$v}</option>
                {/foreach}
            </select>
            <label for="securitygroups" style="padding-left:10px">Cơ sở : Toàn Quốc</label>
            {* <select id="securitygroups" style="line-height:32px;height:32px;" name="securitygroups">
                {foreach from=$security_groups key=k item=v}
                	<option value="{$v->securitygroup_id}">{$v->name}</option>
                {/foreach}
            </select> *}
        
            </div>
        </div>
        <div class="col-md-12">
            <div style="padding-top:30px">
                {if $nodate=='all'}
                    <input type="checkbox" id="nodate" value="all" checked>
                {else}
                    <input type="checkbox" id="nodate" value="">
                {/if}
              <label for="nodate">Tìm theo đợt nhập học</label><br>
              <button id="search" class="btn btn-danger" style="visibility:visible">Xem báo cáo</button>
            </div>
        </div>
    
 
    </div>
</div>

<h1>Báo cáo Active Lead </h1>
{foreach from=$report key=k item=v}
    {if $v->security_group_name == 'KBEAUTY-HN' || $v->security_group_name == 'KBEAUTY-HCM'}
    <table class="list view table" id="{$v->sec_id}">
        <thead>
            <tr>
                <th style="background:#534d64;border-radius-top-left:10px;border-radius-top-right:10px;" colspan="12">Báo cáo cơ sở {$v->security_group_name}</th>
            </tr>
            <tr>
                <th>Nguồn</th>
                <th >Lead</th>
                <th>Active Lead</th>
                <th>Tỉ lệ CV AL%</th>
                <th>Account</th>
                <th>Tỉ lệ CV Acc%</th>
                <th>NE</th>
                <th>Tỉ lệ CV NE%</th>

            </tr>
        </thead>
        <tbody>
        
                {* {if $v->data->empty==0}  *}
                    {foreach from=$v->data key=x item=y name="report"}
                        {* {if $y->empty==0} *}
                        {if !$smarty.foreach.report.last}
                            <tr>
                                <td>{$y->name}</td>
                                <td>{$y->lead}</td>
                                <td>{$y->active_lead}</td>
                                <td>{$y->active_lead_rate}%</td>
                                <td>{$y->converted}</td>
                                <td>{$y->converted_rate}%</td>
                                <td>{$y->ne}</td>
                                <td>{$y->ne_rate}%</td>
                            </tr>
                        {/if}
                        {* {/if} *}
                 
                    {/foreach} 
            
        

        </tbody>
   
    </table>
    <table class="list view" id="{$v->sec_id}">
            <tbody>
            
                    {* {if $v->data->empty==0}  *}
                        {foreach from=$v->data key=x item=y name="report"}
                            {* {if $y->empty==0} *}
                            {if $smarty.foreach.report.last}
                                <tr>
                                    <td>{$y->name}</td>
                                    <td>{$y->lead}</td>
                                    <td>{$y->active_lead}</td>
                                    <td>{$y->active_lead_rate}%</td>
                                    <td>{$y->converted}</td>
                                    <td>{$y->converted_rate}%</td>
                                    <td>{$y->ne}</td>
                                    <td>{$y->ne_rate}%</td>
                                </tr>
                            {/if}
                            {* {/if} *}
                    
                        {/foreach} 
                
            

            </tbody>
    
    </table>
    {* <button id="table" onclick="write_to_excel('{$v->sec_id}','Báo cáo cơ sở {$v->security_group_name}')">Tải về excel</button> *}
    <div style="padding-top:15px;padding-bottom:15px;width:100%;"></div>
    {/if}
{/foreach}
{foreach from=$report key=k item=v}
    {if $v->security_group_name != 'KBEAUTY-HN' && $v->security_group_name != 'KBEAUTY-HCM'}
    <table class="list view table" id="{$v->sec_id}">
        <thead>
            <tr>
                <th style="background:#534d64;border-radius-top-left:10px;border-radius-top-right:10px;" colspan="12">Báo cáo cơ sở {$v->security_group_name}</th>
            </tr>
            <tr>
             <th>Nguồn</th>
                <th >Lead</th>
                <th>Active Lead</th>
                <th>Tỉ lệ CV AL%</th>
                <th>Account</th>
                <th>Tỉ lệ CV Acc%</th>
                <th>NE</th>
                <th>Tỉ lệ CV NE%</th>
            </tr>
        </thead>
        <tbody>
        
                {* {if $v->data->empty==0}  *}
                    {foreach from=$v->data key=x item=y name="report"}
                          {if !$smarty.foreach.report.last}
                            <tr>
                                <td>{$y->name}</td>
                                <td>{$y->lead}</td>
                                <td>{$y->active_lead}</td>
                                <td>{$y->active_lead_rate}%</td>
                                <td>{$y->converted}</td>
                                <td>{$y->converted_rate}%</td>
                                <td>{$y->ne}</td>
                                <td>{$y->ne_rate}%</td>
                            </tr>
                           {/if}
                    {/foreach} 
            
        

        </tbody>
   
    </table>
      <table class="list view" id="{$v->sec_id}">

        <tbody>
        
                {* {if $v->data->empty==0}  *}
                    {foreach from=$v->data key=x item=y name="report"}
                          {if $smarty.foreach.report.last}
                            <tr>
                                <td>{$y->name}</td>
                                <td>{$y->lead}</td>
                                <td>{$y->active_lead}</td>
                                <td>{$y->active_lead_rate}%</td>
                                <td>{$y->converted}</td>
                                <td>{$y->converted_rate}%</td>
                                <td>{$y->ne}</td>
                                <td>{$y->ne_rate}%</td>
                            </tr>
                           {/if}
                    {/foreach} 
            
        

        </tbody>
   
    </table>
    {/if}
{/foreach}
   <table class="list view table">
        <thead>
            <tr>
                <th style="background:#534d64;border-radius-top-left:10px;border-radius-top-right:10px;" colspan="12">Báo cáo toàn quốc</th>
            </tr>
            <tr>
                   <th>Nguồn</th>
                <th >Lead</th>
                <th>Active Lead</th>
                <th>Tỉ lệ CV AL%</th>
                <th>Account</th>
                <th>Tỉ lệ CV Acc%</th>
                <th>NE</th>
                <th>Tỉ lệ CV NE%</th>
            </tr>
        </thead>
        <tbody>
             {foreach from=$report_all key=x item=y name="report"}
                            <tr>
                                <td>{$y->name}</td>
                                <td>{$y->lead}</td>
                                <td>{$y->active_lead}</td>
                                <td>{$y->active_lead_rate}%</td>
                                <td>{$y->converted}</td>
                                <td>{$y->converted_rate}%</td>
                                <td>{$y->ne}</td>
                                <td>{$y->ne_rate}%</td>
                            </tr>
                {/foreach} 
           
        </tbody>
    
    </table>
    <table class="list view table">
    <thead>

        <tr>
            <th style="width: 15%">Nguồn</th>
                    <th style="width: 10%" >Lead </th>
            <th style="width: 10%" >Active Lead</th>
            <th style="width: 10%">Tỉ lệ CV AL%</th>
            <th style="width: 10%">Account</th>
            <th style="width: 10%">Tỉ lệ CV Acc%</th>
            <th style="width: 10%">NE</th>
            <th style="width: 10%">Tỉ lệ CV NE%</th>

        </tr>
    </thead>
    <tbody>
          <tr>
            <td>
                Tổng tất cả
            </td>
            <td>{$reportall->lead}</td>
            <td>{$reportall->active_lead}</td>
            <td>{$reportall->active_lead_rate}%</td>
            <td>{$reportall->converted}</td>
            <td>{$reportall->converted_rate}%</td>
            <td>{$reportallv->ne}</td>
            <td>{$reportall->ne_rate}%</td>
        <tr>
    </tbody>
   
</table>
        <style>
            {literal}
                .dataTables_wrapper{
                    margin-top:20px;
                }
                table.dataTable thead .sorting_asc {background-image: url(include/dateRangePicker/sort_asc.png);}
                table.dataTable thead .sorting_desc {background-image: url(include/dateRangePicker/sort_desc.png);}
            {/literal}
        </style>
<a href="?module=PolyReports&action=leadall">Trở về danh sách báo cáo lead</a>
<script type="text/javascript" src="include/dateRangePicker/datatables.min.js"></script>
<script type="text/javascript">
{literal}

    
    var from,to,nodate; 

      if($('#nodate').val()=='all'){
        $('#from').attr('disabled','disabled');
        $('#to').attr('disabled','disabled');
    }
    $( "#nodate" ).change(function() {
    let  checked = $('#nodate').prop( "checked" );
    if(checked){
        $('#from').attr('disabled','disabled');
        $('#to').attr('disabled','disabled');
        $('#nodate').val('all');
        nodate=$('#nodate').val()
    }else{
        $('#from').removeAttr('disabled');
        $('#to').removeAttr('disabled');
        $('#nodate').val('');
        nodate=$('#nodate').val()

    }
    })
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

	let security_group= $('#securitygroups').val();
	let dot_nhap_hoc= $('#dot_nhap_hoc').val();
	//console.log(from);
	//console.log(dot_nhap_hoc);
  let str_dot_nhap_hoc= '';
  nodate=$('#nodate').val()
  try {
    let last_key= dot_nhap_hoc.length-1;
     for(i in dot_nhap_hoc)
    {
        if (i == last_key)
        {
          str_dot_nhap_hoc+=`${dot_nhap_hoc[i]}`;
            //console.log(i)
        }else{
          str_dot_nhap_hoc+=`${dot_nhap_hoc[i]},`;
        }
    }
  }
  catch(err) {
    str_dot_nhap_hoc = ''
  }

 
	//console.log(to);
	//console.log(str_dot_nhap_hoc);
	let url_path = `?module=PolyReports&action=sourceall&sec=all&dot_nhap_hoc=${str_dot_nhap_hoc}&telesale=all&from=${from}&to=${to}&nodate=${nodate}`
//	console.log(url_path);

   // console.log( window.location.pathname);
    //console.log(window.location.pathname + url_path );
	  window.location.href= window.location.pathname + url_path;
    });
          $('.table').DataTable( {
    "paging": false,
     "bInfo" : false
});
{/literal}
 
</script>
    {literal}
    <style>
         td,th {text-align:left;padding:8px 10px !important;width:10%}
         </style>
     {/literal}