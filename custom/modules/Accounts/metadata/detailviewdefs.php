<?php

  include_once 'custom/modules/Accounts/common.php';
  // require_once 'modules/Administration/QuickRepairAndRebuild.php';
  // $repair= new RepairAndClear();
  // $repair->show_output = false;
  // $repair->clearThemeCache();
  // $repair->clearVardefs();
  $id_rc= $_GET['record'];
  $db = DBManagerFactory::getInstance();
  $sql = "SELECT converted_file_student_c FROM accounts_cstm WHERE id_c='$id_rc'";
  $result = $db->query($sql,true,"Error");
  $data = [];
  echo "<div style='display:none' id='id_rc'>".$id_rc."</div>";
  while($row = $result->fetch_assoc()) {
      array_push($data,(object) ["converted_file_student_c"=>$row['converted_file_student_c']]);
  }
  // echo $data[0]->converted_file_student_c ;
  if($data[0]->converted_file_student_c == "0" || $data[0]->converted_file_student_c == NULL){
    $common = new CommonNE;
    $record= $common->getInfoAccount2($id_rc);

    
    // Lấy ra danh sách role của user và kiểm tra role có đạt quyền dể xem ko
    $roles= $common->getRoleUser();
    $access_role = false;
    $is_leader=false;
    foreach ($roles as $role){
      if($role->name == 'admin' || $role->name == 'Leader' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'|| $role->role_id == '7bf90ea1-2c00-10c3-9a0e-58abca3491d0'){
      // Bảo trì
      // if($role->name == 'admin'){
        $access_role = true;
        if($role->name == 'Leader' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'){
          $is_leader = true;
        }
     
      }
     
    }
    if($is_leader){
      ?>
      <style>
      	overlay{
					z-index:99;
					position:fixed;
					left:0;
					top:0;
					width:100vw;
					height:100vh;
					transition-duration:0.5s;
					background:white;
          display:none;
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
						margin-left: -110px;
						top: calc(50% + 200px);
						margin-top: -100px;
				}
      </style>
	      <overlay>
				
        </overlay>
      <?php
      echo '
      Gắn mã hồ sơ: 
      
      <input type="text" onkeypress="return isNumberKey(event)" id="attach_crm_id" placeholder="Nhập id CRM" />
      <input type="button" id="people_id_send" class="button"  value="Gắn mã">
      ';
      ?>
      <script>
          function isNumberKey(evt){
              var charCode = (evt.which) ? evt.which : evt.keyCode
              if (charCode > 31 && (charCode < 48 || charCode > 57))
                  return false;
              return true;
          }
          var people=new Object();
       
      			var crm_domain = 'https://crm.poly.edu.vn';
				var scrm_domain = 'https://scrm.poly.edu.vn';
        $("#people_id_send").click(function(){
          people.people_id=$('#attach_crm_id').val();
          people.id_rc=$('#id_rc').text();
          $.ajax({
												type: "POST",
												url: `${crm_domain}/crm/attach_scrm_id.php`,
												data: JSON.stringify(people),
												dataType: "json",
												success: function (data, status) {
													if (data.type == "error") {
                            $("overlay").css("display", "block");
                                $("#status").css("display", "block");
                            
                                $("overlay").text('');
                                $("overlay").append(`<span id='status'>${data.message}<span>`);
                                
                                $("overlay").append(`<button class="button" id="close">Thoát</button>`);
                              $("#close").click(function(){
                                $("overlay").css("display", "none");
                                $("#status").css("display", "none");
                                
													})
                          }
													if (data.type == "success") {
														//pass data, send it
														let account = data.data;

														$.ajax({
															type: "GET",
															url: `${scrm_domain}/index.php?module=Accounts&action=attach_people_id&people_id=${people.people_id}&id_rc=${people.id_rc}&crm_convert_ne_c=${account.status_changed_date}`,
															dataType: "json",
															success: function (data, status) {
																if (data.data.type == "success") {
                                  $("overlay").css("display", "block");
                                      $("#status").css("display", "block");
                                  
                                      $("overlay").text('');
                                      $("overlay").append(`<span id='status'>${data.data.message}<span>`);
                                      
                                      $("overlay").append(`<button class="button" id="close">Thoát</button>`);
                                    $("#close").click(function(){
                                      $("#close").attr('disabled', 'disabled');	
                                      $("overlay").css("display", "block");
                                      $("#status").css("display", "block");
                                
                                      location.reload();
                                })

																	
																} else {
                                  $("overlay").css("display", "block");
                                      $("#status").css("display", "block");
                                  
                                      $("overlay").text('');
                                      $("overlay").append(`<span id='status'>${data.data.message}<span>`);
                                      
                                      $("overlay").append(`<button class="button" id="close">Thoát</button>`);
                                    $("#close").click(function(){
                                      $("overlay").css("display", "none");
                                      $("#status").css("display", "none");
                                      
                                     
                                      
                                })
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
      </script>
      <?php
    }
  }
  // var_dump($data[0]->converted_file_student_c);
  if($data[0]->converted_file_student_c == "1"){
    $common = new CommonNE;
    $record= $common->getInfoAccount2($id_rc);

    
    // Lấy ra danh sách role của user và kiểm tra role có đạt quyền dể xem ko
    $roles= $common->getRoleUser();
    $access_role = false;
    $is_leader=false;
    foreach ($roles as $role){
      if($role->name == 'admin' || $role->name == 'Leader' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'|| $role->role_id == '7bf90ea1-2c00-10c3-9a0e-58abca3491d0'){
        // Bảo trì
        // if($role->name == 'admin'){
          $access_role = true;
          if($role->name == 'Leader' || $role->role_id == '2671ebfb-7ac6-95fd-6005-58abcf1ca699'){
            $is_leader = true;
          }
       
        }
     
    }

    //  var_dump($record); 
    //  die;
     $ss = new Sugar_Smarty();
     $url= $_SERVER['HTTP_HOST'];
     $ss->assign('record',$record[0]);
     $ss->assign('role',$access_role);
     $ss->assign('record_json',json_encode($record[0]));
     $ss->assign('url',$url);
     $ss->assign('is_leader',$is_leader);
     $html = $ss->fetch('custom/modules/Accounts/tpls/detailview.tpl');
     echo $html;

   

     echo "<style>
     .moduleTitle,.detail-view,#merge_duplicate_button,#duplicate_button{
       display:none !important;
     }
     
     </style>";
    // die;
  }else{


  }
  $clear =  array (
    'DetailView' => 
    array (
      'templateMeta' => 
      array (
        'form' => 
        array (
          'buttons' => 
          array (
            'SEND_CONFIRM_OPT_IN_EMAIL' => 
            array (
              'customCode' => '<input type="submit" class="button hidden" disabled="disabled" title="{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}" onclick="this.form.return_module.value=\'Accounts\'; this.form.return_action.value=\'Accounts\'; this.form.return_id.value=\'{$fields.id.value}\'; this.form.action.value=\'sendConfirmOptInEmail\'; this.form.module.value=\'Accounts\'; this.form.module_tab.value=\'Accounts\';" name="send_confirm_opt_in_email" value="{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}"/>',
              'sugar_html' => 
              array (
                'type' => 'submit',
                'value' => '{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}',
                'htmlOptions' => 
                array (
                  'class' => 'button hidden',
                  'id' => 'send_confirm_opt_in_email',
                  'title' => '{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}',
                  'onclick' => 'this.form.return_module.value=\'Accounts\'; this.form.return_action.value=\'DetailView\'; this.form.return_id.value=\'{$fields.id.value}\'; this.form.action.value=\'sendConfirmOptInEmail\'; this.form.module.value=\'Accounts\'; this.form.module_tab.value=\'Accounts\';',
                  'name' => 'send_confirm_opt_in_email',
                  'disabled' => true,
                ),
              ),
            ),
            0 => 'EDIT',
            1 => 'DUPLICATE',
            2 => 'DELETE',
            3 => 'FIND_DUPLICATES',
            'test' =>
            array(
              'customCode' => '
              {if $fields.converted_file_student_c.value == 1}
              <input type="button" class="button" onClick="" value="HỒ SƠ ĐÃ GỬI CRM" disabled style="height:32px">
              {else}
              <input type="button" class="button" onClick="window.open(window.location.pathname+\'?module=Accounts&action=convertne&record_id={$fields.id.value}\', \'_blank\',\'width=1000,height=700,scrollbars=1,resizable=1,status=1\');" value="CONVERT HỒ SƠ">
              {/if} 
              ',
            ),
          ),
        ),
        'maxColumns' => '2',
        'widths' => 
        array (
          0 => 
          array (
            'label' => '10',
            'field' => '30',
          ),
          1 => 
          array (
            'label' => '10',
            'field' => '30',
          ),
        ),
        'includes' => 
        array (
          0 => 
          array (
            'file' => 'modules/Accounts/Account.js',
          ),
        ),
        'useTabs' => true,
        'tabDefs' => 
        array (
          'LBL_ACCOUNT_INFORMATION' => 
          array (
            'newTab' => true,
            'panelDefault' => 'expanded',
          ),
          'LBL_EDITVIEW_PANEL1' => 
          array (
            'newTab' => true,
            'panelDefault' => 'expanded',
          ),
        ),
      ),
      'panels' => 
      array (
        'lbl_account_information' => 
        array (
          0 => 
          array (
            0 => 
            array (
              'name' => 'name',
              'comment' => 'Name of the Company',
              'label' => 'LBL_NAME',
            ),
            1 => 
            array (
              'name' => 'birthdate_c',
              'label' => 'LBL_BIRTHDATE',
            ),
          ),
          1 => 
          array (
            0 => 
            array (
              'name' => 'gender_c',
              'studio' => 'visible',
              'label' => 'LBL_GENDER',
            ),
            1 => 
            array (
              'name' => 'ethnicity_c',
              'studio' => 'visible',
              'label' => 'LBL_ETHNICITY',
            ),
          ),
          2 => 
          array (
            0 => 
            array (
              'name' => 'id_passport_c',
              'label' => 'LBL_ID_PASSPORT',
            ),
            1 => 
            array (
              'name' => 'date_issued_c',
              'label' => 'LBL_DATE_ISSUED',
            ),
          ),
          3 => 
          array (
            0 => 
            array (
              'name' => 'place_issued_c',
              'label' => 'LBL_PLACE_ISSUED',
            ),
            1 => 
            array (
              'name' => 'study_time_c',
              'studio' => 'visible',
              'label' => 'LBL_STUDY_TIME',
            ),
          ),
          4 => 
          array (
            0 => 
            array (
              'name' => 'school_c',
              'label' => 'LBL_SCHOOL',
            ),
            1 => 
            array (
              'name' => 'graduated_c',
              'label' => 'LBL_GRADUATED',
            ),
          ),
          5 => 
          array (
            0 => 
            array (
              'name' => 'year_graduated_c',
              'label' => 'LBL_YEAR_GRADUATED',
            ),
            1 => 
            array (
              'name' => 'major_c',
              'studio' => 'visible',
              'label' => 'LBL_MAJOR',
            ),
          ),
          6 => 
          array (
            0 => 
            array (
              'name' => 'campaign_c',
              'studio' => 'visible',
              'label' => 'LBL_CAMPAIGN',
            ),
            1 => 
            array (
              'name' => 'email1',
              'studio' => 'false',
              'label' => 'LBL_EMAIL',
            ),
          ),
          7 => 
          array (
            0 => 
            array (
              'name' => 'address_c',
              'label' => 'LBL_ADDRESS',
            ),
            1 => 
            array (
              'name' => 'postal_address_c',
              'label' => 'LBL_POSTAL_ADDRESS',
            ),
          ),
          8 => 
          array (
            0 => 
            array (
              'name' => 'parent1_name_c',
              'label' => 'LBL_PARENT1_NAME',
            ),
          ),
          9 => 
          array (
            0 => 
            array (
              'name' => 'country_c',
              'studio' => 'visible',
              'label' => 'LBL_COUNTRY',
            ),
            1 => 
            array (
              'name' => 'province_c',
              'studio' => 'visible',
              'label' => 'LBL_PROVINCE',
            ),
          ),
          10 => 
          array (
            0 => 
            array (
              'name' => 'phone1_c',
              'label' => 'LBL_PHONE1',
            ),
            1 => 
            array (
              'name' => 'phone3_c',
              'label' => 'LBL_PHONE3',
            ),
          ),
          11 => 
          array (
            0 => 
            array (
              'name' => 'district_c',
              'label' => 'LBL_DISTRICT',
            ),
            1 => 
            array (
              'name' => 'source_c',
              'studio' => 'visible',
              'label' => 'LBL_SOURCE',
            ),
          ),
          12 => 
          array (
            0 => 
            array (
              'name' => 'phone2_c',
              'label' => 'LBL_PHONE2',
            ),
            1 => 
            array (
              'name' => 'phone4_c',
              'label' => 'LBL_PHONE4',
            ),
          ),
          13 => 
          array (
            0 => 
            array (
              'name' => 'tshirt_size_c',
              'label' => 'LBL_TSHIRT_SIZE',
            ),
            1 => 
            array (
              'name' => 'program_c',
              'studio' => 'visible',
              'label' => 'LBL_PROGRAM',
            ),
          ),
          14 => 
          array (
            0 => 
            array (
              'name' => 'area_c',
              'studio' => 'visible',
              'label' => 'LBL_AREA',
            ),
            1 => 
            array (
              'name' => 'description',
              'comment' => 'Full text of the note',
              'label' => 'LBL_DESCRIPTION',
            ),
          ),
          15 => 
          array (
            0 => 
            array (
              'name' => 'assigned_user_name',
              'label' => 'LBL_ASSIGNED_TO',
            ),
            1 => 
            array (
              'name' => 'accounts_leads_1_name',
              'label' => 'LBL_ACCOUNTS_LEADS_1_FROM_LEADS_TITLE',
            ),
          ),
          16 => 
          array (
            0 => 
            array (
              'name' => 'enrollment_status_c',
              'studio' => 'visible',
              'label' => 'LBL_ENROLLMENT_STATUS',
            ),
            1 => 
            array (
              'name' => 'student_code_c',
              'label' => 'LBL_STUDENT_CODE',
            ),
          ),
          17 => 
          array (
            0 => 
            array (
              'name' => 'scheduled_date_c',
              'label' => 'LBL_SCHEDULED_DATE',
            ),
            1 => 
            array (
              'name' => 'dot_nhap_hoc_c',
              'studio' => 'visible',
              'label' => 'LBL_DOT_NHAP_HOC',
            ),
          ),
          18 => 
          array (
            0 => 
            array (
              'name' => 'promoter_c',
              'studio' => 'visible',
              'label' => 'LBL_PROMOTER',
            ),
            1 => 
            array (
              'name' => 'date_entered',
              'customCode' => '{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}',
            ),
          ),
          19 => 
          array (
            0 => 
            array (
              'name' => 'date_modified',
              'label' => 'LBL_DATE_MODIFIED',
              'customCode' => '{$fields.date_modified.value} {$APP.LBL_BY} {$fields.modified_by_name.value}',
            ),
          ),
        ),
        'lbl_editview_panel1' => 
        array (
          0 => 
          array (
            0 => 
            array (
              'name' => 'accounts_cases_1_name',
              'label' => 'LBL_ACCOUNTS_CASES_1_FROM_CASES_TITLE',
            ),
            1 => '',
          ),
        ),
      ),
    ),
  );
  $viewdefs ['Accounts'] = $clear;

?>
