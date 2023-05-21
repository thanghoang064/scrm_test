<?php
/*
 * @deprecated
 * This config is no longger in use, use PlatformConnetor::getAuditedModulesConfig() instead
 *
 * */
global $mod_strings;

$ifDateCreatedBeforeSql = ARSql::getIf(
    "audit_next.date_created IS NULL",
    "audit_parent.date_entered",
    "audit_next.date_created"
);

$auditView = "SELECT
                    audit_prev.id,
                    audit_prev.parent_id,
                    audit_prev.date_created,
                    {$ifDateCreatedBeforeSql} AS date_created_before,
                    audit_prev.created_by AS changed_by,
                    audit_prev.field_name,
                    audit_prev.data_type,
                    audit_prev.before_value_string,
                    audit_prev.after_value_string,
                    audit_prev.before_value_text,
                    audit_prev.after_value_text
            FROM ! audit_prev
            LEFT JOIN ! audit_next
            ON audit_prev.parent_id = audit_next.parent_id AND audit_next.date_created < audit_prev.date_created
                AND audit_next.after_value_string = audit_prev.before_value_string
                AND audit_prev.field_name = audit_next.field_name
            LEFT JOIN ! audit_parent
            ON audit_prev.parent_id = audit_parent.id
            ";

$auditModules = array(
    'Accounts'=>array(
        'moduleTableName' => 'accounts',
        'auditTableName' => 'accounts_audit',
        'block' => 2
    ),
    'Bugs'=>array(
        'moduleTableName' => 'bugs',
        'auditTableName' => 'bugs_audit',
        'block' => 2
    ),
    'Campaigns'=>array(
        'moduleTableName' => 'campaigns',
        'auditTableName' => 'campaigns_audit',
        'block' => 2
    ),
    'Cases'=>array(
        'moduleTableName' => 'cases',
        'auditTableName' => 'cases_audit',
        'block' => 2
    ),
    'Contacts'=>array(
        'moduleTableName' => 'contacts',
        'auditTableName' => 'contacts_audit',
        'block' => 2
    ),
    'Leads'=>array(
        'moduleTableName' => 'leads',
        'auditTableName' => 'leads_audit',
        'block' => 2
    ),
    'Opportunities'=>array(
        'moduleTableName' => 'opportunities',
        'auditTableName' => 'opportunities_audit',
        'block' => 2
    )
);

$auditTableFields = array(
    0 => array(
        'tablename'     => '',
        'columnname'    => 'date_created',
        'fieldname'     => 'date_created',
        'fieldlabel'    => $mod_strings['dateCreated'],
        'uitype'        => 'datetime',
        'typeofdata'    => 'DT~O',
        'block'         => ''
    ),
    1 => array(
        'tablename'     => '',
        'columnname'    => 'date_created_before',
        'fieldname'     => 'date_created_before',
        'fieldlabel'    => $mod_strings['dateCreatedBefore'],
        'uitype'        => 'datetime',
        'typeofdata'    => 'DT~O',
        'block'         => ''
    ),
    2 => array( //TODO to namefield
        'tablename'     => '',
        'columnname'    => 'changed_by',
        'fieldname'     => 'changed_by',
        'fieldlabel'    => $mod_strings['createdBy'],
        'uitype'        => 'relate',
        'typeofdata'    => 'V~O',
        'block'         => '',
        'related_module'=> 'Users',
        'table'         => 'users',
        'id_name'       => 'changed_by',
        'rname'         => 'user_name'
    ),
    3 => array(
        'tablename'     => '',
        'columnname'    => 'field_name',
        'fieldname'     => 'field_name',
        'fieldlabel'    => $mod_strings['fieldName'],
        'uitype'        => 'txt',
        'typeofdata'    => 'V~O',
        'block'         => ''
    ),
    4 => array(
        'tablename'     => '',
        'columnname'    => 'data_type',
        'fieldname'     => 'data_type',
        'fieldlabel'    => $mod_strings['dataType'],
        'uitype'        => 'txt',
        'typeofdata'    => 'V~O',
        'block'         => ''
    ),
    5 => array(
        'tablename'     => '',
        'columnname'    => 'before_value_string',
        'fieldname'     => 'before_value_string',
        'fieldlabel'    => $mod_strings['beforeValueString'],
        'uitype'        => 'txt',
        'typeofdata'    => 'V~O',
        'block'         => ''
    ),
    6 => array(
        'tablename'     => '',
        'columnname'    => 'after_value_string',
        'fieldname'     => 'after_value_string',
        'fieldlabel'    => $mod_strings['afterValueString'],
        'uitype'        => 'txt',
        'typeofdata'    => 'V~O',
        'block'         => ''
    ),
    7 => array(
        'tablename'     => '',
        'columnname'    => 'before_value_text',
        'fieldname'     => 'before_value_text',
        'fieldlabel'    => $mod_strings['beforeValueText'],
        'uitype'        => 'txt',
        'typeofdata'    => 'V~O',
        'block'         => ''
    ),
    8 => array(
        'tablename'     => '',
        'columnname'    => 'after_value_text',
        'fieldname'     => 'after_value_text',
        'fieldlabel'    => $mod_strings['beforeValueText'],
        'uitype'        => 'txt',
        'typeofdata'    => 'V~O',
        'block'         => ''
    ),
    9 => array(
        'tablename'     => '',
        'columnname'    => 'id',
        'fieldname'     => 'audit_id',
        'fieldlabel'    => 'Audit ID',
        'uitype'        => 'txt',
        'typeofdata'    => 'V~O',
        'block'         => ''
    ),
);

$config = array();

foreach ($auditModules as $auditModule => $options) {
    $config[$auditModule][0] = array(
        'tableName' => "advanced_reports_{$options['moduleTableName']}_audit",
        'parentModuleIdColumn' => 'parent_id',
        'view' => true,
        'viewSql' => $auditView,
        'viewParameters' => array($options['auditTableName'], $options['auditTableName'], $options['moduleTableName'])
    );
    $config[$auditModule][0]['panelData'] = array(
        'id' => $options['block'],
        'label' => "{$auditModule} Audit",
        'fields' => array()
    );
    foreach ($auditTableFields as $field) {
        $field['tablename'] = $config[$auditModule][0]['tableName'];
        $field['block'] = $options['block'];
        $config[$auditModule][0]['panelData']['fields'][] = $field;
    }

}

return $config;