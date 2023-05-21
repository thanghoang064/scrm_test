<?php

$asterisk_integration_admin_option_defs = array();

$asterisk_integration_admin_option_defs['Administration']['AsteriskIntegrationConfiguration'] = array(
    "asterisk_integration_configuration_24",
    "LBL_ASTERISK_INTEGRATION_CONFIGURATION_TITLE",
    "LBL_ASTERISK_INTEGRATION_CONFIGURATION_DESCRIPTION",
    "index.php?module=AsteriskIntegration&action=configuration",
);

$asterisk_integration_admin_option_defs['Administration']['AsteriskIntegrationLicense'] = array(
    "asterisk_integration_license_24",
    "LBL_ASTERISK_INTEGRATION_LICENSE_TITLE",
    "LBL_ASTERISK_INTEGRATION_LICENSE_DESCRIPTION",
    "index.php?module=AsteriskIntegration&action=license",
);

$admin_group_header[] = array(
    'LBL_ASTERISK_INTEGRATION_TITLE',
    '',
    false,
    $asterisk_integration_admin_option_defs,
    'LBL_ASTERISK_INTEGRATION_DESCRIPTION',
);
