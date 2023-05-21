/**
 * Init chart view after data is loaded into ReportData.chartData
 * Before can call loadData()
 */
function initChartView($el, data, showLinks, aggregates, groups) { // #5762
    groups = groups || data.fieldGroupingSorting;
    aggregates = aggregates || data.selectedAggregates;
    // @TODO: type should be get from ReportData.chartType, but at this moment, Ractive is not updating it on select
    showLinks = showLinks || false;

    var elName = '#chart1';
    var svg = '#chart1 svg';
    if($el) {
        elName = $el;
        svg = '#' + $el.attr("id") + ' svg';
    }

    // Initialize chart view, with data from server response,
    // and selected component
    chartView = new ChartView({
        el: elName,
        data: {
            svg: svg,
            type: data.chartType,
            data: data.chartData,
            title: data.chartTitle,
            showPercents: data.chartShowPercents, // #4545
            showLabels: data.chartShowLabels, // #5169
            showZoneLabels: data.chartShowZoneLabels, // #5169
            valueZones: data.chartValueZones, // #4541
            xAxisSegment: data.chartAxisXSegment, // #4541
            legend: data.chartLegend,
            xAxis: data.chartAxisX,
            yAxis: data.chartAxisY,
            yAxis2: data.chartAxisY2,
            yAxisType: data.chartYAxisType,
            yAxis2Type: data.chartYAxis2Type,
            aggregates: aggregates,
            groups: groups,
            bars1Stacked: data.chartBars1Stacked,
            bars2Stacked: data.chartBars2Stacked,
            showLinks: showLinks,
            isWidget: data.isWidget,
            cumulated: data.chartCumulated, // #4540
            sortableValues: data.chartSortableValues, // #4540
            numberFormat: (new NumberFormatter(jQuery.extend({},{"numdec":data.chartDecimalDigits},data.numberFormat),null)).makeFormatter(), // #5879 use "numdec" to specify number of decimal digits
            decimalDigits: data.chartDecimalDigits,
            mapType: data.mapType, // #5890
            country: data.country, // #5890
            state: data.state, // #6318
            zoom: data.zoom, // #5890
            lat: data.lat, // #5890
            lng: data.lng, // #5890
            labels: data.labels, // #5890
            fieldsByName: data.fieldsByName,
            options: data.options,
            chartOptions: data.chartOptions,
            combinedSelectedFields: data.combinedSelectedFields,
            availableFields: data.availableFields,
            columns: data.selectedFields,
            calcFields: data.calcFields,
            getAvailableGroups: reportUtils.getAvailableGroups(data, groups, data.fieldsByName),
            filters: data.selectedFilters,
            margin: data.chartMargin,
            stacked: data.chartStacked,
            reportData: data,
            marker: data.marker,
            markerAxisX: data.markerAxisX,
            markerAxisY: data.markerAxisY,
            canEdit: data.canEdit,
            canDelete: data.canDelete,
            swapAxis: data.chartSwapAxis,
            chartColors: data.chartColors,
        },
        components: {
            chartComponent: getChartComponent(data.chartType, data.chartLegend, data.chartAxisX, groups),
        }
    });

    return chartView;
}

// #5819 - Get d3-context-menu elements for drilldown
function getContextMenuElements(reportData) {
    var menu = [{
        title: function(d) {
            var url = "#";
            var data = {
                meta: false
            }

            // Set label and current color to be used in color picker. Different charts have different data strucutre
            var colorField ='';
            var color = '';

            if (d.data && d.data.label) {
                colorField = d.data.label;
                color = d.color;
            } else if (d.data && d.data.key) {
                colorField = d.data.key;
                color = d.color;
            } else if (d.series && d.point) {
                colorField = d.series.key;
                color = d.point.color;
            } else if (d.series && d.series.key) {
                colorField = d.series.key;
                color = d.series.color;
            }

            if(d.data) {
                data = d.data;
            } else if (d.points){
                data = d.points;
            } else if (d.point) {
                data = d.point;
            }

            // Area chart store meta data in third element of data array of record
            if(data.meta || data[2]) {
                var meta = data.meta || data[2];
                url = reportData.urlDrilldown + reportData.id  + "&drilldown=" + encodeURI(JSON.stringify(meta));
            }
            return '<a href="'+url+'" target="_blank">Drill-down to detailed data</a><input type="hidden" value="'+colorField+'" id="colorForField"><input type="hidden" value="'+color+'" id="drilldownpopup" />';
        },
        action: function(elm, d, i) {
            //
        }
    }];

    return menu;
}

/**
 * Return chart object by chart type
 */
function getChartObject(type) {
    var object;
    switch(type) {
        case 'area':
            object = ReportAreaChart;
            break;
        // #4541 - Added Gauge chart
        case 'gauge':
            object = ReportGaugeChart;
            break;
        // #4540 [start] - Added funnel chart
        case 'funnel':
            object = ReportFunnelChart;
            break;
        // #4540 [end]
        case 'bar':
            object = ReportBarChart;
            break;
        case 'hbar':
            object = ReportHorizontalBarChart;
            break;
        case 'line':
            object = ReportLineChart;
            break;
        case 'combined':
            object = ReportCombinedChart;
            break;
        case 'map':
            object = ReportMapChart;
            break;
        case 'pie':
        default:
            object = ReportPieChart;
            break;
    }

    return object;
}


/**
 * Return chart component by chart type
 */
function getChartComponent(type, legend, xAxis, groups) {
    var component;
    switch(type) {
        case 'area':
            component = AreaChartComponent;
            break;
        // #4541 - Added Gauge chart
        case 'gauge':
            component = GaugeChartComponent;
            break;
        // #4540 [start] - Added Funnel chart
        case 'funnel':
            component = FunnelChartComponent;
            break;
        // #4540 [end]
        case 'bar':
            // #5916 - Legend can be with date grouping
            var xAxisGroup = reportUtils.getGroup(xAxis, groups);
            if(xAxisGroup) {
                if(xAxisGroup.dateGrouping && xAxis == xAxisGroup.name) {
                    xAxis = xAxisGroup.name + "_" + xAxisGroup.dateGrouping
                }
            }

            // If legend is not the same as xAxis
            if(legend != xAxis) {
                component = MultiBarChartComponent;
            } else {
                component = BarChartComponent;
            }
            break;
        case 'hbar':
            component = HorizontalBarChartComponent;
            break;
        case 'line':
            component = LineChartComponent;
            break;
        case 'combined':
            component = CombinedChartComponent;
            break;
        case 'map':
            component = MapChartComponent;
            break;
        case 'pie':
        default:
            component = PieChartComponent;
            break;
    }

    return component;
}