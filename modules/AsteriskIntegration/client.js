//Configuration Variable
var asteriskintegration_call_notification_maximized_width = 350;
var asteriskintegration_call_notification_minimized_width = 60;
var asteriskintegration_call_notification_titlebar_text = "Asterisk Call Notifications";

var asteriskintegration_user_id;
var asteriskintegration_show_notification;
var asteriskintegration_server_ip;
var asteriskintegration_extension;
var asteriskintegration_context;
var asteriskintegration_socket_port;

var socket;

var asteriskintegration_disposition_code_list_html = "";

var pb = new PromptBoxes();

function AsteriskIntegrationCallNotificationTogglePopup()
{
    if ($('#asteriskintegration_call_notification_toggle_popup').hasClass("asteriskintegration_call_notification_maximized"))
    {
        $("#asteriskintegration_call_notification_container").hide();
        $("#asteriskintegration_call_notification_titlebar_text").html("");
        $("#asteriskintegration_call_notification_toggle_popup").removeClass("asteriskintegration_call_notification_maximized").addClass("asteriskintegration_call_notification_minimized");
        $("#asteriskintegration_call_notification_popup").css("width", asteriskintegration_call_notification_minimized_width);
        localStorage.setItem("AsteriskIntegration:ToggleStatus", "Minimized");
    }
    else
    {
        $("#asteriskintegration_call_notification_container").show();
        $("#asteriskintegration_call_notification_titlebar_text").html(asteriskintegration_call_notification_titlebar_text);
        $("#asteriskintegration_call_notification_toggle_popup").removeClass("asteriskintegration_call_notification_minimized").addClass("asteriskintegration_call_notification_maximized");
        $("#asteriskintegration_call_notification_popup").css("width", asteriskintegration_call_notification_maximized_width);
        localStorage.setItem("AsteriskIntegration:ToggleStatus", "Maximized");
    }
}

function AsteriskIntegrationClickToCall(number, module_name, record_id)
{
    if (asteriskintegration_server_ip !== "" && asteriskintegration_extension !== "" && asteriskintegration_context !== "")
    {
        socket.emit('ClickToCall',
        {
            number: number,
            extension: asteriskintegration_extension,
            context: asteriskintegration_context,
            user_id: asteriskintegration_user_id,
            module_name: module_name,
            record_id: record_id
        });
    }
    else
    {
        pb.error("<b>Asterisk Integration</b><br/>Incomplete Asterisk Integration Setup In User Profile To Use Click To Call Functionlity",
        {
            duration: 10000,
            allowClose: true
        });
    }
}

function AsteriskIntegrationCloseCallPopup(uniqueid)
{
    socket.emit('CloseCallPopup',
    {
        uniqueid: uniqueid
    });
}

function AsteriskIntegrationCloseCallPopupEvent(data)
{
    uniqueid = data.uniqueid;
    $("#asteriskintegration_popupbox_" + uniqueid).remove();
}

function AsteriskIntegrationToggleOptions(uniqueid)
{
    socket.emit('ToggleOptions',
    {
        uniqueid: uniqueid
    });
}

function AsteriskIntegrationToggleOptionsEvent(data)
{
    uniqueid = data.uniqueid;
    $("#asteriskintegration_popupbox_options_" + uniqueid).slideToggle(200);
}

function AsteriskIntegrationDisplayCallDuration(uniqueid, duration)
{
    var timestring = GenericTimeToString(duration);
    $("#asteriskintegration_popupbox_duration_" + uniqueid).html(timestring);
}

function AsteriskIntegrationRemoveTransferButton(uniqueid)
{
    $("#asteriskintegration_popupbox_head_transfer_button_" + uniqueid).remove();
}

function AsteriskIntegrationRemoveHangupButton(uniqueid)
{
    $("#asteriskintegration_popupbox_head_hangup_button_" + uniqueid).remove();
}

