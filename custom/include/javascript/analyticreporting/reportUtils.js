var reportUtils = {
    /**
     * Return unique id, used for id element numbering
     */
    uniqueId: function () {
        return _.uniqueId();
    },
    
    appendDateGrouping: function (data,item) {
        if(typeof data.cols[item] == "undefined"){
            if(typeof data.cols[item + "_year"]!=="undefined"){
                item = item + "_year";
            }
            else if(typeof data.cols[item + "_quarter"]!=="undefined"){
                item = item + "_quarter";
            }
            else if(typeof data.cols[item + "_quarterAndYear"]!=="undefined"){
                item = item + "_quarterAndYear";
            }
            else if(typeof data.cols[item + "_month"]!=="undefined"){
                item = item + "_month";
            }
            else if(typeof data.cols[item + "_monthAndYear"]!=="undefined"){
                item = item + "_monthAndYear";
            }
            else if(typeof data.cols[item + "_week"]!=="undefined"){
                item = item + "_week";
            }
            else if(typeof data.cols[item + "_weekAndYear"]!=="undefined"){
                item = item + "_weekAndYear";
            }
            else if(typeof data.cols[item + "_day"]!=="undefined"){
                item = item + "_day";
            }
        }
        return item;
    },
    generateFieldsByNameFromBlocks:function(blocks){
        var r = {};
        for(var i = 0; i<blocks.length; i++){
            for(var j = 0; j<blocks[i].fields.length; j++){
                r[blocks[i].fields[j].name] = blocks[i].fields[j];
            }
        }
        return r;
    },

    isMultiSummaryReport: function(aggregates,groups, includeDetails,isCrosstab) {
        isCrosstab = isCrosstab || false;
        // Found aggregates in level
        var hasInLevel          = [];
        for(var i = 0; i < groups.length; i++) {
            var _group          = groups[i];
            var _aggregates     = _group.showAggregates;

            // If crosstab, then ignore groups with position column
            if(_group.position == 'column' && isCrosstab) {
                continue;
            }

            for(var j = 0; j < aggregates.length; j++) {
                // Sum, count, etc
                var _aggregateList = _aggregates[aggregates[j].selectedField];
                if(!_aggregateList) {
                    continue;
                }

                // Aggregate found in level
                var foundInLevel = false;


                // Check for min, max, sum, count, avg
                if(_aggregateList.min) {
                    foundInLevel = true;
                }
                if(_aggregateList.max) {
                    foundInLevel = true;
                }
                if(_aggregateList.sum) {
                    foundInLevel = true;
                }
                if(_aggregateList.count) {
                    foundInLevel = true;
                }
                if(_aggregateList.avg) {
                    foundInLevel = true;
                }

                // If found in level aggregate
                if(foundInLevel) {
                    hasInLevel.push(true);
                }
            }
        }

        // If not included details
        if(!includeDetails) { // #3840 - Added negation, because in multilevel reports should show all groups
            // Remove last item
            hasInLevel.pop();
        }

        // If found at least one aggregate
        if(hasInLevel.length > 0)  {
            return true;
        }

        return false;
    },
    convertToJSONPost: function(data,nonJSONKeys){
        var r = {};
        nonJSONKeys = nonJSONKeys || [];
        var keys = Object.keys(data);
        for(var i = 0; i<keys.length; i++){
            if(nonJSONKeys.indexOf(keys[i])== -1){
                r[keys[i]] = JSON.stringify(data[keys[i]]);
            }
            else{
                r[keys[i]] = data[keys[i]];
            }
        }
        return r;
    },
    
    /**
     * Parse group names with date grouping and combined reports
     */
    getAvailableGroups: function (reportData, groups, fieldsByName) {
        var availableGroups = [];

        // Allow only group and groupsort
        for(var i = 0; i < groups.length; i++) {
            // Date grouping was already added in avaliableAxis group merging
            if(['group', 'groupsort', 'nogroup'].indexOf(groups[i].sortAction) != -1){
                // Deep copy current group object, so we can make changes in it                 
                var _group = jQuery.extend(true, {}, groups[i]);
                // Add special title and for grouped elements, so we can identify by unique postfix
                var fieldName = _group.aggregate;

                if(fieldsByName[fieldName]) {
                    _group.title = fieldsByName[fieldName].title;   
                }

                if(_group.dateGrouping) {
                    _group.title += " " + reportData.dictionary["label_" + reportUtils.toSnakeCase(_group.dateGrouping)];
                    _group.name = fieldName + "_" + _group.dateGrouping;
                }
                availableGroups.push(_group);
            }
        }
        if(reportData.options.isCombined){
            availableGroups.unshift({
                "name":"date_field",
                "title":reportData.dictionary.label_date,
                "showAggregates":{},
                "sortAction":"group",
                "sortDirection":"DESC",
                "aggregate":"",
                "position":"",
                "dateGrouping":""
            });
        }
        
        // Filter unique values
        availableGroups = _.uniq(availableGroups, function(object) { 
            return object.name; 
        });

        return availableGroups;
    },


    makeAvailableFields: function (blocks) {
        var tmpFields = [];
        for(var i = 0; i<blocks.length; i++){
            for(var j = 0; j<blocks[i].fields.length; j++){
                tmpFields.push(blocks[i].fields[j]);
            }
        }

        return tmpFields;
    },

    makeFieldsByName: function(blocks) {
        var r = {};
        for(var i = 0; i<blocks.length; i++){
            for(var j = 0; j<blocks[i].fields.length; j++){
                r[blocks[i].fields[j].name] = blocks[i].fields[j];
            }
        }

        return r;
    },

    // Get one aggregate item if is aggregate
    getAggregate: function(name, aggregates) {
        var found = false;
        
        // Search all aggregates
        for(var i = 0; i < aggregates.length; i++) {
            if(aggregates[i].value.min) {
                if(aggregates[i].selectedField + '_min' == name) {
                    found = true;
                }
            }
            if(aggregates[i].value.max) {
                if(aggregates[i].selectedField + '_max' == name) {
                    found = true;
                }
            }
            if(aggregates[i].value.sum) {
                if(aggregates[i].selectedField + '_sum' == name) {
                    found = true;
                }
            }
            if(aggregates[i].value.avg) {
                if(aggregates[i].selectedField + '_avg' == name) {
                    found = true;
                }
            }
            if(aggregates[i].value.count) {
                if(aggregates[i].selectedField + '_cnt' == name) {
                    found = true;
                }
            }

            // If found aggregate by this name, return it's object
            if(found) {
                return aggregates[i];
            }

        }
    },

    // Get one group item if it is group
    getGroup: function(name, groups) {
        // Search all groups
        for(var i = 0; i < groups.length; i++) {
            // #5762 - Compare xAxis name with grouping name with added date grouping postfix
            var groupName = groups[i].name;
            if(groups[i].dateGrouping) {
                groupName += "_" + groups[i].dateGrouping;
            }

            // Date grouped or plain group name comparisation
            if(groupName == name || groups[i].name == name) {
                return groups[i];
            }
        }
    },

    // Get object key by value
    findKey: function(obj, value){
        for(var key in obj){
            if(obj[key] == value) {
                return key;
            }
        }

        return null;
    },

    /**
     * Returns array of unique string values
    */
    unique: function(list) {
        var result = [];
        jQuery.each(list, function(i, e) {
            if (jQuery.inArray(e, result) == -1) result.push(e);
        });

        return result;
    },

    /**
     * #5762
     * Transform string from camelCase to snake_case
     */
    toSnakeCase: function(s) {
        return s.replace(/([A-Z])/g, function($1){
            return "_" + $1.toLowerCase();
        });
    },

    /**
     * #6494
     * Transform string to Title Case
     */
    toTitleCase: function(s) {
        return s.replace(/\w\S*/g, function(txt){
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        });
    },

    // Shared data normalisation
    // TODO: Must refactor this piece of heck
    setFieldsByName: function(reportData) {
        if(reportData.options.isCombined) {
            // Set moduleId for each field for combined reports
            for(var i = 0; i < reportData.availableFields.length; i++) {
                for(var j = 0; j < reportData.availableFields[i].fields.length; j++) {
                    reportData.availableFields[i].fields[j].moduleId = reportData.availableFields[i].fields[j].name.split("_")[0];
                }
            }
            for(var i = 0; i < reportData.selectableFields.length; i++) {
                for(var j = 0; j < reportData.selectableFields[i].fields.length; j++) {
                    reportData.selectableFields[i].fields[j].moduleId = reportData.selectableFields[i].fields[j].name.split("_")[0];
                }
            }

            // #5382 - After saving combined report, remove first level grouping elements from common grouping
            reportData.fieldGroupingSorting = reportData.fieldGroupingSorting.filter(function (el) {
                return el.showAggregates !== undefined;
            });
        }

        var availableFields = [];
        // Quifix: this was called from index where the properties are not present, thus the else condition was always called with bad data
        if(typeof reportData.options.isCombined !== "undefined"){
            if(reportData.options.isCombined) {
                availableFields = reportUtils.makeAvailableFields(reportData.selectableFields);
                reportData.fieldsByName = reportUtils.makeFieldsByName(reportData.selectableFields);
            } else {
                availableFields = reportUtils.makeAvailableFields(reportData.availableFields);
                reportData.fieldsByName = reportUtils.makeFieldsByName(reportData.availableFields);
            }
        }

        return reportData;
        // return availableFields;       
    },

};

