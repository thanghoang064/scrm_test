"use strict";

var AR = AR || {};
AR.Actions = AR.Actions || {};

(function(exports) {

    exports.AR.Actions.fetchDashboardWidgetsInit = function() {
        return {
            type: AR.Constants.FETCH_DASHBOARD_WIDGETS_INIT,
        };
    }

    exports.AR.Actions.fetchDashboardWidgetsSuccess = function(dashboardId, widgets) {
        return {
            type: AR.Constants.FETCH_DASHBOARD_WIDGETS_SUCCESS,
            payload: {
                dashboardId: dashboardId,
                widgets: widgets
            }
        };
    }

    exports.AR.Actions.fetchDashboardWidgetsFailure = function(error) {
        return {
            type: AR.Constants.FETCH_DASHBOARD_WIDGETS_FAILURE,
            error: error
        };
    }

    exports.AR.Actions.fetchDashboardWidgets = function(dashboardId) {
        var options = {
            method: 'GET',
            credentials: "same-origin",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
        };

        return function(dispatch, getState) {
            // Init saving process
            dispatch(AR.Actions.fetchDashboardWidgetsInit());
            var url = AR.Constants.FETCH_DASHBOARD_WIDGETS_URL + dashboardId;

            // Actual submit process
            return window.fetch(url, options)
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    dispatch(AR.Actions.fetchDashboardWidgetsSuccess(dashboardId, data.widgets));
                })
                .catch(function (error) {
                    dispatch(AR.Actions.fetchDashboardWidgetsFailure(error));
                })
        }
    }







    exports.AR.Actions.saveDashboardWidgetsInit = function() {
        return {
            type: AR.Constants.SAVE_DASHBOARD_WIDGETS_INIT,
        };
    }

    exports.AR.Actions.saveDashboardWidgetsFailure = function(error) {
        return {
            type: AR.Constants.SAVE_DASHBOARD_WIDGETS_FAILURE,
            error: error
        };
    }

    exports.AR.Actions.saveDashboardWidgetsSuccess = function(data) {
        return {
            type: AR.Constants.SAVE_DASHBOARD_WIDGETS_SUCCESS,
            data: data
        };
    }

    /**
     * End-user submits dashboard for saving data
     *
     * @returns {Function}
     */
    exports.AR.Actions.saveDashboardWidgets = function(dashboardId) {
        var options = {
            method: 'POST',
            credentials: "same-origin",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: {}
        };

        return function(dispatch, getState) {
            // Init saving process
            dispatch(AR.Actions.saveDashboardWidgetsInit());

            options.body = JSON.stringify({
                dashboard:getState().dashboard,
                widgets:getState().widgets
            });

            // Actual submit process
            return window.fetch(AR.Constants.SAVE_DASHBOARD_WIDGETS_URL + dashboardId, options)
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    dispatch(AR.Actions.saveDashboardWidgetsSuccess(data));
                })
                .then(function(){
                    dispatch(AR.Actions.toggleEditMode());
                })
                .catch(function (error) {
                    dispatch(AR.Actions.saveDashboardWidgetsFailure(error));
                })
        }
    }




    /**
     * Toggle dashboard edit mode on/off
     *
     * @return {Object}
     */
    exports.AR.Actions.toggleEditMode = function() {
        return {
            type: AR.Constants.TOGGLE_EDIT_MODE,
        }
    }


})(this);