function AsteriskIntegrationShowSaveIcon(uniqueid, call_id)
{
    $("#asteriskintegration_popupbox_save_icon_" + uniqueid).show();
    $("#asteriskintegration_popupbox_save_icon_" + uniqueid).attr("onclick", "AsteriskIntegrationSaveCallDescription('" + uniqueid + "','" + call_id + "')");
}

function AsteriskIntegrationSaveCallDescription(uniqueid, call_id)
{
    description = $("#asteriskintegration_popupbox_call_description_textarea_" + uniqueid).val();
    disposition = $("#asteriskintegration_popupbox_call_disposition_" + uniqueid).val();

    if (description === "")
    {
        alert("No call description entered");
        return false;
    }

    pb.clear();
    pb.info("<b>Asterisk Integration</b><br/>Please wait while details are being saved.",
    {
        duration: 10000,
        allowClose: true
    });

    $.ajax(
    {
        url: 'index.php?entryPoint=AsteriskIntegrationController&action=SaveDescription&call_id=' + encodeURIComponent(call_id) + '&description=' + encodeURIComponent(description) + '&disposition=' + encodeURIComponent(disposition),
        type: 'GET',
        success: function()
        {
            pb.clear();
            pb.info("<b>Asterisk Integration</b><br/>Description Saved Successfully.",
            {
                duration: 10000,
                allowClose: true
            });
        }
    });
}

