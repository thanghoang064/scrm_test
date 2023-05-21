<?php 
 //WARNING: The contents of this file are auto-generated


$hook_array['before_save'][] = Array(2, 'Check if duplicate', 'custom/modules/fpoly_LeadImports/check.php','LeadImportChecker', 'check_if_duplicate');

$hook_array['after_save'][] = Array(1, 'Import Leads', 'custom/modules/fpoly_LeadImports/import.php','LeadImporter', 'import_leads');

$hook_array['before_save'][] = Array(5, 'Mark auto assigned leads', 'custom/modules/fpoly_LeadImports/check.php','LeadImportChecker', 'mark_auto_assign_leads');

$hook_array['before_save'][] = Array(3, 'Sanitize phone', 'custom/modules/fpoly_LeadImports/phone.php','PhoneSanitizer', 'formatPhone');
?>