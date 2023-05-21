<p>Đợt nhập học tháng 1:</p>
<vardump></vardump>
<p>Đang xử lý: </p>
<alo></alo>
<table id="list" class="table">
    <tbody>
        <tr>
        <th>STT</th>
        <th>ID SCRM</th>
        <th>ID CRM</th>
        <th>SỐ SV CHÍNH</th>
        <th>SỐ SV PHỤ</th>
        <th>SỐ PHỤ HUYNH CHÍNH</th>
        <th>SỐ PHỤ HUYNH PHỤ</th>
        </tr>
    <tbody>
<table>
<vardump2></vardump2>
<p>Tiến trình:</p>
<progessnow></progessnow>/<progesslen></progesslen>
<p>List</p>
<dumplist></dumplist>
<style>{literal}th,td{padding: 5px 10px}{/literal}</style>
<table id="error" class="table">
    <tbody>
        <tr>
        <th>STT</th>
        <th>ID CRM</th>
        <th>SỐ SV CHÍNH</th>
        <th>SỐ SV PHỤ</th>
        <th>SỐ PHỤ HUYNH CHÍNH</th>
        <th>SỐ PHỤ HUYNH PHỤ</th>
        </tr>
    <tbody>

<table>
	<script type="text/javascript">
	{literal}
													//		url: `http://scrm.poly.edu.vn/index.php?module=Accounts&action=savecrminfo&id=${account.scrm_id}&brand_id=${account.brand_id}&campus_id=${account.campus_id}&district_id=${account.district_id}&people_id=${account.people_id}&province_id=${account.province_id}&race_code=${account.race_code}&recruitment_id=${account.recruitment_id}&school_id=${account.school_id}&document_id=${account.document_id}`,
				var crm_domain = 'https://crm.poly.edu.vn';
				var scrm_domain = 'https://scrm.poly.edu.vn';
                //var crm_domain = 'http://localhost:81/crm/public_html/';
				//var scrm_domain = 'http://localhost:81/public_html/public_html/';
                
                
                var store_data=function(){
					var store_data =null;
					$.ajax({
							type: 'GET',
							url: `${crm_domain}/crm/get_list_3.php`,
							dataType: "json",
							success: function (data,status) {
                                $('vardump').text('Còn '+ data.data.count + ' hồ sơ !');
                                let len = data.data.list_people.length ;
                                $('alo').text(len + ' hồ sơ !');
                                $('progesslen').text(len);
                                let ix = 0;
                                   $.ajax({
                                            type: 'POST',
								            data: JSON.stringify(data.data.list_people),
                                            url: `${scrm_domain}/index.php?module=Accounts&action=savescrmaccount`,
                                            dataType: "json",
                                            success: function (data,status) {
                                                ix++;
                                                $('progessnow').text(ix);
                                                let num = 0;
                                                $.each(data.null_queries, function (index, value) {
                                                    num++;
                                                    $('#error').append(`
                                                        <tr>
                                                            <td>${num}</td>
                                                            <td>${value.id}</td>
                                                            <td>${value.telephone}</td>
                                                            <td>${value.phone}</td>
                                                            <td>${value.parent1_mobile}</td>
                                                            <td>${value.parent2_mobile}</td>
                                                        </tr>
                                                    `)
                                                });
                                                let num_list = 0;
                                                $.each(data.data, function (index, value) {
                                                    num_list++;
                                                    $('#list').append(`
                                                        <tr>
                                                            <td>${num_list}</td>
                                                            <td>${value.id_c}</td>
                                                            <td>${value.people_id}</td>
                                                            <td>${value.phone1_c}</td>
                                                            <td>${value.phone3_c}</td>
                                                            <td>${value.phone2_c}</td>
                                                            <td>${value.phone4_c}</td>
                                                        </tr>
                                                    `)
                                                });
                                                $.ajax({
                                                    type: 'POST',
                                                    data: JSON.stringify(data.data),
                                                    url: `${crm_domain}/crm/fix_account_scrm.php`,
                                                    dataType: "json",
                                                    success: function (data,status) {
                                                       
                                                        
                                                     $('vardump2').text(JSON.stringify(data.data));
                                                    },
                                                        error: function (errorThrown) {
                                                            console.log(errorThrown);
                                                        }
                                                });
                                            // $('vardump2').text(JSON.stringify(data.data.list_people));
                                            },
                                                error: function (errorThrown) {
                                                    console.log(errorThrown);
                                                }
                                    });
                               // $('vardump2').text(JSON.stringify(data.data.list_people));
							},
								error: function (errorThrown) {
									console.log(errorThrown);
								}
					});
					
				}();
				
							

			
		
			
				
	{/literal}		
	</script>