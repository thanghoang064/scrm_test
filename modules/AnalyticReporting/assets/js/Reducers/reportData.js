"use strict";

var AR = AR || {};
AR.Reducers = AR.Reducers || {};

(function(exports) {

    /**
     * Add object to ID index
     *
     * @return {Object}
     */
    function addReportData(state, action) {
        var reportId = action.payload.reportId;
        var data = action.payload.data;

        return Object.assign({}, state, {
            // TODO: Tricky part, possible, that computed properties are not available (polyfill?)
            [reportId]: data
        })
    }

    /**
     * Store all indexed object IDs
     *
     * @return {Array}
     */
    function allReportDataIds(state = [], action) {
        return [].concat(state);
        // return ["12321","123123","34343"]
    }

    function reportDataById(state = {}, action) {
        switch (action.type) {

            /**
             * Load widgets after fetching
             *
             * @return {object}
             */
            case AR.Constants.FETCH_WIDGET_DATA_SUCCESS:
                // Create index by reportId
                return addReportData(state, action);

            /**
             * Delete indexed object by ID
             *
             * @return {Object}
             */
            case AR.Constants.DELETE_WIDGET:
                var newState = Object.assign({}, state);

                delete newState[action.payload.id]

                return newState;

            /**
             * Default
             *
             * @return {Object}
             */
            default:
                return Object.assign({}, state);
        }
    }

    // Combine all reducers into one
    exports.AR.Reducers.reportData = Redux.combineReducers({
        byId: reportDataById,
        allIds: allReportDataIds
    })

})(this);