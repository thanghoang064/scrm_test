<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('modules/Leads/views/view.edit.php');

class CustomLeadsViewEdit extends LeadsViewEdit
{
    
    function display()
    
    {
   
        if (empty($_REQUEST['record'])) {
            $queryParams = array(
                'module' => 'fpoly_LeadImports',
                'action' => 'EditView',
            );
            SugarApplication::redirect('index.php?' . http_build_query($queryParams));
        } else {
            $this->ev->process();
            echo $this->ev->display($this->showTitle);
        }
      
        $code = <<<CODE
            <script>
            function check_dup_phone(phone_type) {
                        var phone = jQuery("#" + phone_type).val();
			            var lead_id = jQuery('input[name=record]').val();
                        var url = '/index.php?entryPoint=LeadDuplicateCheckEntryPoint&phone=' + phone + '&exclude=' + lead_id;
                        jQuery.get(url, function(data) {
                            // console.log(phone, lead_id, data);
                            if(data == 1) {
                                jQuery("#" + phone_type+"").nextAll().remove();
                                jQuery("#" + phone_type).after('<span class="phone-check-message" style="color: red; font-weight: bold;"> Trùng SĐT!</span>');
                            } else {
                                jQuery("#" + phone_type+"").nextAll().remove();
                                jQuery("#" + phone_type).after('<span class="phone-check-message" style="color: green; font-weight: bold"> OK!</span>');
                            }
                        });
                        }
                jQuery(function() {
                    jQuery('#phone_mobile').on('input',function(e){
                        check_dup_phone("phone_mobile");
                        });
                        jQuery('#phone_work').on('input',function(e){
                        check_dup_phone("phone_work");
                        });
                        jQuery('#phone_home').on('input',function(e){
                        check_dup_phone("phone_home");
                        });
                        jQuery('#phone_other').on('input',function(e){
                        check_dup_phone("phone_other");
                        });
                });
            </script>
CODE;
        echo $code;
    }
}