function AsteriskIntegrationDialEventCallPopup(dial_event_result)
{
    uniqueid = dial_event_result.uniqueid.replace(".", "_");
    direction = dial_event_result.direction;
    number = dial_event_result.number;
    extension = dial_event_result.extension;
    hangup_channel = dial_event_result.hangup_channel;
    redirect_channel = dial_event_result.redirect_channel;
    record_name = dial_event_result.record_name;
    record_id = dial_event_result.record_id;
    parent_name = dial_event_result.parent_name;
    parent_id = dial_event_result.parent_id;
    module_name = dial_event_result.module_name;
    module_label = dial_event_result.module_label;
    primary_email = dial_event_result.primary_email;
    date = AsteriskIntegrationGetDateYmdHis();

    module_label_contacts = SUGAR.language.languages.app_list_strings.moduleListSingular.Contacts;
    module_label_accounts = SUGAR.language.languages.app_list_strings.moduleListSingular.Accounts;
    module_label_leads = SUGAR.language.languages.app_list_strings.moduleListSingular.Leads;
    module_label_opportunities = SUGAR.language.languages.app_list_strings.moduleListSingular.Opportunities;
    module_label_cases = SUGAR.language.languages.app_list_strings.moduleListSingular.Cases;
    module_label_meetings = SUGAR.language.languages.app_list_strings.moduleListSingular.Meetings;
    module_label_calls = SUGAR.language.languages.app_list_strings.moduleListSingular.Calls;

    switch (direction)
    {
        case 'Inbound':
            asteriskintegration_popupbox_head_class = 'asteriskintegration_popupbox_head_inbound';
            popup_box_html='';
        //     popup_box_html = `
        //     <div class='asteriskintegration_popupbox' id='asteriskintegration_popupbox_` + uniqueid + `'>
        //         <div class='asteriskintegration_popupbox_head ` + asteriskintegration_popupbox_head_class + `'>
        //             <div class='asteriskintegration_popupbox_head_info'>
        //                 <div class='asteriskintegration_popupbox_head_info_record_name'>
        //                     ` + record_name_link + `
        //                 </div>
        //                 <div class='asteriskintegration_popupbox_head_info_parent_name'>
        //                     ` + parent_name_link + `
        //                 </div>
        //             </div>
        //             <div class='asteriskintegration_popupbox_head_buttons'>
        //                 <div>
        //                     <a class='asteriskintegration_popupbox_head_close_button' id='asteriskintegration_popupbox_head_close_button_` + uniqueid + `' href='javascript:void(0);' onclick='AsteriskIntegrationCloseCallPopup("` + uniqueid + `");'>
        //                     </a>
        //                     <a class='asteriskintegration_popupbox_head_options_button' id='asteriskintegration_popupbox_head_options_button_` + uniqueid + `' href='javascript:void(0);' onclick='AsteriskIntegrationToggleOptions("` + uniqueid + `");'>
        //                     </a>
        //                 </div>
        //                 <div>
        //                     <a class='asteriskintegration_popupbox_head_hangup_button' id='asteriskintegration_popupbox_head_hangup_button_` + uniqueid + `' href='javascript:void(0);' onclick='AsteriskIntegrationHangupCall("` + hangup_channel + `");'></a>
        //                     <a class='asteriskintegration_popupbox_head_transfer_button' id='asteriskintegration_popupbox_head_transfer_button_` + uniqueid + `' href='javascript:void(0);' onclick='AsteriskIntegrationRedirectCall("` + redirect_channel + `");'></a>
        //                 </div>
        //             </div>
        //         </div>
        //         <div class='asteriskintegration_popupbox_options' id='asteriskintegration_popupbox_options_` + uniqueid + `' style='display: none'>
        //             <ul>` + asteriskintegration_popupbox_options + `</ul>
        //         </div>
        //         <div class='asteriskintegration_popupbox_body'>
        //             <ul>
        //                 <li>
        //                     <label>Number</label>
        //                     <value>` + number + `</value>
        //                 </li>
        //                 <li>
        //                     <label>Extension</label>
        //                     <value>` + extension + `</value>
        //                 </li>
        //                 <li>
        //                     <label>Email</label>
        //                     <value>` + primary_email + `</value>
        //                 </li>
        //                 <li>
        //                     <label>Module</label>
        //                     <value>` + module_label + `</value>
        //                 </li>
        //                 <li>
        //                     <label>Disposition</label>
        //                     <value><select id='asteriskintegration_popupbox_call_disposition_` + uniqueid + `'>` + asteriskintegration_disposition_code_list_html + `</select></value>
        //                 </li>
        //                 <li>
        //                     <label>Date</label>
        //                     <value>` + date + `</value>
        //                 </li>
        //                 <li>
        //                     <label>Duration</label>
        //                     <value><span id='asteriskintegration_popupbox_duration_` + uniqueid + `'>-</value>
        //                 </li>
        //         </div>
        //         <div class='asteriskintegration_popupbox_call_description'>
        //             <textarea class='asteriskintegration_popupbox_call_description_textarea' id='asteriskintegration_popupbox_call_description_textarea_` + uniqueid + `' placeholder='Call Description'></textarea>
        //             <a class='asteriskintegration_popupbox_save_icon' id='asteriskintegration_popupbox_save_icon_` + uniqueid + `' href='javascript:void(0);'><img src='modules/AsteriskIntegration/images/save.png'/></a>
        //         </div>
        //     </div>
        // `;
            break;

        case 'Outbound':
            asteriskintegration_popupbox_head_class = 'asteriskintegration_popupbox_head_outbound';
            popup_box_html='';

            break;
    }

    if (record_id !== '' && record_name !== '')
    {
        record_name_link = `<a href='?module=` + module_name + `&action=DetailView&record=` + record_id + `' target='_blank'>` + record_name + `</a>`;
    }
    else
    {
        record_name_link = '-Unknown-';
    }

    if (parent_id !== '' && parent_name !== '')
    {
        parent_name_link = `<a href='?module=Accounts&action=DetailView&record=` + parent_id + `' target='_blank'>` + parent_name + `</a>`;
    }
    else
    {
        parent_name_link = '';
    }

    create_contact_url = "?module=Contacts&action=EditView";
    create_lead_url = "?module=Leads&action=EditView";
    create_account_url = "?module=Accounts&action=EditView";
    create_opportunity_url = "?module=Opportunities&action=EditView";
    create_case_url = "?module=Cases&action=EditView";
    convert_lead_url = "?module=Leads&action=ConvertLead";
    schedule_meeting_url = "?module=Meetings&action=EditView";
    schedule_call_url = "?module=Calls&action=EditView&direction=Outbound&status=Planned";

    switch (module_name)
    {
        case 'Contacts':
            if (parent_id !== '' && parent_name !== '')
            {
                create_opportunity_url += "&account_name=" + parent_name + "&account_id=" + parent_id;
                create_case_url += "&account_name=" + parent_name + "&account_id=" + parent_id;
                create_lead_url += "&account_name=" + parent_name + "&account_id=" + parent_id;
            }
            create_lead_url += "&last_name=" + record_name + "&phone_work=" + number;
            schedule_meeting_url += "&parent_type=" + module_name + "&parent_name=" + record_name + "&parent_id=" + record_id;
            schedule_call_url += "&parent_type=" + module_name + "&parent_name=" + record_name + "&parent_id=" + record_id;

            asteriskintegration_popupbox_options = `
                <a href='` + create_opportunity_url + `' target='_blank'><li>Create ` + module_label_opportunities + `</li></a>
                <a href='` + create_case_url + `' target='_blank'><li>Create ` + module_label_cases + `</li></a>
                <a href='` + create_lead_url + `' target='_blank'><li>Create ` + module_label_leads + `</li></a>
                <a href='` + schedule_meeting_url + `' target='_blank'><li>Schedule ` + module_label_meetings + `</li></a>
                <a href='` + schedule_call_url + `' target='_blank'><li>Log ` + module_label_calls + `</li></a>
            `;
            break;

        case 'Leads':
            convert_lead_url += "&record=" + record_id;
            schedule_meeting_url += "&parent_type=" + module_name + "&parent_name=" + record_name + "&parent_id=" + record_id;
            schedule_call_url += "&parent_type=" + module_name + "&parent_name=" + record_name + "&parent_id=" + record_id;

            asteriskintegration_popupbox_options = `
                <a href='` + convert_lead_url + `' target='_blank'><li>Convert ` + module_label_leads + `</li></a>
                <a href='` + schedule_meeting_url + `' target='_blank'><li>Schedule ` + module_label_meetings + `</li></a>
                <a href='` + schedule_call_url + `' target='_blank'><li>Log ` + module_label_calls + `</li></a>
                `;
            break;

        case 'Accounts':
            create_opportunity_url += "&account_name=" + record_name + "&account_id=" + record_id;
            create_case_url += "&account_name=" + record_name + "&account_id=" + record_id;
            schedule_meeting_url += "&parent_type=" + module_name + "&parent_name=" + record_name + "&parent_id=" + record_id;
            schedule_call_url += "&parent_type=" + module_name + "&parent_name=" + record_name + "&parent_id=" + record_id;

            asteriskintegration_popupbox_options = `
                <a href='` + create_opportunity_url + `' target='_blank'><li>Create ` + module_label_opportunities + `</li></a>
                <a href='` + create_case_url + `' target='_blank'><li>Create ` + module_label_cases + `</li></a>
                <a href='` + schedule_meeting_url + `' target='_blank'><li>Schedule ` + module_label_meetings + `</li></a>
                <a href='` + schedule_call_url + `' target='_blank'><li>Log ` + module_label_calls + `</li></a>            `;
            break;

        default:
            create_contact_url += "&phone_work=" + number;
            create_lead_url += "&phone_work=" + number;
            create_account_url += "&phone_office=" + number;

            asteriskintegration_popupbox_options = `
                <a href='` + create_contact_url + `' target='_blank'><li>Create ` + module_label_contacts + `</li></a>
                <a href='` + create_lead_url + `' target='_blank'><li>Create ` + module_label_leads + `</li></a>
                <a href='` + create_account_url + `' target='_blank'><li>Create ` + module_label_accounts + `</li></a>
            `;
            break;
    }
    // popup_box_html = `
    //     <div class='asteriskintegration_popupbox' id='asteriskintegration_popupbox_` + uniqueid + `'>
    //         <div class='asteriskintegration_popupbox_head ` + asteriskintegration_popupbox_head_class + `'>
    //             <div class='asteriskintegration_popupbox_head_info'>
    //                 <div class='asteriskintegration_popupbox_head_info_record_name'>
    //                     ` + record_name_link + `
    //                 </div>
    //                 <div class='asteriskintegration_popupbox_head_info_parent_name'>
    //                     ` + parent_name_link + `
    //                 </div>
    //             </div>
    //             <div class='asteriskintegration_popupbox_head_buttons'>
    //                 <div>
    //                     <a class='asteriskintegration_popupbox_head_close_button' id='asteriskintegration_popupbox_head_close_button_` + uniqueid + `' href='javascript:void(0);' onclick='AsteriskIntegrationCloseCallPopup("` + uniqueid + `");'>
    //                     </a>
    //                     <a class='asteriskintegration_popupbox_head_options_button' id='asteriskintegration_popupbox_head_options_button_` + uniqueid + `' href='javascript:void(0);' onclick='AsteriskIntegrationToggleOptions("` + uniqueid + `");'>
    //                     </a>
    //                 </div>
    //                 <div>
    //                     <a class='asteriskintegration_popupbox_head_hangup_button' id='asteriskintegration_popupbox_head_hangup_button_` + uniqueid + `' href='javascript:void(0);' onclick='AsteriskIntegrationHangupCall("` + hangup_channel + `");'></a>
    //                     <a class='asteriskintegration_popupbox_head_transfer_button' id='asteriskintegration_popupbox_head_transfer_button_` + uniqueid + `' href='javascript:void(0);' onclick='AsteriskIntegrationRedirectCall("` + redirect_channel + `");'></a>
    //                 </div>
    //             </div>
    //         </div>
    //         <div class='asteriskintegration_popupbox_options' id='asteriskintegration_popupbox_options_` + uniqueid + `' style='display: none'>
    //             <ul>` + asteriskintegration_popupbox_options + `</ul>
    //         </div>
    //         <div class='asteriskintegration_popupbox_body'>
    //             <ul>
    //                 <li>
    //                     <label>Number</label>
    //                     <value>` + number + `</value>
    //                 </li>
    //                 <li>
    //                     <label>Extension</label>
    //                     <value>` + extension + `</value>
    //                 </li>
    //                 <li>
    //                     <label>Email</label>
    //                     <value>` + primary_email + `</value>
    //                 </li>
    //                 <li>
    //                     <label>Module</label>
    //                     <value>` + module_label + `</value>
    //                 </li>
    //                 <li>
    //                     <label>Disposition</label>
    //                     <value><select id='asteriskintegration_popupbox_call_disposition_` + uniqueid + `'>` + asteriskintegration_disposition_code_list_html + `</select></value>
    //                 </li>
    //                 <li>
    //                     <label>Date</label>
    //                     <value>` + date + `</value>
    //                 </li>
    //                 <li>
    //                     <label>Duration</label>
    //                     <value><span id='asteriskintegration_popupbox_duration_` + uniqueid + `'>-</value>
    //                 </li>
    //         </div>
    //         <div class='asteriskintegration_popupbox_call_description'>
    //             <textarea class='asteriskintegration_popupbox_call_description_textarea' id='asteriskintegration_popupbox_call_description_textarea_` + uniqueid + `' placeholder='Call Description'></textarea>
    //             <a class='asteriskintegration_popupbox_save_icon' id='asteriskintegration_popupbox_save_icon_` + uniqueid + `' href='javascript:void(0);'><img src='modules/AsteriskIntegration/images/save.png'/></a>
    //         </div>
    //     </div>
    // `;

    $("#asteriskintegration_call_notification_container").append(popup_box_html);
    if ($('#asteriskintegration_call_notification_toggle_popup').hasClass("asteriskintegration_call_notification_minimized"))
    {
        AsteriskIntegrationCallNotificationTogglePopup();
    }
    $("#asteriskintegration_call_notification_container").animate(
    {
        scrollTop: $("#asteriskintegration_call_notification_container").get(0).scrollHeight
    }, 2000);
}

