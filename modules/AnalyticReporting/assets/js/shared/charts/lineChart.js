/**
 * Simple Line Chart component
 */
var LineChartComponent = BaseChartComponent.extend({
    // Swith template for Sugar Sidecar or "normal" report chart template
    template: function(data) {
        // For widgets
        if(data.isWidget) {
            return '<svg></svg>'
        }

        // For report
        return '#chartViewTemplate'
    },

    // Axis keys
    axisKeys:[],
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
        var xAxisLabel = this.get("xAxis");
        var isWidget = that.get('isWidget'); // #3892
        var availableGroups = this.get("getAvailableGroups");
        var reportOptions = this.get("options");

        var margin = {top: 50, right: 50, bottom: 120, left: 100};

        // #4062 [start] - Override chart margin
        if(!isWidget && that.get("margin")) {
            margin = that.get("margin");
        }
        // #4062 [end]

        var d3 = this.get("d3");
        var nv = this.get("nv");

        // #5762 - Try to get real xAxis (date grouping)
        for(var i = 0; i < availableGroups.length; i++) {
            if(availableGroups[i].dateGrouping) {
                var foundAxisLabel = xAxisLabel + "_" + availableGroups[i].dateGrouping;

                if(foundAxisLabel == availableGroups[i].name) {
                    xAxisLabel = foundAxisLabel;
                    break;
                }
            }
        }

        //Regular pie chart example
        nv.addGraph(function() {
            //var chart = nv.models.lineChart()
            var chart = nv.models.lineChart()
                .options({reduceXTicks:false}) // .reduceXTicks(false)
                .margin(margin)
                // .useVoronoi(false)
                .useInteractiveGuideline(false)  //We want nice looking tooltips and a guideline! // #5819 - Will not work tooltip data
                // .transitionDuration(350)  //how fast do you want the lines to transition?
                .showLegend(true)       //Show the legend, allowing users to turn on/off line series.
                // .interpolate("basis")
                // .interpolate("cardinal")
                .color(d3.scale.category10().range())
            ;

            // Get axis label
            xAxisLabel = jQuery.grep(availableGroups, function(item){
                return item.name == xAxisLabel;
            });
            if(reportOptions.isCombined && that.get("xAxis")=="date_field"){
                xAxisLabel = "Date";
            }else{
                xAxisLabel = '';
                if(xAxisLabel[0]) {
                    xAxisLabel = xAxisLabel[0].title;
                }
            }


            chart.xAxis     //Chart x-axis settings
                .axisLabel(xAxisLabel)
                .tickFormat(function(d){
                    // If there is such element, return it
                    if(typeof that.axisKeys[d] !== "undefined"){
                        return that.axisKeys[d];
                    }

                    return "";
                });

            chart.xAxis.rotateLabels(-30);

            var seriesData = that.normalise(data);

            // #5424 - Remove decimal seperators if big values
            if(that.bigValues) {
                chart.yAxis.tickFormat(function(value){
                    var numberFormat = chartView.get("numberFormat");
                    return numberFormat(null, null, value)
                });
            }

            // #3892 [start] - Normal views, have added title and need to align it
            if(!isWidget) {
                chart.legend.margin({top: 20, bottom: 30});
            }
            // #3892 [end]

            // Set min value for y-axis, could be [minValue, maxValue]
            chart.forceY(0);

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
            that.chartUpdate();

            // #5819 - Tooltip with drilldown data
            if(that.get("drilldownEnabled")){
                chart.lines.dispatch.on("elementClick", d3.contextMenu(getContextMenuElements(that.get("reportData")), function(){that.colorPickerCallback(that)}));
            }

            that.chart = chart; // #4351

            return chart;
        });
    },

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
        var aggregates 	= this.get("aggregates");

        xAxis = reportUtils.appendDateGrouping(data,xAxis);

        // Check if in legend is aggregates
        var legendHaveAggregates = false;
        for(var i = 0; i < legend.length; i++) {
            var found = reportUtils.getAggregate(legend[i], aggregates)
            // Found aggregate in legend
            if(found) {
                legendHaveAggregates = true;
                break;
            }
        }

        // If found aggregates, then parse as aggregates, else - as groups
        if(legendHaveAggregates) {
            // Parse data and format as if aggregates
            return this.parseAggregates(data, xAxis, yAxis, legend);
        } else {
            legend = reportUtils.appendDateGrouping(data,legend);
            // Parse data and format as if groups
            return this.parseGroups(data, xAxis, yAxis, legend);
        }
    },

    data: {
        data: [],
        title: '',
        xAxis: '',
        yAxis: '',
    }
});