{literal}
<script>
    var __APP_INITIAL_STATE = {/literal}{$__APP_INITIAL_STATE}{literal};
</script>

    <style>
        /* Override Sugar nv-chart definition */
        .nv-chart{
            height:auto !important;
            width:auto !important;
            min-width:50px !important;
            min-height:5px !important;
        }

        /* TODO Remove .leaflet-container fix, don't know why it is needed*/
        /* Fixing leaflet */
        .leaflet-container {
            height: auto;
            min-height:100px;
            width: auto;
            margin: 0 auto;
        }
        /* Fixing leaflet-dvf svg, because of sugar nv.d3.css file */
        .leaflet-container svg {
            width: auto;
            height:auto;
            max-height:none;
        }
    </style>
{/literal}

<!-- React goes here -->
<div id="root">Loading dashboard...</div>

<script src="modules/{$moduleName}/assets/js/dashboardApp.min.js"></script>