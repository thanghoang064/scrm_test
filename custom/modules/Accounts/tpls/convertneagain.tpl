{literal}
    <script src="include/dateRangePicker/select2/select2.min.js"></script>
    <script src="include/dateRangePicker/select2/i18n/vi.js"></script>
    <link href="include/dateRangePicker/select2/select2.min.css" rel="stylesheet" type="text/css">
{/literal}
<div class="container">
    <div class="row">
		<div class="col-md-12">
			<overlay>
				<span id="status">Đang kiểm tra dữ liệu hệ thống...<span>	
			</overlay>
			<table class="list view table">
				<thead>
					<tr>
						<th colspan="4">HỒ SƠ CONVERT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4" id="error"></td>
					</tr>
					<tr>
						<td class="required2 last_name"><b>Họ và tên đệm: </b></td>
						<td ><input type="text" id="last_name" value="{$record->last_name}"></td>
						<td class="required2 first_name"><b>Tên:</b></td>
						<td ><input type="text" id="first_name" value="{$record->first_name}"></td>
					</tr>
					<tr>
						<td class="required2 birthdate"><b>Ngày sinh: </b></td>
						<td ><input type="date" id="birthdate" value="{$record->birthdate_c}"></td>
						<td class="required2 gender"><b>Giới tính:</b></td>
						<td ><select id="gender">
						<option value="female" {if $record->gender_c == 'female'} selected{/if}>Nữ</option>
						<option value="male" {if $record->gender_c == 'male'} selected{/if}>Nam</option>
						</select></td>
					</tr>
					<tr>
						<td class="required2 race"><b>Dân tộc: </b></td>
						<td >
						<select class="select2" name="race" id="race" style="max-width:200px;">
							<option value=""></option>
						</select>
						<p>Dân tộc hiện tại: <span style="font-style: italic;font-weight:400;">{$record->ethnicity_c}</span></p>
						</td>
						<td class="required2 branch"><b>Chuyên ngành: </b></td>
						<td >
						<select class="select2" name="branch" id="branch" style="max-width:360px;">
							<option value=""></option></select>
							<p>Chuyên ngành hiện tại: <span style="font-style: italic;font-weight:400;">{$record->major_name}</span></p>	
						</td>
					</tr>
					<tr>
						<td class="required2 id_passport"><b>CMND/Hộ chiếu: </b></td>
						<td ><input type="text" id="id_passport" value="{$record->id_passport_c}" onkeypress="return isNumber(event)"></td>
						<td class="required2 date_issued"><b>Ngày cấp:</b></td>
						<td ><input type="date" id="date_issued" value="{$record->date_issued_c}"></td>
					</tr>
					<tr>
						<td class="required2 place_issued"><b>Nơi cấp: </b></td>
						<td ><input type="text" id="place_issued" value="{$record->place_issued_c}"></span></td>
						<td ><b>Nguyện vọng học (thời gian):</b></td>
						<td >
							<select id="time_study">
								<option value="day" {if $record->study_time_c == 'day'}selected{/if}>Ban ngày</option>
								<option value="evenning" {if $record->study_time_c == 'evenning'}selected{/if}>Ban đêm</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="required2 province"><b>Tỉnh,Thành phố:</b></td>
						<td >
						<select class="select2" name="province" id="province" style="max-width:200px;">
						<option value=""></option></select>
						<p>Tỉnh,Thành phố hiện tại: <span style="font-style: italic;font-weight:400;">{$record->province_name}<span></p>
						</td>
						<td class="required2 district"><b>Quận huyện: </b></td>
						<td ><select name="district" style="max-width:200px;" id="district">
						<option value="" class="none"></option></select>
						<p>Quận huyện hiện tại: <span style="font-style: italic;font-weight:400;">{$record->district_c}<span></p></td> 
					</tr>
					<tr>
						<td class="required2 school"><b>Trường THPT: </b></td>
						<td ><select class="select2" name="school" style="max-width:200px;" id="school">
						<option value=""></option>
						</select>
						<p>Trường hiện tại: <span style="font-style: italic;font-weight:400;">{$record->school_c}<span></p></td>
						<td class="required2 year_graduated graduated_name"><b>Trạng thái học: </b></td>
						<td > 
						<select id="graduated_name" >
								<option value="0" {if $record->graduated_c == 0}selected{/if}>Chưa tốt nghiệp</option>
								<option value="1" {if $record->graduated_c == 1}selected{/if}>Đã tốt nghiệp</option>
						</select>
						- Năm tốt nghiệp <input style="width: 55px;" id="year_graduated" value="{$record->year_graduated_c}"  onkeypress="return isNumber(event)"></td>
					</tr>
					
					<tr>
						<td class="required2 office"><b>Văn phòng: </b></td>
						<td >
						<select name="office" style="max-width:200px;" id="office">
							<option value=""></option></select>
						</td>
				
						<td class="required2 campaign"><b>Khóa nhập học:</b></td>
						<td >
					
							<select name="campaign" style="max-width:200px;" id="campaign">
							<option value=""></option></select>
							<p>Khóa nhập học hiện tại: <span style="font-style: italic;font-weight:400;">{$record->campaign_name}<span></p>
						</td>
					</tr>
					<tr>
						<td ><b>Email: </b></td>
						<td ><input type="text" id="email" value="{$record->email_c}"></td>
						<td class="required2 address"><b>Địa chỉ:</b></td>
						<td ><input type="text" id="address" value="{$record->address_c}"></td>
					</tr>
					{*<tr>
						<td ><b>Tên phụ huynh: </b></td>
						<td ><input type="text" id="parent1_name" value="{$record->parent1_name_c}"></td>
						<td class="required2 postal_address"><b>Địa chỉ bưu điện</b></td>
						<td ><input type="text" id="postal_address" value="{$record->postal_address_c}"></td>
					</tr>*}
					<tr>
						<td class="required2 phone1"><b>SĐT sinh viên (chính): </b></td>
						<td ><input type="text" id="phone1" value="{$record->phone1_c}" onkeypress="return isNumber(event)" maxlength="10"></td>
						<td ><b>SĐT sinh viên (phụ):</b></td>
						<td ><input type="text" id="phone3" value="{$record->phone3_c}" onkeypress="return isNumber(event)" maxlength="10"> </td>
					</tr>
					<tr>
						<td class="required2 phone2"><b>SĐT phụ huynh (chính): </b></td>
						<td ><input type="text" id="phone2" value="{$record->phone2_c}" onkeypress="return isNumber(event)" maxlength="10"></span></td>
						<td ><b>SĐT phụ huynh (phụ):</b></td>
						<td ><input type="text" id="phone4" value="{$record->phone4_c}" onkeypress="return isNumber(event)" maxlength="10"></td>
					</tr>
					<tr>
						<td ><b>Quốc gia: </b></td>
						<td >Việt Nam</td>
						<td ><b>Hệ đào tạo:</b></td>
						<td >Cao đẳng</td>	
					</tr>
				
					<tr>		
						<td ><b>Hệ đào tạo:</b></td>
						<td >Cao đẳng</td>	
					</tr>								
					<tr style="background:#f2f1f5f0">
						<td colspan="1">Url Account:</td>
						<td colspan="3"><span>{$record->url}</span></td>
					</tr>
				</tbody>
			</table>
			<button class="button" id="convert">Convert</button>
			<div id="hscv" style="display:none">{$record_json}</div>
			<div id="tesst"></div>
			{* <dump></dump> *}
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
				#confirm{
					    display: block;
						height: 30px;
						width: 200px;
						position: absolute;
						left: 50%;
						margin-left: -100px;
						top: calc(50% + 200px);
						margin-top: -100px;
				}
				#close{
					    display: block;
						height: 30px;
						width: 180px;
						position: absolute;
						left: 50%;
						margin-left: -90px;
						top: calc(50% + 200px);
						margin-top: -100px;
				}
				p{
					font-size: 12px;
					font-weight:bold;
				}
				{/literal}
			</style>
		</div>
	<div>
	
	
