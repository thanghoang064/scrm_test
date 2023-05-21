<?php
$hook_array['before_save'][] = Array(2, 'Check if duplicate', 'custom/modules/fpoly_LeadImports/check.php','LeadImportChecker', 'check_if_duplicate');