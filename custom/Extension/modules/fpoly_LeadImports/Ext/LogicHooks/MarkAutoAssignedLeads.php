<?php
$hook_array['before_save'][] = Array(5, 'Mark auto assigned leads', 'custom/modules/fpoly_LeadImports/check.php','LeadImportChecker', 'mark_auto_assign_leads');