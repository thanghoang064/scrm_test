<?php 
 //WARNING: The contents of this file are auto-generated



$layout_defs["Contacts"]["subpanel_setup"]['asteriskintegration_contacts'] = array(
    'order' => 100,
    'module' => 'AsteriskIntegration',
    'subpanel_name' => 'default',
    'sort_order' => 'asc',
    'sort_by' => 'id',
    'title_key' => 'LBL_ASTERISKINTEGRATION_CONTACTS_FROM_ASTERISKINTEGRATION_TITLE',
    'get_subpanel_data' => 'asteriskintegration_contacts',
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



$layout_defs['Contacts']['subpanel_setup']['asteriskintegration_contacts']['override_subpanel_name'] = 'Contact_subpanel_asteriskintegration_contacts';

?>