function AsteriskIntegrationCdrEventCallPopup(data)
{
    call_id = data.call_id;
    uniqueid = data.uniqueid.replace(".", "_");
    duration = data.duration;

    AsteriskIntegrationRemoveTransferButton(uniqueid);
    AsteriskIntegrationRemoveHangupButton(uniqueid);
    AsteriskIntegrationShowSaveIcon(uniqueid, call_id);
    AsteriskIntegrationDisplayCallDuration(uniqueid, duration);
}

function GenericGetURLParameter(parameter)
{
    var page_url = location.search.substring(1);
    var url_variables = page_url.split('&');

    for (var i = 0; i < url_variables.length; i++)
    {
        var url_variable_name = url_variables[i].split('=');
        if (url_variable_name[0] === parameter)
        {
            return url_variable_name[1];
        }
    }
}

function AsteriskIntegrationUserDetails()
{
    $.ajax(
    {
        url: 'index.php?entryPoint=AsteriskIntegrationUserDetails',
        async: false,
        success: function(response)
        {
            var data = $.parseJSON(response);

            localStorage.setItem('AsteriskIntegration:UserID', data.asteriskintegration_user_id);
            localStorage.setItem('AsteriskIntegration:ShowNotification', data.asteriskintegration_show_notification);
            localStorage.setItem('AsteriskIntegration:ServerIP', data.asteriskintegration_server_ip);
            localStorage.setItem('AsteriskIntegration:Extension', data.asteriskintegration_extension);
            localStorage.setItem('AsteriskIntegration:Context', data.asteriskintegration_context);
            localStorage.setItem('AsteriskIntegration:SocketPort', data.asteriskintegration_socket_port);
            localStorage.setItem('AsteriskIntegration:ToggleStatus', data.asteriskintegration_toggle_status);
        }
    });
}

