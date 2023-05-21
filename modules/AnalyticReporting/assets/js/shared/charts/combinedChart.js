/**
 * Combined Chart component
 */
CombinedChartComponent = BaseChartComponent.extend({
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

        var margin = {top: 50, right: 50, bottom: 120, left: 70};
        // #4062 [start] - Override chart margin
        if(!isWidget && that.get("margin")) {
            margin = that.get("margin");
        }
        // #4062 [end]

        var d3 = this.get("d3");
        var nv = this.get("nv");

        // Check for stacked bars
        var bars1Stacked = that.get('bars1Stacked');
        var bars2Stacked = that.get('bars2Stacked');

        //Regular pie chart example
        nv.addGraph(function() {
            var chart = nv.models.multiChart()
                .options({reduceXTicks:false}) // .reduceXTicks(false)
                .margin(margin)
                .color(d3.scale.category10().range())
                .bars1stacked(bars1Stacked)
                .bars2stacked(bars2Stacked)
            ;

            // #5819 - Show xAxis keys as labels, not indexes
            chart.tooltip.headerFormatter(function (d) {
                // If there is such element, return it
                if(typeof that.axisKeys[d] !== "undefined"){
                    return that.axisKeys[d];
                }

                return "";
            });

            chart.xAxis     // Chart x-axis settings
            //.axisLabel(xAxisLabel)
                .tickFormat(function(d){
                    // If there is such element, return it
                    if(typeof that.axisKeys[d] !== "undefined"){
                        return that.axisKeys[d];
                    }

                    return "";
                });

            chart.xAxis.rotateLabels(-30);

            // #5424 - Remove decimal seperators if big values
            if(that.bigValues) {
                // add thousand separators
                chart.yAxis1.tickFormat(function(value){
                    var numberFormat = chartView.get("numberFormat");
                    return numberFormat(null, null, value)
                }); // #5879 format numbers according to user preferences
                chart.yAxis2.tickFormat(function(value){
                    var numberFormat = chartView.get("numberFormat");
                    return numberFormat(null, null, value)
                });
            }

            // Get normalised data for chart
            var seriesData = that.normalise(data);

            // Get max values for each axis
            var minY1 = 0;
            var minY2 = 0;
            var maxY1 = 0;
            var maxY2 = 0;
            for(var i = 0; i < seriesData.length; i++) {
                var _axis = seriesData[i].yAxis;
                var _values = seriesData[i].values;

                // Walk values and set largest to variables
                for(var j = 0; j < _values.length; j++) {
                    // For maxY1
                    if(_axis == 1) {
                        if(_values[j].y > maxY1) {
                            maxY1 = _values[j].y;
                        }
                    }
                    // For maxY2
                    if(_axis == 2) {
                        if(_values[j].y > maxY2) {
                            maxY2 = _values[j].y;
                        }
                    }
                }
            }

            // Set min, max values of axis
            chart.yDomain1([minY1, maxY1]);
            chart.yDomain2([minY2, maxY2]);

            // Align lines with bars
            // chart.lines1.padData(true);
            // chart.lines2.padData(true);

            // Set chart
            d3.select(svg)
                .datum(seriesData)
                .call(chart)
            ;


            // #3892 [start] - Normal views, have added title
            if(!isWidget) {
                d3.select(svg)//.select(".nv-wrap g")
                    .append("text")
                    .attr("x", 100)
                    .attr("y", 10)
                    .style({
                        "text-anchor": "left",
                        "font-weight": "bold",
                    })
                    .text(title);
            }
            // #3892 [end]

            // Auto resize chart on window resize
            nv.utils.windowResize(chart.update);

            // #5819 - Tooltip with drilldown data
            if(that.get("drilldownEnabled")) {
                chart.bars1.dispatch.on("elementClick", d3.contextMenu(getContextMenuElements(that.get("reportData")), function(){that.colorPickerCallback(that)}));
                chart.bars2.dispatch.on("elementClick", d3.contextMenu(getContextMenuElements(that.get("reportData")), function(){that.colorPickerCallback(that)}));
                chart.lines1.dispatch.on("elementClick", d3.contextMenu(getContextMenuElements(that.get("reportData")), function(){that.colorPickerCallback(that)}));
                chart.lines2.dispatch.on("elementClick", d3.contextMenu(getContextMenuElements(that.get("reportData")), function(){that.colorPickerCallback(that)}));
            }

            that.chart = chart; // #4351

            return chart;
        });
    },

    // #6627 If the field has a custom color set add it to the data item
    updateData: function(){
        var that = this;

        var data = that.get('data');
        var svg = that.get('svg');

        that.set("chartColors", ReportData.chartColors);

        var seriesData = that.normalise(data);

        // Set chart
        d3.select(svg)
            .datum(seriesData)
            .call(that.chart)
        ;
    },

    // Normalise data for rendering
    normalise: function(data) {
        var legend 		= this.get("legend");
        var xAxis 		= this.get("xAxis");
        var yAxis 		= this.get("yAxis");
        var yAxis2 		= this.get("yAxis2");

        var aggregates 	= this.get("aggregates");

        var yAxisType 	= this.get("yAxisType");
        var yAxis2Type 	= this.get("yAxis2Type");
        var chartColors = this.get("chartColors");

        xAxis = reportUtils.appendDateGrouping(data,xAxis);

        // Get all legend and axis keys
        var legendKeys 	= [];
        var axisKeys 	= [];

        // Get legend keys
        for(var j = 0; j < legend.length; j++) {
            legendKeys.push(legend[j]);
        }

        // Get axis keys
        for(var i = 0; i < data.data.length; i++) {
            if(!data.data[i][xAxis]) {
                data.data[i][xAxis] = "-";
            }

            axisKeys.push(data.data[i][xAxis]);
        }

        // Unique legendKeys and axis keys
        legendKeys 		= reportUtils.unique(legendKeys); // #3842
        axisKeys 		= reportUtils.unique(axisKeys); // #3842
        // Add to object scope, so nvd3 tickFormat could use it
        this.axisKeys 	= axisKeys;

        // #3850 [start] - Convert single string items into array with single element
        if(typeof yAxis == 'string') {
            yAxis = [yAxis];
            // Update with array'ed data
            this.set("yAxis", yAxis);
        }
        if(typeof yAxis2 == 'string') {
            yAxis2 = [yAxis2];
            // Update with array'ed data
            this.set("yAxis2", yAxis2);
        }
        // #3850 [end]

        // #3932 [start] - if not set axis type, but is set axis, force to line
        if(!yAxisType && (yAxis.length > 0) ) {
            yAxisType = "line";
            this.set("yAxisType", yAxisType);
        }
        if(!yAxis2Type && (yAxis2.length > 0) ) {
            yAxis2Type = "line";
            this.set("yAxis2Type", yAxis2Type);
        }
        // #3932 [end]

        var axisAggregates = [];
        axisAggregates.push({keys: yAxis, type: yAxisType, position: 1});
        axisAggregates.push({keys: yAxis2, type: yAxis2Type, position: 2});

        var series = [];
        var l = 0; // Series counter
        for(var i = 0; i < axisAggregates.length; i++) {
            // Bar, line, etc
            var _axisType 		= axisAggregates[i].type;
            var _axisPosition 	= axisAggregates[i].position;

            // Each selected key
            for(var j = 0; j < axisAggregates[i].keys.length; j++) {
                var _axisKey = axisAggregates[i].keys[j];

                // Create series record
                series[l] = {key: _axisKey, type: _axisType, yAxis: _axisPosition, values: []};

                // Fill with axis keys
                for(var k = 0; k < axisKeys.length; k++) {
                    series[l].values[k] = {x:k, y: 0}
                }

                // Update series counter
                l++;
            }
        }


        // Fill series with data
        for(var i = 0; i < data.data.length; i++) {
            // Get index of axisKey position in data
            var axisKey = axisKeys.indexOf(data.data[i][xAxis]);

            // For each legend item
            for(var j = 0; j < legend.length; j++) {
                // For each series item
                for(var k = 0; k < series.length; k++) {

                    // If series key is the same as legend key, assign data value
                    if(series[k].key == legend[j]) {
                        // #3936 [start] - Set only valid y values (can not be null or undefined)
                        var value = parseFloat(data.data[i][legend[j]]);
                        if(!value) {
                            value = 0;
                        }

                        //if(value > 100) { // #5878 completely disable decimal points from charts
                        this.bigValues = true;
                        //}

                        series[k].values[axisKey].y = value;
                        // #3936 [end]
                        // #5819 - Parse meta data for drilldown
                        series[k].values[axisKey].meta = this.parseMetaDrilldown([{
                            fieldName: legend[j],
                            value: this.parseMetaValue(data.data[i], legend[j]),
                            type: 'legend',
                        }, {
                            fieldName: xAxis,
                            value: this.parseMetaValue(data.data[i], xAxis),
                            type: 'xAxis',
                        }]);
                    }
                }

            }
        }

        // Rename series keys to understandable names
        for(var i = 0; i < series.length; i++) {
            series[i].key = data.cols[series[i].key];
            // #6627 If the field has a custom color set add it to the data item
            if(chartColors && (chartColors[series[i].key] || chartColors[series[i].key+' (right axis)'])){
                series[i].color = chartColors[series[i].key] || chartColors[series[i].key+' (right axis)'];
            }
        }

        // console.log("Series: ", series);
        return series;
    },

    data: {
        data: [],
        title: '',
        xAxis: '',
        yAxis: [],
        yAxis2: [],
        yAxisType: '',
        yAxis2Type: '',
        bars1Stacked: false,
        bars2Stacked: false,
        legend: [],
    }
});