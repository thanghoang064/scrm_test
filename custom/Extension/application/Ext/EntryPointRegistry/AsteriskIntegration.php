<?php

$entry_point_registry['AsteriskIntegrationController'] = array(
    'file' => 'modules/AsteriskIntegration/EntryPoints/Controller.php',
    'auth' => false,
);

$entry_point_registry['AsteriskIntegrationConfiguration'] = array(
    'file' => 'modules/AsteriskIntegration/EntryPoints/Configuration.php',
    'auth' => false,
);

$entry_point_registry['AsteriskIntegrationUserDetails'] = array(
    'file' => 'modules/AsteriskIntegration/EntryPoints/UserDetails.php',
    'auth' => true,
);