var NumberFormatter = function(settings,aggregates){
    var options = jQuery.extend({},{"format":"","seperator":"'",decimal:".", "numdec":2},settings); // #5879 add option to specify decimal digits
    this.format = options.format;
    this.decimal = options.decimal;
    this.seperator = options.seperator;
    this.aggregates = aggregates;
    this.numdec = options.numdec;
};
NumberFormatter.prototype.format = "";
NumberFormatter.prototype.decimal = ".";
NumberFormatter.prototype.seperator = "'";
NumberFormatter.prototype.makeFormatter = function(){
    var that = this;
    switch (this.format){
        case "123,456,789":
            return function(row, cell, val, columnDef, dataContext) {
                if(val == null){
                    return "";
                }
                // Return raw if is not number
                if(!that.isNumber(val)) {
                    return val;
                }
                if(val.length && !val[0].match("[0-9]")){
                    return val;
                }

                val = (Math.round(parseFloat(val) * 100 ) / 100).toFixed(that.numdec);

                var t = val.split(".");
                var dec = "";
                if(t.length>1){
                    dec = that.decimal+ t[1];
                }
                if(t[0].length>3){//no need to call anything for <3 digits
                    t[0] = that.by3(t[0]);
                }
                return t[0] + dec;
            };
            break;
        case "12,34,56,789":
            return function(row, cell, val, columnDef, dataContext) {
                if(val == null){
                    return "";
                }
                // Return raw if is not number
                if(!that.isNumber(val)) {
                    return val;
                }
                if(val.length && !val[0].match("[0-9]")){
                    return val;
                }

                val = (Math.round(parseFloat(val) * 100 ) / 100).toFixed(that.numdec);

                var t = val.split(".");
                var dec = "";
                if(t.length>1){
                    dec = that.decimal+ t[1];
                }
                if(t[0].length>3){//no need to call anything for <3 digits
                    t[0] = that.by3then2(t[0]);
                }
                return t[0] + dec;
            };
            break;
        case "123456,789":
            return function(row, cell, val, columnDef, dataContext) {
                if(val == null){
                    return "";
                }
                // Return raw if is not number
                if(!that.isNumber(val)) {
                    return val;
                }
                if(val.length && !val[0].match("[0-9]")){
                    return val;
                }

                val = (Math.round(parseFloat(val) * 100 ) / 100).toFixed(that.numdec);

                var t = val.split(".");
                var dec = "";
                if(t.length>1){
                    dec = that.decimal+ t[1];
                }
                if(t[0].length>3){//no need to call anything for <3 digits
                    t[0] = that.first3(t[0]);
                }
                return t[0] + dec;
            };
            break;
        case "123456789":
        default:
            return function(row, cell, val, columnDef, dataContext) {
                if(val == null){
                    return "";
                }
                // Return raw if is not number
                if(!that.isNumber(val)) {
                    return val;
                }
                if(val.length && !val[0].match("[0-9]")){
                    return val;
                }

                val = (Math.round(parseFloat(val) * 100 ) / 100).toFixed(that.numdec);

                var t = val.split(".");
                var dec = "";
                if(t.length>1){
                    dec = that.decimal+ t[1];
                }
                if(t[0].length>3){//no need to call anything for <3 digits
                    t[0] = that.noFormat(t[0]);
                }
                return t[0] + dec;
            };
            break;
    }

    //end return
};

