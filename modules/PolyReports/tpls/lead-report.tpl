
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
            <label for="securitygroups" style="padding-left:10px">Cơ sở : </label>
            <select id="securitygroups" style="line-height:32px;height:32px;" name="securitygroups">
                {foreach from=$security_groups key=k item=v}
                	<option value="{$v->securitygroup_id}">{$v->name}</option>
                {/foreach}
            </select>
        
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

<h1>Báo cáo lead của cơ sở {$security}</h1>
    {$report->length}
<table class="list view table">
    <thead>

        <tr>
            <th style="width: 15%">Telesales</th>
            {* <th style="width: 10%" >Lead <button class="lead_filter" inverse="false">F</button></th>
            <th style="width: 10%" >Active Lead <button class="active_lead_filter" inverse="false">F</button></th> *}
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

    {foreach from=$report key=k item=v name="report"}
      {if $v->report->empty==0} 
        {if $smarty.foreach.report.last}
        
        {else}
          <tr>
            <td>{$v->report->user_name}</td>
            <td>{$v->report->data[0]->lead}</td>
            <td>{$v->report->data[0]->active_lead}</td>
            <td>{$v->report->data[0]->active_lead_rate}%</td>
            <td>{$v->report->data[0]->converted}</td>
            <td>{$v->report->data[0]->converted_rate}%</td>
            <td>{$v->report->data[0]->ne}</td>
            <td>{$v->report->data[0]->ne_rate}%</td>
        <tr>
        {/if}
      
        {/if}
    {/foreach}

    </tbody>
   
</table>
<table class="list view">

    <tbody>
          {if $v->report->empty==0} 
        {if $smarty.foreach.report.last}
            <tr class="last-create">
                <td style="width: 15%">{$v->report->user_name}</td>
                <td style="width: 10%">{$v->report->data[0]->lead}</td>
                <td style="width: 10%" >{$v->report->data[0]->active_lead}</td>
                <td style="width: 10%" >{$v->report->data[0]->active_lead_rate}%</td>
                <td style="width: 10%" >{$v->report->data[0]->converted}</td>
                <td style="width: 10%" >{$v->report->data[0]->converted_rate}%</td>
                <td style="width: 10%" >{$v->report->data[0]->ne}</td>
                <td style="width: 10%" >{$v->report->data[0]->ne_rate}%</td>
            <tr>
        <tr>
        {/if}
      
        {/if}
         
    </tbody>
</table>
 <style>
        {literal}
        td,th {text-align:left;padding:8px 10px !important;}
        table.dataTable thead .sorting_asc {background-image: url(include/dateRangePicker/sort_asc.png);}
        table.dataTable thead .sorting_desc {background-image: url(include/dateRangePicker/sort_desc.png);}
        {/literal}
    </style>
<a href="?module=PolyReports&action=lead">Trở về danh sách báo cáo lead</a>

<script type="text/javascript" src="include/dateRangePicker/datatables.min.js"></script>

<script type="text/javascript">
    {literal}
    var from,to,nodate;
    let xx = $('tr');
    for(i=0;i<xx.length;i++){
        if(xx[i].cells.length == 0){
            xx[i].parentNode.removeChild(xx[i]);
        }
    }
    $('.table').DataTable( {
    "paging": false,
     "bInfo" : false
});

    jQuery.fn.sortElements = (function(){
    
    var sort = [].sort;
    
    return function(comparator, getSortable) {
        
        getSortable = getSortable || function(){return this;};
        
        var placements = this.map(function(){
            
            var sortElement = getSortable.call(this),
                parentNode = sortElement.parentNode,
                
                // Since the element itself will change position, we have
                // to have some way of storing it's original position in
                // the DOM. The easiest way is to have a 'flag' node:
                nextSibling = parentNode.insertBefore(
                    document.createTextNode(''),
                    sortElement.nextSibling
                );
            
            return function() {
                
                if (parentNode === this) {
                    throw new Error(
                        "You can't sort elements if any one is a descendant of another."
                    );
                }
                
                // Insert before flag:
                parentNode.insertBefore(this, nextSibling);
                // Remove flag:
                parentNode.removeChild(nextSibling);
                
            };
            
        });
       
        return sort.call(this, comparator).each(function(i){
            placements[i].call(getSortable.call(this));
        });
        
    };
    
})();
 
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
        startDate: moment($("#from_val").val(), "YYYY-MM-DD"),
    }, function(start, end, label) {
        setTimeout(function(){
            $('input[name="from"]').val(`${start.format('DD-MM-YYYY')}`)
        }, 0);
        from=start.format('YYYY-MM-DD')
    });

        $('#to').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        startDate: moment($("#to_val").val(), "YYYY-MM-DD"),
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
        let dot_nhap_hoc= $('#dot_nhap_hoc').val();
        nodate=$('#nodate').val()
        //console.log(security);

        // let security_group= $('#securitygroups').val();
        //console.log(from);
       //console.log(to);
        let str_dot_nhap_hoc= '';
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
	    let url_path = `?module=PolyReports&action=lead&sec=${security_group}&dot_nhap_hoc=${str_dot_nhap_hoc}&telesale=all&from=${from}&to=${to}&nodate=${nodate}`;

    // console.log( window.location.pathname);
        //console.log(window.location.pathname + url_path );
     window.location.href= window.location.pathname + url_path;
    });
    {/literal}

</script>
