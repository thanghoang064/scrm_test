<?php

return array(
    'Opportunities'=>array(
        0 => array(
            'tableName' => "advancedreports_opportunities_sales_stage_audit_by_month",
            'parentModuleIdColumn' => 'id',
            'view' => false,
            'viewSql' => "",
            'viewParameters' => array(),
            'panelData' =>  array(
                'id' => '2',
                'label' => 'Snapshot',
                'fields' => array(
                    0 => array(
                        'tablename'     => 'advancedreports_opportunities_sales_stage_audit_by_month',
                        'columnname'    => 'date',
                        'fieldname'     => 'date',
                        'fieldlabel'    => 'Date',
                        'uitype'        => 'datetime',
                        'typeofdata'    => 'DT~O',
                        'block'         => '2'
                    ),
                    1 => array(
                        'tablename'     => 'advancedreports_opportunities_sales_stage_audit_by_month',
                        'columnname'    => 'value',
                        'fieldname'     => 'sales_stage_custom',
                        'fieldlabel'    => 'Value',
                        'uitype'        => 'enum',
                        'typeofdata'    => 'DT~O',
                        'block'         => '2',
                        'options'       => 'sales_stage_dom'
                    ),
                )
            )
        )
    )
);