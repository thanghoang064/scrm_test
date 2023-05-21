
<div class="container">
    <div class="row">
		<div class="col-md-12">
			<overlay>
				
			</overlay>
			{* <div class='alert alert-danger'>
				Hồ sơ đã được chuyển sang crm, bạn không thể chỉnh sửa tại đây nữa!
			</div> *}
			{if $is_leader==true}
				<input type="button" id="remove" class="button" record="{$record->id}" style="height:32px" value="Gỡ kết nối crm">
		
			{/if}
			{if $role==true}
			<input type="button" id="edit" class="button" record="{$record->id}" style="height:32px" value="Sửa hồ sơ (CRM)">
			
		
			<script>

			{literal}
			
			
			$( "#edit" ).click(function() {
					
				let idrc= $(this).attr('record');
				window.open(`${window.location.pathname}?module=Accounts&action=editcrm&record_id=${idrc}`, '_blank','width=1000,height=700,scrollbars=1,resizable=1,status=1');
	
			});
						{/literal}
			</script>
			<script>
			{literal}
			$( "#convert2" ).click(function() {
				let idrc= $(this).attr('record');
				window.open(`${window.location.pathname}?module=Accounts&action=convertedneagain&record_id=${idrc}`, '_blank','width=1000,height=700,scrollbars=1,resizable=1,status=1');
	
			});
						{/literal}
			</script>
			{/if}
			<table class="list view table">
				<thead>
					<tr>
						<th colspan="4">HỒ SƠ</th>
				
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4" id="error"></td>
					</tr>
					<tr>
						<td><b>Mã hồ sơ:</b></td>
						<td><b style="color:red" id="document_code">{$record->crm_document_id_c}</b></td>
						<td><b>Mã sinh viên: <b></td>
						<td><span id="student_code"></span></td>
					</tr>
					<tr>
						<td><b>Trạng thái:</b></td>
						<td><span id="status_student"></span></td>
						<td class="required2 campaign"><b>Chiến dịch tuyển sinh:</b></td>
						<td >
							<span id="campaign"></span>
						</td>
					</tr>
					<tr>
						<td class="required2 last_name"><b>Họ và tên: </b></td>
						<td ><span id="last_name">{$record->last_name}</span> <span id="first_name">{$record->first_name}</span></td>
						<td class="required2 gender"><b>Giới tính:</b></td>
						<td ><span id="gender">{$record->gender_c}</span></td>
					</tr>
					<tr>
						<td class="required2 birthdate"><b>Ngày sinh: </b></td>
						<td ><span id="birthdate">{$record->birthdate_c}</span></td>
						<td class="required2 race"><b>Dân tộc: </b></td>
						<td >
							<span id="race"></span>
						</td>
					</tr>

					<tr>
						<td class="required2 id_passport"><b>CMND/Hộ chiếu: </b></td>
						<td ><span id="id_passport">{$record->id_passport_c}</span></td>
						<td class="required2 date_issued"><b>Ngày cấp:</b></td>
						<td ><span id="date_issued">{$record->date_issued_c}</span></td>
					</tr>
					<tr>
						<td class="required2 place_issued"><b>Nơi cấp: </b></td>
						<td ><span id="place_issued">{$record->place_issued_c}</span></td>
						<td class="required2 branch"><b>Chuyên ngành: </b></td>
						<td >
							<span id="branch"></span>
						</td>

					</tr>
					<tr>
						<td class="required2 school"><b>Trường THPT: </b></td>
						<td ><span id="school"></span></td>
						<td class="required2 year_graduated graduated_name"><b>Trạng thái học: </b></td>
						<td > <span id="graduated_name">{$record->graduated_name} </span> - <span id="year_graduated">{$record->year_graduated_c}</span></td>
					</tr>
					<tr>
						<td ><b>Tên phụ huynh: </b></td>
						<td ><span id="parent1_name">{$record->parent1_name_c}</span></td>
						<td class="required2 campus"><b>Cơ sở (CRM): </b></td>
						<td >
						<span id="campus"></span>
						</td>
					</tr>
					<tr>
						<td class="required2 phone1"><b>SĐT sinh viên (chính): </b></td>
						<td ><span id="phone1">{$record->phone1_c}</span></td>
						<td ><b>SĐT sinh viên (phụ):</b></td>
						<td >{$record->phone3_c}</td>
					</tr>
					<tr>
						<td class="required2 phone2"><b>SĐT phụ huynh (chính): </b></td>
						<td ><span id="phone2">{$record->phone2_c}</span></td>
						<td ><b>SĐT phụ huynh (phụ):</b></td>
						<td >{$record->phone4_c}</td>
					</tr>
					<tr>
						<td class="required2 address"><b>Địa chỉ:</b></td>
						<td ><span id="address">{$record->address_c}</span></td>
						<td class="required2 postal_address"><b></b></td>
						<td ><span id="postal_address"></span></td>
					</tr>
					<tr>
							<td class="required2 province"><b>Tỉnh,Thành phố:</b></td>
						<td >
						<span id="province"></span>
						</td>
						<td class="required2 district"><b>Quận huyện: </b></td>
						<td >
							<span id="district"></span>
						</td> 
					</tr>
					<tr>
						<td ><b>Quốc gia: </b></td>
						<td >{$record->country_name}</td>
						<td ><b>Email: </b></td>
						<td ><span id="email">{$record->email_c}</span></td>	
					</tr>
					<tr>
						<td class="required2 source_name"><b>Nguồn: </b></td>
						<td ><span id="source_name">{$record->source_name}</span></td>
						<td ><b>Hệ đào tạo:</b></td>
						<td >{$record->program_name}</td>
					</tr>

					<tr>
							<td ><b>Nguyện vọng học (thời gian):</b></td>
						<td >{$record->study_time_c}</td>
							<td class="required2 "><b>Promoter:</b></td>
						<td >
							{$record->pro_name_c}
						</td>
						
					</tr>			
					<tr>
							<td ><b>Telesales:</b></td>
						<td >{$record->telesale}</td>
							<td class="required2 "><b>Đợt nhập học:</b></td>
						<td >
							{$record->dot_nhap_hoc_name}
						</td>
						
					</tr>		
					<tr>
						<td ><b>Lần cập nhật cuối(SCRM):</b></td>
						<td >{$record->date_modified}</td>
							<td ><b>Ngày tạo account (SCRM)</b></td>
						<td >
							{$record->date_entered}
						</td>
						
					</tr>	
						<tr>
						<td ><b>Người cập nhật cuối(CRM):</b></td>
						<td id="updated_by">{$record->date_modified}</td>
							<td ><b>Lần cập nhập cuối (CRM)</b></td>
						<td id="last_modified">
							{$record->date_entered}
						</td>
						
					</tr>		
					<tr style="background:#f2f1f5f0">
						<td colspan="1">Url Account:</td>
						<td colspan="3"><span>{$record->url}</span></td>
					</tr>
				
				</tbody>
			</table>
	
			<div id="hscv" style="display:none">{$record_json}</div>
			<dump></dump>
			<style>
				{literal}
				overlay{
					z-index:99;
					position:fixed;
					left:0;
					top:0;
					width:100vw;
					height:100vh;
					transition-duration:0.5s;
					background:white;
				}
				#status_student,#student_code{
					color:red;
					font-weight:bold
				}
				#status{
				    display: block;
					padding-top: 80px;
					height: 200px;
					width: 300px;
					position: absolute;
					left: 50%;
					margin-left: -150px;
					top: 50%;
					margin-top: -100px;
				}
				#confirmremove{
					    display: block;
						height: 30px;
						width: 200px;
						position: absolute;
						left: 50%;
						margin-left: -195px;
						top: calc(50% + 200px);
						margin-top: -100px;
				}
				#close{
					    display: block;
						height: 30px;
						width: 180px;
						position: absolute;
						left: 50%;
						margin-left: 20px;
						top: calc(50% + 200px);
						margin-top: -100px;
				}
				p{
					font-size: 12px;
					font-weight:bold;
				}
				.moduleTitle,.detail-view,#merge_duplicate_button,#duplicate_button{
				display:none !important;
				}
     

				{/literal}
			</style>
			{if $is_leader == 0}
			<style>
				{literal}
					#delete_button{
						display:none !important;
					}
				{/literal}
			</style>
			{/if}
		</div>
	<div>
	
	
