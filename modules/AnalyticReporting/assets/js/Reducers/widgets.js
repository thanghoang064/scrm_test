"use strict";

var AR = AR || {};
AR.Reducers = AR.Reducers || {};

(function(exports) {

    var initialState = []


    /**
     * RFC4122 version 4 compliant solution for generating UUID
     *
     * @returns {string}
     */
    function getUUID() {
        var pattern = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx';
        var uid = pattern.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });

        return uid;
    }

    exports.AR.Reducers.widgets = function(state = initialState, action) {

        switch (action.type) {

            /**
             * Load widgets to widgets data store after success
             *
             * @return {Array}
             */
            case AR.Constants.FETCH_DASHBOARD_WIDGETS_SUCCESS:
                return [].concat(action.payload.widgets)

            /**
             * Add widget to widget data store
             *
             * @return {Array}
             */
            case AR.Constants.ADD_WIDGET:
                var newState = [].concat(state);

                newState = [].concat(newState, {
                    id: getUUID(), // Generate unique id
                    dashboardId: action.payload.dashboardId,
                    reportId: action.payload.reportId,
                    name: "---",
                    x:0,
                    y:0,
                    width:2,
                    height:2
                })

                return newState;

            /**
             * Update widget size
             *
             * @return {Array}
             */
            case AR.Constants.UPDATE_WIDGET_SIZE:
                var newState = [].concat(state);

                newState.map(function(element) {
                    if(element.id == action.payload.id ) {
                        element.width = action.payload.width;
                        element.height = action.payload.height;
                    }
                    return element
                });
                return newState

            /**
             * Update widget position in grid
             *
             * @return {Array}
             */
            case AR.Constants.UPDATE_WIDGET_POSITION:
                var newState = [].concat(state);

                newState.map(function(element) {
                    if(element.id == action.payload.id ) {
                        element.x = action.payload.x;
                        element.y = action.payload.y;
                    }
                    return element
                });
                return newState

            /**
             * Delete widget from store
             *
             * @return {Array}
             */
            case AR.Constants.DELETE_WIDGET:
                var newState = [].concat(state);

                return newState.filter(function(element) {
                    return element.id !== action.payload.id
                });

            /**
             * Default
             *
             * @return {Array}
             */
            default:
                return [].concat(state);
        }
    }


})(this);