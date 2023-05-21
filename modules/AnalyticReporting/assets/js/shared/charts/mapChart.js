/**
 * Map Chart component
 */
MapChartComponent = BaseChartComponent.extend({
    // Swith template for Sugar Sidecar or "normal" report chart template
    template: function(data) {
        // For widgets
        if(data.isWidget) {
            return '<div id="{{elementId}}" style="height:100%;"></div>'
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

        // Set unique id for div element
        this.set("elementId", "id_" + reportUtils.uniqueId());
    },

    /**
     * Fired each time the instance is rendered
     *
     * Use onrender() for code that needs access to the rendered DOM, but is safe being called more than once if you unrender and rerender your ractive instance.
     */
    onrender:function() {
        var that = this;
        var title = that.get('title');
        var isWidget = that.get('isWidget');

        var elementId = 'choropleth';
        if(isWidget) {
            elementId = this.get("elementId");
        }

        var map = L.map(elementId).setView([that.get("lat"), that.get("lng")], that.get("zoom"));

        // Set approximate max bounds for world map, so it would never go to invalid coordinates
        var maxBoundsSouthWest = new L.LatLng(85, -180);
        var maxBoundsNorthEast = new L.LatLng(-85, 180);
        var maxBoundsArea = new L.LatLngBounds(maxBoundsSouthWest, maxBoundsNorthEast);
        map.setMaxBounds(maxBoundsArea);

        var legendControl = new L.Control.Legend();
        legendControl.addTo(map);

        // Add the Stamen toner tiles as a base layer
        L.tileLayer.provider('Stamen.TonerLite',{
            minZoom:2
        }).addTo(map);

        // Get normalised data and create options
        var normalised = this.normalise(
            this.get("data"),
            this.get("country"),
            this.get("state"),
            this.get("xAxis"),
            this.get("yAxis"),
            this.get("markerAxisX"),
            this.get("markerAxisY")
        );

        var options = this.getOptions();
        var data = this.getData(normalised, options);

        // Set choropleth layer as base
        var baseLayer = new L.ChoroplethDataLayer(data, options);
        baseLayer.addTo(map);

        // Add markers (charts)
        if(this.get("marker")) {
            var markerLayer = this.getMarkerLayer(data, options);
            map.addLayer(markerLayer);
        }

        // Handle map zooming
        map.on("zoomend", function(event) {
            if(!isWidget) {
                ReportData.zoom = map.getZoom();
            }
        });

        // Handle map positions
        map.on("dragend", function(event) {
            if(!isWidget) {
                var center = map.getCenter();
                ReportData.lat = center.lat;
                ReportData.lng = center.lng;
            }
        });


        if(!isWidget) {
            // #6129 - Merge map tiles and svg charts on map
            // then send to server and combine together
            jQuery(window).on("exportImage", function(e, $el) {
                // Get pressed link element and
                // set text with backup
                if($el) {
                    $el = jQuery($el);
                    $el.data('initialText', $el.text());
                    $el.text("Loading...");
                }

                // Base64 encoded PNG strings
                var sources = [];

                // Create image from leaflet tiles
                // Important! This plugin has been modified
                // not to use canvase (otherwise, dvf will not work)
                leafletImage(map, function(err, canvas) {
                    // Added Base64 encoded Leaflet tiles PNG to sources array
                    sources.push(canvas.toDataURL());

                    // Get SVG and positions (transform)
                    var svgElement = jQuery("svg")[0];
                    var transform = jQuery(".leaflet-map-pane").css('transform');
                    var transformX = parseInt(transform.split(',')[4]);
                    var transformY = parseInt(transform.split(',')[5]);

                    saveSvgAsPng(svgElement, 'chart.png', 1, function(svgImage) {
                        // Added Base64 encoded Leaflet DVF SVG PNG to sources array
                        sources.push(svgImage);

                        // Try to push Base64 encoded PNG data to server and merge into one image
                        // Then push back to user as downloadable file
                        try {

                            jQuery.post("index.php?entryPoint=combineMapTiles", {sources:sources}, function(response) {

                                window.location = "index.php?entryPoint=analyticReportBouncer&img="+response+"&nobase=true"
                            });
                        } catch(e) {
                            console.log(e);
                            alery("There was problems with generating map chart image on server.");
                        } finally {
                            // Set pressed link element text to
                            // default
                            if($el) {
                                $el.text($el.data('initialText'));
                            }
                        }
                    }, transformX, transformY);
                });
            });
        }

        that.chart = {
            // Update map size
            update: function() {
                map.invalidateSize();
            }
        }
    },

    /**
     * Get chart options with keys
     */
    getChartOptions: function(data, options) {
        var chartOptions = {};

        for(key in data) {
            for(chartKey in data[key].data) {
                // Define array keypath, where date item is stored
                var keyPath = "data." + chartKey;
                chartOptions[keyPath] = {
                    displayName: chartKey,
                    fillColor:null,
                }
            }
        }

        var i = 0;
        for(option in chartOptions) {
            var colors = this.get('chartColors');
            var color = colors[i];


            chartOptions[option].fillColor = color;
            i++;
        }

        return chartOptions;
    },

    /**
     * Set marker layer - charts on map
     */
    getMarkerLayer: function(data, options) {
        var layerOptions = {
            chartOptions: {
            },
            layerOptions: {
                fillOpacity: 1.0,
                opacity: 1,
                weight: 1,
                radius: 15,
                barThickness: 10,
                gradient:true,
            },
            legendOptions: {
                title: 'Chart legend'
            }
        };

        // Chart options containing data reference keys
        var chartOptions = this.getChartOptions(data, options);
        layerOptions["chartOptions"] = chartOptions;

        // Merge chart options with main options
        var pieChartOptions = jQuery.extend(true, options, layerOptions);

        // console.log("pieChartOptions", pieChartOptions,data);

        return new L.PieChartDataLayer(data, pieChartOptions);
    },

    // Get data in GEO JSON format
    getData: function(data, options) {
        // Create data object
        var d = {};

        for(var i = 0; i < data.length; i++) {
            var key = data[i].key;
            var val = data[i].val;
            var title = data[i].title; // #6318 Add title for LOOKUP

            // Pass additional data (used for charts)
            var _data = {};
            if(data[i].data) {
                _data = data[i].data;
            }

            d[key] = {
                "name": key,
                "val": val,
                "title": title,
                "data": _data,
            }
            d[key][options.codeField] = key;
        }

        // console.log("getData " , d);
        return d;
    },

    // Colorize map areas
    colorize: function(min, max, colors) {
        return new L.CustomColorFunction(min, max, colors, { interpolate: true });
    },

    // Get location mode by map type
    getLocationMode: function() {
        // Set Leaflet location mode - state, country, etc
        var locationMode;
        switch (this.get("mapType")) {
            case 'state':
                // Merge all available states into one
                for(state in LSTATES) {
                    L.states = jQuery.extend({}, L.states, LSTATES[state]);
                }
                // moved outside the for loop merge all states first and generate centroids once after merge
                var centroids = L.GeometryUtils.loadCentroids(L.states);
                L.stateCentroids = jQuery.extend({}, L.stateCentroids, centroids);

                locationMode = L.LocationModes.STATE;
                break;
            case 'city':
                locationMode = L.LocationModes.LOOKUP;
                break;
            case 'country':
            default:
                locationMode = L.LocationModes.COUNTRY;
                break;
        }

        return locationMode;
    },

    // Create Leaflet options for choropleth chart
    getOptions: function(data) {
        var that = this;
        var yAxis = this.get("yAxis");
        var aggregates = this.get("aggregates");
        var labels = this.get("labels");


        var options = {
            recordsField: null,
            locationMode: this.getLocationMode(),
            codeField: 'abbr',
            displayOptions: {
            },
            layerOptions: {
                fillOpacity: 0.8,
                opacity: 1,
                weight: 1,
                stroke: false,
                //numberOfSides: 50
            },
            tooltipOptions: {
                iconSize: new L.Point(100,70),
                iconAnchor: new L.Point(-5,55)
            },
            getIndexKey: function (location, record) {
                return location.text;
            },
            // setHighlight: function (layerStyle) {
            //     layerStyle.stroke = true;
            //     return layerStyle;
            // },
            // unsetHighlight: function (layerStyle) {
            //     layerStyle.stroke = false;
            //     return layerStyle;
            // }
        };

        // #6318 Allow for additional options based on mapType
        var extraoptions = {};

        switch (this.get('mapType')){
            case 'city':
                // Merge all country cities into one. LCITIES have city definitions by country
                /* LCITIES are arrays of GeoJSON objects similar to LSTATES
                 * Each LCITIES array element contains cities within a single country inside a GeoJSON FeatureCollcetion object
                 * Each array element features contains a GeoJSON Feature object containing the minimum of:
                 * type: 'Feature', geometry Point (as defined in GeoJSON), and a properties object with a single 'id' key used for LOOKUP
                 * The city id is in the form of COUNTRY.STATE.CITY, where city is stripped of dots and whitespaces
                 * NOTE: Some cities are in the form of COUNTRY.CITY, where data is unavailable or country addressing conventions do not use state
                 * See getKeyPath function for details
                 */
                var cities = {type: 'FeatureCollection', features: []};
                for(country in LCITIES) {
                    jQuery.merge(cities.features, LCITIES[country].features);
                }

                var extraoptions = jQuery.extend({}, extraoptions, {
                    locationLookup: cities,
                    locationIndexField: 'id',
                    locationTextField: 'title',
                    // TODO: When making a chloropleth with points it defaults to a polygon (triangle) around the point
                    // A circle marker would be better looking. See L.DataLayer _getMarker function and getMarker option in leaflet-dvf.js
                    //getMarker: L.CircleMarker // doesn't work
                });
                break;
        }

        options = jQuery.extend(options, extraoptions);

        // The display will be colored by your 'density' property in your GeoJSON. This accesses the feature object directory, so the 'properties' prefix is required if you're going to access a GeoJSON property on your data.
        // 'properties.density': {
        //     // A legend will automatically be generated for you. You can add this as a control. This displayName property will be the title for this layer's legend.
        //     displayName: 'Density',
        //     color: yellowToRed
        // }
        var aggregate = reportUtils.getAggregate(yAxis, aggregates);
        var displayName = labels[yAxis] ? labels[yAxis] : aggregate.title;

        // #6318 Get the color palette depending on markers- if map has markers use the green shades for less color clutter
        // If map has no markers use a heatmap type color palette for better visibility (pale colours are hard to see on a white background)
        var colors = this.get('marker') ? this.get('colors') : this.get('heatcolors');

        options['displayOptions'].val = {
            displayName: displayName,
            fillColor: that.colorize(this.min, this.max, colors),
            // fillOpacity: new L.PiecewiseFunction([new L.LinearFunction(new L.Point(0, 0), new L.Point(1, 0.7)), new L.LinearFunction(new L.Point(1, 0.7), new L.Point(55, 0.7))]),
            // color: that.colorize(),
        }

        // console.log("options", options);
        return options;
    },

    // Return key path by given data, for example "IN.AP.Itanagar"
    getKeyPath: function(dataItem, countryField, stateField, dataKey) {
        var path = "";

        switch (this.get("mapType")) {
            case 'state':
                var countryCode = this.getCountryCode(dataItem[countryField]);
                path = countryCode + '.' + this.getStateCode(countryCode, dataItem[dataKey]);
                break;
            case 'city':
                // Cities are normally defined by country and state
                // Some countries like the USA, DE always include regional data in addresses, also useful to resolve naming clashes
                // Others do not use states in their address
                // NOTE: GB usualy uses counties in their addresses, however currently such data is lacking
                // Whatever convention is being used make sure that the GeoJSON feature list is compatible
                var citiesWithoutState = ['GB','FR','AT','BE','DK','IE','IT','NL','SE','PL','ES','MX','IS','NO','CH','GR','CZ','IN','CN','LV','EE','LT'];
                var countryCode = this.getCountryCode(dataItem[countryField]);
                path = countryCode;
                // Currently lacking consistent province/region/state/county data for UK/GB, so exclude state for UK
                if(jQuery.inArray(countryCode, citiesWithoutState) == -1){
                    path += '.' + this.getStateCode(countryCode, dataItem[stateField]);
                }

                if(dataItem[dataKey]) {
                    path += '.' + dataItem[dataKey].replace(/[. ]/g, '');
                }

                return path;
                break;
            // Added redundant 'country' and default to create a more consistent structure across various normalisation functions
            case 'country':
            default:
                path = this.getCountryCode(dataItem[dataKey]);
                break;
        }

        return path;
    },

    // Filter empty values and aggregate
    _normalise: function(data, countryField, stateField, dataKey, dataVal, filterKey, filterVal) {
        // Cumulate data values into one key/value pair
        var d = {};
        var titles = [];
        var keyPathMap = {}; // Store keyPath - originalKey mapping

        for(var i = 0; i < data.data.length; i++) {
            var keyOrignal = data.data[i][dataKey];
            var keyPath = this.getKeyPath(data.data[i], countryField, stateField, dataKey);
            keyPathMap[keyPath] = keyOrignal;

            var val = data.data[i][dataVal];

            // Accumulate all original keys to be used as titles
            titles[keyPath] = keyOrignal;

            // Normalize only filtered keys
            if(filterKey && filterVal) {
                if(data.data[i][filterKey] != filterVal) {
                    continue;
                }
            }

            // Don't allow empty values
            if(!keyPath) {
                continue;
            }

            val = parseFloat(val) || 0;

            // Init entry with zeros or use existing one and add
            // var id = prefix + "." + key;
            d[keyPath] = d[keyPath] || 0;
            d[keyPath] += val;
        }

        // return d;

        // Convert to array of objects
        var result = [];
        for(keyPath in d) {
            var item = {};
            item.keyPath = keyPath;
            item.key = keyPathMap[item.keyPath];
            item.title = titles[item.keyPath];
            item.value = d[keyPath]; // Value

            result.push(item);
        }

        return result;
    },

    // Filter empty values and aggregate
    _normaliseMarkers: function(data, countryField, stateField, dataKey, dataVal, filterKey, filterVal) {
        // Cumulate data values into one key/value pair
        var d = {};
        for(var i = 0; i < data.data.length; i++) {
            var key = data.data[i][dataKey];
            var val = data.data[i][dataVal];

            // Normalize only filtered keys
            if(filterKey && filterVal) {
                if(data.data[i][filterKey] != filterVal) {
                    continue;
                }
            }

            // Don't allow empty values
            if(!key) {
                continue;
            }

            val = parseFloat(val) || 0;

            // Init entry with zeros or use existing one and add
            d[key] = d[key] || 0;
            d[key] += val;
        }

        return d;
    },

    // Normalise data for rendering
    // normalise: function(data, dataKey, dataVal, filterKey, filterVal) {
    normalise: function(data, countryField, stateField, dataKey, valueField, markerLegendField, markerValueField){
        countryField = reportUtils.appendDateGrouping(data, countryField);
        stateField = reportUtils.appendDateGrouping(data, stateField);
        dataKey = reportUtils.appendDateGrouping(data, dataKey);

        // Filter empty values and aggregate
        var d = this._normalise(data, countryField, stateField, dataKey, valueField);

        // Max and min values
        this.max = 0;
        this.min = 0

        // Fill series with data
        var series = [];

        for(var i = 0; i < d.length; i++) {
            // Set min and max values
            if(d[i].value > this.max) {
                this.max = d[i].value;
            }
            if(d[i].value < this.min) {
                this.min = d[i].value;
            }

            // Additional data for each item (used for charts)
            var _data = this._normaliseMarkers(data, countryField, stateField, markerLegendField, markerValueField, dataKey, d[i].key);

            var item = {
                key: d[i].keyPath,
                val: d[i].value,
                title: d[i].title,
                data: _data,
            }
            series.push(item);
        }

        // console.log("Series: ", series);
        return series;
    },

    /**
     * #6494
     *
     * Find synonyms for country names
     * For example: Russia is synonym for Russian Federation
     *
     * @param key
     * @returns string value or bool false
     */
    getCountryNameSynonym: function(key) {
        var map = [{
            key: "Russia",
            value: "Russian Federation",
        }, {
            key: "England",
            value: "United Kingdom"
        }, {
            key: "USA",
            value: "United States"
        }, {
            key: "US",
            value: "United States"
        }, {
            key: "UAE",
            value: "United Arab Emirates"
        }, {
            key: "RSA",
            value: "South Africa"
        }]

        var found = map.filter(function(item) {
            return  item.key == key
        })[0];

        if(found) {
            return found.value;
        }

        return false;
    },

    /**
     * Try to find ISO2 country code by country name in any format
     */
    getCountryCode:function(key) {
        // If country is empty or not defined, then ignore processing
        if(!key) {
            return false
        }

        if(key.length > 2 && L.fullLookup)  {
            // Transform country name to Title Case
            var name = reportUtils.toTitleCase(key);
            // Names with 3 characters long should be UPPER CASED
            if(key.length <= 3) {
                name = name.toUpperCase();
            }

            // Get possible synonyms for country name (Russia to Russian Federation)
            var synonym = this.getCountryNameSynonym(name);
            if(synonym) {
                name = synonym;
            }

            // Try to find key in ISO2 to Country name lookup object
            var _key = reportUtils.findKey(L.fullLookup, name);

            if(_key) {
                key = _key
            }
        }

        return key;
    },

    /**
     * Try to find ISO2 state code by state name in any format
     */
    getStateCode: function(country, key) {
        // If country or state is empty or not defined, then ignore processing
        if(!country || !key) {
            return false
        }

        if(key.length > 2 && L.stateAlpha2Lookup && L.stateAlpha2Lookup[country])  {
            var _key = reportUtils.findKey(L.stateAlpha2Lookup[country], key);
            if(_key) {
                key = _key
            }
        }

        return key;
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
        mapType: "country",
        zoom:2,
        lat: 0,
        lng: 0,
        // colors: L.ColorBrewer.Sequential.Greens['9'],
        heatcolors: ["#2e539c","#8aed4a","#f2e51a","#f41e36"],
        colors: [/*"#f4f7ee",*/"#d3e0ba","#bdd097","#a7c074","#91b152","#7ba12f"],
        chartColors: ["#a6cee3","#1f78b4","#b2df8a","#33a02c","#fb9a99","#e31a1c","#fdbf6f","#ff7f00","#cab2d6","#6a3d9a","#ffff99","#b15928"],
    }
});