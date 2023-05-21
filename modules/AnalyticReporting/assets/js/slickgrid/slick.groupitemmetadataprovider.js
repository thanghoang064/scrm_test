(function ($) {
  $.extend(true, window, {
    Slick: {
      Data: {
        GroupItemMetadataProvider: GroupItemMetadataProvider
      }
    }
  });


  /***
   * Provides item metadata for group (Slick.Group) and totals (Slick.Totals) rows produced by the DataView.
   * This metadata overrides the default behavior and formatting of those rows so that they appear and function
   * correctly when processed by the grid.
   *
   * This class also acts as a grid plugin providing event handlers to expand & collapse groups.
   * If "grid.registerPlugin(...)" is not called, expand & collapse will not work.
   *
   * @class GroupItemMetadataProvider
   * @module Data
   * @namespace Slick.Data
   * @constructor
   * @param options
   */
  function GroupItemMetadataProvider(options) {
    var _grid;
    var _defaults = {
      groupCssClass: "slick-group",
      groupTitleCssClass: "slick-group-title",
      totalsCssClass: "slick-group-totals",
      groupFocusable: true,
      totalsFocusable: false,
      toggleCssClass: "slick-group-toggle",
      toggleExpandedCssClass: "expanded",
      toggleCollapsedCssClass: "collapsed",
      enableExpandCollapse: true,
      groupFormatter: defaultGroupCellFormatter,
      totalsFormatter: defaultTotalsCellFormatter
    };

    options = $.extend(true, {}, _defaults, options);

    /**
     * Check if this column have selected aggreagates
     */
    function isAggregatedField(column, field, isCrosstab) {
      fields = [];
      var key;
      for(key in aggregatesDefinitions){
        fields.push(field+aggregatesDefinitions[key]['namePostfix']);

      }
      // For each of fields compare is with v prefix or not
      for(var i = 0; i < fields.length; i++) {
          var remains = column.replace(fields[i], '');

          // Crosstab have v1_SalesOrder_SubTotal_sum
          if(isCrosstab) {
            var end = remains.match(/v[0-9]+_/);
            if(remains !== column && end) {
              return true;
            }
          // Normal have SalesOrder_SubTotal_sum
          } else {
            if(remains !== column) {
              return true;
            }
          }
      }

      return false;
    }


    function defaultGroupCellFormatter(row, cell, value, columnDef, item) {

      // #3576 [start] - Get aggregates
      // @FIX - there should be only array, not groupingManager
      // Get aggregates
      var aggregates = options.groupingManager.get("aggregates");
      // #3576 [end]

      // #3576 [start] - If grouping have totals, show them in the same row level as groping expand/collapse 
      // For each cell, search for aggregates, if it have aggregate, return right total formatter
      for(var i = 0; i < aggregates.length; i++){

        // Multi level Summary report have different field names (with postfixes)
        if(options.multiSummaryReport) {
          if(isAggregatedField(columnDef.field, aggregates[i].selectedField, options.isCrosstab) ){
            return (columnDef.groupTotalsFormatter && columnDef.groupTotalsFormatter(item.totals, columnDef)) || "";
          }
        }

        // Standart detailed report have the same field names
        if(columnDef.field == aggregates[i].selectedField) { // #3622 - Changed to field attribute
          // If this column have no totals, show empty
          if(!item.totals) {
            // return ''; #3576 - If set, then, when group is in third level, no totals is shown
          }

          // Return summed and formated total for column
          return (columnDef.groupTotalsFormatter && columnDef.groupTotalsFormatter(item.totals, columnDef)) || "";
        }
      }

      // Search for grouping toggle for it's place
      var found = -1;
      for(var i = 0; i < options.groups.length; i++){
        // If column name is the same as group name, then mark as found place
        if(columnDef.field == options.groups[i].name) { // #3622 - Changed to field attribute
          // Found must be set as the grouping order
          found = i;
          break;   
        }
      }

      // If not found place for grouping expand/collapse and level is not the same as item level, then make empty cell
      // Crosstab have different levelings
      if(options.isCrosstab) {
        if(found !=item.level+1){
        	// Grand total row is not grouped, because such exception
			if(!(item.totals && item.totals.grandTotals && item.totals.grandTotals.noGrouping)) {
	          // All columns, which is not grouped, should be empty
	          return ""
        	}
        }
      } else {
        // Include details and normal multi level summary 
        if(found < 0 || item.level !== found){
			// Grand total row is not grouped, because such exception
			if(!(item.totals && item.totals.grandTotals && item.totals.grandTotals.noGrouping)) {
          		// All columns, which is not grouped, should be empty
          		return "";
          	}
        }
        // #3576 [end]
      }
      

      if (!options.enableExpandCollapse) {
        return item.title;
      }

      // #3576 [start] - Show grand total label for grand total grouping cell
      if(item.rows[0].noGrouping) {
        // Set grand total label cell as predefined text
        var grandTotalLabelValue = options.grandTotalLabel;

        // If grand total label cell have data, then return data instead of predefined text
        if(item.rows[0][columnDef.field]) {
          grandTotalLabelValue = item.rows[0][columnDef.field];
        } else {
        	// If not set such column in totals row, then
        	// return blank string
        	return "";
        }
        
        return "<strong>"+grandTotalLabelValue+"</strong>";
      }
      // #3576 [end]

      // #3576 [start] - As we show each group toggle in the same place as cell, we don't need intendation;
      //var indentation = item.level * 15 + "px";
      var indentation = "0px";
      // #3576 [end]

      return "<span class='" + options.toggleCssClass + " " +
          (item.collapsed ? options.toggleCollapsedCssClass : options.toggleExpandedCssClass) +
          "' style='margin-left:" + indentation +"'>" +
          "</span>" +
          "<span class='" + options.groupTitleCssClass + "' level='" + item.level + "'>" +
            item.title +
          "</span>";
    }

    function defaultTotalsCellFormatter(row, cell, value, columnDef, item) {
      return (columnDef.groupTotalsFormatter && columnDef.groupTotalsFormatter(item, columnDef)) || "";
    }


    function init(grid) {
      _grid = grid;
      _grid.onClick.subscribe(handleGridClick);
      _grid.onKeyDown.subscribe(handleGridKeyDown);
      _grid.onHeaderClick.subscribe(handleHeaderClick); // #3622 - assign binding

    }

    function destroy() {
      if (_grid) {
        _grid.onClick.unsubscribe(handleGridClick);
        _grid.onKeyDown.unsubscribe(handleGridKeyDown);
        _grid.onHeaderClick.unsubscribe(handleHeaderClick); // #3622 - clear binding
      }
    }

    // #3622 [start] - When clicked on header expand/collapse grouped sign
    function handleHeaderClick(e, args) {
      // Check if clicked item is expand/collapse item
      var hasExpandCollapse = $(e.target).hasClass(options.toggleCssClass);
      if(hasExpandCollapse) {
        // Get grouping level
        var level = $(e.target).attr("level");

        // This block must be here? (copied from handleGridClick)
        var range = _grid.getRenderedRange();
        this.getData().setRefreshHints({
          ignoreDiffsBefore: range.top,
          ignoreDiffsAfter: range.bottom
        });

        // Collapse or expand?
        if($(e.target).hasClass(options.toggleExpandedCssClass)) {
          // Collapse groups by level
          this.getData().collapseAllGroups(level);
        } else if($(e.target).hasClass(options.toggleCollapsedCssClass)) {
          // Expand groups by level
          this.getData().expandAllGroups(level);
        }
        
        e.stopImmediatePropagation();
        e.preventDefault();
      } 
    }
    // #3622 [end]

    function handleGridClick(e, args) {
      var item = this.getDataItem(args.row);
      if (item && item instanceof Slick.Group && $(e.target).hasClass(options.toggleCssClass)) {
        var range = _grid.getRenderedRange();
        this.getData().setRefreshHints({
          ignoreDiffsBefore: range.top,
          ignoreDiffsAfter: range.bottom
        });

        if (item.collapsed) {
          this.getData().expandGroup(item.groupingKey);
        } else {
          this.getData().collapseGroup(item.groupingKey);
        }

        e.stopImmediatePropagation();
        e.preventDefault();
      }
    }

    // TODO:  add -/+ handling
    function handleGridKeyDown(e, args) {
      if (options.enableExpandCollapse && (e.which == $.ui.keyCode.SPACE)) {
        var activeCell = this.getActiveCell();
        if (activeCell) {
          var item = this.getDataItem(activeCell.row);
          if (item && item instanceof Slick.Group) {
            var range = _grid.getRenderedRange();
            this.getData().setRefreshHints({
              ignoreDiffsBefore: range.top,
              ignoreDiffsAfter: range.bottom
            });

            if (item.collapsed) {
              this.getData().expandGroup(item.groupingKey);
            } else {
              this.getData().collapseGroup(item.groupingKey);
            }

            e.stopImmediatePropagation();
            e.preventDefault();
          }
        }
      }
    }

    // #3576 [start] - Modify grouping row so the totals is on this row
    // function getGroupRowMetadata(item) {
    //   return {
    //     selectable: false,
    //     focusable: options.groupFocusable,
    //     cssClasses: options.groupCssClass,
    //     columns: {
    //       0: {
    //         colspan: "*",
    //         formatter: options.groupFormatter,
    //         editor: null
    //       }
    //     }
    //   };
    // }

    // Will remove colsapn and allow to merge total rows
    function getGroupRowMetadata(item) {
      // Set grouping row params
      var groupingRow = {
        selectable: false,
        focusable: options.groupFocusable,
        cssClasses: options.groupCssClass,
        columns: {}
      };

      // For each column in grouping row
      for(var i = 0; i < options.columns.length; i++){
        // Set grouping row column params
        groupingRow.columns[i] = {
          formatter: options.groupFormatter,
          editor: null,
        };

        // Set groupFormatter only for cells where group name is equal to column name
        // for(var j = 0; j < options.groups.length; j++) {
        //   if(options.columns[i].field == options.groups[j].name) {
        //     groupingRow.columns[i].formatter = options.groupFormatter;
        //     continue;
        //   }
        // }
      }

      return groupingRow;
    }
    // #3576 [end]

    function getTotalsRowMetadata(item) {
      return {
        selectable: false,
        focusable: options.totalsFocusable,
        cssClasses: options.totalsCssClass,
        formatter: options.totalsFormatter,
        editor: null
      };
    }


    return {
      "init": init,
      "destroy": destroy,
      "getGroupRowMetadata": getGroupRowMetadata,
      "getTotalsRowMetadata": getTotalsRowMetadata
    };
  }
})(jQuery);