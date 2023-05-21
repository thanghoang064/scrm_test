"use strict";

var AR = AR || {};
AR.Actions = AR.Actions || {};

(function(exports) {

    exports.AR.Actions.fetchWidgetDataInit = function() {
        return {
            type: AR.Constants.FETCH_WIDGET_DATA_INIT,
        };
    }

    exports.AR.Actions.fetchWidgetDataSuccess = function(reportId, data) {
        return {
            type: AR.Constants.FETCH_WIDGET_DATA_SUCCESS,
            payload: {
                reportId: reportId,
                data: data
            }
        };
    }

    exports.AR.Actions.fetchWidgetDataFailure = function(error) {
        return {
            type: AR.Constants.FETCH_WIDGET_DATA_FAILURE,
            error: error
        };
    }

    exports.AR.Actions.fetchWidgetData = function(reportId) {
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
            dispatch(AR.Actions.fetchWidgetDataInit());
            var url = AR.Constants.FETCH_WIDGET_DATA_URL + reportId;

            // Actual submit process
            return window.fetch(url, options)
                .then(function (response) {
                    return response.json();
                })
                .then(function (data) {
                    dispatch(AR.Actions.fetchWidgetDataSuccess(reportId, data));
                })
                .then(function (data) {
                    // Filter common report data after new widget has been fetched
                    dispatch(AR.Actions.filterCommonData())
                })
                .catch(function (error) {
                    dispatch(AR.Actions.fetchWidgetDataFailure(error));
                })
        }
    }

    /**
     * TODO: Not used
     * Adds Widget with reportData to state
     *
     * @param {String} type
     * @param {Number} reportId
     * @return {Object}
     */
    exports.AR.Actions.addWidgetWithData = function(type, reportId) {
        return function(dispatch, getState) {
            return Promise.all([
                dispatch(AR.Actions.addWidget(type, reportId)),
                dispatch(AR.Actions.fetchWidgetData(reportId)),
                dispatch(AR.Actions.filterCommonData())
            ]).then(function() {
                console.log('I did everything!');
            }).catch(function(err) {
                console.log("There was errors with addWidgetWithData:", err.message);
            });
        }
    }

    /**
     * Adds Widget to state
     *
     * @param {String} type
     * @param {Number} reportId
     * @return {Object}
     */
    exports.AR.Actions.addWidget = function(type, reportId, dashboardId) {
        return {
            type: AR.Constants.ADD_WIDGET,
            payload: {
                type: type,
                reportId: reportId,
                dashboardId: dashboardId
            }
        };
    }

    // TODO: not implemented
    exports.AR.Actions.updateWidget = function() {
        return {
            type: AR.Constants.UPDATE_WIDGET,
            payload: {
                id: id,
                width: width,
                height: height,
                x: x,
                y: y,
            }
        };
    }

    /**
     * Update existing widget size
     *
     * @param {Number} reportId
     * @param {Number} width
     * @param {Number} height
     * @return {Object}
     */
    exports.AR.Actions.updateWidgetSize = function(id, width, height) {
        return {
            type: AR.Constants.UPDATE_WIDGET_SIZE,
            payload: {
                id: id,
                width: width,
                height: height,
            }
        };
    }

    /**
     * Update existing widget position
     *
     * @param {Number} reportId
     * @param {Number} x
     * @param {Number} y
     * @return {Object}
     */
    exports.AR.Actions.updateWidgetPosition = function(id, x, y) {
        return {
            type: AR.Constants.UPDATE_WIDGET_POSITION,
            payload: {
                id: id,
                x: x,
                y: y,
            }
        };
    }

    exports.AR.Actions.deleteWidget = function(id) {
        return function(dispatch, getState) {
            // Find reportId by widgetId
            var state = getState();
            var widget = state.widgets.find(function(widget) {
                return widget.id == id
            })

            dispatch({
                type: AR.Constants.DELETE_WIDGET,
                payload: {
                    id: id,
                    reportId: widget.reportId
                }
            })
        }

    }

})(this);