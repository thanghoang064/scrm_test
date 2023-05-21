var app = '<div id="ASD" class="modal fade modal-search in" tabindex="-1" role="dialog" style="display: none; padding-left: 12px;">' +
    '<div class="modal-dialog modal-lg">' +
    '<div class="modal-content" id="SMS_modal_content" style="border-color: #f08377;border-width: medium;">' +
    '</div></div>' +
    '</div>';

var bulksms = '<div id="BULK" class="modal fade modal-search in" tabindex="-1" role="dialog" style="display: none; padding-left: 12px;">' +
    '<div class="modal-dialog modal-lg">' +
    '<div class="modal-content" style="border-color: #f08377;border-width: medium;">' +
    '<div class="modal-header" style="background:#66727d">' +
    '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>' +
    '<h4 class="modal-title" style="color:#fff"><b>Sending Bulk SMS</b></h4>' +
    '</div>' +
    '<div class="modal-body" id="bulk_dashboardDialog">' +
    '</div>' +
    '<div class="modal-footer" style="background-color:#F5F5F5">' +
    '<button type="button" class="button" id="mod_can" data-dismiss="modal">Close</button>  ' +
    '<button type="submit" id="bulksubmit" class="button">Send</button>' +
    '</div></div></div>' +
    '</div>';


var bulksmstarget = '<div id="BULKTARGET" class="modal fade modal-search in" tabindex="-1" role="dialog" style="display: none; padding-left: 12px;">' +
    '<div class="modal-dialog modal-lg">' +
    '<div class="modal-content" style="border-color: #f08377;border-width: medium;">' +
    '<div class="modal-header" style="background:#66727d">' +
    '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>' +
    '<h4 class="modal-title" style="color:#fff"><b>Sending Bulk SMS</b></h4>' +
    '</div>' +
    '<div class="modal-body" id="bulk_dashboardDialog_target">' +
    '</div>' +
    '<div class="modal-footer" style="background-color:#F5F5F5">' +
    '<button type="button" class="button" id="mod_can" data-dismiss="modal">Close</button>  ' +
    '<button type="submit" id="bulksubmit" class="button">Send</button>  ' +
    '<button type="submit" id="schedule_target" class="button">Schedule SMS</button>' +
    '</div></div></div>' +
    '</div>';

var testing_sms = '<div id="Testing_SMS" class="modal fade modal-search in" tabindex="-1" role="dialog" style="display: none; padding-left: 12px;">' +
    '<div class="modal-dialog modal-lg">' +
    '<div class="modal-content" style="border-color: #f08377;border-width: medium;">' +
    '<div class="modal-header" style="background:#66727d">' +
    '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>' +
    '<h4 class="modal-title" style="color:#fff"><b>Testing SMS</b></h4>' +
    '</div>' +
    '<div class="modal-body" id="testing_dashboardDialog">' +
    '</div>' +
    '<div class="modal-footer" style="background-color:#F5F5F5">' +
    '<button type="button" class="button" id="mod_can" data-dismiss="modal">Close</button>  ' +
    '</div></div></div>' +
    '</div>';

$('body').append(app);
$('body').append(testing_sms);
$('body').append(bulksms);
$('body').append(bulksmstarget);

function sendbulksms(module) {
    sugarListView.get_checks();
    var sms_ids = document.MassUpdate.uid.value;

    $('#BULK').modal('toggle');
    $.ajax({
        url: 'index.php?entryPoint=CE_SMS_Options',
        type: 'POST',
        data: {
            action: 'get_smsbulk_body',
            modulefrom: module,
            recid: sms_ids
        },
        success: function (get_body) {
            $("#bulk_dashboardDialog").empty();
            $("#bulk_dashboardDialog").append(get_body);
        }
    });

}

function sendbulksmstarget(id) {
    $('#BULKTARGET').modal('toggle');
    $.ajax({
        url: 'index.php?entryPoint=CE_SMS_Options',
        type: 'POST',
        data: {
            action: 'send_sms_target',
            recid: id
        },
        success: function (get_body) {
            $("#bulk_dashboardDialog_target").empty();
            $("#bulk_dashboardDialog_target").append(get_body);
        }
    });

}

function smstonumber(mobile, module, recid) {
    $('#ASD').modal('toggle');
    $.ajax({
        url: 'index.php?entryPoint=CE_SMS_Options',
        type: 'POST',
        data: {
            action: 'get_sms_body',
            mobile: mobile,
            modulefrom: module,
            recid: recid
        },
        success: function (get_body) {
            $("#SMS_modal_content").empty();
            $("#SMS_modal_content").append(get_body);
            $("#rec_history_sms").click();
        }
    });
}


