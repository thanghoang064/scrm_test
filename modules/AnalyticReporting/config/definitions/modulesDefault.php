<?php
return array(
    //table created via job CombineMeetingsTasksCallsJob.php
    "MTC" => array(
        "fields" => array(
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "id",
                "fieldname" => "id",
                "fieldlabel" => "id",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "type",
                "fieldname" => "type",
                "fieldlabel" => "Type",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "name",
                "fieldname" => "name",
                "fieldlabel" => "Name",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "date_entered",
                "fieldname" => "date_entered",
                "fieldlabel" => "Date entered",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "date_modified",
                "fieldname" => "date_modified",
                "fieldlabel" => "Date modified",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "date_due",
                "fieldname" => "date_due",
                "fieldlabel" => "Due date",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename"     => "advancedreports_tasks_meetings_calls",
                "columnname"    => "modified_user_id",
                "fieldname"     => "modified_user_id",
                "fieldlabel"    => "Modified by",
                "uitype"        => "relate",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Users",
                "table"         => "users",
                "id_name"       => "modified_user_id",
                "rname"         => "user_name",
                "presence" => 1,
            ),
            array(
                "tablename"     => "advancedreports_tasks_meetings_calls",
                "columnname"    => "created_by",
                "fieldname"     => "created_by",
                "fieldlabel"    => "Created by",
                "uitype"        => "relate",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Users",
                "table"         => "users",
                "id_name"       => "created_by",
                "rname"         => "user_name",
                "presence" => 1,
            ),
            array(
                "tablename"     => "advancedreports_tasks_meetings_calls",
                "columnname"    => "assigned_user_id",
                "fieldname"     => "assigned_user_id",
                "fieldlabel"    => "Assigned user",
                "uitype"        => "relate",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Users",
                "table"         => "users",
                "id_name"       => "assigned_user_id",
                "rname"         => "user_name",
                "presence" => 1,
            ),
            array(
                "tablename"     => "advancedreports_tasks_meetings_calls",
                "columnname"    => "team_id",
                "fieldname"     => "team_id",
                "fieldlabel"    => "Team",
                "uitype"        => "txt",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Teams",
                "table"         => "teams",
                "id_name"       => "team_id",
                "rname"         => "name",
                "presence" => 1,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "deleted",
                "fieldname" => "deleted",
                "fieldlabel" => "Deleted",
                "uitype" => "checkbox",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "description",
                "fieldname" => "description",
                "fieldlabel" => "Description",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "status",
                "fieldname" => "status",
                "fieldlabel" => "Status",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "parent_type",
                "fieldname" => "parent_type",
                "fieldlabel" => "Parent type",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls",
                "columnname" => "parent_id",
                "fieldname" => "parent_id",
                "fieldlabel" => "Parent id",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
        ),
        "tab_name_index" => array(
            array("name"=>"advancedreports_tasks_meetings_calls", "idCol"=>"id")
            //"advancedreports_tasks_meetings_calls" => "id",
        ),
        "table_name" => "advancedreports_tasks_meetings_calls",
        "table_index" => "id",
        "blocks" => array(
            array(
                "blockid" => -6,
                "blocklabel" => "Tasks, meetings, calls",
            )
        )
    ),
    //table created via job CombineMeetingsTasksCallsEmailsJob.php
    "MTCE" => array(
        "fields" => array(
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "id",
                "fieldname" => "id",
                "fieldlabel" => "id",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "type",
                "fieldname" => "type",
                "fieldlabel" => "Type",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "name",
                "fieldname" => "name",
                "fieldlabel" => "Name",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "date_entered",
                "fieldname" => "date_entered",
                "fieldlabel" => "Date entered",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "date_modified",
                "fieldname" => "date_modified",
                "fieldlabel" => "Date modified",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "date_due",
                "fieldname" => "date_due",
                "fieldlabel" => "Due date",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename"     => "advancedreports_tasks_meetings_calls_emails",
                "columnname"    => "modified_user_id",
                "fieldname"     => "modified_user_id",
                "fieldlabel"    => "Modified by",
                "uitype"        => "relate",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Users",
                "table"         => "users",
                "id_name"       => "modified_user_id",
                "rname"         => "user_name",
                "presence" => 1,
            ),
            array(
                "tablename"     => "advancedreports_tasks_meetings_calls_emails",
                "columnname"    => "created_by",
                "fieldname"     => "created_by",
                "fieldlabel"    => "Created by",
                "uitype"        => "relate",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Users",
                "table"         => "users",
                "id_name"       => "created_by",
                "rname"         => "user_name",
                "presence" => 1,
            ),
            array(
                "tablename"     => "advancedreports_tasks_meetings_calls_emails",
                "columnname"    => "assigned_user_id",
                "fieldname"     => "assigned_user_id",
                "fieldlabel"    => "Assigned user",
                "uitype"        => "relate",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Users",
                "table"         => "users",
                "id_name"       => "assigned_user_id",
                "rname"         => "user_name",
                "presence" => 1,
            ),
            array(
                "tablename"     => "advancedreports_tasks_meetings_calls_emails",
                "columnname"    => "team_id",
                "fieldname"     => "team_id",
                "fieldlabel"    => "Team",
                "uitype"        => "txt",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Teams",
                "table"         => "teams",
                "id_name"       => "team_id",
                "rname"         => "name",
                "presence" => 1,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "deleted",
                "fieldname" => "deleted",
                "fieldlabel" => "Deleted",
                "uitype" => "checkbox",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "description",
                "fieldname" => "description",
                "fieldlabel" => "Description",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "status",
                "fieldname" => "status",
                "fieldlabel" => "Status",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "parent_type",
                "fieldname" => "parent_type",
                "fieldlabel" => "Parent type",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "advancedreports_tasks_meetings_calls_emails",
                "columnname" => "parent_id",
                "fieldname" => "parent_id",
                "fieldlabel" => "Parent id",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
        ),
        "tab_name_index" => array(
            array("name"=>"advancedreports_tasks_meetings_calls_emails", "idCol"=>"id")
            //"advancedreports_tasks_meetings_calls" => "id",
        ),
        "table_name" => "advancedreports_tasks_meetings_calls_emails",
        "table_index" => "id",
        "blocks" => array(
            array(
                "blockid" => -6,
                "blocklabel" => "Tasks, meetings, calls, emails",
            )
        )
    ),
    "Opportunities_contacts" => array(
        "fields" => array(
            array(
                "tablename" => "opportunities_contacts",
                "columnname" => "id",
                "fieldname" => "id",
                "fieldlabel" => "id",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "opportunities_contacts",
                "columnname" => "contact_id",
                "fieldname" => "contact_id",
                "fieldlabel" => "Contact id",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "opportunities_contacts",
                "columnname" => "opportunity_id",
                "fieldname" => "opportunity_id",
                "fieldlabel" => "Opportunity id",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "opportunities_contacts",
                "columnname" => "contact_role",
                "fieldname" => "contact_role",
                "fieldlabel" => "Contact role",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "opportunities_contacts",
                "columnname" => "date_modified",
                "fieldname" => "date_modified",
                "fieldlabel" => "Due modified",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "opportunities_contacts",
                "columnname" => "deleted",
                "fieldname" => "deleted",
                "fieldlabel" => "Deleted",
                "uitype" => "bool",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
        ),
        "tab_name_index" => array(
            array("name"=>"opportunities_contacts", "idCol"=>"id")
            //"advancedreports_tasks_meetings_calls" => "id",
        ),
        "table_name" => "opportunities_contacts",
        "table_index" => "id",
        "blocks" => array(
            array(
                "blockid" => -6,
                "blocklabel" => "Opportunities Contacts",
            )
        )
    ),
    "Currencies" => array(
        "fields" => array(
            array(
                "tablename" => "currencies",
                "columnname" => "id",
                "fieldname" => "id",
                "fieldlabel" => "id",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "currencies",
                "columnname" => "name",
                "fieldname" => "name",
                "fieldlabel" => "Name",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "currencies",
                "columnname" => "symbol",
                "fieldname" => "symbol",
                "fieldlabel" => "Symbol",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "currencies",
                "columnname" => "iso4217",
                "fieldname" => "iso4217",
                "fieldlabel" => "ISO4217",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "currencies",
                "columnname" => "conversion_rate",
                "fieldname" => "conversion_rate",
                "fieldlabel" => "Conversion rate",
                "uitype" => "float",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "currencies",
                "columnname" => "status",
                "fieldname" => "status",
                "fieldlabel" => "Status",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "currencies",
                "columnname" => "deleted",
                "fieldname" => "deleted",
                "fieldlabel" => "Deleted",
                "uitype" => "checkbox",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "currencies",
                "columnname" => "date_entered",
                "fieldname" => "date_entered",
                "fieldlabel" => "Date entered",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename" => "currencies",
                "columnname" => "date_modified",
                "fieldname" => "date_modified",
                "fieldlabel" => "Due modified",
                "uitype" => "datetime",
                "typeofdata" => "DT~O",
                "presence" => 1,
                "block" => -6,
            ),
            array(
                "tablename"     => "currencies",
                "columnname"    => "created_by",
                "fieldname"     => "created_by",
                "fieldlabel"    => "Created by",
                "uitype"        => "relate",
                "typeofdata"    => "V~O",
                "block"         => -6,
                "related_module"=> "Users",
                "table"         => "users",
                "id_name"       => "created_by",
                "rname"         => "user_name",
                "presence" => 1,
            ),
        ),
        "tab_name_index" => array(
            array("name"=>"currencies", "idCol"=>"id")
            //"advancedreports_tasks_meetings_calls" => "id",
        ),
        "table_name" => "currencies",
        "table_index" => "id",
        "blocks" => array(
            array(
                "blockid" => -6,
                "blocklabel" => "Currencies",
            )
        )
    ),
    "EmailAddrRel" => array(
        "fields" => array(
            array(
                "tablename" => "emails_email_addr_rel",
                "columnname" => "id",
                "fieldname" => "id",
                "fieldlabel" => "EmailAddrRel ID",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -7,
            ),
            array(
                "tablename" => "emails_email_addr_rel",
                "columnname" => "email_id",
                "fieldname" => "email_id",
                "fieldlabel" => "Email ID",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -7,
            ),
            array(
                "tablename" => "emails_email_addr_rel",
                "columnname" => "email_address_id",
                "fieldname" => "email_address_id",
                "fieldlabel" => "Email Address ID",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -7,
            ),
            array(
                "tablename" => "emails_email_addr_rel",
                "columnname" => "email_id",
                "fieldname" => "email_id",
                "fieldlabel" => "Email ID",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -7,
            ),
            array(
                "tablename" => "emails_email_addr_rel",
                "columnname" => "address_type",
                "fieldname" => "address_type",
                "fieldlabel" => "Address Type",
                "uitype" => "txt",
                "typeofdata" => "V~O",
                "presence" => 1,
                "block" => -7,
            ),
        ),
        "tab_name_index" => array(
            array("name"=>"emails_email_addr_rel", "idCol"=>"id")
            //"advancedreports_tasks_meetings_calls" => "id",
        ),
        "table_name" => "emails_email_addr_rel",
        "table_index" => "id",
        "blocks" => array(
            array(
                "blockid" => -7,
                "blocklabel" => "Emails EmailAddress",
            )
        )
    ),
);