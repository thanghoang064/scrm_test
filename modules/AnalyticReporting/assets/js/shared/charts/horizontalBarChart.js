/**
 * Multi (stacked/grouped) Bar Chart component
 */
HorizontalBarChartComponent = BaseChartComponent.extend({ // #4351
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
        var stacked = that.get('stacked');

        var margin = {top: 50, right: 150, bottom: 120, left: 70};

        // #4062 [start] - Override chart margin
        if(!isWidget && that.get("margin")) {
            margin = that.get("margin");
        }
        // #4062 [end]

        var d3 = this.get("d3");
        var nv = this.get("nv");

        nv.addGraph(function() {
            var chart = nv.models.multiBarHorizontalChart()
                //.reduceXTicks(false) //.options({reduceXTicks:false})
                //.transitionDuration(350)
                    .margin(margin)
                    .stacked(stacked)
                    .color(d3.scale.category10().range())
            ;

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

            var seriesData = that.normalise(data);

            // #5424 - Remove decimal seperators if big values
            if(that.bigValues) {
                chart.yAxis.tickFormat(function(value){
                    var numberFormat = chartView.get("numberFormat");
                    return numberFormat(null, null, value)
                }) // #5879 format numbers according to user preferences); // #5878 add thousand separators by default
            }

            // #3892 [start] - Normal views, have added title and need to align it
            if(!isWidget) {
                chart.legend.margin({top: 20, bottom: 20});
            }
            // #3892 [end]

            // Set chart
            d3.select(svg)
                .datum(seriesData)
                .call(chart)
            ;

            // On state change (stacked, grouped) update main variable
            chart.dispatch.on('stateChange', function(e) {
                ReportData.chartStacked = e.stacked;
            });

            // #3892 [start] - Normal views, have added title
            if(!isWidget) {
                d3.select(svg)//select(".nv-wrap g")
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
                chart.multibar.dispatch.on("elementClick", d3.contextMenu(getContextMenuElements(that.get("reportData")), function(){that.colorPickerCallback(that)}));
            }

            that.chart = chart; // #4351

            return chart;
        });
    },

    // #6627 Update chart data after changing colors
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
        var legend      = this.get("legend");
        var xAxis       = this.get("xAxis");
        var yAxis       = this.get("yAxis");
        xAxis = reportUtils.appendDateGrouping(data,xAxis);
        var aggregates  = this.get("aggregates");

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
            // Parse data and format as if groups
            return this.parseGroups(data, xAxis, yAxis, legend);
        }
    },

    data: {
        data: [],
        title: '',
        xAxis: '',
        yAxis: '',
        legend: '',
        svg:''
    }
});