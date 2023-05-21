<script src="modules/{$moduleName}/assets/js/jquery/jquery-1.8.3.min.js"></script>
<script src="modules/{$moduleName}/assets/js/legacy/startwith.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
</script>


<script src="modules/{$moduleName}/assets/js/jstree/jstree.min.js"></script>
<script src="modules/{$moduleName}/assets/js/jstree/jstreegrid.min.js"></script>

<script src="modules/{$moduleName}/assets/js/jquery-ui/jquery-ui.min.js"></script>
<link href="modules/{$moduleName}/assets/css/jquery-ui/redmond/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />

<script src="modules/{$moduleName}/assets/js/ractive/Ractive.min.js"></script>

<link href="modules/{$moduleName}/assets/css/jquery.select2.css" rel="stylesheet" type="text/css" media="all" />
<link href="modules/{$moduleName}/assets/css/jstree/style.min.css" rel="stylesheet" type="text/css" media="all"  />
<link href="modules/{$moduleName}/assets/css/{$moduleName}.css" rel="stylesheet" type="text/css" media="all" />
<style>
{literal}
.jstree-grid-wrapper {
    border-collapse: collapse;
    border:1px solid #ddd;
}
.jstree-grid-table *{
    vertical-align: top !important;
}
.jstree-grid-header-cell {
    text-align:left;
    font-size:11px;
    border-bottom:1px solid #ddd;
    border-right:1px solid #ddd;
    padding:5px;
    font-weight: bold;
    white-space:nowrap;
    color:#333;
    background: #fff;
    background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
    background: -moz-linear-gradient(top,  #fff,  #ededed);
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');
}
.jstree-grid-column:last-child > .jstree-grid-header-cell {
    border-right:none;
}
.jstree-grid-header-cell > a {
    font-size:11px !important;
    font-weight: normal !important;
}

.jstree-grid-separator {
    display:none;
}

.jstree-anchor,.jstree-grid-cell {
	text-overflow:ellipsis !important;
	white-space:nowrap !important;
	overflow:hidden !important;
}
{/literal}
</style>
<script>
var del_rep = {$DELETABLE_REPORTS|@json_encode};//#3879 - array of reports that the current user is able to move between folders
var translated_labels = {$DICTIONARY}; // #5286 - Refactored to JSON object

</script>
{* Include underscore.js and Ractive.js templates *}
{include file="modules/$moduleName/templates/templates.tpl"}
<script>
{literal}
var ReportData = {
	options: {
		includeDetails: false
	},
	{/literal}
    reportAccessUsers:{$REPORTACCESSUSERS},
    reportScheduleUsers:{$REPORTSCHEDULEUSERS},
    users:{$REPORTUSERS},
    {literal}
}
{/literal}
</script>
<script src="modules/{$moduleName}/assets/js/underscore.js"></script>
<script src="modules/{$moduleName}/assets/js/jquery/jquery.select2.min.js"></script>
<script src="modules/{$moduleName}/assets/js/ractive/ractive-decorators-select2.min.js"></script>
<!-- env:dev --#>
<script src="modules/{$moduleName}/assets/js/components/app.js"></script>
<script src="modules/{$moduleName}/assets/js/components/reports/shared.js"></script>
<script src="modules/{$moduleName}/assets/js/components/shared.js"></script>
<script src="modules/{$moduleName}/assets/js/components/reportManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/accessManager.js"></script>
<script src="modules/{$moduleName}/assets/js/components/manager/scheduleManager.js"></script>
<!-- env:dev:end -->
<!-- env:prod -->
<script src="modules/{$moduleName}/assets/js/main.min.js"></script>
<!-- env:prod:end -->
<script>
function pop_include_details() {ldelim}
	newwindow2=window.open('','name','height=140,width=580');
	var tmp = newwindow2.document;
	tmp.write('<html><head><title>Include Details Help</title>');
	tmp.write('</head><body>');
	tmp.write('<p>'+translated_labels.label_to_create_new+'</p>');
	tmp.write('</ body></html>'); // #4470 - Added whitespace in closing body tag, so csrf-magic will not add tokens and kill JS
	tmp.close();
{rdelim}
//#4391 [end]
{literal}

function toggleVisible(show) {
	var location = window.location.href;
	location = location.replace("&showHidden=true","");
	location = location.replace("#toggleVisible","");
	if(show) {
		location = location + "&showHidden=true";
	}
	
	window.location.href = location;
}

//#5722 [START] Highlight search results
function highlightResults(highlight){
	var highlights = highlight.split(" ");
	highlights = highlights.filter(function(value){return value.length>0;});
	highlights = highlights.join("|");
	var re = new RegExp(highlights, "gi");
	var titles = document.getElementsByClassName("reportTreeTitle");
	var descriptions = document.getElementsByClassName("reportTreeDescription");
	for(var i = 0, l = titles.length; i<l; i++){
		titles[i].innerHTML = titles[i].innerHTML.replace(re, function(x){return '<span class="highlight">'+x+'</span>'});
		if(descriptions[i]!=undefined){
			descriptions[i].innerHTML = descriptions[i].innerHTML.replace(re, function(x){return '<span class="highlight">'+x+'</span>'});
		}
	}
}
//#5722 [END]

/**
 * RFC4122 version 4 compliant solution for generating UUID
 *
 * @returns {string}
 */
function getUUID () {
    var pattern = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx';
    var uid = pattern.replace(/[xy]/g, function(c) {
        var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
        return v.toString(16);
    });

    return uid;
}

// jsTree context menu
function contextMenu(node) {
    // Only for categories
    if (node.type !== 'category') {
        return;
    }

    // The default set of all items
    var items = {
        createDashboard: {
            label: "{/literal}{$MOD.label_add_dashboard}{literal}",
            action: function () {
                var categoryId = node.id.replace("c_","");
                var dashboardId = getUUID();
                var urlCreate = "{/literal}{$urls.withoutAction}{literal}createDashboard&dashboardId="+dashboardId+"&categoryId=" + categoryId;
                var urlRedirect = "{/literal}{$urls.withoutAction}{literal}dashboard&record="+dashboardId;

                var options = {
                    method: 'GET',
                    credentials: "same-origin",
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                };

                SUGAR.ajaxUI.showLoadingPanel();
                window.fetch(urlCreate, options)
                    .then(function (response) {
                        SUGAR.ajaxUI.hideLoadingPanel();
                        window.location = urlRedirect;
                    })
                    .catch(function (error) {
                        SUGAR.ajaxUI.hideLoadingPanel();
                        console.log(error);
                    })
            }
        },
        repairReportPositions: {
            separator_before: true,
            label: "Repair report positions",
            action: function() {
                var saveCategoryUrl = "{/literal}{$urls.saveCategoryUrl}{literal}";
                var categoryId = node.id.replace("c_","");

                var newData = {
                    _action: 'repairReports',
                    parentId: categoryId,
                };
                // Send to server
                jQuery.post(saveCategoryUrl, newData, function(response){
                    window.location.reload();
                });
            }
        },
        repairCategoriesPositions: {
            label: "Repair categories positions",
            action: function() {
                var saveCategoryUrl = "{/literal}{$urls.saveCategoryUrl}{literal}";
                var categoryId = node.id.replace("c_","");

                var newData = {
                    _action: 'repairCategories',
                    parentId: categoryId,
                };
                // Send to server
                jQuery.post(saveCategoryUrl, newData, function(response){
                    window.location.reload();
                });
            }
        },
        repairRootPostions: {
            label: "Repair root positions",
            action: function() {
                var saveCategoryUrl = "{/literal}{$urls.saveCategoryUrl}{literal}";

                var newData = {
                    _action: 'repairCategories',
                    parentId: 0,
                };
                // Send to server
                jQuery.post(saveCategoryUrl, newData, function(response){
                    window.location.reload();
                });
            }
        }
    };

    return items;
}

jQuery(function() {
	// URL for saving category
	var saveCategoryUrl = "{/literal}{$urls.saveCategoryUrl}{literal}";
	var massScheduleUrl = "{/literal}{$urls.massScheduleUrl}{literal}";
	var exportReportsUrl = "{/literal}{$urls.exportReportsUrl}{literal}";

	// Report tree JSON data
	var treeData = {/literal}{$REPORTTREE}{literal};
	var highlight = "{/literal}{$SEARCHCRITERIA}{literal}";

    var reportTreeAdminAccess = {/literal}{$reportTreeAdminAccess}{literal};
    var isAdmin = {/literal}{$ISADMIN}{literal};

    var tools_add = '';
    var jsTreePlugins = ["grid", "state", "types", "checkbox", "contextmenu"];
    if(isAdmin || !reportTreeAdminAccess) {
        jsTreePlugins.push("dnd"); // Add Drag-and-Drop
        var tools_add = '{/literal}<a href="{$urls.toggleVisible}" onclick="toggleVisible({$TOGGLEHIDDEN});" style="color:blue">{if $TOGGLEHIDDEN eq "true"}'+translated_labels.label_show_hidden+'{else}'+translated_labels.label_hide_hidden+'{/if}</a>'{literal};
    }

	// Bind jsTree on selected node
	var treeNodeId = "jstree";
	var jsTree = jQuery('#'+treeNodeId).jstree({
		plugins : jsTreePlugins,
		core : {
			data: treeData,
			// #3844 [start] - Every time node has been moving, run validator
			check_callback: function(operation, node, parent, position) {
				if (node.id.substring(0, 2) != "c_"){//#4033 - fixed folder moving
				if(operation == "move_node") {
					//#3879 [start] - prevent moving reports that the current user is unable to edit
					if (node.id.substring(0, 2) != "c_"){//#4033 - fixed folder moving
						if(del_rep.indexOf(node.id)==-1){
							return false;
						}
					}
					//#3879 [end]
					// Reports can not be moved directly to the root
					if((node.type == "report" || node.type == "dashboard") && parent.id == "#") {
						return false;
					}
				}
				}
				return true;
			}
			// #3844 [end]
		},
        contextmenu: {
            'select_node': false,
		    items: contextMenu
        },
		state: {
			"key":treeNodeId,
			// Forget selected checkboxes after reload
            filter : function (state) {
                delete state.checkbox;
                return state;
            }
		},
		grid: {
		    width:'100%',
			columns: [
				// This is mystification for cross-browser support. It should be something like 30%/50%/20%
                {width: '50%', header: translated_labels.label_report_folders},
                {width: '50%', header: translated_labels.label_description, value: "description", cellClass: "desctooltip"},//#4391 added new tooltip
                {width: '10%', header: translated_labels.label_tools + '&nbsp;' + tools_add, value: "tools"}
			],
		},
		checkbox: {
			tie_selection: false,
			whole_node: false,
		},
		types: {
			category: {
				icon: "jstree-folder",
				valid_children : ["category", "report", "dashboard"],
			},
			report: {
				icon: "jstree-file",
				valid_children: [],
			},
			dashboard: {
				icon: "modules/AnalyticReporting/assets/img/gears_16x16.png",
				valid_children: [],
			},
		},

	});

	// #5696 [start] - allow checking of deletable reports only
 	jsTree.on('check_node.jstree', function (e, data){
		referenceJSTree = jQuery("#jstree");
		var children = data.node.children;
		var folderHasSelectedElements = false;
		if(data.node.id.indexOf("c_") == 0){
			for (var i = 0; i < children.length; i++) {
				if(data.selected.indexOf(children[i])!=-1){
					folderHasSelectedElements = true;
					break;
				}
			}
		}
		
		if(!folderHasSelectedElements){
			checkIfDeletableRecursive(data.node.id, referenceJSTree);
		}else{
			//if folder has selected elements, that means it was already selected, deselect it instead
			referenceJSTree.jstree(true).uncheck_node(data.node.id);
		}

    });

	function checkIfDeletableRecursive(nodeId, referenceJSTree){
		var children = referenceJSTree.jstree(true).get_node(nodeId).children;
		//single node
		if(children.length == 0 && //no children
		nodeId.indexOf("c_") != 0 && //not a folder
		del_rep.indexOf(nodeId) == -1)referenceJSTree.jstree(true).uncheck_node(nodeId);
		//folder
		else{
			for (var i = 0; i < children.length; i++) {
				if((children[i].indexOf("c_") == 0)){
					allDeletable = checkIfDeletableRecursive(children[i], referenceJSTree);
					if(allDeletable == false)break;
				}else if (del_rep.indexOf(children[i]) == -1) {
			        referenceJSTree.jstree(true).uncheck_node(children[i]);
			    }
			}
		}

	}
	// #5696 [end]
	
	// Filter report onclick
 	jsTree.on('select_node.jstree', function (e, data) {
 		// Don't trigger select_node event if triggered from saved state
 		if(!data.event) {
 			return false;
 		}

		// Reports open as links
		if(data.node.type == "report" || data.node.type == "dashboard") {
			window.location.href = data.node.a_attr.href;
		} else {
			// Other types just toggle
			return data.instance.toggle_node(data.node);
		}
    });

	jsTree.on('ready.jstree', function (e, data) {
		if(highlight.length > 0){ //#5722 Highlight results is search criteria is passed
			highlightResults(highlight);
		}
	});

	// After node has been moved
	jsTree.on("move_node.jstree", function (e, data) { 
		var newData = {};

		// Move category
		if(data.node.type == "category") {
			var action	= "moveCategory";
		} else {
			// Move report	
			var action	= "moveItem";
		}

		// Remove c_ from category ids
		var parentId 	= data.parent.replace("c_", "");
		var id 			= data.node.id.replace("c_", "");

		// Replace category root elements to zero
		if(parentId == "#") {
			parentId = 0;
		}

		// Set POST data items
		newData._action		= action;
		newData.id 			= id;
		newData.parentId 	= parentId;
		newData.position 	= data.position;

		// Send to server
		jQuery.post(saveCategoryUrl, newData, function(response){
			window.location.reload();
		});
	});


	// Ractive.js modal component for saving new reports or edit existing
	var ReportFolder = Ractive.extend({
		el: jQuery('#modalWindow'),
		append: false,
		template: '{{>modalContent}}',

		data: {
		},
		init: function() {
			// Get passed data
			data = this.data;

			// Open dialog and save
			jQuery("#modalWindow").dialog({
				modal: true,
				draggable:false,
				resizable: false,
				title: (data._action == "edit" ? translated_labels.label_edit_report_folder : translated_labels.label_new_report_folder),//#3931
				open: function (type, _data) {
					// If edit, then get existing title and description
					if(data._action == "edit") {
						jQuery(this).find("[name=categoryName]").val(data.title);
						jQuery(this).find("[name=categoryDescription]").val(data.description)
					}
				},
				buttons: [
					{
						text: translated_labels.label_save,
						click: function() {
							var that = this;

							data.title 			= jQuery(this).find("[name=categoryName]").val();
							data.description 	= jQuery(this).find("[name=categoryDescription]").val();

							// Send to server
							jQuery.post(saveCategoryUrl, data, function(response){
								response = JSON.parse(response);
								jQuery(that).dialog("close");
								window.location.reload();
							});
						}
					},
					{
						text: translated_labels.label_cancel,
						click: function() {
							jQuery(this).dialog("close");
						}
					}
				]
			});
		}
	});

	// Unified Ractive dialog component (should be merged with ReportFolder component)
	var RactiveDialog = Ractive.extend({
		el: jQuery('#modalWindow'),
		append: false,
		template: '{{>modalContent}}', // Using partials
		data: {
			dialogOptions: {}
		},
		init: function() {
			// Get passed data
			data = this.data;

			// Init callback
			if(data.init) {
				data.init();
			}

			// Open dialog and save
			jQuery(this.el).dialog(data.dialogOptions);
		},
		// On shutdown, destroy dialog
		onteardown: function(){
			if(this.dialog){
				this.dialog.dialog('destroy');
			}
		}
	});

	var modalContentTemplate = '<div style="padding-top:10px;"><label>'+translated_labels.label_title+': <input style="width: 280px;" type="text" name="categoryName" /></label><label>'+translated_labels.label_description+': <textarea style="width: 280px;" name="categoryDescription"></textarea></label></div>';

	jQuery("[data-action='addCategory']").live("click", function(e) {
		e.preventDefault();
		// Get data for modal
		var data = {}
		data.id 		= jQuery(this).data("id");
		data._action 	= "add";
	
		// Initialize Ractive.js modal component with data
		var modal = new ReportFolder({
			data: data,
			partials: {
				modalContent: modalContentTemplate
			}
		});
	});

	jQuery("[data-action='editCategory']").live("click", function(e) {
		e.preventDefault();
		// Get data for modal
		var data = {}
		data.id 		 = jQuery(this).data("id");
		data.title 		 = jQuery(this).data("title");
		data.description = jQuery(this).data("description");
		data._action 	 = "edit";
	
		// Initialize Ractive.js modal component with data
		var modal = new ReportFolder({
			data: data,
			partials: {
				modalContent: modalContentTemplate
			}
		});
	});

	jQuery("[data-action='deleteCategory']").live("click", function(e) {
		//#3839 [start] - delete reports from before deleting report folder
		var children = jQuery("#jstree").jstree(true).get_node("#c_"+jQuery(this).data("id")).children;
		if(children.length>0){
			alert(translated_labels.label_delete_children);
			return false;
		}
		//#3839 [end]
		e.preventDefault();
		var data = {};
		data.id 		= jQuery(this).data("id");
		data._action 	= "delete";
		jQuery.post(saveCategoryUrl, data, function(response){
			window.location.reload();
		});
	});

	jQuery("[data-action='massSchedule']").click(function(e) {
		e.preventDefault();
		var reportIds = [];

		// Get all checked node ids
		jQuery("#jstree").jstree("get_checked").forEach(function(id){
			// Filter reports
			if(id.substring(0, 2) != "c_") {
				reportIds.push(id);
			}
		});

		// Show dialog only if there is at least one report selected
		if(reportIds.length > 0) {
			// Set dialog modal options
			var dialogOptions = {
				modal: true,
				draggable:true,
				resizable: false,
				width:755,
				title: translated_labels.label_mass_schedule_title,
				buttons: [
					{
						text: translated_labels.label_save,
						click: function() {
							var that = this;

							var params = {};
							params.globalSharing = accessManager.get("globalSharing");
							params.globalSharingRights = accessManager.get("globalSharingRights");
							params.userSharing = accessManager.getSelectedAccess();
							params.owner = accessManager.get("owner");
							params.isScheduled = (scheduleManager.get("isScheduled")==true)?(1):(0);
							params.updatePermissions = (accessManager.get("updatePermissions")==true)?(1):(0);//#5286
							params.interval = scheduleManager.get("interval");
							params.intervalH = scheduleManager.get("timeH");
							params.intervalM = scheduleManager.get("timeM");
							params.intervalOptions = scheduleManager.get("intervalOptions");
							params.scheduledRecipients = scheduleManager.getSelectedRecipients();
							params.scheduledFormats = scheduleManager.get("scheduledFormats");
							params.reportIds = reportIds;

							// Params keys which should not be converted to JSON (@TODO: Should make DRY)
							var nonJSONSaveKeys = ["reportIds","globalSharing", "globalSharingRights", "owner","isScheduled", "updatePermissions", "interval", "intervalH", "intervalM", "intervalOptions", "scheduledRecipients"];
							// Send to server
							jQuery.post(massScheduleUrl, reportUtils.convertToJSONPost(params, nonJSONSaveKeys), function(response){
								response = JSON.parse(response);
								jQuery(that).dialog("close");
							});
						}
					},
					{
						text: translated_labels.label_cancel,
						click: function() {
							jQuery(this).dialog("close");
						}
					}
				]
			}

			// Initialize Ractive.js modal component with data
			var modal = new RactiveDialog({
				data: {
					dialogOptions:dialogOptions,
					init:function(){
						var accessManagerOpt = {
							users:ReportData.reportAccessUsers,
							filter: "",
							accessRights:[],
							globalSharing:'PRIV',
							availableOwners:ReportData.users,
							owner:'1',
							globalSharingRights:'VIEW',
							updatePermissions:false,//#5286
						};
						var scheduleManagerOpt = {
							users:ReportData.reportScheduleUsers,
							filter: "",
							isScheduled:false,
							selectedUsers:[],
							timeH:'12',
							timeM:'00',
							interval:0,
							intervalOptions:['01','01'],
							scheduledFormats:{},
						};

						accessManager = new reportAccessManager({data:accessManagerOpt});
						accessManager.render("#ar-rv-editor-access-sharing");
						scheduleManager = new reportScheduleManager({data: scheduleManagerOpt});
						scheduleManager.render("#ar-rv-editor-access-scheduling");
					}
				},
				partials: {
					modalContent: '<div class="ar-container"><div id="ar-rv-editor-access"><strong>{/literal}{$MOD.label_sharing}</strong><br><div id="ar-rv-editor-access-sharing"></div><br><strong>{$MOD.label_scheduling}{literal}</strong><br><div id="ar-rv-editor-access-scheduling"></div></div></div>'
				}
			});
		}else{
			alert("Please select at least one report!");
		}
	});

    jQuery("[data-action='export']").click(function(e) {
        e.preventDefault();
        var reportIds = [];

        // Get all checked node ids
        jQuery("#jstree").jstree("get_checked").forEach(function(id){
            // Filter reports
            if(id.substring(0, 2) != "c_") {
                reportIds.push(id);
            }
        });

        // Show dialog only if there is at least one report selected
        if(reportIds.length > 0) {
            var params = '';
            reportIds.forEach(function(id){
                params+= '&reportIds[]='+id;
            });
            window.location = exportReportsUrl + '&reportIds=' + params;
        }else{
            alert(translated_labels.label_err_select_reports);
        }
    });

    jQuery("[data-action='import']").click(function(e) {
        e.preventDefault();

        var dialogOptions = {
            modal: true,
            draggable:true,
            resizable: false,
            width:450,
            title: translated_labels.label_import_wizard,
            buttons: [
                {
                    text: translated_labels.label_import,
                    click: function() {
                        if(jQuery("[name=importType]:checked").val() == "inCategory" && jQuery("[name=category]").val() == -1){
                            alert(translated_labels.label_err_select_folder);
                        } else if(!jQuery("[name=importFile]").val() || jQuery("[name=importFile]").val().substr(-4) != ".xml") {
                            alert(translated_labels.label_err_xml_extension);
                        } else {
                            jQuery("#import-reports").submit();
                            jQuery(this).dialog("close");
                        }
                    }
                },
                {
                    text: translated_labels.label_cancel,
                    click: function() {
                	   jQuery(this).dialog("close");
                    }
                }
            ]
        };

        var ImportWizard = Ractive.extend({
            template: '#importReportsTemplate',
            oninit:function(){
                var that = this;
                var data = this.data;
            },
            data:{
                categories:[],
            },
        });

        // Initialize Ractive.js modal component with data
        var modal = new RactiveDialog({
            data: {
                dialogOptions:dialogOptions,
                init:function(){
                    var importOptions = {categories: {/literal}{$CATEGORIES}{literal}};
                    importWizard = new ImportWizard({data:importOptions});
                    importWizard.render("#ar-rv-import-wizard");
                }
            },
            partials: {
                modalContent: '<div id="ar-rv-import-wizard"></div>'
            }
        });
    });

    function checkImportErrors(){
        var checkErrorsUrl = '{/literal}{$urls.importReportsUrl}{literal}';

        jQuery.post(checkErrorsUrl, {_action: 'errorCheck'}, function(response){
            response = JSON.parse(response);
            if(response.status != "ok"){
                var dialogOptions = {
                    modal: true,
                    draggable:true,
                    resizable: false,
                    width:250,
                    title: translated_labels.label_import_error,
                    buttons: [
                        {
                            text: translated_labels.label_close,
                            click: function() {
                               jQuery(this).dialog("close");
                            }
                        }
                    ]
                };

                var modal = new RactiveDialog({
                    data: {
                        dialogOptions:dialogOptions,
                    },
                    partials: {
                        modalContent: '<div style="text-align:center;">'+translated_labels[response.errorMsg]+'</div>'
                    }
                });
            }
        });
    }

    checkImportErrors();

    // #6076 - Added font checking and downloading frontend
    function checkFonts() {
        var settingsAjaxUrl = '{/literal}{$urls.checkFontsAjax}{literal}';

        // Check for additional font existence
        function downloadFontsCheck(modalObj) {
            var downloadFontCheckUrl = '{/literal}{$urls.downloadFontCheckUrl}{literal}';
            jQuery("#status").show();
            jQuery.getJSON(downloadFontCheckUrl, function(response) {
                jQuery("#status").hide();
                if(response.status) {
                    // Close dialog
                    jQuery(modalObj).dialog("close");
                } else {
                    // Set dialog modal options
                    var dialogOptions = {
                        modal: true,
                        draggable:true,
                        resizable: false,
                        width:400,
                        title: translated_labels.additionalFontsInfo,
                        buttons: {
                            "downloadButton": {
                                text: translated_labels.download,
                                class: 'downloadFontsButton',
                                click: function() {
                                    jQuery(".downloadFontsButton > .ui-button-text").text("Downloading...");
                                    downloadFonts(jQuery(this));
                                }
                            },
                            "cancelButton": {
                                text: translated_labels.label_cancel,
                                click: function() {
                                    jQuery(this).dialog("close");
                                }
                            }
                        }
                    }

                    var modal = new RactiveDialog({
                        data: {
                            dialogOptions:dialogOptions,
                            init:function(){
                            }
                        },
                        partials: {
                            modalContent: '<div>'+response.error+'</div>'
                        }
                    });
                }
            });
        }

        // Download fonts in background
        function downloadFonts(modal) {
            var downloadFontUrl = '{/literal}{$urls.downloadFontUrl}{literal}';
            jQuery("#downloadFontsStatus").html("{/literal}{$MOD.downloading}{literal}");
            jQuery("#status").show();
            jQuery.getJSON(downloadFontUrl, function(response) {
                jQuery("#status").hide();
                downloadFontsCheck(modal);
            });
        }

        downloadFontsCheck();
    }

    checkFonts();

	// After jsTree has been loaded, set valid widths in percents
	setTimeout(function(){
		jQuery(".jstree-grid-header th:nth-child(1)").css({width:"30%"});
		jQuery(".jstree-grid-header th:nth-child(2)").css({width:"55%"});
		jQuery(".jstree-grid-header th:nth-child(3)").css({width:"15%"});
	}, 600);
});
{/literal}
</script>

<!-- ADVANCED REPORTS CONTAINER -->
<div id="ar-container">
	<div id="ar-toolbar">
        {if $ISADMIN eq 1 || $reportTreeAdminAccess eq 0}
		<a href="javascript:void(0);" data-action="addCategory" data-id="0">{$MOD.label_add_folder}</a>
        {/if}
		<a href="javascript:void(0);" data-action="massSchedule">{$MOD.label_mass_schedule}</a>
		{if $ISADMIN eq 1 || $reportBuilderPublic eq 1}
			<a href="{$urls.reportBuilder}" >{$MOD.reportBuilder}</a>
		{/if}
		<form id="searchreports" action="{$urls.withoutAction}listview" method="POST" style=" display:inline!important;">
			<input type="hidden" name="search" value="1">
			<input type="text" name="searchCriteria" placeholder="{$MOD.label_search_placeholder}" value="{$SEARCHCRITERIA}" />
			<input type="checkbox" style="vertical-align: middle" name="matchAll" id="searchMatchAll" value="true" {$matchAll} />
			<label style="margin-right: 5px;" for="searchMatchAll">{$MOD.label_matchall}</label>
			<input class="ar-button" type="submit" name="submit" value="{$MOD.label_search}" />
			{if isset($SEARCHCRITERIA)}
				<a class="ar-button" href="{$urls.withoutAction}index">{$MOD.label_cancel}</a>
			{/if}
		</form>

		{if $ISADMIN eq 1} {* #5885 Hide settings link from non-admin users *}
			<a style="float:right" href="{$urls.settings}" >Reporting Tool Settings{$MOD.label_settings}</a>
			<br />
			<div style="float:right">
				<a href="javascript:void(0);" data-action="import" >{$MOD.label_import}</a> / 
				<a href="javascript:void(0);" data-action="export" >{$MOD.label_export}</a>
			</div>
		{/if}
	</div>

	<div id="modalWindow" style="display:none;"></div>
	<div id="jstree"></div>
</div>
<!-- // ADVANCED REPORTS CONTAINER -->