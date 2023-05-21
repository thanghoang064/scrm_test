<?php 
 //WARNING: The contents of this file are auto-generated



$layout_defs["Accounts"]["subpanel_setup"]['asteriskintegration_accounts'] = array(
    'order' => 100,
    'module' => 'AsteriskIntegration',
    'subpanel_name' => 'default',
    'sort_order' => 'asc',
    'sort_by' => 'id',
    'title_key' => 'LBL_ASTERISKINTEGRATION_ACCOUNTS_FROM_ASTERISKINTEGRATION_TITLE',
    'get_subpanel_data' => 'asteriskintegration_accounts',
    'top_buttons' =>
    array(
        0 =>
        array(
            'widget_class' => 'SubPanelTopButtonQuickCreate',
        ),
        1 =>
        array(
            'widget_class' => 'SubPanelTopSelectButton',
            'mode' => 'MultiSelect',
        ),
    ),
);


$layout_defs['Accounts']['subpanel_setup']['activities']['top_buttons'] = array(
array('widget_class' => 'SubPanelTopScheduleCallButton')
);

unset($layout_defs["Accounts"]["subpanel_setup"]['contacts']);
unset($layout_defs["Accounts"]["subpanel_setup"]['opportunities']);
unset($layout_defs["Accounts"]["subpanel_setup"]['cases']);
unset($layout_defs["Accounts"]["subpanel_setup"]['bugs']);
unset($layout_defs["Accounts"]["subpanel_setup"]['project']);
unset($layout_defs["Accounts"]["subpanel_setup"]['products_services_purchased']);
unset($layout_defs["Accounts"]["subpanel_setup"]['accounts']);


$layout_defs['Accounts']['subpanel_setup']['asteriskintegration_accounts']['override_subpanel_name'] = 'Account_subpanel_asteriskintegration_accounts';

?>