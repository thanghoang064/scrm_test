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
						<td ><input type="date" id="birthdate" value="{$record->birthdate_c}">(mm-dd-yyyy)</td>
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
						<td class="required2 address"><b>Địa chỉ:</b></td>
						<td ><input type="text" id="address" value="{$record->address_c}"></td>
					</tr>
					<tr>
						<td class="required2 id_passport"><b>CMND/Hộ chiếu: </b></td>
						<td ><input type="text" id="id_passport" value="{$record->id_passport_c}" onkeypress="return isNumber(event)"></td>
						<td class="required2 date_issued"><b>Ngày cấp:</b></td>
						<td ><input type="date" id="date_issued" value="{$record->date_issued_c}">(mm-dd-yyyy)</td>
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
						- Năm tốt nghiệp <input id="year_graduated" style="width:55px" value="{$record->year_graduated_c}"  onkeypress="return isNumber(event)"></td>
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
						<td class="required2 branch"><b>Chuyên ngành: </b></td>
						<td >
							<select class="select2" name="branch" id="branch" style="max-width:360px;">
								<option value=""></option>
							</select>
							<p>Chuyên ngành hiện tại: <span style="font-style: italic;font-weight:400;">{$record->major_name}</span></p>	
							<select name="sector" id="sector" style="max-width:360px;">
								<option value="" disabled></option>
							</select>
						</td>
						
					</tr>
					{*<tr>
						<td ><b>Tên phụ huynh: </b></td>
						<td ><input type="text" id="parent1_name" value="{$record->parent1_name_c}"></td>
						<td></td>
						<td></td>
						<td class="required2 postal_address"><b>Địa chỉ bưu điện</b></td>
						<td ><input type="text" id="postal_address" value="{$record->postal_address_c}"></td>
					</tr>
					*}
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
				
											
					<tr style="background:#f2f1f5f0">
						<td colspan="1">Url Account:</td>
						<td colspan="3"><span>{$record->url}</span></td>
					</tr>
				</tbody>
			</table>
			<button class="button" id="save">Lưu</button>
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
				var acc = JSON.parse($('#hscv').text());
				$('#hscv').remove();
				var store_data=[];
				var now_campus=0;
				//var crm_domain = 'http://localhost:81/crm/public_html';
				//var scrm_domain = 'http://localhost:81/public_html/public_html';
				var crm_domain = 'https://crm.poly.edu.vn';
				var scrm_domain = 'http://scrm.poly.edu.vn';
				function isNumber(evt) {
					evt = (evt) ? evt : window.event;
					var charCode = (evt.which) ? evt.which : evt.keyCode;
					if (charCode > 31 && (charCode < 48 || charCode > 57)) {
						return false;
					}
					return true;
				}
			

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
									//$.each(data.data.branch, function( index, value ) {
									//	 $("select[name='branch']").append(`<option value='${value.id}'>${value.name}</option>`);
									//});
									//$.each(data.data.campaign, function( index, value ) {
									//	 $("select[name='campaign']").append(`<option value='${value.id}'>${value.name}</option>`);
									//});
									$.each(data.data.province, function( index, value ) {
										 $("select[name='province']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.office, function( index, value ) {
										 $("select[name='office']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									$.each(data.data.district, function( index, value ) {
										 $("select[name='district']").append(`<option value='${value.id}'>${value.name}</option>`);
									});
									store_data = data.data;
									//Provinvce change
									// Lay campus hien tai
											
										
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
												$("select[name='branch']").html('');
											$("select[name='branch']").append(`<option value=''></option>`);
											$("select[name='branch']").val('');
										}else{
											$("select[name='campaign']").html('');
											$("select[name='campaign']").append(`<option value=''></option>`);
											$("select[name='campaign']").val('');
											$.each(store_data.campaign, function( index, value ) {
												if(value.campus_id == now_campus){
													$("select[name='campaign']").append(`<option value='${value.id}'>${value.name}</option>`);
												}
											});
											$("select[name='branch']").html('');
											$("select[name='branch']").append(`<option value=''></option>`);
											$("select[name='branch']").val('');
										}

									});

									$.each(data.data.sectors, function( index, value ) {
										 $("select[name='sector']").append(`<option value='${value.id}' disable>${value.name}</option>`);
									});
											$("select[name='campaign']").change(function() {
										let now_crm = $(this).val();
										$("select[name='branch']").html('');
										$.each(data.data.fee_branch,function (index,fee_brand){
									
											if(now_crm == fee_brand.rcm_id){
														
												$.each(data.data.branch, function( indexs, value ) {
													if(fee_brand.brand_id == value.id){
										 				$("select[name='branch']").append(`<option value='${value.id}'>${value.name}</option>`);

													}
												});
											}
										});
										$("select[name='branch']").next().css({"min-width": "190px"});
											
									})
									$.ajax({
										type: 'GET',
										url: `${crm_domain}/crm/get_list_2.php?people_id=${acc.crm_people_id_c}`,
										dataType: "json",
										success: function (data,status) {
										
											if(data.type == "success"){
												//alert(data.message);
												$('#last_name').val(data.data.last_name);
												$('#first_name').val(data.data.first_name);
												if(data.data.gender == 0){
													$('#gender').val('female');
												}
												if(data.data.gender == 1){
													$('#gender').val('male');
												}
												$('#birthdate').val(data.data.dob);
												$('#date_issued').val(data.data.cmt_provided_date);
												$('#race').find('option').each(function(index,element){
													if(element.value  == data.data.race_code){
														$(`#race`).val(element.value);
													}
												});
											
												$('#province').find('option').each(function(index,element){
													if(element.value  == data.data.province_id){
														$(`#province`).val(element.value);
													}
												});
												$('#district').find('option').each(function(index,element){
													if(element.value  == data.data.district_id){
														$(`#district`).val(element.value);
													}
												});
												$('#district').find('option').each(function(index,element){
													if(element.value  == data.data.district_id){
														$(`#district`).val(element.value);
													}
												});
												$('#school').find('option').each(function(index,element){
													if(element.value  == data.data.school_id){
														$(`#school`).val(element.value);
													}
												});
												$('#graduated_name').find('option').each(function(index,element){	
													if(element.value  == data.data.is_graduated){
														$(`#graduated_name`).val(element.value);
													}
												});
												$('#graduated_name').find('option').each(function(index,element){	
													if(element.value  == data.data.is_graduated){
														$(`#graduated_name`).val(element.value);
													}
												});
												$("#year_graduated").val(data.data.graduated_year);
												$("#email").val(data.data.email);
												$("#id_passport").val(data.data.cmt);
												$("#date_issued").val(data.data.cmt_provided_date);
												$("#place_issued").val(data.data.cmt_provided_where);
												
												$("#address").val(data.data.address);
												$("#phone1").val(data.data.phone1);
												$("#phone2").val(data.data.phone2);
												$("#phone3").val(data.data.phone3);
												$("#phone4").val(data.data.phone4);
												$.each(store_data.office, function( index, value ) {
															var now_off= data.data.office_id;
														if(value.id == now_off){
															now_campus=value.campus_id

														}
													});
												$('#office').find('option').each(function(index,element){	
													if(element.value  == data.data.office_id){
														$(`#office`).val(element.value);
													}
												});
												$(`#campaign`).html('');
												$.each(store_data.campaign,function(index,element){	
												
														if(element.campus_id == now_campus){
															$("select[name='campaign']").append(`<option value='${element.id}'>${element.name}</option>`);
															if(element.id  == data.data.precruitment_id){
																$(`#campaign`).val(element.id);
															}
														}
												
												});

											let now_crm = $("select[name='campaign']").val();
											$("select[name='branch']").html('');
											$.each(store_data.fee_branch,function (index,fee_brand){
										
												if(now_crm == fee_brand.rcm_id){
															
													$.each(store_data.branch, function( indexs, value ) {
														if(fee_brand.brand_id == value.id){
															$("select[name='branch']").append(`<option value='${value.id}'>${value.name}</option>`);

														}
													});
												}
											});
										$("select[name='branch']").next().css({"min-width": "190px"});

												$('#branch').find('option').each(function(index,element){
													if(element.value  == data.data.pbrand_id){
														$(`#branch`).val(element.value);
													}
												});
												$('.select2').select2({selectOnClose:false});
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
							$("select[name='office']").attr('disabled', 'disabled');
							$("select[name='district']").attr('disabled', 'disabled');

							$("#last_name").attr('disabled', 'disabled');
							$("#first_name").attr('disabled', 'disabled');
							$("#birthdate").attr('disabled', 'disabled');
							$("#gender").attr('disabled', 'disabled');
							$("#id_passport").attr('disabled', 'disabled');
							$("#date_issued").attr('disabled', 'disabled');
							$("#place_issued").attr('disabled', 'disabled');
							$("#time_study").attr('disabled', 'disabled');
							$("#address").attr('disabled', 'disabled');
							$("#parent1_name").attr('disabled', 'disabled');
							$("#phone1").attr('disabled', 'disabled');
							$("#phone2").attr('disabled', 'disabled');
							$("#phone3").attr('disabled', 'disabled');
							$("#phone4").attr('disabled', 'disabled');
	
						
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
				
						$( "#save" ).click(function() {
							$("#save").attr('disabled', 'disabled');

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
									name:'Khóa nhập học',
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
						if(requires == 0){
								var people=new Object();
								people.confirm=0;
								people.first_name=$('#first_name').val();
								people.last_name=$('#last_name').val();
								people.birthdate_c=$('#birthdate').val();
								people.race=$('#race').val();
								people.race_name=$('#race option:selected').text();
								people.gender_c = $('#gender').val();
								if(people.gender_c == 'female'){
									people.gender_c = 0;
								}else{
									people.gender_c = 1;
								}
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
								people.office=$('#office').val();
								people.campus=now_campus;
								people.email=$('#email').val();
								people.username=acc.username;
								people.record_id=acc.record_id;
								people.people_id=acc.crm_people_id_c;

								$.ajax({
									type: "POST",
									url: `${crm_domain}/crm/update_student_api_crm.php`,
									data: JSON.stringify(people),
									dataType: "json",
									success: function (data, status) {




										$('#save').removeAttr("disabled")
							
										$("select[name='school']").removeAttr("disabled")
										$("select[name='race']").removeAttr("disabled")
										$("select[name='branch']").removeAttr("disabled")
										$("select[name='campaign']").removeAttr("disabled")
										$("select[name='province']").removeAttr("disabled")
										$("select[name='office']").removeAttr("disabled")
										$("select[name='district']").removeAttr("disabled")


										$("#last_name").removeAttr("disabled")
										$("#first_name").removeAttr("disabled")
										$("#birthdate").removeAttr("disabled")
										$("#gender").removeAttr("disabled")
										$("#id_passport").removeAttr("disabled")
										$("#date_issued").removeAttr("disabled")
										$("#place_issued").removeAttr("disabled")
										$("#time_study").removeAttr("disabled")
										$("#address").removeAttr("disabled")
										$("#parent1_name").removeAttr("disabled")
										$("#phone1").removeAttr("disabled")
										$("#phone2").removeAttr("disabled")
										$("#phone3").removeAttr("disabled")
										$("#phone4").removeAttr("disabled")

										$("overlay").css("display", "none");
										$("#status").css("display", "none");
									if (data.type == "error") {
										$("#status").text(data.message);
										$('#save').removeAttr("disabled")
							
										$("select[name='school']").removeAttr("disabled")
										$("select[name='race']").removeAttr("disabled")
										$("select[name='branch']").removeAttr("disabled")
										$("select[name='campaign']").removeAttr("disabled")
										$("select[name='province']").removeAttr("disabled")
										$("select[name='office']").removeAttr("disabled")
										$("select[name='district']").removeAttr("disabled")


										$("#last_name").removeAttr("disabled")
										$("#first_name").removeAttr("disabled")
										$("#birthdate").removeAttr("disabled")
										$("#gender").removeAttr("disabled")
										$("#id_passport").removeAttr("disabled")
										$("#date_issued").removeAttr("disabled")
										$("#place_issued").removeAttr("disabled")
										$("#time_study").removeAttr("disabled")
										$("#address").removeAttr("disabled")
										$("#parent1_name").removeAttr("disabled")
										$("#phone1").removeAttr("disabled")
										$("#phone2").removeAttr("disabled")
										$("#phone3").removeAttr("disabled")
										$("#phone4").removeAttr("disabled")
									}
									if (data.type == "success") {
															//pass data, send it
										let account = data.data;

														}
														if (data.type == "confirm") {
															//$("#status").text(data.message);
														}
													},
													error: function (errorThrown) {
														$('#save').removeAttr("disabled")
														$("overlay").css("display", "none");
														$("#status").css("display", "none");
														console.log(errorThrown);
													},
												});
												
						}else{
								$('#save').removeAttr("disabled")
											$('#save').removeAttr("disabled")
							
										$("select[name='school']").removeAttr("disabled")
										$("select[name='race']").removeAttr("disabled")
										$("select[name='branch']").removeAttr("disabled")
										$("select[name='campaign']").removeAttr("disabled")
										$("select[name='province']").removeAttr("disabled")
										$("select[name='office']").removeAttr("disabled")
										$("select[name='district']").removeAttr("disabled")


										$("#last_name").removeAttr("disabled")
										$("#first_name").removeAttr("disabled")
										$("#birthdate").removeAttr("disabled")
										$("#gender").removeAttr("disabled")
										$("#id_passport").removeAttr("disabled")
										$("#date_issued").removeAttr("disabled")
										$("#place_issued").removeAttr("disabled")
										$("#time_study").removeAttr("disabled")
										$("#address").removeAttr("disabled")
										$("#parent1_name").removeAttr("disabled")
										$("#phone1").removeAttr("disabled")
										$("#phone2").removeAttr("disabled")
										$("#phone3").removeAttr("disabled")
										$("#phone4").removeAttr("disabled")
						}
						
						});

						
			
				
	{/literal}		
	</script>