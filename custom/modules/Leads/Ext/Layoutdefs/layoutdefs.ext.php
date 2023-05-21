<?php 
 //WARNING: The contents of this file are auto-generated



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


 // created: 2017-03-18 02:51:52
$layout_defs["Leads"]["subpanel_setup"]['fpoly_leadimports_leads_1'] = array (
  'order' => 100,
  'module' => 'fpoly_LeadImports',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_FPOLY_LEADIMPORTS_LEADS_1_FROM_FPOLY_LEADIMPORTS_TITLE',
  'get_subpanel_data' => 'fpoly_leadimports_leads_1',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);


 // created: 2017-02-21 16:08:21
$layout_defs["Leads"]["subpanel_setup"]['leads_accounts_1'] = array (
  'order' => 100,
  'module' => 'Accounts',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_LEADS_ACCOUNTS_1_FROM_ACCOUNTS_TITLE',
  'get_subpanel_data' => 'leads_accounts_1',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);


 // created: 2017-02-21 16:09:01
$layout_defs["Leads"]["subpanel_setup"]['leads_opportunities_1'] = array (
  'order' => 100,
  'module' => 'Opportunities',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_LEADS_OPPORTUNITIES_1_FROM_OPPORTUNITIES_TITLE',
  'get_subpanel_data' => 'leads_opportunities_1',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);


$layout_defs['Leads']['subpanel_setup']['activities']['top_buttons'] = array(
array('widget_class' => 'SubPanelTopScheduleCallButton')
);

unset($layout_defs["Leads"]["subpanel_setup"]['leads_opportunities_1']);


$layout_defs['Leads']['subpanel_setup']['securitygroups'] = array(
	'top_buttons' => array(array('widget_class' => 'SubPanelTopSelectButton', 'popup_module' => 'SecurityGroups', 'mode' => 'MultiSelect'),),
	'order' => 900,
	'sort_by' => 'name',
	'sort_order' => 'asc',
	'module' => 'SecurityGroups',
	'refresh_page'=>1,
	'subpanel_name' => 'default',
	'get_subpanel_data' => 'SecurityGroups',
	'add_subpanel_data' => 'securitygroup_id',
	'title_key' => 'LBL_SECURITYGROUPS_SUBPANEL_TITLE',
);






$layout_defs['Leads']['subpanel_setup']['asteriskintegration_leads']['override_subpanel_name'] = 'Lead_subpanel_asteriskintegration_leads';


//auto-generated file DO NOT EDIT
$layout_defs['Leads']['subpanel_setup']['fpoly_leadimports_leads_1']['override_subpanel_name'] = 'Lead_subpanel_fpoly_leadimports_leads_1';


//auto-generated file DO NOT EDIT
$layout_defs['Leads']['subpanel_setup']['leads_leads_1']['override_subpanel_name'] = 'Lead_subpanel_leads_leads_1';

?>