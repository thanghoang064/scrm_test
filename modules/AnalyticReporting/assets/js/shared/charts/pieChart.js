/**
 * Pie Chart component
 */
var PieChartComponent = BaseChartComponent.extend({ // #4351
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
        var showPercents = that.get('showPercents'); // #4545
        var reportOptions = this.get("options");

        var margin = {top: 10, right: 10, bottom: 10, left: 10};

        // #4062 [start] - Override chart margin
        if(!isWidget && that.get("margin")) {
            margin = that.get("margin");
        }
        // #4062 [end]

        var d3 = this.get("d3");
        var nv = this.get("nv");

        // Regular pie chart
        nv.addGraph(function() {
            var chart = nv.models.pieChart()
                .x(function(d) { return d.label })
                .y(function(d) { return d.value })
                .margin(margin)
                .showLabels(true)
                .color(d3.scale.category10().range())
            ;

            // Show percents
            // chart.pie.pieLabelsOutside(true).labelType("percent");
            // Key
            //chart.pie.pieLabelsOutside(true).labelType("key");
            // Value
            chart.pie.labelsOutside(true).labelType("value").showPercents(showPercents); // #4545 - Added method showPercents
            chart.pie.valueFormat(function(value){
                var numberFormat = chartView.get("numberFormat");
                return numberFormat(null, null, value)
            }); // #5878 completely disable decimal points from charts
            // #3892 [start] - Normal views, have added title and need to align it
            if(!isWidget) {
                chart.legend.margin({top: 20, bottom: 20});
            }
            // #3892 [end]

            // Set chart
            d3.select(svg)
            //.datum(data)
                .datum(that.normalise(data))
                .transition()
                .duration(350)
                .call(chart)
            ;

            // #3892 [start] - Normal views, have added title
            if(!isWidget) {
                d3.select(svg)
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
            if(that.get("drilldownEnabled")) {
                chart.pie.dispatch.on("elementClick", d3.contextMenu(getContextMenuElements(that.get("reportData")), function(){that.colorPickerCallback(that)}));
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

        d3.select(svg)
        //.datum(data)
            .datum(that.normalise(data))
            .transition()
            .duration(350)
            .call(that.chart)
        ;
    },

    // Normalize data got from server
    normalise: function(data) {
        var that = this;
        // Get selected values for x and y axis
        var xAxis = this.get('xAxis');
        var yAxis = this.get('yAxis');
        xAxis = reportUtils.appendDateGrouping(data,xAxis);
        // Temporary object for normalised key/values
        var newData = [];
        // Final normalised object
        var normalised = [];

        // Walk throught response data and
        // create normalised data
        _.each(data.data, function(val) {
            // #5762 - If nothing filled in x and y axis - skip this item
            if(!val[xAxis] && !val[yAxis]) {
                return; // Same as continue
            }

            var item = {
                label: val[xAxis],
                value: parseFloat(val[yAxis]),
                // #5819 - Parse meta data for drilldown
                meta: that.parseMetaDrilldown([{
                    fieldName: xAxis,
                    value: that.parseMetaValue(val, xAxis),
                    type: 'legend',
                }])
            };

            // #6627 If the field has a custom color set add it to the data item
            var chartColors = that.get("chartColors");
            if(chartColors && chartColors[val[xAxis]]){
                item.color = chartColors[val[xAxis]];
            }
            newData.push(item);
        });

        // Format final result object
        var normalised = newData;

        return normalised;
    },
    data: {
        data: [],
        title: '',
        xAxis: '',
        yAxis: '',
        chartColors:{},
        showPercents: false,
    }
});