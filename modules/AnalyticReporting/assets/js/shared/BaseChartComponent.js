/**
 * #4351
 * Base chart component with increase height and decrease height methods
 */
var BaseChartComponent = Ractive.extend({
    isolated:false,
    chartHeight:600,
    // Chart height modifier ratio
    chartHeightModifier: 1.2,

    // Chart have big values (values larger or equal than 5)
    // Chart have big values (values larger than 100)
    bigValues: false,

    parentInit:function(){
        var that = this;

        if(!this.get('isWidget')) {
            // Use saved chart height if set
            if(ReportData.chartHeight || ReportData.chartHeight > 0) {
                this.chartHeight = ReportData.chartHeight;
            }

            // Bind methods on events
            this.on("increaseHeight", function(){
                that.chartIncreaseHeight();
            });
            this.on("decreaseHeight", function(){
                that.chartDecreaseHeight();
            });
            this.on("changeColor", function(value) {
                that.changeColor(value);
            });

            // #5844 - Resize chart so it will show correctly
            jQuery(document).on("d3RenderRequest", function() {
                that.chartUpdate();
            });
        }

        // #5424 - Workarounded initial state of NVD3 chart. On initialization it is ignoring margins.
        // TODO: find why on NVD3 initialization chart margins is ignored
        if(that.chart) {
            setTimeout(function(){
                console.log("chart update now ", that.chart);
                // that.chartUpdate();
            }, 300);
        }
    },
    chartUpdate:function(){
        // If chart is ready then resize
        if(this.chart && this.chart.update) {
            this.chart.update();
        }
    },
    chartIncreaseHeight:function(){
        this.chartHeight = Math.round(this.chartHeight * this.chartHeightModifier)
        jQuery("#chart1").css({
            height: this.chartHeight,
        });
        ReportData.chartHeight = this.chartHeight;
        this.chartUpdate();
    },
    chartDecreaseHeight:function(){
        this.chartHeight = Math.round(this.chartHeight / this.chartHeightModifier)
        jQuery("#chart1").css({
            height: this.chartHeight,
        });
        ReportData.chartHeight = this.chartHeight;
        this.chartUpdate();
    },
    changeColor:function(value){
        this.chartColors = jQuery.extend({}, ReportData.chartColors, value);
        ReportData.chartColors = this.chartColors;
        // Update chart data with new colors
        this.updateData();
    },
    // If in legend is groups
    parseGroups: function (data, xAxis, yAxis, legend) {
        var yAxis = [].concat(yAxis);
        var legend = [].concat(legend);

        // Get all legend and axis keys
        var legendKeys 	= [];
        var axisKeys 	= [];
        var chartColors = this.get("chartColors");
        var legendMapping = { };
        var ReportData = this.get("reportData");

        for(var i = 0; i < data.data.length; i++) {
            // Manage multiple items
            for(var j = 0; j < legend.length; j++) {
                var fieldName = legend[j];
                var rawFieldName = fieldName + '_raw',
                    legendFieldName = data.data[i][ rawFieldName ];

                if(!legendFieldName) {
                    legendFieldName = "-";
                }

                legendKeys.push( data.data[i][ rawFieldName ] );
                legendMapping[ data.data[i][ rawFieldName ] ] = data.data[i][ fieldName ];
            }

            if(!data.data[i][xAxis]) {
                data.data[i][xAxis] = "-";
            }

            axisKeys.push(data.data[i][xAxis]);
        }

        var order = this.getTopLefLegendFieldOrdering(legend[0], ReportData.chartGrouping);

        // Unique legendKeys and axis keys
        legendKeys 		= reportUtils.unique(legendKeys).sort(function(left, right) {
            return (order == 'ASC') ? (left - right) : (right - left);
        }); // #3842
        axisKeys 		= reportUtils.unique(axisKeys); // #3842
        // Add to object scope, so nvd3 tickFormat could use it
        this.axisKeys 	= axisKeys;

        // Format series
        var series = [];
        for(var i = 0; i < legendKeys.length; i++) {
            var mappedKey = legendMapping[ legendKeys[i] ];
            series[i] = { key: mappedKey, values: []};

            var defaultColors = d3.scale.category10().range();
            if(chartColors && chartColors[ mappedKey ]) {
                series[i].color = chartColors[ mappedKey ];
            } else {
                series[i].color = defaultColors[i];
            }

            for(var j = 0; j < axisKeys.length; j++) {
                series[i].values[j] = {x:j, y: 0}
                // #5819 - Parse meta data for drilldown
                series[i].values[j].meta = this.parseMetaDrilldown([{
                    fieldName: legend[0],
                    value: this.parseMetaValue(data.data[i], legend[0]),
                    type: 'legend',
                }, {
                    fieldName: xAxis,
                    value: this.parseMetaValue(data.data[i], xAxis),
                    type: 'xAxis',
                }]);
            }
        }

        var keys = [];
        for (var elem in legendMapping) {
            // console.log(elem);
            keys.push( legendMapping[ elem ] );
        }

        // Fill with data
        for(var i = 0; i < data.data.length; i++) {
            // Get index of axisKey position in data
            var axisKey = axisKeys.indexOf(data.data[i][xAxis]);

            // Manage multiple items
            for(var j = 0; j < legend.length; j++) {
                var idx = keys.indexOf(data.data[i][ legend[j] ]);
                // #4036 [start] - If y data is null, undefined ir something bad, set it to zero
                if(!data.data[i][yAxis]) {
                    data.data[i][yAxis] = 0;
                }
                // #4036 [end]

                // Data must be integer/float, not string
                series[idx].values[axisKey].y += parseFloat(data.data[i][yAxis]);

                if (parseFloat(data.data[i][yAxis]) >= 5) {
                    this.bigValues = true;
                }

                // #5819 - Parse meta data for drilldown
                series[idx].values[axisKey].meta = this.parseMetaDrilldown([{
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
        // console.log("parseGroup", series);
        return series;
    },

    parseAggregatesSwap: function(data, xAxis, yAxis, legend) {
        var legendKeys = [];
        var axisKeys = [];
        var series = [];

        for (var j = 0; j < legend.length; j++) {
            legendKeys.push(legend[j]);
        }

        var axisKeys = [].concat(yAxis);

        var axisKeysForLegend = [];
        for(var i = 0; i < axisKeys.length; i++) {
            axisKeysForLegend.push(data.cols[axisKeys[i]]);
        }
        this.axisKeys = axisKeysForLegend;

        var xAxisTranslated = data.cols[xAxis];
        // For only one group
        // for(var i = 0; i < legendKeys.length; i++) {
        series[0] = {key: xAxisTranslated, values:[]}
        // }

        // Fill with axis keys
        // for(var j = 0; j < axisKeys.length; j++) {
        // 	series[0].values[j] = {x: j, y: 0}
        // }

        // for(var i = 0; i < legendKeys.length; i++) {
        for(var j = 0; j < axisKeys.length; j++) {
            series[0].values[j] = {x: j, y: 0}
        }
        // }

        // Fill series with data
        for(var i = 0; i < data.data.length; i++) {
            // Get index of axisKey position in data
            for(var j = 0; j < axisKeys.length; j++) {
                var axisKey = axisKeys[j];

                // For each series item
                for (var k = 0; k < series.length; k++) {
                    series[k].values[j].y += parseFloat(data.data[i][axisKey]);
                }
            }
        }

        // console.log("parseAggregatesSwap", series, series, JSON.stringify(series));
        return series;
    },

    // If legend is aggregates
    parseAggregates: function(data, xAxis, yAxis, legend){
        // Get all legend and axis keys
        var legendKeys 	= [];
        var axisKeys 	= [];
        var chartColors = this.get("chartColors");

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
        legendKeys 		= reportUtils.unique(legendKeys);
        axisKeys 		= reportUtils.unique(axisKeys);
        // Add to object scope, so nvd3 tickFormat could use it
        this.axisKeys 	= axisKeys;

        // Fill series with legend keys and empty values
        var series = [];
        for(var i = 0; i < legendKeys.length; i++) {
            series[i] = {key: legendKeys[i], values: []};

            // Fill with axis keys
            for(var j = 0; j < axisKeys.length; j++) {
                series[i].values[j] = {x:j, y: 0}
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
                        // #4036 [start] - If y data is null, undefined ir something bad, set it to zero
                        if(!data.data[i][legend[j]] ) {
                            data.data[i][legend[j]] = 0;
                        }
                        // #4036 [end]

                        // if(parseFloat(data.data[i][legend[j]]) > 100) { // #5878 completely disable decimal points from charts
                        this.bigValues = true;
                        // }

                        series[k].values[axisKey].y += parseFloat(data.data[i][legend[j]]);
                        // #5819 - Parse meta data for drilldown
                        series[k].values[axisKey].meta = this.parseMetaDrilldown([{
                            fieldName: legend[j],
                            value: this.parseMetaValue(data.data[i], legend[j]),
                            type: 'legend',
                        }, {
                            fieldName: xAxis,
                            value: this.parseMetaValue(data.data[i], [xAxis]),
                            type: 'xAxis',
                        }]);
                    }
                }

            }
        }

        // Rename series keys to understandable names
        for(var i = 0; i < series.length; i++) {
            series[i].key = data.cols[series[i].key];

            if(chartColors && chartColors[series[i].key]){
                series[i].color = chartColors[series[i].key];
            }
        }

        // console.log("Series parseAggregates: ", series, JSON.stringify(series));
        return series;
    },

    // #5819 - Parse meta from data, to get drilldown filters
    parseMetaDrilldown: function(meta) {
        var aggregates 	= this.get("aggregates");
        var availableGroups = reportUtils.getAvailableGroups(this.get('reportData'), this.get("groups"), this.get("fieldsByName"));

        // Allow drilldown only if more than 1 groups available
        if(availableGroups.length < 1) {
            return false
        }

        // Allow only one field name paramter drilldown
        meta = _.uniq(meta, function(object) {
            return object.fieldName;
        });

        // Parse each meta element
        for(var i = 0; i < meta.length; i++) {
            // Check if given field is aggregate and remove them
            var found = reportUtils.getAggregate(meta[i].fieldName, aggregates)
            if(found) {
                meta.splice(i, 1);
                // break;
            }

            // By default filter condition is "equal"
            meta[i].condition = "eq";

            // If this group have date grouping, then remove postfix from fieldName and add condition ar postfix
            var dateGroup = this.findGroupingWithDate(availableGroups, meta[i].fieldName);
            if(dateGroup) {
                meta[i].fieldName = dateGroup.aggregate;
                meta[i].condition = dateGroup.dateGrouping;
            }

            // Transform to use isempty filter
            if(meta[i].value == "-" || meta[i].value == "") {
                meta[i].condition = "empty";
            }
        }

        // console.log("meta",meta);
        return meta;
    },

    // #6185 - Some modules have id to be passed, parse them
    parseMetaValue: function(row, fieldName) {
        if(!row) {
            return;
        }

        if(row[fieldName+"_setype"] !== undefined) {
            var moduleName = row[fieldName+"_setype"];
            if (['Users'].indexOf(moduleName) == 0) {
                // Return id field instead of field value
                return row[fieldName + "_id"];
            }
        }

        // Use value instead of name if provided
        if(row[fieldName + "_value"]) {
            return row[fieldName + "_value"];
        }

        // Return field value instead of id
        return row[fieldName];
    },

    // #5819 - Find grouping element with date grouping set up
    findGroupingWithDate: function(availableGroups, fieldName) {
        // Search for date grouping and remove date grouping post fix
        for(var i = 0; i < availableGroups.length; i++) {
            if(availableGroups[i].dateGrouping) {
                // Try to get full name of grouping, if already removed postfix
                var fieldNameFull = fieldName + "_" + availableGroups[i].dateGrouping;
                if(availableGroups[i].name == fieldName || availableGroups[i].name == fieldNameFull) {
                    return availableGroups[i];
                }
            }
        }

        return false;
    },

    // #6185 - Return row from data array, filered by key and value
    findByKeyValue: function(data, key, value) {
        var row = {};

        for(var i = 0; i < data.length; i++){
            if(data[i][key] == value) {
                row = data[i];
                break
            }
        }

        return row;
    },

    // Callback for chart context menu to add color picker
    colorPickerCallback: function(that) {
        d3.selectAll(".nvtooltip").style("opacity", 0); // On pre-show, hide tooltip

        // Disable color picker for widgets
        var isWidget = that.get('isWidget');
        if(!isWidget) {
            // If a color picker already exists (i.e. by repeatedly clicking different chart areas), destroy it
            if(that.spectrumContainer){
                jQuery(that.spectrumContainer).remove();
            }

            //
            jQuery("#drilldownpopup").spectrum({
                clickoutFiresChange: false,
                preferredFormat: "hex",
                change: function(color){
                    var hexColor = color.toHexString();
                    var field = jQuery('#colorForField').val();
                    var value = {};
                    value[field] = hexColor;
                    // Set color by {label : color} data pair
                    that.changeColor(value);
                    jQuery(".d3-context-menu").hide();
                }
            });
            // Temporarily set the spectrum color picker container so it can be removed if a different context menu is opened
            that.spectrumContainer = jQuery("#drilldownpopup").spectrum("container");
        }
    },

    getTopLefLegendFieldOrdering: function (legendField, chartGrouping) {
        var sorting = 'ASC';

        for (var ii = 0; ii < chartGrouping.length; ++ii) {
            var grouping = chartGrouping[ii],
                fieldName = grouping['name'];

            if (grouping['dateGrouping'].length && grouping['dateGrouping'] != 'default') {
                fieldName += '_' + grouping['dateGrouping'];
            }

            if ((fieldName == legendField) && (grouping['sortDirection'] == 'DESC')) {
                sorting = 'DESC';
                break;
            }
        }

        return sorting;
    }
});