function AsteriskIntegrationUserDetailsSave()
{
    if (performance.navigation.type === 0)
    {
        pb.clear();
        pb.success("<b>Asterisk Integration</b><br/>Require full reoad of page once, if you have modified Asterisk Integration configuration settings.",
        {
            duration: 10000,
            allowClose: true
        });
    }
}

function GenericTimeToString(totalseconds)
{
    var timestring = "";
    var hours = Math.floor(totalseconds / 3600);
    var minutes = Math.floor((totalseconds - (hours * 3600)) / 60);
    var seconds = totalseconds % 60;

    if (hours !== 0)
        timestring += hours + " Hr, ";
    if (minutes !== 0)
        timestring += minutes + " Min, ";
    timestring += seconds + " Sec";

    return timestring;
}

if (GenericGetURLParameter('module') === "Users" && GenericGetURLParameter('action') === "Login")
{
    localStorage.removeItem('AsteriskIntegration:UserID');
    localStorage.removeItem('AsteriskIntegration:ShowNotification');
    localStorage.removeItem('AsteriskIntegration:ServerIP');
    localStorage.removeItem('AsteriskIntegration:Extension');
    localStorage.removeItem('AsteriskIntegration:Context');
    localStorage.removeItem('AsteriskIntegration:SocketPort');
    localStorage.removeItem('AsteriskIntegration:ToggleStatus');
}
else
{
    if (localStorage.getItem('AsteriskIntegration:ServerIP') === null || localStorage.getItem('AsteriskIntegration:Extension') === null || localStorage.getItem('AsteriskIntegration:Context') === null || localStorage.getItem('AsteriskIntegration:SocketPort') === null)
    {
        AsteriskIntegrationUserDetails();
        AsteriskIntegrationMainFunction();
    }
    else
    {
        AsteriskIntegrationMainFunction();
    }
}

