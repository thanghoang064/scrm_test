<?php

$subpanel_layout['list_fields'] = array (
  'name' => 
  array (
    'type' => 'name',
    'link' => true,
    'vname' => 'LBL_NAME',
    'width' => '10%',
    'default' => true,
    'widget_class' => 'SubPanelDetailViewLink',
    'target_module' => NULL,
    'target_record_key' => NULL,
  ),
  'number' => 
  array (
    'type' => 'varchar',
    'vname' => 'LBL_NUMBER',
    'width' => '10%',
    'default' => true,
  ),
  'extension' => 
  array (
    'type' => 'phone',
    'vname' => 'LBL_EXTENSION',
    'width' => '10%',
    'default' => true,
  ),
  'direction' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'vname' => 'LBL_DIRECTION',
    'width' => '10%',
    'default' => true,
  ),
  'status' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'vname' => 'LBL_STATUS',
    'width' => '10%',
    'default' => true,
  ),
  'duration' => 
  array (
    'type' => 'varchar',
    'vname' => 'LBL_DURATION',
    'width' => '10%',
    'default' => true,
  ),
  'disposition' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'vname' => 'LBL_DISPOSITION',
    'width' => '10%',
    'default' => true,
  ),
  'call_date' => 
  array (
    'type' => 'date',
    'vname' => 'LBL_CALL_DATE',
    'width' => '10%',
    'default' => true,
  ),
  'date_entered' => 
  array (
    'type' => 'datetime',
    'vname' => 'LBL_DATE_ENTERED',
    'width' => '10%',
    'default' => true,
  ),
  'assigned_user_name' => 
  array (
    'link' => true,
    'type' => 'relate',
    'vname' => 'LBL_ASSIGNED_TO_NAME',
    'id' => 'ASSIGNED_USER_ID',
    'width' => '10%',
    'default' => true,
    'widget_class' => 'SubPanelDetailViewLink',
    'target_module' => 'Users',
    'target_record_key' => 'assigned_user_id',
  ),
  'edit_button' => 
  array (
    'vname' => 'LBL_EDIT_BUTTON',
    'widget_class' => 'SubPanelEditButton',
    'module' => 'AsteriskIntegration',
    'width' => '4%',
    'default' => true,
  ),
  'remove_button' => 
  array (
    'vname' => 'LBL_REMOVE',
    'widget_class' => 'SubPanelRemoveButton',
    'module' => 'AsteriskIntegration',
    'width' => '5%',
    'default' => true,
  ),
);