$(document).ready(function () {
    $(document).on('click', '#bulksubmit', function () {
        var selected_id = $('#bulksms_description').val();
        var sl_mod = $('#bulk_sl_mod').val();
        var sl_mod_id = $('#bulk_sl_mod_id').val();
        $("#errr_msg").css("display", "none");
        if (selected_id === "") {
            $("#errr_msg").css("display", "block");
        } else {
            $("#loading_sms").css("display", "block");
            $.ajax({
                url: 'index.php?entryPoint=CE_SMS_Options',
                type: 'POST',
                async: true,
                data: {
                    action: 'bulksend_sms',
                    template_id: $('#bulktemplate_id').val(),
                    template_name: $('#bulktemplate_id option:selected').text(),
                    mobile_numbers: $("#bulkmobile_numbers").val(),
                    body: selected_id,
                    sl_mod: sl_mod,
                    sl_mod_id: sl_mod_id
                },
                success: function (get_body) {
                    if (get_body !== "") {
                        $("#loading_sms").css("display", "none");
                        $("#errr_msg").text("Message Sent Successfully..");
                        $("#errr_msg").css("color", "blue");
                        $("#errr_msg").css("display", "block");
                    } else {
                        $("#loading_sms").css("display", "none");
                        $("#errr_msg").text("Message Sending Failed..");
                        $("#errr_msg").css("color", "red");
                        $("#errr_msg").css("display", "block");

                    }
                    setTimeout(function () {
                        $("#mod_can").click();
                    }, 3000);
                    window.location.reload();
                }
            });
        }

    });
    $(document).on('click', '#rec_history_sms', function () {

        var sl_mod = $('#sl_mod').val();
        var sl_mod_id = $('#sl_mod_id').val();
        $("#sms_history").empty();
        $.ajax({
            url: 'index.php?entryPoint=CE_SMS_Options',
            type: 'POST',
            data: {
                action: 'sms_history',
                sl_mod: sl_mod,
                sl_mod_id: sl_mod_id
            },
            success: function (get_body) {
                $("#sms_history").append(get_body);
            }
        });
    });
    $(document).on('click', '#back_history', function () {
        $("#back_history").attr("id", "rec_history_sms");
        $("#rec_history_sms").text("History");
        $('#sms_history').css('display', 'none');
        $('#sms_dashboardDialog').css('display', 'block');
        $("#submitsms").removeAttr('disabled');

    });
    setInterval(function () {
        if ($("#ASD").css('display') == "block") {
            $("#refresh_history_sms").click();
        }
    }, 7000);
    $(document).on('click', '#refresh_history_sms', function () {
        var sl_mod = $('#sl_mod').val();
        var sl_mod_id = $('#sl_mod_id').val();
        $.ajax({
            url: 'index.php?entryPoint=CE_SMS_Options',
            type: 'POST',
            data: {
                action: 'sms_history_refresh',
                sl_mod: sl_mod,
                sl_mod_id: sl_mod_id
            },
            success: function (get_body) {
                $("#history-list").empty();
                $("#history-list").append(get_body);

            }
        });
    });
    $(document).on('click', '#submit', function () {

        var selected_id = $('#sms_description').val();
        var sl_mod = $('#sl_mod').val();
        var sl_mod_id = $('#sl_mod_id').val();
        $("#errr_msg").css("display", "none");
        if (selected_id === "") {
            $("#errr_msg").css("display", "block");
        } else {
            $("#loading_sms").css("display", "block");
            $.ajax({
                url: 'index.php?entryPoint=CE_SMS_Options',
                type: 'POST',
                async: true,
                data: {
                    action: 'send_sms',
                    template_name: $('#template_id option:selected').text(),
                    mobile_numbers: $("#mobile_numbers").val(),
                    body: selected_id,
                    sl_mod: sl_mod,
                    sl_mod_id: sl_mod_id
                },
                success: function (get_body) {
                    if (get_body !== "") {
                        $("#loading_sms").css("display", "none");
                        $("#errr_msg").text("Message Sent Successfully..");
                        $("#errr_msg").css("color", "blue");
                        $("#errr_msg").css("display", "block");
                        setTimeout(function () {
                            $("#errr_msg").text('').css('color', '');
                        }, 5000);
                        $('#sms_description').val("");
                    } else {
                        $("#loading_sms").css("display", "none");
                        $("#errr_msg").text("Message Sending Failed..");
                        $("#errr_msg").css("color", "red");
                        $("#errr_msg").css("display", "block");
                        setTimeout(function () {
                            $("#errr_msg").text('').css('color', '');
                        }, 5000);

                    }
                    setTimeout(function () {
                        $("#mod_can").click();
                    }, 3000);
                }
            });
        }

    });
    $(document).on('change', '#template_id', function () {
        var selected_id = $('#template_id').val();
        var sl_mod = $('#sl_mod').val();
        var sl_mod_id = $('#sl_mod_id').val();
        //alert(selected_id);
        $("#errr_msg").css("display", "none");
        $.ajax({
            url: 'index.php?entryPoint=CE_SMS_Options',
            type: 'POST',
            data: {
                action: 'sms_fetch',
                et_id: selected_id,
                sl_mod: sl_mod,
                sl_mod_id: sl_mod_id
            },
            success: function (get_body) {
                $("#sms_description").empty();
                $("#sms_description").append(get_body);
            }
        });
    });
    $(document).on('change', '#bulktemplate_id', function () {
        var selected_id = $('#bulktemplate_id').val();
        if (selected_id != "NS") {
            $('#bulksms_description').prop('readonly', 'readonly');
        } else {
            $('#bulksms_description').prop('readonly', '');
        }
        $("#errr_msg").css("display", "none");
        $.ajax({
            url: 'index.php?entryPoint=CE_SMS_Options',
            type: 'POST',
            data: {
                action: 'bulksms_fetch',
                et_id: selected_id
            },
            success: function (get_body) {
                $("#bulksms_description").empty();
                $("#bulksms_description").append(get_body);
            }
        });
    });
    //
    $(document).on('click', '#schedule', function () {
        var mobile_numbers = $("#mobile_numbers").val();
        var smsbodytext = $("#sms_description").val();
        var smsmodulename = $('#sl_mod').val();
        var smsrecord_id = $('#sl_mod_id').val();
        if (mobile_numbers == "") {
            $("#errr_msg").text("Please add recipients before Scheduling the SMS");
            $("#errr_msg").css("color", "red");
            $("#errr_msg").css("display", "block");
            setTimeout(function () {
                $("#errr_msg").text('').css('color', '');
            }, 2000);
            return false;
        } else {
            if (smsbodytext == "") {
                $("#errr_msg").text("Please add the text before scheduling");
                $("#errr_msg").css("color", "red");
                $("#errr_msg").css("display", "block");
                setTimeout(function () {
                    $("#errr_msg").text('').css('color', '');
                }, 2000);
                return false;
            }
            var callUrl = "&name=Outbound-SMS to " + mobile_numbers + "&direction=Outbound&status=Scheduled&parent_type=" + smsmodulename + "&to_number_c=" + mobile_numbers + "&parent_id=" + smsrecord_id + "&description=" + smsbodytext + "&parent_name=" + $(".module-title-text").text().trim() + "&call_purpose=Meeting&call_type_c=sms";
            window.open('./index.php?module=Calls&action=EditView&return_module=Calls&return_action=DetailView' + callUrl, '_blank');
        }
    });
    $(document).on('click', '#schedule_target', function () {
        var mobile_numbers = $("#bulkmobile_numbers").val();
        var smsbodytext = $("#bulksms_description").val();
        var smsmodulename = $('#bulk_sl_mod').val();
        var smsrecord_id = $('#bulk_sl_mod_id').val();

        if (mobile_numbers == "") {
            $("#errr_msg").text("Please add recipients before Scheduling the SMS");
            $("#errr_msg").css("color", "red");
            $("#errr_msg").css("display", "block");
            setTimeout(function () {
                $("#errr_msg").text('').css('color', '');
            }, 2000);
            return false;
        } else {

            if (smsbodytext == "") {
                $("#errr_msg").text("Please add the text before scheduling");
                $("#errr_msg").css("color", "red");
                $("#errr_msg").css("display", "block");
                setTimeout(function () {
                    $("#errr_msg").text('').css('color', '');
                }, 2000);
                return false;
            }
            var callUrl = "&name=Outbound-SMS to " + mobile_numbers + "&direction=Outbound&status=Scheduled&parent_type=" + smsmodulename + "&to_number_c=" + mobile_numbers + "&parent_id=" + smsrecord_id + "&description=" + smsbodytext + "&parent_name=" + $(".module-title-text").text().trim() + "&call_purpose=Meeting&call_type_c=sms";
            window.open('./index.php?module=Calls&action=EditView&return_module=Calls&return_action=DetailView' + callUrl, '_blank');
        }
    });
});