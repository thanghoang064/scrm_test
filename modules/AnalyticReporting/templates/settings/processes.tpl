{literal}
<script id='processesTemplate' type='text/ractive'>
{/literal}
    <h2>Scheduler settings</h2>
    <div class="ar-container">

        <form action="index.php" method="post">
        <input type="hidden" name="module" value="{$moduleName}" />
        <input type="hidden" name="action" value="settings" />
        <label>
            <input type="checkbox" {if $ignoreTimeZoneForScheduler eq 1}checked="checked" {else} {/if} onclick="this.form.submit();" />
            <input type="hidden" name="ignoreTimeZoneForScheduler" value="{if $ignoreTimeZoneForScheduler eq 1}0{else}1{/if}" />
            Do not adjust time zone for scheduler (set if scheduler server time is already set to user time zone)
        </label>
        </form>
{literal}
    </div>
    <h2>{/literal}{$MOD.processes}{literal}</h2>
    <div class="ar-container">
        <div class="jobs-list">
            <table>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Active</th>
                    <th>Edit</th>
                    <th>Run</th>
                </tr>

                {{#types.jobs:index}}
                    <tr>
                        <td>{{name}}</td>
                        <td>{{description}}</td>
                        <td>{{active}}</td>
                        <td><button class="ar-button green" on-click='editJob:{{index}}'>{/literal}{$MOD.label_edit}{literal}</button></td>
                        <td><button class="ar-button green" on-click='runJob:{{id}}'>{/literal}Run process{literal}</button></td>
                    </tr>
                {{/}}
            </table>
            <p>
                <button class="ar-button green" on-click='addJob'>{/literal}New process{literal}</button>
            </p>
            {{#loader}}
                <div class="loader"><img src="modules/AnalyticReporting/assets/css/select2-spinner.gif" alt="Loading..." /></div>
            {{/}}
            <div class="response">
            {{# internal.response.statusCode == 1}}
                <span class="status-success">{{internal.response.statusMessage}}</span>
            {{/}}
            {{# internal.response.statusCode > 1}}
                <span class="status-error">{{internal.response.statusMessage}}</span>
            {{/}}
            </div>
        </div>
        <div class="selected-job">
         {{#selectedJob}}
             <p>
                <label for="job-name">Name</label>
                <input id="job-name" value='{{selectedJob.name}}'/>
            </p>
            <p>
                <label for="job-description">Description</label>
                <input id="job-description" value='{{selectedJob.description}}'/>
            </p>
            <p>
                <label for="job-active">Active</label>
                <input id="job-active" type='checkbox' checked='{{selectedJob.active}}'/>
            </p>
             <p>
                <label for="job-type">Type</label>
               <select id="job-type" value='{{type}}'>
                    {{#types.jobTypes:i}}
                        <option value='{{types.jobTypes[i]}}'>{{types.jobTypes[i]}}</option>
                    {{/}}
                </select>
            </p>


                   {{>type+'Template'}}

            <p>
                <label for="job-state">State</label><br/>
                <textarea readonly value='{{JSON.stringify(selectedJob.state)}}'></textarea>
            </p>
            {{#id}}
            <p>
                <button class="ar-button green" on-click='updateJob:{{id}}'>{/literal}Update{literal}</button>
                <button class="ar-button red" on-click='deleteJob:{{id}}'>{/literal}Delete{literal}</button>
                <button class="ar-button red" on-click='clearJobCache:{{id}}'>{/literal}Clear Job Cache{literal}</button>
            </p>
            {{/}}
            {{^id}}
                <p>
                    <button class="ar-button green" on-click='createJob'>{/literal}Save{literal}</button>
                </p>
            {{/}}
         {{/}}
        </div>

    </div>

</script>

<script id='calculateAuditedFieldStateByMonthTemplate' type='text/ractive'>
    <p><label>Options</label></p>
    <p>
        <label>Module</label>
        <input value='{{descriptor.module}}'/>
    </p>
    <p>
        <label>Field</label>
        <input value='{{descriptor.field}}'/>
    </p>
    <p>
        <label>Number of month</label>
        <input value='{{descriptor.cachedElements}}'/>
    </p>
    <p>
        <label>Max iterations per process run</label>
        <input value='{{descriptor.maxIterations}}'/>
    </p>
    <p>
        <label>Module Table</label>
        <input value='{{descriptor.moduleTable}}'/>
    </p>
    <p>
        <label>Module Audit Table</label>
        <input value='{{descriptor.moduleAuditTable}}'/>
    </p>
</script>

    <script id='calculateAuditedFieldStateByTimePeriodTemplate' type='text/ractive'>
    <p><label>Options</label></p>
    <p>
        <label>Module</label>
         <select id="job-type" value='{{descriptor.module}}'>
            {{#types.jobDescriptors.calculateAuditedFieldStateByTimePeriod.auditedModules}}
                <option value='{{name}}'>{{title}}</option>
            {{/}}
        </select>

    </p>
     <p>
       <label for="job-type">Field</label>
       <select id="job-type" value='{{descriptor.field}}'>
            {{#types.availableFields}}
                <option value='{{name}}'>{{title}}</option>
            {{/}}
        </select>
    </p>


    <p>
       <label for="job-type">Time period</label>
       <select id="job-type" value='{{descriptor.elementType}}'>
            {{#types.jobDescriptors.calculateAuditedFieldStateByTimePeriod.allowedElementTypes}}
                <option value='{{name}}'>{{title}}</option>
            {{/}}
        </select>
    </p>
    <p>
        <label>Number of {{descriptor.elementType}}s</label>
        <input value='{{descriptor.cachedElements}}'/>
    </p>

    <p>
        <label>Max iterations per process run</label>
        <input value='{{descriptor.maxIterations}}'/>
    </p>
</script>

{/literal}

<div id='ar-processes'></div>



{literal}
<script>
    //passed to reportBuilder
    var processesOptions = {
        //lists of predefined elements
        types:{
            {/literal}
            jobs:{$jobs},
            jobTypes:{$jobTypes},
            jobDescriptors:{$jobDescriptors},
            {literal}
        },
        {/literal}
        internal:{$internal},
        {literal}

    };
</script>
<!-- env:dev --#>
    <script src="modules/AnalyticReporting/assets/js/components/settings/processes.js"></script>
<!-- env:dev:end -->
<!-- env:prod -->
    <script src="modules/AnalyticReporting/assets/js/processes.min.js"></script>
<!-- env:prod:end -->
{/literal}

