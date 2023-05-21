<?php

$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_leads"] = array(
    'name' => 'asteriskintegration_leads',
    'type' => 'link',
    'relationship' => 'asteriskintegration_leads',
    'source' => 'non-db',
    'module' => 'Leads',
    'bean_name' => 'Lead',
    'vname' => 'LBL_ASTERISKINTEGRATION_LEADS_FROM_LEADS_TITLE',
    'id_name' => 'asteriskintegration_leadsleads_ida',
);
$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_leads_name"] = array(
    'name' => 'asteriskintegration_leads_name',
    'type' => 'relate',
    'source' => 'non-db',
    'vname' => 'LBL_ASTERISKINTEGRATION_LEADS_FROM_LEADS_TITLE',
    'save' => true,
    'id_name' => 'asteriskintegration_leadsleads_ida',
    'link' => 'asteriskintegration_leads',
    'table' => 'leads',
    'module' => 'Leads',
    'rname' => 'name',
    'db_concat_fields' =>
    array(
        0 => 'first_name',
        1 => 'last_name',
    ),
);
$dictionary["AsteriskIntegration"]["fields"]["asteriskintegration_leadsleads_ida"] = array(
    'name' => 'asteriskintegration_leadsleads_ida',
    'type' => 'link',
    'relationship' => 'asteriskintegration_leads',
    'source' => 'non-db',
    'reportable' => false,
    'side' => 'right',
    'vname' => 'LBL_ASTERISKINTEGRATION_LEADS_FROM_ASTERISKINTEGRATION_TITLE',
);
