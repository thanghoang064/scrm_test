<?php
$hook_array['before_save'][] = Array(3, 'Sanitize phone', 'custom/modules/fpoly_LeadImports/phone.php','PhoneSanitizer', 'formatPhone');