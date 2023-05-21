"use strict";

var AR = AR || {};
AR.Reducers = AR.Reducers || {};

(function(exports) {

    var initialState = []

    exports.AR.Reducers.dashboard = function(state = initialState, action) {
        switch (action.type) {
            /**
             * Set widget fetching status when widgets start to load
             *
             * @return {Object}
             */
            case AR.Constants.FETCH_DASHBOARD_WIDGETS_INIT:
                var newState = Object.assign({}, state);

                newState.isFetching = true;

                return newState;

            /**
             * Set widget fetching status when widgets successfully loaded
             *
             * @return {Object}
             */
            case AR.Constants.FETCH_DASHBOARD_WIDGETS_SUCCESS:
                var newState = Object.assign({}, state);

                newState.isFetching = false;

                return newState;

            /**
             * Set widget fetching status when widgets failed to load
             *
             * @return {Object}
             */
            case AR.Constants.FETCH_DASHBOARD_WIDGETS_FAILURE:
                var newState = Object.assign({}, state);

                newState.isFetching = false;

                return newState;

            /**
             * Toggle dashboard edit mode status
             *
             * @return {Object}
             */
            case AR.Constants.TOGGLE_EDIT_MODE:
                var newState = Object.assign({}, state);

                newState.editMode = !newState.editMode || false;

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

})(this);