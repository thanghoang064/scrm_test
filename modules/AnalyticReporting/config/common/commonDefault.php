<?php
/**
 * CSRF validation is mandatory starting from 7.8.0.0
 *
 * It can be configured in config_override.php with
 * $sugar_config['csrf']['soft_fail_form'] = true/false
 */
use Sugarcrm\Sugarcrm\Security\Csrf\CsrfAuthenticator;

$csrfString = "placeholder=1";
if(class_exists('Sugarcrm\Sugarcrm\Security\Csrf\CsrfAuthenticator')){
    // Get CSRF authentication field name and token, then append to all URL's
    $csrf = CsrfAuthenticator::getInstance();
    $csrfString = "".$csrf::FORM_TOKEN_FIELD."=".$csrf->getFormToken()."";
}

$moduleName = PlatformConnector::$moduleName;
$rootUrl = PlatformConnector::getUrl();

return  array(
    'moduleName' => $moduleName,
    'rootUrl' => $rootUrl,
    'url' => array(
        'base' => "index.php?module={$moduleName}&{$csrfString}",
        'index' => "{$rootUrl}?module={$moduleName}&action=listview&{$csrfString}",
        'reportBuilder' => "{$rootUrl}?module={$moduleName}&action=reportBuilder&parenttab=simple&{$csrfString}",
        'settings' => "{$rootUrl}?module={$moduleName}&action=settings&{$csrfString}",
        'combine' => "{$rootUrl}?module={$moduleName}&action=combine&{$csrfString}",
        'withoutAction' => "index.php?module={$moduleName}&{$csrfString}&action=",

        'delete' => "index.php?module={$moduleName}&action=Delete&{$csrfString}&record=",
        'deleteDashboard' => "index.php?module={$moduleName}&action=deleteDasboard&{$csrfString}&record=",
        'toggleReport' => "index.php?module={$moduleName}&action=Toggle&key=report&{$csrfString}&record=",
        'toggleCategory' => "index.php?module={$moduleName}&action=Toggle&key=category&{$csrfString}&record=",
        'toggleDashboard' => "index.php?module={$moduleName}&action=Toggle&key=report&{$csrfString}&record=",
        'report' => "index.php?module={$moduleName}&action=report&{$csrfString}&record=",
        'reportFull' => "{$rootUrl}?module={$moduleName}&action=report&{$csrfString}&record=",
        'list' => "index.php?module={$moduleName}&action=index&{$csrfString}",
        'dashboard' => "index.php?module={$moduleName}&action=dashboard&{$csrfString}&record=",
        'saveCategoryUrl' => "index.php?module={$moduleName}&action=saveCategory&to_pdf=1&{$csrfString}",
        'massScheduleUrl' => "index.php?module={$moduleName}&action=massSchedule&to_pdf=1&{$csrfString}",
        'exportReportsUrl' => "index.php?module={$moduleName}&action=exportReports&{$csrfString}",
        'importReportsUrl' => "index.php?module={$moduleName}&action=importReports&{$csrfString}",
        'toggleVisible' => "index.php?module={$moduleName}&action=index&{$csrfString}#toggleVisible",
        'checkFontsAjax' => "index.php?module={$moduleName}&to_pdf=1&{$csrfString}",
        'downloadFontCheckUrl' => "index.php?module={$moduleName}&to_pdf=1&action=downloadFontCheck&{$csrfString}",
        'downloadFontUrl' => "index.php?module={$moduleName}&to_pdf=1&action=downloadFont&{$csrfString}",
        'runSchedulerDebug' => "index.php?module={$moduleName}&action=run_scheduler&{$csrfString}",
        'forceSendReport' => "index.php?module={$moduleName}&action=force_send_report&{$csrfString}",

        'userDetailView' => "{$rootUrl}?module=Users&action=DetailView&{$csrfString}&record=",
    ),
    'dateMySqlFormat' => array(
        "microsecond" => "MICROSECOND",
        "second" => "SECOND",
        "minute" => "MINUTE",
        "hour" => "HOUR",
        "day" => "DAY",
        "week" => "WEEK",
        "month" => "MONTH",
        "quarter" => "QUARTER",
        "year" => "YEAR"
    ),
    'customSqlBlacklist' => array(
        'select', 'insert', 'update', 'delete', 'file', 'create', 'alter', 'index', 'drop', 'temporary', 'show', 'view', 'routine', 'execute', 'trigger', 'grant', 'super', 'process', 'reload', 'shutdown', 'databases', 'lock', 'tables', 'references', 'replication', '--', 'join'
    )

);
