<?php

//require_once('include/MVC/View/views/view.list.php');
require_once('modules/Accounts/views/view.list.php');
require_once('modules/Accounts/AccountsListViewSmarty.php');

class CustomAccountsViewList extends AccountsViewList
{
    public function display() {
		?>
		<script type="text/javascript">
			jQuery(function() {
				jQuery('.listViewBody table td[field="call_log_c"]').each(function() {
					var call_log = jQuery(this).text().replace(/\|/g, "<br />");
					jQuery(this).html(call_log);
				});
				jQuery('.actionmenulink').text('Danh sách account');
				jQuery('#actionMenuSidebar ul').append(`<li class="actionmenulinks" role="presentation">
                                                <a href="index.php?module=Accounts&action=peoplelist" data-action-name="peoplelist">
                                                    <div class="side-bar-action-icon">
                                                        <span class="suitepicon suitepicon-action-list"></span>
                                                    </div>
                                                    <div class="actionmenulink">Hồ sơ crm</div>
                                                </a>
                                            </li>`);
											jQuery('#actionMenuSidebar ul').append(`<li class="actionmenulinks" role="presentation">
                                                <a href="index.php?module=Accounts&action=EditView" data-action-name="EditView">
                                                    <div class="side-bar-action-icon">
                                                        <span class="suitepicon suitepicon-action-list"></span>
                                                    </div>
                                                    <div class="actionmenulink">Tạo Account</div>
                                                </a>
                                            </li>`);
			});
		
		</script>
		<?php
		parent::display();
	}

}
