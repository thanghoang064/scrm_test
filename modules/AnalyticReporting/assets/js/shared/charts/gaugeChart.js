/**
 * Gauge Chart component
 */
var GaugeChartComponent = BaseChartComponent.extend({ // #4351
    // Swith template for Sugar Sidecar or "normal" report chart template
    template: function(data) {
        // For widgets
        if(data.isWidget) {
            return '<svg></svg>'
        }

        // For report
        return '#chartViewTemplate'
    },
    /**
     * Fired when the instance is ready to be rendered
     *
     * Use oninit() for code that should run only once or needs to be run regardless of whether the ractive instance is rendered into the DOM.
     */
    oninit: function() {
        // Initialize parent (BaseChartComponent)
        this.parentInit();
    },

    /**
     * Fired each time the instance is rendered
     *
     * Use onrender() for code that needs access to the rendered DOM, but is safe being called more than once if you unrender and rerender your ractive instance.
     */
    onrender:function() {
        var that = this;
        var data = that.get('data');
        var title = that.get('title');
        var svg = that.get('svg');
        var isWidget = that.get('isWidget'); // #3892
        var valueZones = that.get('valueZones');
        var showLabels = that.get('showLabels'); // #5169
        var showZoneLabels = that.get('showZoneLabels'); // #5169

        var margin = {top: 10, right: 10, bottom: 10, left: 10};

        // #4062 [start] - Override chart margin
        if(!isWidget && that.get("margin")) {
            margin = that.get("margin");
        }
        // #4062 [end]

        var d3 = this.get("d3");

        // d3-gauge chart options
        var options = {
            min:that.getValueZonesMin(),
            max:that.getValueZonesMax(),
            transitionDuration:900,
            label: '',
            minorTicks:5,
            majorTicks:10,
            needleWidthRatio:0.6,
            needleContainerRadiusRatio:0.7,
            clazz:'small',
            zones: valueZones,
            showLabels: showLabels, // #5169
            showZoneLabels: showZoneLabels // #5169
        };

        // Normal views have margins
        if(!isWidget) {
            options.margin = {
                left: 100,
                right: 0,
                top: 30,
                bottom: 0
            }
        }


        function drawChart() {
            // Chart size
            var svgHeight = jQuery(that.get("svg")).height();
            if(options.margin) {
                svgHeight = svgHeight - options.margin.top - options.margin.bottom;
            }
            options.size = svgHeight;

            // Remove all existing elements
            jQuery(svg).empty();

            var chart = new D3Gauge(svg, options);

            // Update function will be triggered on viewport changes, etc
            chart.update = function() {
                // TODO: Update not re-initialize chart
                drawChart();
            }

            chart.write(that.normalise(data));

            // Normal views have title set
            if(!isWidget) {
                // Add title if set
                d3.select(svg)
                    .attr("class", "nvd3-svg") // #5819 - Added class name for new nvd3 css
                    .append("text")
                    .attr("x", 100)
                    .attr("y", 10)
                    .style({
                        "text-anchor": "left",
                        "font-weight": "bold",
                    })
                    .text(title);
            }

            // FIX - on resize window will rerender chart tousand times
            // Auto resize chart on window resize
            // nv.utils.windowResize(chart.update);

            that.chart = chart;

            return chart;
        }

        // Draw chart on init
        drawChart();
        that.chartUpdate();
    },
    // Get minumum of value zones
    getValueZonesMin: function() {
        var valueZones = this.get("valueZones");
        var value = 0;

        for(var i = 0; i < valueZones.length; i++) {
            // Get minimum of valueZones value
            if(valueZones[i].from < value) {
                value = parseFloat(valueZones[i].from);
            }
        }

        return value;
    },
    // Get maximum of value zones
    getValueZonesMax: function() {
        var data = this.get("data");
        var valueZones = this.get("valueZones");
        var value = 0;

        for(var i = 0; i < valueZones.length; i++) {
            // Get minimum of valueZones value
            if(valueZones[i].to > value) {
                value = parseFloat(valueZones[i].to);
            }
        }

        // If data value is larger than zone value
        // use data value instead of max zone value
        var dataValue = this.normalise(data);
        if(dataValue > value) {
            return dataValue;
        }

        return value;
    },
    // Normalize data got from server
    normalise: function(data) {
        // Get selected values for x and y axis
        var xAxis = this.get('xAxis');
        var xAxisSegment = this.get('xAxisSegment');
        var yAxis = this.get('yAxis');

        xAxis = reportUtils.appendDateGrouping(data,xAxis);
        // Final normalised object
        var normalised = 0;

        // Walk throught response data and
        // create normalised data
        _.each(data.data, function(val) {
            // Collecting grand totals
            if(!xAxisSegment) {
                var _normalisedVal = parseFloat(val[yAxis]);
                if(_normalisedVal) {
                    normalised += _normalisedVal;
                }
            } else {
                // Collecting group segment totals
                if(val[xAxis] && val[xAxis] == xAxisSegment) {
                    var _normalisedVal = parseFloat(val[yAxis]);
                    if(_normalisedVal) {
                        normalised += _normalisedVal;
                    }
                }
            }
        });

        if(!normalised) {
            normalised = 0;
        }

        return normalised;
    },
    data: {
        data: [],
        title: '',
        xAxis: '',
        yAxis: '',
        showPercents: false,
        valueZones:[],
        xAxisSegment:false,
        showLabels:false, // #5169
        showZoneLabels:false, // #5169
    }
});