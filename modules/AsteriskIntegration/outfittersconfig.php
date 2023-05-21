<?php

global $sugar_config;

$outfitters_config['name'] = 'AsteriskIntegration';
$outfitters_config['shortname'] = 'dt-asterisk-integration';
$outfitters_config['public_key'] = 'da5b60247268978f953dfe15f7340b08,aff931fce9f2860a7b89d527dcfb1a75';
$outfitters_config['api_url'] = 'https://store.suitecrm.com/api/v1';
$outfitters_config['validate_users'] = false;
$outfitters_config['manage_licensed_users'] = false;
$outfitters_config['validation_frequency'] = 'daily';
$outfitters_config['continue_url'] = $sugar_config['site_url'].'/index.php?module=AsteriskIntegration&action=configuration';
