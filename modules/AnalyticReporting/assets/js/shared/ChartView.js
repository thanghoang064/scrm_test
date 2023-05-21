/**
 * Chart component selector
 */
var ChartView = Ractive.extend({
    isolated:false,
    template: '<chartComponent data="{{data}}" title="{{title}}" isWidget="{{isWidget}}" xAxis="{{xAxis}}" yAxis="{{yAxis}}" yAxis2="{{yAxis2}}" yAxisType="{{yAxisType}}" yAxis2Type="{{yAxis2Type}}" legend="{{legend}}" bars1Stacked="{{bars1Stacked}}" bars2Stacked="{{bars2Stacked}}" aggregates="{{aggregates}}" groups="{{groups}}" cumulated="{{cumulated}}" sortableValues="{{sortableValues}}" showPercents="{{showPercents}}" showLabels="{{showLabels}}" showZoneLabels="{{showZoneLabels}}" valueZones="{{valueZones}}" xAxisSegment="{{xAxisSegment}}" svg="{{svg}}" decimalDigits={{decimalDigits}} type="{{type}}" mapType="{{mapType}}" country="{{country}}" state="{{state}}" zoom="{{zoom}}" lat="{{lat}}" lng="{{lng}}" labels="{{labels}}" getAvailableGroups="{{getAvailableGroups}}" marker="{{marker}}" markerAxisX="{{markerAxisX}}" markerAxisY="{{markerAxisY}}" drilldownEnabled="{{drilldownEnabled}}" swapAxis="{{swapAxis}}" chartColors="{{chartColors}}" d3="{{d3}}" nv="{{nv}}"/>',
    computed: {
        // Check if drilldown is enabled
        drilldownEnabled: function() {
            // Don't allow drilldown for combined reports
            var options = this.get("options");
            if(options.isCombined) {
                return false;
            }

            // Check if user have editing access
            var isEditable = this.get("canEdit") || this.get("canDelete");
            // Is user can edit or is allowed drilldown for read only users
            if(isEditable || options.allowDrilldownReadOnly ) {
                return true;
            }

            return false;
        },
    },
    data: {
        // Hack to provide bundled version of D3 and NVD3
        d3: (typeof ard3 != 'undefined') ? ard3 : d3,
        nv: (typeof arnv != 'undefined') ? arnv : nv,
        // Update chart component title, without
        // re-rendering chart
        title:"",
        type: false, // #5890
        xAxisSegment:false, // #4541
        valueZones:[], // #4541
        showPercents:false, // #4545
        showLabels:true, // #5169
        showZoneLabels:true, // #5169
        cumulated:true,
        sortableValues: [],
        isWidget:false,
        aggregates:[],
        groups:[],
        xAxis:[],
        yAxis:[],
        yAxis2:[],
        legend:[],
        yAxisType:[],
        yAxis2Type:[],
        svg:"",
        numberFormat:{},
        decimalDigits:0,
        mapType: false, // #5890
        country: false, // #5890
        state: false,
        zoom: 2, // #5890
        lat: 51.505, // #5890
        lng: -0.09, // #5890
        labels: {}, // #5890
        fieldsByName: {},
        options: {},
        chartOptions: {},
        combinedSelectedFields:[],
        availableFields: [],
        columns : [],
        calcFields: [],
        getAvailableGroups: [], // TODO: Merge with groups
        filters: [],
        margin:{},
        stacked:false,
        reportData: {},
        marker:false,
        markerAxisX:false,
        markerAxisY:false,
        canEdit: false, // Users can edit report
        canDelete:false, // Users can edit and delete report
        swapAxis:false,
        chartColors: {},
    }
});
