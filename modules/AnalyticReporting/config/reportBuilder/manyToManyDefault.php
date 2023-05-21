<?php
return array(
    /*Sugar CE*/
    'Accounts' => array(
        0 => array(
            'tableName' => 'accounts_bugs',
            'applicableModules' => array(0 => 'Bugs'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'account_id',
                    'title' => 'account_id'
                ),
                1 => array(
                    'name' => 'bug_id',
                    'title' => 'bug_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'accounts_cases',
            'applicableModules' => array(0 => 'Cases'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'account_id',
                    'title' => 'account_id'
                ),
                1 => array(
                    'name' => 'case_id',
                    'title' => 'case_id'
                )
            )
        ),
        2 => array(
            'tableName' => 'accounts_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'account_id',
                    'title' => 'account_id'
                ),
                1 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                )
            )
        ),
        3 => array(
            'tableName' => 'accounts_opportunities',
            'applicableModules' => array(0 => 'Opportunities'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'account_id',
                    'title' => 'account_id'
                ),
                1 => array(
                    'name' => 'opportunity_id',
                    'title' => 'opportunity_id'
                )
            )
        )
    ),
    'Calls' => array(
        0 => array(
            'tableName' => 'calls_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'call_id',
                    'title' => 'call_id'
                ),
                1 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'calls_leads',
            'applicableModules' => array(0 => 'Leads'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'call_id',
                    'title' => 'call_id'
                ),
                1 => array(
                    'name' => 'lead_id',
                    'title' => 'lead_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'calls_users',
            'applicableModules' => array(0 => 'Users'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'call_id',
                    'title' => 'call_id'
                ),
                1 => array(
                    'name' => 'user_id',
                    'title' => 'user_id'
                )
            )
        )
    ),
    'Cases' => array(
        0 => array(
            'tableName' => 'cases_bugs',
            'applicableModules' => array(0 => 'Bugs'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'case_id',
                    'title' => 'case_id'
                ),
                1 => array(
                    'name' => 'bug_id',
                    'title' => 'bug_id'
                )
            )
        )
    ),
    'Contacts' => array(
        0 => array(
            'tableName' => 'contacts_bugs',
            'applicableModules' => array(0 => 'Bugs'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                ),
                1 => array(
                    'name' => 'bug_id',
                    'title' => 'bug_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'contacts_cases',
            'applicableModules' => array(0 => 'Cases'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                ),
                1 => array(
                    'name' => 'case_id',
                    'title' => 'case_id'
                )
            )
        ),
        2 => array(
            'tableName' => 'contacts_users',
            'applicableModules' => array(0 => 'Users'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                ),
                1 => array(
                    'name' => 'user_id',
                    'title' => 'user_id'
                )
            )
        )
    ),
    'Documents' => array(
        0 => array(
            'tableName' => 'documents_accounts',
            'applicableModules' => array(0 => 'Accounts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'document_id',
                    'title' => 'document_id'
                ),
                1 => array(
                    'name' => 'account_id',
                    'title' => 'account_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'documents_bugs',
            'applicableModules' => array(0 => 'Bugs'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'document_id',
                    'title' => 'document_id'
                ),
                1 => array(
                    'name' => 'bug_id',
                    'title' => 'bug_id'
                )
            )
        ),
        2 => array(
            'tableName' => 'documents_cases',
            'applicableModules' => array(0 => 'Cases'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'document_id',
                    'title' => 'document_id'
                ),
                1 => array(
                    'name' => 'case_id',
                    'title' => 'case_id'
                )
            )
        ),
        3 => array(
            'tableName' => 'documents_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'document_id',
                    'title' => 'document_id'
                ),
                1 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                )
            )
        ),
        4 => array(
            'tableName' => 'documents_opportunities',
            'applicableModules' => array(0 => 'Opportunities'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'document_id',
                    'title' => 'document_id'
                ),
                1 => array(
                    'name' => 'opportunity_id',
                    'title' => 'opportunity_id'
                )
            )
        ),
            /*Sugar EMT*/
        5 => array(
            'tableName' => 'documents_products',
            'applicableModules' => array(0 => 'Products'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'document_id',
                    'title' => 'document_id'
                ),
                1 => array(
                    'name' => 'product_id',
                    'title' => 'product_id'
                )
            )
        ),
        6 => array(
            'tableName' => 'documents_quotes',
            'applicableModules' => array(0 => 'Quotes'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'document_id',
                    'title' => 'document_id'
                ),
                1 => array(
                    'name' => 'quote_id',
                    'title' => 'quote_id'
                )
            )
        ),
        7 => array(
            'tableName' => 'documents_revenuelineitems',
            'applicableModules' => array(0 => 'RevenueLineItems'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'document_id',
                    'title' => 'document_id'
                ),
                1 => array(
                    'name' => 'rli_id',
                    'title' => 'rli_id'
                )
            )
        )
    ),
    'Emails' => array(
        0 => array(
            'tableName' => 'emails_beans',
            'applicableModules' => array(0 => 'Beans'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'email_id',
                    'title' => 'email_id'
                ),
                1 => array(
                    'name' => 'bean_id',
                    'title' => 'bean_id'
                )
            )
        )
    ),
    'Meetings' => array(
        0 => array(
            'tableName' => 'meetings_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'meeting_id',
                    'title' => 'meeting_id'
                ),
                1 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'meetings_leads',
            'applicableModules' => array(0 => 'Leads'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'meeting_id',
                    'title' => 'meeting_id'
                ),
                1 => array(
                    'name' => 'lead_id',
                    'title' => 'lead_id'
                )
            )
        ),
        2 => array(
            'tableName' => 'meetings_users',
            'applicableModules' => array(0 => 'Users'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'meeting_id',
                    'title' => 'meeting_id'
                ),
                1 => array(
                    'name' => 'user_id',
                    'title' => 'user_id'
                )
            )
        )
    ),
    'Opportunities' => array(
        0 => array(
            'tableName' => 'opportunities_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'opportunity_id',
                    'title' => 'opportunity_id'
                ),
                1 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                )
            )
        )
    ),
    'Project' => array(
        0 => array(
            'tableName' => 'projects_accounts',
            'applicableModules' => array(0 => 'Accounts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'project_id',
                    'title' => 'project_id'
                ),
                1 => array(
                    'name' => 'account_id',
                    'title' => 'account_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'projects_bugs',
            'applicableModules' => array(0 => 'Bugs'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'project_id',
                    'title' => 'project_id'
                ),
                1 => array(
                    'name' => 'bug_id',
                    'title' => 'bug_id'
                )
            )
        ),
        2 => array(
            'tableName' => 'projects_cases',
            'applicableModules' => array(0 => 'Cases'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'project_id',
                    'title' => 'project_id'
                ),
                1 => array(
                    'name' => 'case_id',
                    'title' => 'case_id'
                )
            )
        ),
        3 => array(
            'tableName' => 'projects_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'project_id',
                    'title' => 'project_id'
                ),
                1 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                )
            )
        ),
        4 => array(
            'tableName' => 'projects_opportunities',
            'applicableModules' => array(0 => 'Opportunities'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'project_id',
                    'title' => 'project_id'
                ),
                1 => array(
                    'name' => 'opportunity_id',
                    'title' => 'opportunity_id'
                )
            )
        ),
        5 => array(
            'tableName' => 'projects_products',
            'applicableModules' => array(0 => 'Products'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'project_id',
                    'title' => 'project_id'
                ),
                1 => array(
                    'name' => 'product_id',
                    'title' => 'product_id'
                )
            )
        ),
        6 => array(
            'tableName' => 'projects_quotes',
            'applicableModules' => array(0 => 'Quotes'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'project_id',
                    'title' => 'project_id'
                ),
                1 => array(
                    'name' => 'quote_id',
                    'title' => 'quote_id'
                )
            )
        ),
        7 => array(
            'tableName' => 'projects_revenue_line_items',
            'applicableModules' => array(0 => 'RevenueLineItems'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'project_id',
                    'title' => 'project_id'
                ),
                1 => array(
                    'name' => 'rli_id',
                    'title' => 'rli_id'
                )
            )
        )
    ),
    /*Sugar CE OQC modules*/
    'oqc_Addition' => array(
        0 => array(
            'tableName' => 'oqc_addition_accounts',
            'applicableModules' => array(0 => 'Accounts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_addition_ida',
                    'title' => 'oqc_addition_ida'
                ),
                1 => array(
                    'name' => 'accounts_idb',
                    'title' => 'accounts_idb'
                )
            )
        ),
        1 => array(
            'tableName' => 'oqc_addition_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_addition_ida',
                    'title' => 'oqc_addition_ida'
                ),
                1 => array(
                    'name' => 'contacts_idb',
                    'title' => 'contacts_idb'
                )
            )
        ),
        2 => array(
            'tableName' => 'oqc_addition_documents',
            'applicableModules' => array(0 => 'Documents'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_addition_ida',
                    'title' => 'oqc_addition_ida'
                ),
                1 => array(
                    'name' => 'documents_idb',
                    'title' => 'documents_idb'
                )
            )
        ),
        3 => array(
            'tableName' => 'oqc_additio_oqc_product',
            'applicableModules' => array(0 => 'oqc_Product'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_addition_ida',
                    'title' => 'oqc_addition_ida'
                ),
                1 => array(
                    'name' => 'oqc_product_idb',
                    'title' => 'oqc_product_idb'
                )
            )
        ),
        4 => array(
            'tableName' => 'oqc_additio_oqc_service',
            'applicableModules' => array(0 => 'oqc_Service'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_addition_ida',
                    'title' => 'oqc_addition_ida'
                ),
                1 => array(
                    'name' => 'oqc_service_idb',
                    'title' => 'oqc_service_idb'
                )
            )
        )
    ),
    'oqc_Contract' => array(
        0 => array(
            'tableName' => 'oqc_contract_accounts',
            'applicableModules' => array(0 => 'Accounts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_contract_ida',
                    'title' => 'oqc_contract_ida'
                ),
                1 => array(
                    'name' => 'accounts_idb',
                    'title' => 'accounts_idb'
                )
            )
        ),
        1 => array(
            'tableName' => 'oqc_contract_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_contract_ida',
                    'title' => 'oqc_contract_ida'
                ),
                1 => array(
                    'name' => 'contacts_idb',
                    'title' => 'contacts_idb'
                )
            )
        ),
        2 => array(
            'tableName' => 'oqc_contract_documents',
            'applicableModules' => array(0 => 'Documents'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_contract_ida',
                    'title' => 'oqc_contract_ida'
                ),
                1 => array(
                    'name' => 'documents_idb',
                    'title' => 'documents_idb'
                )
            )
        ),
        3 => array(
            'tableName' => 'oqc_contract_oqc_addition',
            'applicableModules' => array(0 => 'oqc_Addition'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_contract_ida',
                    'title' => 'oqc_contract_ida'
                ),
                1 => array(
                    'name' => 'oqc_addition_idb',
                    'title' => 'oqc_addition_idb'
                )
            )
        ),
        4 => array(
            'tableName' => 'oqc_contract_project',
            'applicableModules' => array(0 => 'Project'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_contract_ida',
                    'title' => 'oqc_contract_ida'
                ),
                1 => array(
                    'name' => 'project_idb',
                    'title' => 'project_idb'
                )
            )
        ),
        5 => array(
            'tableName' => 'oqc_contrac_oqc_product',
            'applicableModules' => array(0 => 'oqc_Product'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_contract_ida',
                    'title' => 'oqc_contract_ida'
                ),
                1 => array(
                    'name' => 'oqc_product_idb',
                    'title' => 'oqc_product_idb'
                )
            )
        ),
        6 => array(
            'tableName' => 'oqc_contrac_oqc_service',
            'applicableModules' => array(0 => 'oqc_Service'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_contract_ida',
                    'title' => 'oqc_contract_ida'
                ),
                1 => array(
                    'name' => 'oqc_service_idb',
                    'title' => 'oqc_service_idb'
                )
            )
        )
    ),
    'oqc_ExternalContract' => array(
        0 => array(
            'tableName' => 'oqc_externaact_accounts',
            'applicableModules' => array(0 => 'Accounts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_externalcontract_ida',
                    'title' => 'oqc_externalcontract_ida'
                ),
                1 => array(
                    'name' => 'accounts_idb',
                    'title' => 'accounts_idb'
                )
            )
        ),
        1 => array(
            'tableName' => 'oqc_externaact_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_externalcontract_ida',
                    'title' => 'oqc_externalcontract_ida'
                ),
                1 => array(
                    'name' => 'contacts_idb',
                    'title' => 'contacts_idb'
                )
            )
        ),
        2 => array(
            'tableName' => 'oqc_externact_documents',
            'applicableModules' => array(0 => 'Documents'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_externalcontract_ida',
                    'title' => 'oqc_externalcontract_ida'
                ),
                1 => array(
                    'name' => '	documents_idb',
                    'title' => '	documents_idb'
                )
            )
        )
    ),
    'oqc_Offering' => array(
        0 => array(
            'tableName' => 'oqc_offering_accounts',
            'applicableModules' => array(0 => 'Accounts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_offering_ida',
                    'title' => 'oqc_offering_ida'
                ),
                1 => array(
                    'name' => 'accounts_idb',
                    'title' => 'accounts_idb'
                )
            )
        ),
        1 => array(
            'tableName' => 'oqc_offering_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_offering_ida',
                    'title' => 'oqc_offering_ida'
                ),
                1 => array(
                    'name' => 'contacts_idb',
                    'title' => 'contacts_idb'
                )
            )
        ),
        2 => array(
            'tableName' => 'oqc_offering_documents',
            'applicableModules' => array(0 => 'Documents'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_offering_ida',
                    'title' => 'oqc_offering_ida'
                ),
                1 => array(
                    'name' => 'documents_idb',
                    'title' => 'documents_idb'
                )
            )
        ),
        3 => array(
            'tableName' => 'oqc_offering_opportunities',
            'applicableModules' => array(0 => 'Opportunities'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_offering_ida',
                    'title' => 'oqc_offering_ida'
                ),
                1 => array(
                    'name' => 'opportunities_idb',
                    'title' => 'opportunities_idb'
                )
            )
        ),
        4 => array(
            'tableName' => 'oqc_offering_oqc_contract',
            'applicableModules' => array(0 => 'oqc_Contract'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_offering_ida',
                    'title' => 'oqc_offering_ida'
                ),
                1 => array(
                    'name' => 'oqc_contract_idb',
                    'title' => 'oqc_contract_idb'
                )
            )
        ),
        5 => array(
            'tableName' => 'oqc_offering_project',
            'applicableModules' => array(0 => 'Project'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_offering_ida',
                    'title' => 'oqc_offering_ida'
                ),
                1 => array(
                    'name' => 'project_idb',
                    'title' => 'project_idb'
                )
            )
        ),
        6 => array(
            'tableName' => 'oqc_offerin_oqc_product',
            'applicableModules' => array(0 => 'oqc_Product'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_offering_ida',
                    'title' => 'oqc_offering_ida'
                ),
                1 => array(
                    'name' => 'oqc_product_idb	',
                    'title' => 'oqc_product_idb	'
                )
            )
        ),
        6 => array(
            'tableName' => 'oqc_offerin_oqc_service',
            'applicableModules' => array(0 => 'oqc_Service'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_offering_ida',
                    'title' => 'oqc_offering_ida'
                ),
                1 => array(
                    'name' => 'oqc_service_idb	',
                    'title' => 'oqc_service_idb	'
                )
            )
        )
    ),
    'oqc_ProductCatalog' => array(
        0 => array(
            'tableName' => 'oqc_productcatalog_documents',
            'applicableModules' => array(0 => 'Documents'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_productcatalog_ida',
                    'title' => 'oqc_productcatalog_ida'
                ),
                1 => array(
                    'name' => 'documents_idb',
                    'title' => 'documents_idb'
                )
            )
        )
    ),
    'oqc_Product' => array(
        0 => array(
            'tableName' => 'oqc_productcatalog_documents',
            'applicableModules' => array(0 => 'Documents'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'oqc_product_ida',
                    'title' => 'oqc_product_ida'
                ),
                1 => array(
                    'name' => 'documents_idb',
                    'title' => 'documents_idb'
                )
            )
        )
    ),
    /*Sugar ENT*/
    'Contracts' => array(
        0 => array(
            'tableName' => 'contracts_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'contract_id',
                    'title' => 'contract_id'
                ),
                1 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'contracts_opportunities',
            'applicableModules' => array(0 => 'Opportunities'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'contract_id',
                    'title' => 'contract_id'
                ),
                1 => array(
                    'name' => 'opportunity_id',
                    'title' => 'opportunity_id'
                )
            )
        ),
        2 => array(
            'tableName' => 'contracts_products',
            'applicableModules' => array(0 => 'Products'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'contract_id',
                    'title' => 'contract_id'
                ),
                1 => array(
                    'name' => 'product_id',
                    'title' => 'product_id'
                )
            )
        ),
        3 => array(
            'tableName' => 'contracts_quotes',
            'applicableModules' => array(0 => 'Quotes'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'contract_id',
                    'title' => 'contract_id'
                ),
                1 => array(
                    'name' => 'quote_id',
                    'title' => 'quote_id'
                )
            )
        )
    ),
    'Quotes' => array(
        0 => array(
            'tableName' => 'quotes_accounts',
            'applicableModules' => array(0 => 'Accounts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'quote_id',
                    'title' => 'quote_id'
                ),
                1 => array(
                    'name' => 'account_id',
                    'title' => 'account_id'
                )
            )
        ),
        1 => array(
            'tableName' => 'quotes_contacts',
            'applicableModules' => array(0 => 'Contacts'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'quote_id',
                    'title' => 'quote_id'
                ),
                1 => array(
                    'name' => 'contact_id',
                    'title' => 'contact_id'
                )
            )
        ),
        2 => array(
            'tableName' => 'quotes_opportunities',
            'applicableModules' => array(0 => 'Opportunities'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'quote_id',
                    'title' => 'quote_id'
                ),
                1 => array(
                    'name' => 'opportunity_id',
                    'title' => 'opportunity_id'
                )
            )
        )
    ),
    /*Suite CRM*/
    'AOS_Quotes' => array(
        0 => array(
            'tableName' => 'aos_products_quotes',
            'applicableModules' => array(0 => 'AOS_Products'),
            'relModule' => false,
            'columns' => array(
                0 => array(
                    'name' => 'parent_id',
                    'title' => 'parent_id'
                ),
                1 => array(
                    'name' => 'product_id',
                    'title' => 'product_id'
                )
            )
        )
    )
);