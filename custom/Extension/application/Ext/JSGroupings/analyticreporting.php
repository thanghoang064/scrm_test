<?php

//Loop through the groupings to find grouping file you want to append to
foreach ($js_groupings as $key => $groupings)
{
    foreach ($groupings as $file => $target)
    {
        //if the target grouping is found
        if ($target == 'include/javascript/sugar_sidecar.min.js')
        {
            //append the custom JavaScript file
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/ractive/Ractive.min.js'] = 'include/javascript/sugar_sidecar.min.js';

            // Should use already minified version of D3, because SugarCRM minification will cause errors
            // $js_groupings[$key]['custom/include/javascript/analyticreporting/d3/d3.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['custom/include/javascript/analyticreporting/d3/d3.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['custom/include/javascript/analyticreporting/d3/nv.d3.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['custom/include/javascript/analyticreporting/d3/d3-context-menu.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['custom/include/javascript/analyticreporting/d3/d3-funnel.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['custom/include/javascript/analyticreporting/d3/d3-gauge.js'] = 'include/javascript/sugar_sidecar.min.js';

            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/jsts/javascript.util.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/jsts/jsts.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/leaflet.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/leaflet-providers.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/leaflet-dvf.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/countryData.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/states/statesData.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/states/usa.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/states/india.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/states/canada.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/states/brazil.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/states/china.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/cities/usa.cities.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/cities/ca.cities.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/leaflet/data/cities/cities.min.js'] = 'include/javascript/sugar_sidecar.min.js';
            
            $js_groupings[$key]['custom/include/javascript/analyticreporting/reportUtils.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/chartUtils.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/BaseChartComponent.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/ChartView.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/barChart.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/horizontalBarChart.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/combinedChart.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/funnelChart.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/gaugeChart.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/lineChart.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/mapChart.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/pieChart.js'] = 'include/javascript/sugar_sidecar.min.js';
            $js_groupings[$key]['modules/AnalyticReporting/assets/js/shared/charts/areaChart.js'] = 'include/javascript/sugar_sidecar.min.js';
        }

        break;
    }
}