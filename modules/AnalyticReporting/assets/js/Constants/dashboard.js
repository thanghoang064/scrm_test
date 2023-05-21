"use strict";

var AR = AR || {};
AR.Constants = AR.Constants || {};

(function(exports) {

    exports.AR.Constants.ADD_WIDGET = 'ADD_WIDGET';
    exports.AR.Constants.DELETE_WIDGET = 'DELETE_WIDGET';
    exports.AR.Constants.UPDATE_WIDGET = 'UPDATE_WIDGET';
    exports.AR.Constants.UPDATE_WIDGET_POSITION = 'UPDATE_WIDGET_POSITION';
    exports.AR.Constants.UPDATE_WIDGET_SIZE = 'UPDATE_WIDGET_SIZE';

    exports.AR.Constants.FETCH_WIDGET_DATA_INIT = 'FETCH_WIDGET_DATA_INIT';
    exports.AR.Constants.FETCH_WIDGET_DATA_SUCCESS = 'FETCH_WIDGET_DATA_SUCCESS';
    exports.AR.Constants.FETCH_WIDGET_DATA_FAILURE = 'FETCH_WIDGET_DATA_FAILURE';

    exports.AR.Constants.FETCH_WIDGET_DATA_URL = 'index.php?module=AnalyticReporting&action=getWidgetData&reportId=';

    exports.AR.Constants.TOGGLE_EDIT_MODE = 'TOGGLE_EDIT_MODE';


    exports.AR.Constants.FETCH_DASHBOARD_WIDGETS_INIT = 'FETCH_DASHBOARD_WIDGETS_INIT';
    exports.AR.Constants.FETCH_DASHBOARD_WIDGETS_SUCCESS = 'FETCH_DASHBOARD_WIDGETS_SUCCESS';
    exports.AR.Constants.FETCH_DASHBOARD_WIDGETS_FAILURE = 'FETCH_DASHBOARD_WIDGETS_FAILURE';

    exports.AR.Constants.FETCH_DASHBOARD_WIDGETS_URL = 'index.php?module=AnalyticReporting&action=getDashboardWidgets&dashboardId=';

    exports.AR.Constants.SAVE_DASHBOARD_WIDGETS_INIT = 'SAVE_DASHBOARD_WIDGETS_INIT';
    exports.AR.Constants.SAVE_DASHBOARD_WIDGETS_SUCCESS = 'SAVE_DASHBOARD_WIDGETS_SUCCESS';
    exports.AR.Constants.SAVE_DASHBOARD_WIDGETS_FAILURE = 'SAVE_DASHBOARD_WIDGETS_FAILURE';

    exports.AR.Constants.SAVE_DASHBOARD_WIDGETS_URL = 'index.php?module=AnalyticReporting&action=saveDashboardWidgets&dashboardId=';

    // Filter common report data after widget data has been loaded
    exports.AR.Constants.FILTER_COMMON_DATA = 'FILTER_COMMON_DATA';


})(this);