function AsteriskIntegrationMainFunction()
{
    asteriskintegration_user_id = localStorage.getItem('AsteriskIntegration:UserID');
    asteriskintegration_show_notification = localStorage.getItem('AsteriskIntegration:ShowNotification');
    asteriskintegration_server_ip = localStorage.getItem('AsteriskIntegration:ServerIP');
    asteriskintegration_extension = localStorage.getItem('AsteriskIntegration:Extension');
    asteriskintegration_context = localStorage.getItem('AsteriskIntegration:Context');
    asteriskintegration_socket_port = localStorage.getItem('AsteriskIntegration:SocketPort');

    console.log("Asterisk Integration : User Id = '" + asteriskintegration_user_id + "', Show Notification = '" + asteriskintegration_show_notification + "', Server IP = '" + asteriskintegration_server_ip + "', Extension = '" + asteriskintegration_extension + "', Context = '" + asteriskintegration_context + "'");

    if (asteriskintegration_server_ip !== "" && asteriskintegration_extension !== "" && asteriskintegration_context !== "" && asteriskintegration_socket_port !== "")
    {
        if (localStorage.getItem("AsteriskIntegration:ToggleStatus") === "Minimized")
        {
            asteriskintegration_call_notification_toggle_class = "asteriskintegration_call_notification_minimized";
            asteriskintegration_call_notification_area_width = asteriskintegration_call_notification_minimized_width;
            asteriskintegration_call_notification_titlebar_label = "";
        }
        else
        {
            asteriskintegration_call_notification_toggle_class = "asteriskintegration_call_notification_maximized";
            asteriskintegration_call_notification_area_width = asteriskintegration_call_notification_maximized_width;
            asteriskintegration_call_notification_titlebar_label = asteriskintegration_call_notification_titlebar_text;
        }

        $("body").ready(function()
        {
            if (!$("#asteriskintegration_call_notification_popup").length)
            {
                asteriskintegration_call_notification_popup_html = `
                <div class='asteriskintegration_call_notification_popup' id='asteriskintegration_call_notification_popup' style='width:` + asteriskintegration_call_notification_area_width + `px'>
                    <div class='asteriskintegration_call_notification_titlebar' id='asteriskintegration_call_notification_titlebar'>
                        <span id='asteriskintegration_call_notification_titlebar_text'>` + asteriskintegration_call_notification_titlebar_label + `</span>
                        <a class='` + asteriskintegration_call_notification_toggle_class + `' id='asteriskintegration_call_notification_toggle_popup' href='javascript:void(0);' onclick='AsteriskIntegrationCallNotificationTogglePopup();'>
                        </a>
                    </div>
                    <div class='asteriskintegration_call_notification_container' id='asteriskintegration_call_notification_container'>
                    </div>
                </div>`;

                // $.each(SUGAR.language.languages.app_list_strings.asteriskintegration_disposition_list, function(item, value)
                // {
                //     asteriskintegration_disposition_code_list_html += "<option value='" + item + "'>" + value + "</option>";
                // });
                $("body").append(asteriskintegration_call_notification_popup_html);
                // $("body").append('');
            }

            socket = io.connect(location.protocol + '//' + location.hostname + ':' + asteriskintegration_socket_port,
            {
                query: "extension=" + asteriskintegration_extension
            });


            socket.on('connect', function()
            {
                console.log("%cAsterisk Integration : Successfully Connected To Socket Server", "color: #00FF00");
                $("#asteriskintegration_call_notification_titlebar").css(
                {
                    'background-color': '#404040'
                });
            });

            socket.on('disconnect', function()
            {
                console.log("%cAsterisk Integration : Socket Connection Has Been Disconnected", "color: #FF0000");

                $("#asteriskintegration_call_notification_titlebar").css(
                {
                    'background-color': '#FF0000'
                });
            });

            socket.on('Dial', function(dial_event_result)
            {
                console.log("Asterisk Integration xx: Dial Event : " + JSON.stringify(dial_event_result));

                if (!$("#asteriskintegration_popupbox_" + dial_event_result.uniqueid).length)
                {
                    AsteriskIntegrationDialEventCallPopup(dial_event_result);
                }
            });

            socket.on('Cdr', function(data)
            {
                console.log("Asterisk Integration : Cdr Event : " + JSON.stringify(data));
                AsteriskIntegrationCdrEventCallPopup(data);
            });

            socket.on('CloseCallPopup', function(data)
            {
                console.log("Asterisk Integration : CloseCallPopup Event : " + JSON.stringify(data));
                AsteriskIntegrationCloseCallPopupEvent(data);
            });

            socket.on('ToggleOptions', function(data)
            {
                console.log("Asterisk Integration : ToggleOptions Event : " + JSON.stringify(data));
                AsteriskIntegrationToggleOptionsEvent(data);
            });

            socket.on('Notification', function(data)
            {
                console.log("Asterisk Integration : Notification Event : " + JSON.stringify(data));

                notification = data.notification;
                notification_type = data.notification_type;

                pb.clear();

                switch (notification_type)
                {
                    case "success":
                        pb.success("<b>Asterisk Integration</b><br/>" + notification,
                        {
                            duration: 10000,
                            allowClose: true
                        });
                        break;

                    case "error":
                        pb.error("<b>Asterisk Integration</b><br/>" + notification,
                        {
                            duration: 10000,
                            allowClose: true
                        });
                        break;

                    default:
                        pb.info("<b>Asterisk Integration</b><br/>" + notification,
                        {
                            duration: 10000,
                            allowClose: true
                        });
                        break;
                }
            });
        });
    }
    else
    {
        if ($("#asteriskintegration_call_notification_popup").length)
        {
            $("#asteriskintegration_call_notification_popup").remove();
        }
        console.log("Asterisk Integration : Asterisk Integration configuration incomplete in User profile");
    }
}

