

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
            <input type="text" name="from" value="10/24/1984" style="width:100px;float:left;line-height:23px" disabled/> 
            <span style="font-weight:bold;color:#534d64;float:left;line-height:32px;padding-right:10px;padding-left:10px">Tới</span>

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
                	<option value="{$k}">{$v}</option>
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
              <input type="checkbox" id="nodate" value="">
              <input type="hidden" name="nodate" id="filter" value=""/>
              <label for="nodate">Tìm theo đợt nhập học</label><br>
              <button id="search" class="btn btn-danger" style="visibility:visible">Xem báo cáo</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
{literal}
var from,to,nodate;
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
   /*  $('input[name="daterange"]').daterangepicker({
    opens: 'right',
    startDate: moment().startOf('month'),
    minYear: 2000,
    endDate: moment().endOf('month'),
  }, function(start, end, label) {
            $('#time_range').text(`Thời gian từ ${start.format('DD-MM-YY')} tới ${end.format('DD-MM-YY')}`)
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });
  */
  	 $('input[name="from"]').val( moment().startOf('month').format('DD-MM-YYYY'));
	 $('input[name="to"]').val(moment().endOf('month').format('DD-MM-YYYY'));
     from = moment().startOf('month').format('YYYY-MM-DD');
     to =  moment().endOf('month').format('YYYY-MM-DD');
     
    //$('#time_range').text(`Thời gian từ ${from} tới ${to}`)



  $('#search').click(function(){
      

	let security_group= $('#securitygroups').val();
	let dot_nhap_hoc= $('#dot_nhap_hoc').val();
	//console.log(from);
	//console.log(dot_nhap_hoc);
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
	//console.log(to);
	//console.log(str_dot_nhap_hoc);
	let url_path = `?module=PolyReports&action=source&sec=${security_group}&dot_nhap_hoc=${str_dot_nhap_hoc}&telesale=all&from=${from}&to=${to}&nodate=${nodate}`
	//console.log(url_path);

   // console.log( window.location.pathname);
    //console.log(window.location.pathname + url_path );
	  window.location.href= window.location.pathname + url_path;
  });
{/literal}
  
</script>