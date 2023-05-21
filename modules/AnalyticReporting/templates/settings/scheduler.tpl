{literal}
<script id='schedulerTemplate' type='text/ractive'>
    <h2>Test Scheduler</h2>
    <div class="ar-container">
        <p>Select Report:</p>
        <select value="{{selectedReport}}" decorator="select2" style="min-width:375px;">
            {{#types.availableReports}}
                <option value="{{name}}">{{title}}</option>
            {{/}}
        </select>
        <p>Use report configuration options: <input type='checkbox' checked='{{useDefault}}'></p>
        {{^useDefault}}
            <p>Select User:</p>
            <select value="{{selectedUser}}" decorator="select2" style="min-width:250px;">
                {{#types.availableOwners}}
                    <option value="{{id}}">{{name}}</option>
                {{/}}
            </select>
            <p>Or custom email:</p>
            <input type="text" value="{{customEmail}}" placeholder="Type email address" style="padding:3px;">
            <p>Formats:</p>
            <label><input type="checkbox" checked="{{scheduledFormats.xlsx}}"> {/literal}{$MOD.label_export_send_xlsx}{literal}</label>
		    <label><input type="checkbox" checked="{{scheduledFormats.pdf}}"> {/literal}{$MOD.label_export_send_pdf}{literal}</label>
		    <label><input type="checkbox" checked="{{scheduledFormats.pdfxls}}"> {/literal}{$MOD.label_export_send_pdfxls}{literal}</label>
		    <label><input type="checkbox" checked="{{scheduledFormats.url}}"> {/literal}{$MOD.label_export_send_url}{literal}</label>
        {{/}}

        <p><button class="ar-button green" on-click='sendReport'>{/literal}Send report{literal}</button></p>

        <h2 style="margin-top:10px;">Actions</h2>
        <p>Run "Send scheduled reports" script immediately</p>
        <button class="ar-button green" on-click='sendScheduledReport'>{/literal}Launch{literal}</button>
        <h2 style="margin-top:10px;">System information</h2>
        <p>Server Current time: {{debug.currentTime}} {{debug.currentTimeZone}}. Reports are sent based on this time.</p>
        <p>User Current time: {{debug.userCurrentTime}} {{debug.userCurrentTimeZone}}. The list bellow shows schedule times in server time which are obtained using report owner and server timezone offsets. </p>
        <h2 style="margin-top:10px;">Scheduled reports information</h2>
        <table class="ar-table">
            <thead>
                <tr>
                    <th>Report ID</th>
                    <th>Report Name</th>
                    <th>Interval</th>
                    <th>Interval options</th>
                    <th>Time</th>
                    <th>Next Time (Server Time + Report Owner timezone)</th>
                    <th>Formats</th>
                    <th>Emails</th>
                </tr>
            </thead>
            <tbody>
                {{#debug.scheduledReports}}
                <tr>
                    <td>{{id}}</td>
                    <td>{{title}}</td>
                    <td>{{interval}}</td>
                    <td>{{interval_options}}</td>
                    <td>{{time}}</td>
                    <td>{{nexttime}}</td>
                    <td>{{formats}}</td>
                    <td>{{emails}}</td>
                </tr>
                {{/}}
            </tbody>
        </table>
        <h2 style="margin-top:10px;">Server response {{#loader}}<img src="modules/AnalyticReporting/assets/css/select2-spinner.gif" alt="Loading..." />{{/}}</h2>
        <p>{{response}}<p/>

    </div>

</script>
{/literal}


<div id='ar-scheduler'></div>


{literal}
<script>
    //passed to reportBuilder
    var schedulerOptions = {
        //lists of predefined elements
        types:{
            {/literal}
            availableReports: {$reportNames},
            availableOwners: {$availableOwners}
            {literal}
        },
        debug:{
            {/literal}
            currentTime:'{$currentTime}',
            currentTimeZone:'{$currentTimeZone}',
            userCurrentTime:'{$userCurrentTime}',
            userCurrentTimeZone:'{$userCurrentTimeZone}',
            scheduledReports:{$scheduledReports}
            {literal}
        }


    };
</script>
<!-- env:dev --#>
    <script src="modules/AnalyticReporting/assets/js/components/settings/scheduler.js"></script>
<!-- env:dev:end -->
<!-- env:prod -->
    <script src="modules/AnalyticReporting/assets/js/scheduler.min.js"></script>
<!-- env:prod:end -->
{/literal}

