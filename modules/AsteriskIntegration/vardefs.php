<?php

$dictionary['AsteriskIntegration'] = array(
    'table' => 'asteriskintegration',
    'audited' => false,
    'inline_edit' => false,
    'duplicate_merge' => false,
    'fields' => array(
        'name' => array(
            'name' => 'name',
            'vname' => 'LBL_NAME',
            'type' => 'name',
            'link' => true,
            'dbType' => 'varchar',
            'len' => '255',
            'unified_search' => false,
            'full_text_search' => array(
                'boost' => 3,
            ),
            'required' => false,
            'importable' => 'required',
            'duplicate_merge' => 'disabled',
            'merge_filter' => 'disabled',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'size' => '20',
        ),
        'description' => array(
            'name' => 'description',
            'vname' => 'LBL_DESCRIPTION',
            'type' => 'text',
            'comment' => 'Full text of the note',
            'rows' => '6',
            'cols' => '80',
            'required' => false,
            'massupdate' => 0,
            'no_default' => false,
            'comments' => 'Full text of the note',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'size' => '20',
            'studio' => 'visible',
        ),
        'deleted' => array(
            'name' => 'deleted',
            'vname' => 'LBL_DELETED',
            'type' => 'bool',
            'default' => '0',
            'reportable' => true,
            'comment' => 'Record deletion indicator',
            'required' => false,
            'massupdate' => 0,
            'no_default' => false,
            'comments' => 'Record deletion indicator',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => '255',
            'size' => '20',
        ),
        'add_description' => array(
            'required' => false,
            'name' => 'add_description',
            'vname' => 'LBL_ADD_DESCRIPTION',
            'type' => 'text',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'size' => '20',
            'studio' => 'visible',
            'rows' => '6',
            'cols' => '80',
            'source' => 'non-db',
        ),
        'direction' => array(
            'required' => false,
            'name' => 'direction',
            'vname' => 'LBL_DIRECTION',
            'type' => 'enum',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => 100,
            'size' => '20',
            'options' => 'asteriskintegration_direction_list',
            'studio' => 'visible',
            'dependency' => false,
        ),
        'status' => array(
            'required' => false,
            'name' => 'status',
            'vname' => 'LBL_STATUS',
            'type' => 'enum',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => 100,
            'size' => '20',
            'options' => 'asteriskintegration_status_list',
            'studio' => 'visible',
            'dependency' => false,
        ),
        'call_date' => array(
            'required' => false,
            'name' => 'call_date',
            'vname' => 'LBL_CALL_DATE',
            'type' => 'date',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'size' => '20',
            'enable_range_search' => false,
        ),
        'call_time' => array(
            'required' => false,
            'name' => 'call_time',
            'vname' => 'LBL_CALL_TIME',
            'type' => 'varchar',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => '255',
            'size' => '20',
        ),
        'asterisk_server' => array(
            'required' => false,
            'name' => 'asterisk_server',
            'vname' => 'LBL_ASTERISK_SERVER',
            'type' => 'enum',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => 100,
            'size' => '20',
            'options' => '',
            'function' => 'AsteriskIntegrationServersList',
            'studio' => 'visible',
            'dependency' => false,
        ),
        'disposition' => array(
            'required' => false,
            'name' => 'disposition',
            'vname' => 'LBL_DISPOSITION',
            'type' => 'enum',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => 100,
            'size' => '20',
            'options' => 'asteriskintegration_disposition_list',
            'studio' => 'visible',
            'dependency' => false,
        ),
        'extension' => array(
            'required' => false,
            'name' => 'extension',
            'vname' => 'LBL_EXTENSION',
            'type' => 'varchar',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => '20',
            'size' => '20',
            'dbType' => 'varchar',
        ),
        'number' => array(
            'required' => false,
            'name' => 'number',
            'vname' => 'LBL_NUMBER',
            'type' => 'varchar',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => '50',
            'size' => '20',
            'dbType' => 'varchar',
        ),
        'duration_hours' => array(
            'required' => false,
            'name' => 'duration_hours',
            'vname' => 'LBL_DURATION_HOURS',
            'type' => 'enum',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => 100,
            'size' => '20',
            'options' => 'asteriskintegration_duration_hours_list',
            'studio' => 'visible',
            'dependency' => false,
        ),
        'duration_minutes' => array(
            'required' => false,
            'name' => 'duration_minutes',
            'vname' => 'LBL_DURATION_MINUTES',
            'type' => 'enum',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => 100,
            'size' => '20',
            'options' => 'asteriskintegration_duration_minutes_list',
            'studio' => 'visible',
            'dependency' => false,
        ),
        'duration_seconds' => array(
            'required' => false,
            'name' => 'duration_seconds',
            'vname' => 'LBL_DURATION_SECONDS',
            'type' => 'enum',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => 100,
            'size' => '20',
            'options' => 'asteriskintegration_duration_seconds_list',
            'studio' => 'visible',
            'dependency' => false,
        ),
        'duration' => array(
            'required' => false,
            'name' => 'duration',
            'vname' => 'LBL_DURATION',
            'type' => 'varchar',
            'massupdate' => 0,
            'no_default' => false,
            'comments' => '',
            'help' => '',
            'importable' => 'true',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'audited' => false,
            'inline_edit' => '',
            'reportable' => true,
            'unified_search' => false,
            'merge_filter' => 'disabled',
            'len' => '255',
            'size' => '20',
        ),
        'recording_link' => array(
            'name' => 'recording_link',
            'vname' => 'LBL_RECORDING_LINK',
            'type' => 'url',
            'dbType' => 'varchar',
            'len' => '255',
            'size' => '255',
            'default' => '',
            'comments' => '',
            'help' => '',
            'required' => false,
            'reportable' => true,
            'importable' => true,
            'unified_search' => false,
            'massupdate' => true,
            'audited' => false,
            'calculated' => false,
            'no_default' => false,
            'studio' => 'visible',
            'merge_filter' => 'disabled',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'inline_edit' => '',
        ),
        'parent_type' => array(
            'name' => 'parent_type',
            'vname' => 'LBL_PARENT_TYPE',
            'type' => 'parent_type',
            'dbType' => 'varchar',
            'required' => false,
            'group' => 'parent_name',
            'options' => 'parent_type_display',
            'len' => 255,
            'comment' => '',
            'inline_edit' => '',
        ),
        'parent_name' => array(
            'name' => 'parent_name',
            'parent_type' => 'record_type_display',
            'type_name' => 'parent_type',
            'id_name' => 'parent_id',
            'vname' => 'LBL_LIST_RELATED_TO',
            'type' => 'parent',
            'group' => 'parent_name',
            'source' => 'non-db',
            'options' => 'parent_type_display',
            'inline_edit' => '',
        ),
        'parent_id' => array(
            'name' => 'parent_id',
            'vname' => 'LBL_LIST_RELATED_TO_ID',
            'type' => 'id',
            'group' => 'parent_name',
            'reportable' => false,
            'comment' => '',
            'inline_edit' => '',
        ),
        'unique_id' => array(
            'name' => 'unique_id',
            'vname' => 'LBL_UNIQUE_ID',
            'type' => 'varchar',
            'len' => '50',
            'size' => '50',
            'default' => '',
            'comments' => '',
            'help' => '',
            'required' => false,
            'reportable' => true,
            'importable' => true,
            'unified_search' => false,
            'massupdate' => true,
            'audited' => false,
            'calculated' => false,
            'no_default' => false,
            'studio' => 'visible',
            'merge_filter' => 'disabled',
            'duplicate_merge' => 'disabled',
            'duplicate_merge_dom_value' => '0',
            'inline_edit' => '',
        ),
    ),
    'relationships' => array(
    ),
    'optimistic_locking' => true,
    'unified_search' => true,
);
if (!class_exists('VardefManager'))
{
    require_once 'include/SugarObjects/VardefManager.php';
}
VardefManager::createVardef('AsteriskIntegration', 'AsteriskIntegration', array('basic', 'assignable', 'security_groups'));
