<?php

$layout_defs["Leads"]["subpanel_setup"]['asteriskintegration_leads'] = array(
    'order' => 100,
    'module' => 'AsteriskIntegration',
    'subpanel_name' => 'default',
    'sort_order' => 'asc',
    'sort_by' => 'id',
    'title_key' => 'LBL_ASTERISKINTEGRATION_LEADS_FROM_ASTERISKINTEGRATION_TITLE',
    'get_subpanel_data' => 'asteriskintegration_leads',
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