function AsteriskIntegrationGetDateYmdHis()
{
    now = new Date();

    year = "" + now.getFullYear();
    month = "" + (now.getMonth() + 1);
    if (month.length === 1)
    {
        month = "0" + month;
    }
    day = "" + now.getDate();
    if (day.length === 1)
    {
        day = "0" + day;
    }
    hour = "" + now.getHours();
    if (hour.length === 1)
    {
        hour = "0" + hour;
    }
    minute = "" + now.getMinutes();
    if (minute.length === 1)
    {
        minute = "0" + minute;
    }
    second = "" + now.getSeconds();
    if (second.length === 1)
    {
        second = "0" + second;
    }
    return year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second;
}

function AsteriskIntegrationHangupCall(hangup_channel)
{
    pb.clear();

    socket.emit('Hangup',
    {
        hangupchannel: hangup_channel
    });
}

function AsteriskIntegrationRedirectCall(redirect_channel)
{
    pb.clear();

    pb.prompt(
        function(newextension)
        {
            if (newextension)
            {
                socket.emit('Redirect',
                {
                    redirectchannel: redirect_channel,
                    newextension: newextension,
                    context: asteriskintegration_context
                });
            }
        },
        "Enter The Extension To Transfer The Call",
        "number",
        "Transfer"
    );
}

/*
function AsteriskIntegrationEmailCompose(emailmodule, emailrecordid, emailname, emailaddress)
{
    SUGAR.quickCompose.init({'composePackage': {'subject': '', 'body': '', 'to_email_addrs': emailaddress, 'parent_type': emailmodule, 'parent_id': emailrecordid, 'parent_name': emailname}});
}
*/