NumberFormatter.prototype.noFormat = function(v){
    return v;
};
NumberFormatter.prototype.by3 = function(v){
    var t = v.split("").reverse();
    var r = [];
    for(var i = 1; i< t.length; i++){// note: skips 1st digit to avoid decimal seperator in the beginning
        r.push(t[i-1]);
        if(i % 3 ==0){
            r.push(this.seperator);
        }
    }
    r.push(t[t.length-1]);//add 1st digit as it is ignored by upper loop to avoid decimal seperator in the beginning
    return r.reverse().join("");
};
NumberFormatter.prototype.by3then2 = function(v){
    var t = v.split("").reverse();
    var r = [];
    for(var i = 1; (i< t.length && i<4); i++){// note: skips 1st digit to avoid decimal seperator in the beginning
        r.push(t[i-1]);
        if(i % 3 ==0){
            r.push(this.seperator);
        }
    }
    for(var i = 4; i< t.length; i++){// note: skips 1st digit to avoid decimal seperator in the beginning
        r.push(t[i-1]);
        if((i-4) && ( ((i-1) % 2) ==0) ){// move period off by 2, apply for 2nd+place as 1st seperator is handled by 1st loop
            r.push(this.seperator);
        }
    }
    r.push(t[t.length-1]);//add 1st digit as it is ignored by upper loop to avoid decimal seperator in the beginning
    return r.reverse().join("");
};
NumberFormatter.prototype.first3 = function(v){
    var t = v.split("");
    var r = t.splice(-3,3);
    if(t.length>0){
        r = t.join("") + this.seperator + r.join("");
    }//else less than 4 digits, r contains all the digits
    return r;
};
// Check if string is numeric
NumberFormatter.prototype.isNumber = function(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

/**
 * #3948
 * Validate xAxis on change
 * If xAxis is something that is not set in the availableGroups, then
 * set it as first available
 */
// var validateXAxis = function(xAxis){
//     var availableGroups = this.get("getAvailableGroups");

//     // Check if xAxis is in availableGroups, if not, set to first available
//     var foundAvailabeXAxis = false;
//     for(var i = 0; i < availableGroups.length; i++) {
//         // Check if set xAxis is available
//         if(xAxis == availableGroups[i].name) {
//             foundAvailabeXAxis = true;
//             break;
//         }
//     }

//     // If set xAxis is not available, use first available xAxis from availableGroups
//     var result = xAxis;
//     if(!foundAvailabeXAxis) {
//         //console.log("xAxis set from ", result, " to ", availableGroups[0].name);
//         if(availableGroups.length > 0){
//           result = availableGroups[0].name;
//           this.set("xAxis", result);
//         }
//     }

//     ReportData.chartAxisX = result;
// }