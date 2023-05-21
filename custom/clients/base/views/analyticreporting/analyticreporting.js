({
    plugins: ['Dashlet', 'Tooltip'],

    events: {
        'click .enlarge': 'enlargeClicked',
    },

    // Current reportId
    reportId: null,

    // Endpoint URL's
    getReportsEndpoint: 'AnalyticReporting/GetReports',
    getWidgetEndpoint: 'AnalyticReporting/GetWidget?reportId=',

    /**
     * Initialize the View
     *
     * @constructor
     * @param {Object} options
     */
    initialize: function(options) {
        // Callbacks should access this, so bind this to all methods
        _.bindAll(this, "renderChart");
        // _.bindAll.apply(_, [this].concat(_.functions(this)));
        this.isManager = app.user.get('is_manager');
        this._super('initialize', [options]);
    },

    /**
     * Special case for reportId field rendering
     * TODO: In future this should be moved in config
     */
    _renderField: function(field, $fieldEl) {
        var self = this;

        // TODO: Must find better "Sugar" way for this solution
        // Special case for choosing reports
        if(field.name == "reportId") {
            App.progress.start();
            app.api.call('GET', app.api.buildURL(this.getReportsEndpoint), null, 
            {
                success: function (data) {
                    if (this.disposed) {
                        App.progress.cancel();
                        return;
                    }

                    // Set report options as select options
                    App.progress.done();
                    // Till Sugar 7.8.0.0
                    // field.options.def.options = data;
                    // From Sugar 7.8.0.0
                    field.items = data;
                    self._super("_renderField", [field, $fieldEl]);
                },
            });             
        } else {
            // Render other fields
            self._super("_renderField", [field, $fieldEl]);
        }
    },

    /**
     * @inheritdoc
     */
    bindDataChange: function() {
        var self = this;
        if (!this.meta.config) {
            // Load report and render chart when changing report by select bar
            this.settings.on('change:reportId', function(model) {
                self.loadReportData(null, model.get('reportId'), self.renderChart);
            });
        }
    },

    /**
     * Load ReportData from API endpoint
     */
    loadData: function(options) {
        if (this.disposed || this.meta.config) {
            return;
        }

        // Load data and render chart when completed
        this.loadReportData(
            options,
            this.settings.get('reportId'), 
            this.renderChart
        );
    },


    /**
     * Load report from endpoint and run callback when completed
     */
    loadReportData: function(options, reportId, callback) {
        var self = this;

        App.progress.start();      
        app.api.call('GET', app.api.buildURL(this.getWidgetEndpoint + reportId), null, 
        {
            /**
             * On successfully retrieved data event
             */
            success: function (data) {      
                if (this.disposed) {
                    App.progress.cancel();
                    return;
                }
                
                App.progress.done();
                callback(data);
            },
            error: function (data) {
                if (this.disposed) {
                    App.progress.cancel();
                    return;
                }

                App.progress.done();
                self.renderErrorMessage(reportId, data.message);
            },
            complete: options ? options.complete : null,
        });
    },

    /**
     * Generic method to render chart with check for visibility and data.
     * Called by _renderHtml and loadData.
     */
    renderChart: function(reportData) {
        // Set chart title if entered
        if(reportData.chartTitle && reportData.chartTitle.length > 0) {
            this.layout.setTitle(reportData.chartTitle);
        }

        // Set current reportId
        this.reportId = reportData.id;

        if (!this.meta.config) {
            // Wrap title with link to report
            var title = this.layout.$('h4.dashlet-title').text();
            var url = this.dashletConfig.config.openReportUrl + reportData.id;

            // Dirty fix for enlarging charts (open in popup window)
            // var height = jQuery(window.parent).height() - (jQuery(window.parent).height() / 3);
            // var width = jQuery(window.parent).width() - (jQuery(window.parent).width() / 3);
            // var popupUrl = this.dashletConfig.config.openWidgetUrl + this.reportId;
            // var enlarge = ' <a class="fa fa-arrows-alt enlarge" href="javascript:window.open(\''+popupUrl+'\',  \'_blank\', \'height='+height+',width='+width+'\')"></a>';
            var chartTitle = '<a href="'+ url +'" target="_blank">' + title + '</a>';
            // this.layout.setTitle(chartTitle);
            this.layout.$el.find("h4").first().html(chartTitle);
        }

        // Generate fieldsByName variables and merge with reportData
        reportData = reportUtils.setFieldsByName(reportData);

        // Exted dashlet with data (for templates) and render
        // _.extend(this, reportData);

        $el = this.$el.find(".ar-chart:first");
        initChartView($el, reportData);
    },

    /**
     * Render error message in chart DIV container with link to report.
     * Called by loadReportData.
     */
    renderErrorMessage: function(reportId, errorMessage) {
        var url = this.dashletConfig.config.openReportUrl + reportId;
        try {
            $el = this.$el.find(".ar-chart:first");
            var a = $("<a />")
                .attr('href', url)
                .text(errorMessage);
            var div = $("<div />")
                .css({
                    height: "100%",
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center"
                });
            a.appendTo(div.appendTo($el));
        } catch(e) {
            console.log("Couldn't render error message for reportId: " + reportId);
        }
    },

    /**
     * Open report chart in new window
     */
    enlargeClicked: function(e) {
        console.log("clicked enlarge",e);
        var height = jQuery(window.parent).height() - (jQuery(window.parent).height() / 3);
        var width = jQuery(window.parent).width() - (jQuery(window.parent).width() / 3);
        var url = this.dashletConfig.config.openWidgetUrl + this.reportId;
        var popup = window.open(url,"Enlrage",'height='+height+',width='+width);
    }

    /**
     * On dashlet initialization event
     */
    // initDashlet: function (view) {
    // },
    //     this._super('initDashlet', [view]);

    //     var self = this;
    //     this.viewName = view;

    //     // check if we're on the config screen
    //     if (this.meta.config) {
    //         console.warn("on config plane", this.meta.config);
    //         this.meta.panels = this.dashletConfig.dashlet_config_panels;
    //         console.log("this.meta",this.meta);
    //         //this.getAllSavedReports();
    //     } else {
    //         this.template = app.template.get(this.name+ '.main');
    //         console.log("this.template", this.template, view);
    //     }

    //     // On render, set layout title
    //     this.layout.on('render', function() {
    //         if (!this.disposed && !this.settings.get('config')) {
    //             //this.layout.setTitle(app.lang.get(this.meta.label, this.forecastBy));
    //             this.layout.setTitle("Tiripiri");
    //         }
    //     }, this);
    // },

    // _render: function(options) {
    //     this.$el.html(this.template(this));
    //     this._super('_render', [options]);
    // },

    /**
     * Change to the spinning icon to indicate that loading process is triggered
     * Trigger _super on dashlet-toolbar.js
     */
    // refreshClicked: function() {
    //     this._super("refreshClicked");
    // },
})