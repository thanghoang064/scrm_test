
<style>
{literal}
#data_result td{
        padding: 10px 10px;
}
.btn{
        display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.428571429;
    border-radius: 4px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
th{
        min-width:4%;
}

.list tr th{
        white-space: normal;
}
{/literal}

</style>

<h2 id="message">Danh sách lead </h2>
<p>{$page_start} - {$page_now} / {$totals} Số lead</p>
{$paginate}
<table cellpadding="0" style=" table-layout: auto;" width="100%" cellspacing="0" border="0" class="list view ">
	<thead>
                <tr height="20">
                        <th scope="col">Cơ sở 1</th>
                        <th scope="col">Leads</th>
                        {* <th scope="col">Accounts</th> *}
                        <th scope="col">Mobile</th>
                        <th scope="col">Đợt nhập học</th>
                        <th scope="col">Nguồn</th>
                        <th scope="col">Trường THPT</th>
                        <th scope="col">Converted</th>
                        <th scope="col">Rating</th>
                        <th scope="col">Topic</th>
                        <th scope="col">Telesale</th>
                        <th scope="col" colspan="3">Lịch sử chăm sóc</th>
                        <th scope="col" colspan="3">Chăm sóc</th>
                        
                        <th scope="col">Ngày cập nhập</th>
                        <th scope="col">Promoter</th>
                        <th scope="col">Ngày tạo</th>
                  
                        <th scope="col">Nhập trùng</th>
                        <th scope="col">NE</th>
               </tr>
        
        </thead>
        <tbody id="data_result">
                {foreach from=$record key=k item=v}
                        <tr height="20">
                            <td scope="row" align="left" valign="top">{$v->area_c}</td>
                                <td scope="row" align="left" valign="top"><a href="/index.php?module=Leads&action=DetailView&record={$v->id}">{$v->last_name}</a></td>
                                {* <td scope="row" align="left" valign="top"><a href="/index.php?module=Leads&action=DetailView&record={$v->account_id}">{$v->account_name}</a></td> *}
                                <td scope="row" align="left" valign="top">{$v->phone_mobile}</td>
                                <td scope="row" align="left" valign="top">{$v->dot_nhap_hoc_c_name} </td>
                                <td scope="row" align="left" valign="top">{$v->source_c_name}</td>
                                <td scope="row" align="left" valign="top">{$v->school_c}</td>
                                <td scope="row" align="left" valign="top">{if $v->converted=='1'} Đã convert{else} Chưa Convert{/if}</td>
                                <td scope="row" align="left" valign="top">{$v->rating_c_name}</td>
                                <td scope="row" align="left" valign="top">{$v->topic_c}</td>
                                <td scope="row" align="left" valign="top"><a href="/index.php?module=Users&action=DetailView&record={$v->assigned_user_id}">{$v->assigned_user_name}</a></td>
                                <td scope="row" align="left" valign="top" colspan="3">{$v->call_log_c}</td>
                                <td scope="row" align="left" valign="top" colspan="3">{if $v->contacted_c == '0'} Chưa chăm sóc {else} Đã chăm sóc{/if}</td>
                                <td scope="row" align="left" valign="top">{$v->date_modified}</td>
                                <td scope="row" align="left" valign="top"><a href="/index.php?module=Users&action=DetailView&record={$v->created_by}">{$v->created_by_name}</a></td>
                                <td scope="row" align="left" valign="top">{$v->date_entered}</td>
                 
                                <td scope="row" align="left" valign="top">{$v->dup_c}</td>
                                <td scope="row" align="left" valign="top">{if $v->ne_c =='1'} NE{else} 0{/if} </td>
                        </tr>

                {/foreach}
           
        </tbody>
</table>
<p>{$page_start} - {$page_now} / {$totals} Số lead</p>
{$paginate}
{* 
	<script type="text/javascript">
	{literal}
				//var crm_domain = 'http://localhost:81/crm/public_html';
				//var scrm_domain = 'http://localhost:81/public_html/public_html';
                                var account = '';
				var scrm_domain = 'https://scrm.poly.edu.vn';
                                $('#search').click(function(){
                                        let text_search = $('#phone_search').val();
					$('#search').attr('disabled', 'disabled');																
                                
                                        $.ajax({
							type: 'GET',
							url: `${scrm_domain}/index.php?module=Leads&action=returnsearch&text_search=${text_search}`,
							dataType: "json",
							success: function (data,status) {
								if(data.message=='success'){
                                                                        $('#message').text(`Tìm thấy ${data.count} kết quả phù hợp`);
                                                                        $('#data_result').text('');
                                                                        $.each(data.data, function( index, value ) {
                                                                                if(value.account_id != null){
                                                                                        if(value.account_id.length >0 ){
                                                                                                account= `<td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Accounts&action=DetailView&record=${value.account_id}">${value.account_name}</a></td>`;
                                                                                                }else{
                                                                                                account=`<td scope="row" align="left" valign="top">Không có</td>`;
                                                                                                }
                                                                                }else{
                                                                                        account=`<td scope="row" align="left" valign="top">Không có</td>`;
                                                                                }
                                                                        
                                                                           $('#data_result').append(
                                                                                ` <tr height="20">
                                                                                                <td scope="row" align="left" valign="top">${value.area_c}</td>
                                                                                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Leads&action=DetailView&record=${value.id}">${value.last_name}</a></td>
                                                                                                 ${account}
                                                                                                <td scope="row" align="left" valign="top">${value.phone_mobile}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.dot_nhap_hoc_c_name} </td>
                                                                                                <td scope="row" align="left" valign="top">${value.source_c_name}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.school_c}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.converted==1?'Đã convert':'Chưa convert'}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.rating_c_name}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.topic_c}</td>
                                                                                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Users&action=DetailView&record=${value.assigned_user_id}">${value.assigned_user_name}</a></td>
                                                                                                <td scope="row" align="left" valign="top">${value.date_modified}</td>
                                                                                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Users&action=DetailView&record=${value.created_by}">${value.created_by_name}</a></td>
                                                                                                <td scope="row" align="left" valign="top">${value.date_entered}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.call_log_c}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.dup_c}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.ne_c==1?'NE':'0'}</td>
                                                                                </tr>`
                                                                           )
                                                                        });
                                                                }
								if(data.message=='empty'){
                                                                        $('#message').text(`Không tìm thấy kết quả phù hợp`);
                                                                }
								 $('#search').removeAttr("disabled");
							},
							error: function (errorThrown) {
								console.log(errorThrown);
                                                                 $('#search').removeAttr("disabled");
							}
					});
                                });
                                $('#search_text').click(function(){
                                        let text_search = $('#text_search').val();
					$('#search_text').attr('disabled', 'disabled');																
                                
                                        $.ajax({
							type: 'GET',
							url: `${scrm_domain}/index.php?module=Leads&action=returnsearchtext&text_search=${text_search}`,
							dataType: "json",
							success: function (data,status) {
								if(data.message=='success'){
                                                                        $('#message').text(`Tìm thấy ${data.count} kết quả phù hợp`);
                                                                        $('#data_result').text('');
                                                                        $.each(data.data, function( index, value ) {
                                                                                if(value.account_id != null){
                                                                                        if(value.account_id.length >0 ){
                                                                                                account= `<td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Accounts&action=DetailView&record=${value.account_id}">${value.account_name}</a></td>`;
                                                                                                }else{
                                                                                                account=`<td scope="row" align="left" valign="top">Không có</td>`;
                                                                                                }
                                                                                }else{
                                                                                        account=`<td scope="row" align="left" valign="top">Không có</td>`;
                                                                                }
                                                                                 
                                                                           $('#data_result').append(
                                                                                ` <tr height="20">
                                                                                                <td scope="row" align="left" valign="top">${value.area_c}</td>
                                                                                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Leads&action=DetailView&record=${value.id}">${value.last_name}</a></td>
                                                                                                   ${account}
                                                                                                <td scope="row" align="left" valign="top">${value.phone_mobile}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.dot_nhap_hoc_c_name} </td>
                                                                                                <td scope="row" align="left" valign="top">${value.source_c_name}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.school_c}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.converted==1?'Đã convert':'Chưa convert'}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.rating_c_name}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.topic_c}</td>
                                                                                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Users&action=DetailView&record=${value.assigned_user_id}">${value.assigned_user_name}</a></td>
                                                                                                <td scope="row" align="left" valign="top">${value.date_modified}</td>
                                                                                                <td scope="row" align="left" valign="top"><a href="${scrm_domain}/index.php?module=Users&action=DetailView&record=${value.created_by}">${value.created_by_name}</a></td>
                                                                                                <td scope="row" align="left" valign="top">${value.date_entered}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.call_log_c}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.dup_c}</td>
                                                                                                <td scope="row" align="left" valign="top">${value.ne_c==1?'NE':'0'}</td>
                                                                                </tr>`
                                                                           )
                                                                        });
                                                                }
								if(data.message=='empty'){
                                                                        $('#message').text(`Không tìm thấy kết quả phù hợp`);
                                                                }
								 $('#search_text').removeAttr("disabled");
							},
							error: function (errorThrown) {
								console.log(errorThrown);
                                                                 $('#search_text').removeAttr("disabled");
							}
					});
                                });
				
							

			
		
			
				
	{/literal}		
	</script> *}