<div>
	<script type="text/javascript">
	{literal}
				var store_data=[];
				var now_campus=0;
				function isNumber(evt) {
					evt = (evt) ? evt : window.event;
					var charCode = (evt.which) ? evt.which : evt.keyCode;
					if (charCode > 31 && (charCode < 48 || charCode > 57)) {
						return false;
					}
					return true;
				}
				//var crm_domain = 'http://localhost:81/crm/public_html';
				//var scrm_domain = 'http://localhost:81/public_html/public_html';
				var crm_domain = 'https://crm.poly.edu.vn';
				var scrm_domain = 'https://scrm.poly.edu.vn';
				$.ajax({
							type: 'GET',
							url: `${crm_domain}/crm/get_list.php`,
							dataType: "json",
							success: function (data,status) {
							
								if(data.type == "success"){
									//alert(data.message);
									$.each(data.data.schools, function( index, value ) {
										 $("select[name='school']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.race, function( index, value ) {
										 $("select[name='race']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.branch, function( index, value ) {
										 $("select[name='branch']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.campaign, function( index, value ) {
										 $("select[name='campaign']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.province, function( index, value ) {
										 $("select[name='province']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.campus, function( index, value ) {
										 $("select[name='campus']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.district, function( index, value ) {
										 $("select[name='district']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.office, function( index, value ) {
										 $("select[name='office']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									store_data = data.data;
									//Provinvce change
									$('.select2').select2({selectOnClose:false});
										
									$("select[name='province']").on("change", function (e) { 
											let now_province = $(this).val();

										if(now_province == '' || now_province == undefined || now_province==null){
											$("select[name='district']").html('');
											$("select[name='district']").append(`<option value=''></option>`);
											$("select[name='district']").val('');
											$.each(store_data.district, function( index, value ) {
												$("select[name='district']").append(`<option value='${value.id}'>${value.name}</option>`);
											});
											$("select[name='school']").html('');
											$("select[name='school']").append(`<option value=''></option>`);
											$("select[name='school']").val('');
											$.each(store_data.schools, function( index, value ) {
										
													$("select[name='school']").append(`<option value='${value.id}'>${value.name}</option>`);
												
											});
										
											$('.select2').select2({selectOnClose:false});
										}else{
											$("select[name='district']").html('');
											$("select[name='district']").append(`<option value=''></option>`);
											$("select[name='district']").val('');
											$.each(store_data.district, function( index, value ) {
												if(value.province_id == now_province){
													$("select[name='district']").append(`<option value='${value.id}'>${value.name}</option>`);
												}
											});
										
											$("select[name='school']").html('');
											$("select[name='school']").append(`<option value=''></option>`);
											$("select[name='school']").val('');
											$.each(store_data.schools, function( index, value ) {
												if(value.province_id == now_province){
													$("select[name='school']").append(`<option value='${value.id}'>${value.name}</option>`);
												}
											});
										
											$('.select2').select2({selectOnClose:false});
											
										}

									 });
									$("select[name='office']").change(function() {
										let now_office = $(this).val();
								
											$.each(store_data.office, function( index, value ) {

												if(value.id == now_office){
													now_campus=value.campus_id
												}
											});
										if(now_campus == '' || now_campus == undefined || now_campus ==null){
											$("select[name='campaign']").html('');
											$("select[name='campaign']").append(`<option value=''></option>`);
											$("select[name='campaign']").val('');
											$.each(store_data.campaign, function( index, value ) {
												$("select[name='campaign']").append(`<option value='${value.id}'>${value.name}</option>`);
											});
										}else{
											$("select[name='campaign']").html('');
											$("select[name='campaign']").append(`<option value=''></option>`);
											$("select[name='campaign']").val('');
											$.each(store_data.campaign, function( index, value ) {
												if(value.campus_id == now_campus){
													$("select[name='campaign']").append(`<option value='${value.id}'>${value.name}</option>`);
												}
											});
										}

									});
								

									$("overlay").css("display", "none");
									$("#status").css("display", "none");
								}else if(data.type == "error"){
									$("#status").text(data.message);
								}
								//alert(status)
								},
								error: function (errorThrown) {
									console.log(errorThrown);
								}
				});
				function validate(array_field){
						var error=[];
						$("overlay").css("display", "block");
						$("#status").css("display", "block");
						$(".required2").css("color", "#534d64");
						$("#status").text('Đang xác thực dữ liệu ...')
						$.each(array_field, function( index, field ) {
							switch(field.type) {
								case 'require':
									if(field.data == '' || field.data==null || field.data==undefined){
											error.push(field)
										}
									break;
								case 'phone':
									if(field.data.length != 10){
										error.push(field)
									}
									break;
								case 'cmnd':
									if(field.data.length != 9 && field.data.length != 12){
										error.push(field)
									}
								break;
								default:
									if(field.data == '' || field.data==null || field.data==undefined){
											error.push(field)
									}
							}	
								
						});
						
						if(error.length==0){
							$("#status").text('Dữ liệu đúng yêu cầu, đang xác thực trên hệ thống ...')						
							$("select[name='school']").attr('disabled', 'disabled');																
							$("select[name='race']").attr('disabled', 'disabled');																
							$("select[name='branch']").attr('disabled', 'disabled');														
							$("select[name='campaign']").attr('disabled', 'disabled');									
							$("select[name='province']").attr('disabled', 'disabled');
							$("select[name='campus']").attr('disabled', 'disabled');
							$("select[name='district']").attr('disabled', 'disabled');
							$("select[name='office']").attr('disabled', 'disabled');
	
						
						}else{
							$("#error").text('Các trường còn thiếu thông tin: ');
							$.each(error, function( index, field ) {
								$("#error").append(`, <span style="color:red;font-size:12px">${field.name}<span>`);
								$(field.order).css("color", "red");
							});
							$("overlay").css("display", "none");
							$("#status").css("display", "none");
						}
					return error.length;
				}
				
				$( "#convert" ).click(function() {
						var acc = JSON.parse($('#hscv').text());
						//Validate view screen
						var requires = validate(
							[
								{
									name:'Tên đệm',
									data:$('#first_name').val(),
									order:'.first_name',
									type:'require'
								},
								{
									name:'Tên',
									data:$('#last_name').val(),
									order:'.last_name',
									type:'require'

								},		
														
								{
									name:'Chuyên ngành',
									data:$('select[name="branch"]').val(),
									order:'.branch',
									type:'require'


								},
								{
									name:'Chiến dịch tuyển sinh',
									data:$('select[name="campaign"]').val(),
									order:'.campaign',
									type:'require'


								},
								{
									name:'Văn phòng',
									data:$('select[name="office"]').val(),
									order:'.office',
									type:'require'


								},
								
						
							
							]
						)
						
						//$('dump').text(acc.id);
							var people=new Object();
							people.confirm=0;
							people.first_name=$('#first_name').val();
							people.last_name=$('#last_name').val();
							people.birthdate_c=$('#birthdate').val();
							people.race=$('#race').val();
							people.race_name=$('#race option:selected').text();
							people.gender_c=$('#gender').val();
							people.id_passport_c=$('#id_passport').val();
							people.date_issued_c=$('#date_issued').val();
							people.place_issued_c=$('#place_issued').val();
							people.school=$('#school').val();
							people.school_name=$('#school option:selected').text();
							people.graduated_c=$('#graduated_name').val();
							people.year_graduated_c=$('#year_graduated').val();
							people.branch=$('#branch').val();
							people.branch_name=$('#branch ').val();
							people.campaign=$('#campaign').val();
							people.address_c=$('#address').val();
							people.postal_address_c=$('#postal_address').val();
							people.phone1_c=$('#phone1').val();
							people.phone2_c=$('#phone2').val();
							people.phone3_c=$('#phone3').val();
							people.phone4_c=$('#phone4').val();
							people.province=$('#province').val();
							people.district=$('#district').val();
							people.campus=now_campus;
							people.office=$('#office').val();
							people.email=$('#email').val();
							people.username=acc.username;
							people.record_id=acc.record_id;
							//$('#tesst').text(JSON.stringify(people));
						if(requires==0){
							people.confirm = 0;
							$.ajax({
								type: "POST",
								url: `${crm_domain}/crm/people_scrm_api_create.php`,
								data: JSON.stringify(people),
								dataType: "json",
								success: function (data, status) {
									if (data.type == "error") {
										$("#status").text(data.message);
									}
									if (data.type == "confirm") {
										$("#status").text(data.message);
										$("overlay").append(`<button class="button" id="confirm">Xác nhận</button>`);
										//if confirm then pass
										$("#confirm").click(function () {
											people.confirm = 1;
											$.ajax({
												type: "POST",
												url: `${crm_domain}/crm/people_scrm_api_create.php`,
												data: JSON.stringify(people),
												dataType: "json",
												success: function (data, status) {
													if (data.type == "error") {
														$("#status").text(data.message);
													}
													if (data.type == "success") {
														//pass data, send it
														let account = data.data;

														$.ajax({
															type: "GET",
															url: `${scrm_domain}/index.php?module=Accounts&action=savecrminfo&id=${account.scrm_id}&brand_id=${account.brand_id}&campus_id=${account.campus_id}&district_id=${account.district_id}&people_id=${account.people_id}&province_id=${account.province_id}&race_code=${account.race_code}&recruitment_id=${account.recruitment_id}&school_id=${account.school_id}&document_id=${account.document_id}`,
															dataType: "json",
															success: function (data, status) {
																if (data.status) {
																		$("#status").text(data.description);
																		$("overlay").append(`<button class="button" id="close">Thoát</button>`);
																		$("#confirm").css("display", "none");
																		$("#status").css("margin-left", "-125px");
																		$("#status").css("width", "250px");

																		//if confirm then pass
																		$("#close").click(function () {
																			var win = window.open(`${crm_domain}/crm/lead_showlist.php?people_id=${account.people_id}`, '_blank');
																			win.focus();
																			var win2 = window.open(`${scrm_domain}/index.php?module=Accounts&action=DetailView&record=${account.scrm_id}`, '_blank');
																			win2.focus();
																			window.close();
																		});
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
										});
									}
									if (data.type == "success") {
										let account = data.data;
										$.ajax({
											type: "GET",
											url: `${scrm_domain}/index.php?module=Accounts&action=savecrminfo&id=${account.scrm_id}&brand_id=${account.brand_id}&campus_id=${account.campus_id}&district_id=${account.district_id}&people_id=${account.people_id}&province_id=${account.province_id}&race_code=${account.race_code}&recruitment_id=${account.recruitment_id}&school_id=${account.school_id}&document_id=${account.document_id}`,
											dataType: "json",
											success: function (data, status) {
												if (data.status) {
																$("#status").text(data.description);
																		$("overlay").append(`<button class="button" id="close">Thoát</button>`);
																		$("#confirm").css("display", "none");
																		$("#status").css("margin-left", "-125px");
																		$("#status").css("width", "250px");

																		//if confirm then pass
																		$("#close").click(function () {
																			var win = window.open(`${crm_domain}/crm/lead_showlist.php?people_id=${account.people_id}`, '_blank');
																			win.focus();
																			var win2 = window.open(`${scrm_domain}/index.php?module=Accounts&action=DetailView&record=${account.scrm_id}`, '_blank');
																			win2.focus();
																			window.close();
																		});
												} else {
													$("#status").text("Tạo hồ sơ có lỗi vui lòng báo it trường hợp này để đc hỗ trợ!");
												}
											},
											error: function (errorThrown) {
												console.log(errorThrown);
											},
										});
									}
								},
								error: function (errorThrown) {
									console.log(errorThrown);
								},
							});

						
										
										}
						
						
					
				});	
				
	{/literal}		
	</script>