<div>
	<script type="text/javascript">
	{literal}
				//var crm_domain = 'http://localhost:81/crm/public_html';
				//var scrm_domain = 'http://localhost:81/public_html/public_html';
				var crm_domain = 'https://crm.poly.edu.vn';
				var scrm_domain = 'https://scrm.poly.edu.vn';
				var acc = JSON.parse($('#hscv').text());
				$('#hscv').remove();
				var store_data=function(){
					var store_data =null;
					$.ajax({
							type: 'GET',
							url: `${crm_domain}/crm/get_list.php`,
							dataType: "json",
							success: function (data,status) {
								
								
								if(data.type == "success"){
									//alert(data.message);
								
									store_data = data.data;
										$.ajax({
											type: 'GET',
											url: `${crm_domain}/crm/get_list_2.php?people_id=${acc.crm_people_id_c}`,
											dataType: "json",
											success: function (data,status) {
											
												if(data.type == "success"){
													
													//Provinvce change
													$("#document_code").html(`<a style="text-decoration:underline;" href="${crm_domain}/crm/lead_showlist.php?people_id=${acc.crm_people_id_c}" target="_blank">${data.data.pdocument_code}</a>`);
													$("#student_code").text(data.data.student_code);
													$("#status_student").text(data.data.status);
													$("#last_name").text(data.data.last_name);
													$("#first_name").text(data.data.first_name);
													if(data.data.gender=='1'){
														$("#gender").text("Nam");
													}else{
														$("#gender").text("Nữ");
													}
													$("#birthdate").text(data.data.dob);
													$("#id_passport").text(data.data.cmt);
													$("#place_issued").text(data.data.cmt_provided_date);
													$("#date_issued").text(data.data.cmt_provided_where);
													if(data.data.is_graduated=='1'){
														$("#graduated_name").text('Đã tốt nghiệp');
													}else{
														$("#graduated_name").text('Chưa tốt nghiệp');
													}
													$("#year_graduated").text(data.data.graduated_year);
													$("#updated_by").text(data.data.updated_by);
													$("#last_modified").text(data.data.last_modified);
													$("#phone1").text(data.data.phone1);
													$("#phone2").text(data.data.phone2);
													$("#phone3").text(data.data.phone3);
													$("#phone4").text(data.data.phone4);
													$("#phone4").text(data.data.phone4);
													$("#address").text(data.data.address);
													$("#email").text(data.data.email);
						
													$.each(store_data.schools, function( index, value ) {
										
														if(value.id == data.data.school_id){
															$("#school").text(value.name);
														}
													
													});
													$.each(store_data.race, function( index, value ) {
																	
														if(value.id ==  data.data.race_code){
																$("#race").text(value.name);
														}
													});
													$.each(store_data.branch, function( index, value ) {
														if(value.id == data.data.pbrand_id){
																$("#branch").text(value.name);
														}	
													});
													$.each(store_data.campaign, function( index, value ) {
											
														if(value.id == data.data.precruitment_id){
																$("#campaign").text(value.name);
														}	
													});
													$.each(store_data.province, function( index, value ) {										
														if(value.id ==  data.data.province_id){
																$("#province").text(value.name);
														}	
													});
													$.each(store_data.campus, function( index, value ) {
														if(value.id == data.data.pcampus_id){
																$("#campus").text(value.name);
														}	
													});
													$.each(store_data.district, function( index, value ) {
														if(value.id == data.data.district_id){
																$("#district").text(value.name);
														}	
													});
													if(data.data.student_code == "" || data.data.status_code == '10'){
															$("#student_code").css({"color":"red"})
													}
													if(data.data.status_code == '3' || data.data.status_code == '4'){
														$("#student_code").css({"color":"blue"})
													}
													$("overlay").css("display", "none");
													$("#status").css("display", "none");
												}
												if(data.type == "error"){
													$("#status").text(data.message);
												}
												//alert(status)
												},
												error: function (errorThrown) {
													console.log(errorThrown);
												}
								});
								
					
						
								
								}else if(data.type == "error"){
									$("#status").text(data.message);
								}
								//alert(status)
								},
								error: function (errorThrown) {
									console.log(errorThrown);
								}
					});
					
				}();
							$("#remove").click(function(){
				$("overlay").css("display", "block");
				$("#status").css("display", "block");
		
				$("overlay").text('');
				$("overlay").append(`<span id='status'>Xác nhận gỡ kết nối account này với hệ thống crm ?<span>`);
				$("overlay").append(`<button class="button" id="confirmremove">Xác nhận</button>`);
				$("overlay").append(`<button class="button" id="close">Không</button>`);
				$("#close").click(function(){
					$("overlay").css("display", "none");
					$("#status").css("display", "none");
				});
				$("#confirmremove").click(function(){
					$.ajax({
												type: "POST",
												url: `${crm_domain}/crm/remove_scrm_id.php`,
												data: JSON.stringify(acc),
												dataType: "json",
												success: function (data, status) {
													$("#confirmremove").attr('disabled', 'disabled');		
													if (data.type == "error") {
														$("#status").text(data.message);
														$("#confirmremove").removeAttr("disabled");
													}
													if (data.type == "success") {
														//pass data, send it
														let account = data.data;

														$.ajax({
															type: "GET",
															url: `${scrm_domain}/index.php?module=Accounts&action=removecrm&people_id=${acc.crm_people_id_c}`,
															dataType: "json",
															success: function (data, status) {
																if (data.data.type=='success') {
																	location.reload();
																} else {
																	$("#status").text("Tạo hồ sơ có lỗi vui lòng báo it trường hợp này để đc hỗ trợ!");
																}
															},
															error: function (errorThrown) {
																console.log(errorThrown);
															},
														});
													}
													if (data.type == "confirm") {
														//$("#status").text(data.message);
													}
												},
												error: function (errorThrown) {
													console.log(errorThrown);
												},
											});
				})
			});
							

			
		
			
				
	{/literal}		
	</script>