/**
 * Funnel Chart component
 */
var FunnelChartComponent = BaseChartComponent.extend({ // #4351
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
        var reportData = that.get('reportData');

        var margin = {top: 10, right: 10, bottom: 10, left: 10};
        // #4062 [start] - Override chart margin
        if(!isWidget && that.get("margin")) {
            margin = that.get("margin");
        }
        // #4062 [end]

        var d3 = this.get("d3");

        // Get total of values
        var total = that.getTotal(data.data, this.get('yAxis'));

        // d3-funnel chart options
        var options = {
            block: {
                dynamicHeight: true,
                highlight:true,
                fill: {
                    type: 'gradient',
                }
            },
            label: {
                format: function(key, value) {
                    if(showPercents) {
                        key += ' ('+ that.getPercents(total, value).toFixed(2) +'%)';
                    }
                    var numberFormat = (new NumberFormatter(jQuery.extend({},{"numdec":reportData.chartDecimalDigits},reportData.numberFormat),null)).makeFormatter();
                    return key +": " + numberFormat(null,null,value);
                },
            },
        };

        // On click events
        if(that.get("drilldownEnabled")) {
            options.events = {
                click: {
                    block: function(data) {
                        var menu = [{
                            title: function(d) {
                                // #6185
                                // Get row by value and field name to pass
                                // to that parseMetaValue
                                var fieldName = that.get("xAxis");
                                var value = d.label.raw;
                                var row = that.findByKeyValue(that.get('data').data, fieldName, value);

                                var meta = that.parseMetaDrilldown([{
                                    fieldName: fieldName,
                                    value: that.parseMetaValue(row, fieldName),
                                    type: 'xAxis',
                                }]);

                                // Set hidden input values for for field name and current color for use with color picker
                                var colorField =d.label.raw;
                                var color = d.fill.raw;

                                var url = reportData.urlDrilldown + reportData.id  + "&drilldown=" + encodeURI(JSON.stringify(meta));
                                return '<a href="'+url+'" target="_blank">Drill-down to detailed data</a><input type="hidden" value="'+colorField+'" id="colorForField"><input type="hidden" value="'+color+'" id="drilldownpopup" />';
                            },
                            action: function(elm, d, i) {
                                //
                            }
                        }];
                        d3.contextMenu(menu, function(){that.colorPickerCallback(that)}).call(this, data);
                    }
                },
            }
        }

        // Normal views have margins
        if(!isWidget) {
            options.chart = {
                margin: {
                    left: 0,
                    right: 0,
                    top: 30,
                    bottom: 0,
                }
            }
        }

        function drawChart() {
            // Remove all existing elements
            jQuery(svg).empty();

            var chart = new D3Funnel(svg);

            // Update function will be triggered on viewport changes, etc
            chart.update = function() {
                drawChart();
            }

            try {
                chart.draw(that.normalise(data), options);
                // Quick and dirty fix for white text color;
                jQuery(svg + ' text').attr("style", "font-size:14px;fill: #fff !important");
            } catch(e) {
                console.log(e);
            }

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
    // #4545 - Get total from values
    getTotal: function(data, key) {
        var total = 0;

        for(var i = 0; i < data.length; i++) {
            if(data[i][key]) {
                total += parseFloat(data[i][key]);
            }
        }

        return total;
    },
    // #4545 - Get percents from total
    getPercents: function(total, value) {
        var percentage = 0;

        if(total > 0 && value > 0)  {
            percentage = value / total * 100;
        }

        return percentage;
    },

    // #6627 Update chart data after changing colors
    updateData: function(){
        var reportData = that.get('reportData');
        this.set("chartColors", reportData.chartColors);
        this.chart.update();
    },
    // Normalize data got from server
    normalise: function(data) {
        // Get selected values for x and y axis
        var xAxis 		= this.get('xAxis');
        var yAxis 		= this.get('yAxis');
        var cumulated 	= this.get('cumulated');
        var groups 		= this.get('groups');

        // Search in groups for xAxis dateGrouping
        for(var i = 0; i < groups.length; i++) {
            if(groups[i].name == xAxis) {
                // add postfix of date grouping to xAxis name
                if(groups[i].dateGrouping) {
                    xAxis = xAxis + "_" + groups[i].dateGrouping;
                }
            }
        }

        // Normalise data by cumulation
        if(cumulated) {
            return this.normaliseCumulated(data, xAxis, yAxis);
        } else {
            return this.normaliseNonCumulated(data, xAxis, yAxis);
        }
    },
    // Normalise cumulated data
    normaliseCumulated: function(data, xAxis, yAxis, isDateGrouped) {
        var that = this;

        // Sorted picklist values
        var sortableValues = this.get("sortableValues");

        // Temporary object for normalised key/values
        var newData = [];
        // Final normalised object
        var normalised = [];
        var chartColors = that.get("chartColors");

        // Normalise for sorting
        _.each(data.data, function(val) {
            // #5762 - If nothing filled in x and y axis - skip this item
            if(!val[xAxis] && !val[yAxis]) {
                return; // Same as continue
            }

            var item = {
                key: val[xAxis],
                val: parseFloat(val[yAxis])
            }

            newData.push(item);
        });

        // If not set manual sorting values, then sort ascending
        if(sortableValues.length == 0) {
            newData = newData.sort(function(a,b) {
                return a.val - b.val;
            });

            // Cumulate values
            newData = this.cumulateValues(newData);

            // Sort by values descending
            newData = newData.sort(function(a,b) {
                return b.val - a.val;
            });
        }

        // If not set manual sorting values, then sort descending
        if(sortableValues.length > 0) {
            // Manually sorted
            var newDataSorted = [];
            for(var i = 0; i < sortableValues.length; i++) {
                var _name = sortableValues[i].value;
                for(var j = 0; j < newData.length; j++) {
                    if(_name == newData[j].key) {
                        // Add to sorted array
                        newDataSorted.push(newData[j]);
                    }
                }
            }

            // Cumulate sorted values
            newData = this.cumulateValues(newDataSorted);
        }

        // Normalise data for d3-funnel
        for(var i = 0; i < newData.length; i++) {
            var key 	= newData[i].key;
            var val 	= newData[i].val;

            var item = [
                key,
                +val.toFixed(2),
            ];

            // #6627 If the field has a custom color set add it to the data item
            if(chartColors && chartColors[key]){
                item.push(chartColors[key]);
            }

            normalised.push(item);
        }

        return normalised;
    },
    // Cumulated values (data is array of key/val objects)
    cumulateValues: function(data) {
        var lastValue = 0;
        var foundNonZero = false;

        // Reverse array and cumulate from bottom to top
        var data = data.reverse();
        for(var i = 0; i < data.length; i++) {
            // Strip first zero valued elements from array
            if(data[i].val > 0) {
                foundNonZero = true;
            } else {
                if(!foundNonZero) {
                    data.splice(i, 1);
                    continue;
                }
            }

            // If first non zero value is found - cumulate
            if(foundNonZero) {
                data[i].val = data[i].val + lastValue;
                lastValue = data[i].val;
            }
        }

        // Reverse array back
        var cumulatedData = data.reverse();
        return cumulatedData;
    },
    // Normalise non-cumulated data for
    normaliseNonCumulated: function(data, xAxis, yAxis) {
        var that = this;
        // Temporary object for normalised key/values
        var newData = [];
        // Final normalised object
        var normalised = [];
        var chartColors = that.get("chartColors");

        // Normalise for sorting
        _.each(data.data, function(val) {
            // #5762 - If nothing filled in x and y axis - skip this item
            if(!val[xAxis] && !val[yAxis]) {
                return; // Same as continue
            }

            var key 	= val[xAxis];
            var value 	= parseFloat(val[yAxis]);

            var item = {
                key: key,
                val: value,
            }

            newData.push(item);
        });

        // Sort by values descending
        newData = newData.sort(function(a,b) {
            return b.val - a.val;
        });

        var newData = newData.reverse();

        // Remove first zero value from array
        var foundNonZero = false;
        for(var i = 0; i < newData.length; i++) {
            // Remove first non zero values
            if(newData[i].val > 0) {
                foundNonZero = true;
            } else {
                if(!foundNonZero) {
                    newData.splice(i, 1);
                    continue;
                }
            }
        }

        // Normalise data for d3-funnel
        for(var i = 0; i < newData.length; i++) {
            var item = [
                newData[i].key,
                +newData[i].val.toFixed(2),
            ];

            if(chartColors && chartColors[key]){
                item.push(chartColors[key]);
            }

            normalised.push(item);
        }

        return normalised.reverse();
    },
    data: {
        cumulated: true,
        sortableValues: [],
        data: [],
        title: '',
        xAxis: '',
        yAxis: '',
        showPercents: false,
    }
});