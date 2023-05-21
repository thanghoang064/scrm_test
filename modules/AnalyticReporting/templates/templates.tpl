<!-- TEMPLATES -->
{literal}

<script id="reportButtonsTemplate" type="text/ractive-template">
{/literal}{if $CANEDIT eq 1}{literal}
<reportBtn text="{/literal}{$MOD.label_save}{literal}" on-clicked="save" className="green"/>
<reportBtn text="{/literal}{$MOD.label_save_as}{literal}" on-clicked="saveAs" className="green" />
{/literal}{/if}
{if $CANDELETE eq 1}{literal}
<reportBtn text="{/literal}{$MOD.label_delete}{literal}" on-clicked="delete" className="red"/>
{/literal}{/if}{literal}
<reportBtn text="{/literal}{$MOD.label_back_to_reports}{literal}" on-clicked="back"/>
{/literal}{if $CANEDIT eq 1 || $CANEXPORT eq 1}{literal}
<a href="javascript:void(0);" class="loadPDF"><img style="vertical-align: middle; margin-right: 3px;" alt="Export report to PDF" src="modules/{/literal}{$moduleName}{literal}/assets/img/pdf_icon.png" />{/literal}{$MOD.label_export_pdf}{literal}</a>
<a href="javascript:void(0);" class="loadPDFXLS"><img style="vertical-align: middle; margin-right: 3px;" alt="Export report to PDF from XLS" src="modules/{/literal}{$moduleName}{literal}/assets/img/pdf_icon.png" />{/literal}{$MOD.label_export_pdf_from_xls}{literal}</a>
<a href="javascript:void(0);" class="loadXLSX"><img style="vertical-align: middle; margin-right: 3px;" alt="Export report to Excel" src="modules/{/literal}{$moduleName}{literal}/assets/img/excel_icon.png" />{/literal}{$MOD.label_export_xlsx}{literal}</a>
<a href="javascript:void(0);" class="loadXLSXHeaders"><img style="vertical-align: middle; margin-right: 3px;" alt="Export report to Excel with Headers" src="modules/{/literal}{$moduleName}{literal}/assets/img/excel_icon.png" />{/literal}{$MOD.label_export_xlsx_headers}{literal}</a>
{/literal}{/if}{literal}
</script>

<script id="selectBoxImgTemplate" type="text/ractive-template">

<select value="{{selected}}" id="{{id}}">
	{{#options:opt}}
	<option 
	data-imagesrc="modules/{/literal}{$moduleName}{literal}/assets/img/{{options[opt][valueName]}}.png"
            data-description=""
	value="{{options[opt][valueName]}}">{{options[opt][titleName]}}</option>
	{{/options}}
</select>
</script>
<script type="text/javascript" src="modules/{/literal}{$moduleName}{literal}/assets/js/dd.js"></script>
<script id="multiSelectBoxTemplate" type="text/ractive-template">
<div style="display:inline-block"><select value="{{selected}}" decorator="multiSelect" multiple="multiple">
{{#optionGroups}}
	<optgroup label="{{.title}}">
		{{#items}}
			<option value="{{.value}}" disabled="{{.disabled}}">{{.title}}</option>
		{{/items}}
	</optgroup>
{{/optionGroups}}
</select></div>
</script>

<script id="groupedBoxTemplate" type="text/ractive-template">
<select value="{{selected}}" decorator="select2:filter">
{{#groups}}
	<optgroup label="{{title}}">
		{{#items}}
			<option value="{{value}}">{{title}}</option>
		{{/items}}
	</optgroup>
{{/groups}}
</select>
</script>

<script id="fieldFilterValueTemplate" type="text/ractive-template">
{{#condition!=="empty" &&condition!=="filled" &&condition!=="today" &&condition!=="tomorrow" &&condition!=="aftert" &&condition!=="yesterday" &&condition!=="tilly" &&condition!=="yesterday" &&condition!=="ndays" &&condition!=="pdays" &&condition!=="gtdays" &&condition!=="ltdays" &&condition!=="tweek" &&condition!=="lweek" &&condition!=="tmonth" &&condition!=="lmonth" &&condition!=="tyear" &&condition!=="lyear" &&condition!=="nquarter" &&condition!=="lquarter" &&condition!=="tquarter" &&condition!=="nweek"  &&condition!=="nolweeks" &&condition!=="nolmonths" &&condition!=="nolquarters" &&condition!=="checked" &&condition!=="unchecked" &&condition!=="assignedto"}}
	{{#fieldType === "txt"}}
		<input value="{{value.0}}" disabled="{{readOnly}}" />
	{{/fieldType}}
	{{#fieldType === "select" || fieldType === "user" || fieldType === "team"|| fieldType === "teams"}}
		<select decorator="select2:filter" value="{{value}}" style="width:100%;" multiple="multiple" disabled="{{readOnly}}">
			{{#availableValues}}
			<option value="{{val}}">{{title}}</option>
			{{/availableValues}}
		</select>
	{{/fieldType}}
	{{#fieldType === "number"}}
		<input pattern= "[0-9\.,]+" type="number" value="{{value.0}}" disabled="{{readOnly}}" />
	{{/fieldType}}
	{{#fieldType === "integer"}}
		<input pattern= "[0-9\.,]+" type="number" value="{{value.0}}" disabled="{{readOnly}}" />
	{{/fieldType}}
	{{#fieldType === "time"}}
		<selectBox selected = "{{value.0}}" options="{{timeValues.hours}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
		<selectBox selected = "{{value.1}}" options="{{timeValues.minutes}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
		<selectBox selected = "{{value.2}}" options="{{timeValues.AmPm}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
		{{#condition=="between" || condition=="nbetween" }}
			<selectBox selected = "{{value.4}}" options="{{timeValues.hours}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
			<selectBox selected = "{{value.5}}" options="{{timeValues.minutes}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
			<selectBox selected = "{{value.6}}" options="{{timeValues.AmPm}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
		{{/condition}}
	{{/fieldType}}
	{{#fieldType === "date"}}
		{{#condition != "weekAndYear"}}
			{{#condition != "monthAndYear"}}
				{{#condition != "quarterAndYear"}}
					<input type="text" decorator="datepicker" value="{{value.0}}" disabled="{{readOnly}}" />
					{{#condition=="between" || condition=="nbetween" }}
						<input type="text" decorator="datepicker" value="{{value.1}}" disabled="{{readOnly}}" />
					{{/condition}}
				{{/condition}}
			{{/condition}}
		{{/condition}}

		{{#condition == "weekAndYear" || condition == "monthAndYear" || condition == "quarterAndYear"}}
			<input type="text" value="{{value.0}}" disabled="{{readOnly}}" placeholder="Year" />
			<input type="text" value="{{value.1}}" disabled="{{readOnly}}" />
		{{/condition}}
	{{/fieldType}}
    {{#fieldType === "datetime"}}
        {{#condition != "weekAndYear"}}
            {{#condition != "monthAndYear"}}
                {{#condition != "quarterAndYear"}}
                    <input type="text" decorator="datepicker" value="{{value.0}}" disabled="{{readOnly}}" />
                    {{#condition != "day" && condition != "week" && condition != "month" && condition != "quarter" && condition != "year"}}
                        <selectBox selected = "{{value.1}}" options="{{timeValues.hours}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
                        <selectBox selected = "{{value.2}}" options="{{timeValues.minutes}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
                        <selectBox selected = "{{value.3}}" options="{{timeValues.AmPm}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
                        {{#condition=="between" || condition=="nbetween" }}
                            <input type="text" decorator="datepicker" value="{{value.4}}" disabled="{{readOnly}}">
                            <selectBox selected = "{{value.5}}" options="{{timeValues.hours}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
                            <selectBox selected = "{{value.6}}" options="{{timeValues.minutes}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
                            <selectBox selected = "{{value.7}}" options="{{timeValues.AmPm}}" titleName="name" valueName="name" readOnly="{{readOnly}}"/>
                        {{/condition}}
                    {{/condition}}
                {{/condition}}
            {{/condition}}
        {{/condition}}

        {{#condition == "weekAndYear" || condition == "monthAndYear" || condition == "quarterAndYear"}}
            <input type="text" value="{{value.0}}" disabled="{{readOnly}}" placeholder="Year" />
            <input type="text" value="{{value.1}}" disabled="{{readOnly}}" />
        {{/condition}}
    {{/fieldType}}
{{/condition}}
{{#condition=="ndays" || condition=="pdays" || condition=="gtdays" || condition=="ltdays" || condition=="nolweeks" || condition=="nolmonths" || condition=="nolquarters" }}
	<input value="{{value.0}}" disabled="{{readOnly}}" />
{{/condition}}
</script>
{/literal}{*
<script id="reportFieldSorterTemplate" type="text/ractive-template">
<div style="display:inline-block;">
	<div style="position:absoluete;margin-top:-30px;font-weight:bold;">{/literal}{$MOD.label_selected_columns}{literal}:</div>
	<select  style="min-width:300px;height:100px;" multiple="multiple" on-change="changed" value="{{markedFields}}">
	{{#availableFields}}
		<option value="{{name}}">{{title}}</option>
	{{/availableFields}}
	</select>
</div>
<div style="display:inline-block;vertical-align:top;padding-top:30px">
	<a style="display:block;" href="#" on-click="moveFieldsUp:{{markedFields}}"><img alt="{/literal}{$MOD.label_up}{literal}" src="modules/{/literal}{$moduleName}{literal}/assets/img/arrow_up.png"></a>
	<a style="display:block;" href="#" on-click="removeFields:{{markedFields}}" class="tooltipX">
		<img alt="{/literal}{$MOD.label_remove}{literal}" src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png" />
		<span>{/literal}{$MOD.label_remove_item}{literal}</span>
	</a>
	<a style="display:block;" href="#" on-click="moveFieldsDown:{{markedFields}}"><img alt="{/literal}{$MOD.label_down}{literal}" src="modules/{/literal}{$moduleName}{literal}/assets/img/arrow_down.png"></a>
</div>
</script>*}{literal}

<script id="totalTableTemplate" type="text/ractive-template">
<table class="ar-data-table ar-calculated-column-table-left">
	<thead>
		<tr>
			<th>{/literal}{$MOD.label_group}{literal}</th>
			{{#aggregates:i}}

			{/literal}
			    {foreach from=$aggregatesDefinitions key=index item=descriptor}
                    {literal}
                    {{#.value.{/literal}{$index}{literal}}}
                    <th>{/literal}{$MOD[$descriptor.label]}{literal}({{fieldsByName[aggregates[i].selectedField].bareTitle}})</th>
                    {{/.value.{/literal}{$index}{literal}}}
                    {/literal}
                {/foreach}
			{literal}

			{{/aggregates}}
		</tr>
	</thead>
	<tbody>
		{{#selectedFields:i}}
            <tr style="{{#i==errorAggregates}}border:2px solid red;{{/i==errorAggregates}}">
                <td>{{fieldsByName[selectedFields[i].name].bareTitle}} {{addonTitle(fieldsByName, selectedFields[i].name, selectedFields[i])}}</td>
                {{#aggregates}}

                {/literal}
                    {foreach from=$aggregatesDefinitions key=index item=descriptor}
                        {literal}
                        {{#.value.{/literal}{$index}{literal}}}<td>
                        <input style="vertical-align: middle;" type="checkbox" checked="{{selectedFields[i].showAggregates[.selectedField].{/literal}{$index}{literal}}}" />
                        {{#selectedFields[i].showAggregates[.selectedField].{/literal}{$index}{literal}}}


                        <select value="{{selectedFields[i].showAggregates[.selectedField].calculatePercent.{/literal}{$index}{literal}}}" decorator="multiSelect" multiple="multiple">
                                <optgroup label="{/literal}{$MOD.calculations}{literal}">
                                        <option value="percentFromTotal" >{/literal}{$MOD.percentFromTotal}{literal}</option>
                                </optgroup>
                        </select>


                        {{/}}
                        </td>{{/.value.{/literal}{$index}{literal}}}

                        {/literal}
                    {/foreach}
			    {literal}

                {{/aggregates}}
            </tr>
		{{/selectedFields}}
		<tr>
			<td>
				{/literal}{$MOD.label_grand_total}{literal}
				{{#grandTotalBothShow}}<input type="checkbox" checked="{{grandTotalBoth}}" /> {/literal}{$MOD.grandTotalBoth}{literal}{{/grandTotalBothShow}}
			</td>
		{{#aggregates}}
		{{#value}}

		{/literal}
            {foreach from=$aggregatesDefinitions key=index item=descriptor}
                {literal}
                {{#{/literal}{$index}{literal}}}<td><input type="checkbox" checked="{{totalAggregates[selectedField].{/literal}{$index}{literal}}}" /></td>{{/{/literal}{$index}{literal}}}
                {/literal}
            {/foreach}
        {literal}

		{{/value}}
		{{/aggregates}}
		</tr>
	</tbody>
</table>
</script>


<script id="reportFieldManagerTemplate" type="text/ractive-template">
<div class="tools">
	{/literal}{if $CANEDIT eq 1 && $SHOW_DETAILS}{literal}
	<includeDetails on-changed="includeDetails" />
	{/literal}{/if}{literal}
</div>
<div>
    <input type="text" id="fields-available-search" {/literal}{if $CANEDIT != 1}{literal}disabled="disabled" {/literal}{/if}{literal} style="width:276px;border:1px solid #ddd;padding:3px;margin-bottom:2px;" placeholder="{/literal}{$MOD.label_type_to_search}{literal}" value="{{filter}}" />
    <a href="#" on-click="cleanFilter" id="fields-available-clear" style="margin-left:2px;"><img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross_grey.png" alt="x" style="height:8px;width:8px;" /></a>
</div>
<div style="display:inline-block;">
    <select style="min-width:300px;height:100px;" {/literal}{if $CANEDIT != 1}{literal}disabled="disabled" {/literal}{/if}{literal} multiple="multiple" value="{{markedFields}}">
    {{#filteredBlocks}}
        <optgroup label="{{title}}">
        {{#fields}}
            <option value="{{name}}">{{title}}</option>
        {{/fields}}
        </optgroup>
    {{/filteredBlocks}}
    </select>
</div>
<div style="display:inline-block;vertical-align:top;padding-top:50px">
    {/literal}{if $CANEDIT eq 1}{literal}
    <a href="#" on-click="selectField">
        <img alt="->" src="modules/{/literal}{$moduleName}{literal}/assets/img/arrow_right.png" />
    </a>
    {/literal}{/if}{literal}
</div>
<div style="display:inline-block;">
    <div style="position:absolute;margin-top:-30px;font-weight:bold;">{/literal}{$MOD.label_selected_columns}{literal}:</div>
    <select style="min-width:300px;height:100px;" multiple="multiple" value="{{markedFieldsSelected}}" {/literal}{if $CANEDIT != 1}{literal}disabled="disabled" {/literal}{/if}{literal}>
        {{#selectableFields}}
        <option value="{{name}}">{{title}}</option>
        {{/selectableFields}}
    </select>
</div>
{/literal}{if $CANEDIT eq 1}{literal}
<div style="display:inline-block;vertical-align:top;padding-top:30px">
    <a style="display:block;" href="#" on-click="moveUp">
        <img alt="{/literal}{$MOD.label_up}{literal}" src="modules/{/literal}{$moduleName}{literal}/assets/img/arrow_up.png" />
    </a>
    <a style="display:block;" href="#" on-click="removeField" class="tooltipX">
        <img alt="{/literal}{$MOD.label_remove}{literal}" src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png" />
        <span>{/literal}{$MOD.label_remove_item}{literal}</span>
    </a>
    <a style="display:block;" href="#" on-click="moveDown">
        <img alt="{/literal}{$MOD.label_down}{literal}" src="modules/{/literal}{$moduleName}{literal}/assets/img/arrow_down.png" />
    </a>
</div>
{/literal}{/if}{literal}
<br/>
{/literal}{if $CANEDIT == 1}{literal}
<a class="ar-edit-module" href="{/literal}{$reportEditUrl}{literal}">{/literal}{$MOD.addModuleToCurrentReport}{literal}</a>
{/literal}{/if}{literal}
<br/>
<reportButtonPreview on-preview="preview" />
</script>

<script id="reportFilterManagerTemplate" type="text/ractive-template">
<div style="display:inline-block;">

	<!-- TABLE -->
	<table>
		{{#groups:i}}
			<filterRuleGroup sequence="{{i}}" blocks="{{blocks}}" connector="{{connector}}" filters="{{filters}}" on-deleteGroup="groupDeleted" canDelete="{{groups.length>1}}" fieldHTML="{{~/fieldHTML}}" readOnly="{{readOnly}}" />
		    {/literal}{if $CANEDIT eq 1}{literal}
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="vertical-align:middle;">
                    <a href="javascript:void(0);" on-click="addFilter:{{i}}" class="tooltipX"><img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross_g.png"/><span>{/literal}{$MOD.label_add_filter}{literal}</span></a>
                </td>
            </tr>
            {/literal}{/if}{literal}
		{{/groups}}
	</table>
	<!-- // TABLE -->

	<!-- ADD BUTTONS -->
	<div style="margin-top:10px;">
	{/literal}{if $CANEDIT eq 1}{literal}
		<div style="float:left;">
			<reportBtn on-clicked="addGroup" text="{/literal}{$MOD.label_add_group}{literal}"/>
		</div>
	{/literal}{/if}{literal}
	</div>
	<!-- // ADD BUTTONS -->

</div>
<br/><br/>
<reportButtonPreview on-preview="preview"/>
</script>

<script id="reportAggregateManagerTemplate" type="text/ractive-template">
{/literal}
<div class="tools">
	{if $CANEDIT eq 1 && $SHOW_DETAILS}
	<includeDetails on-changed="includeDetails" />
	{/if}
</div>
<table class="ar-data-table {if $CANEDIT != 1}disabled{/if}">
	<thead>
		<tr>
			<th>{$MOD.label_field}</th>

			    {foreach from=$aggregatesDefinitions key=index item=descriptor}
                    <th>{$MOD[$descriptor.label]}</th>
                {/foreach}
			{literal}
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		{{#aggregates:i}}
			<reportAggregate seq="{{i}}" availableFields="{{~/availableFields}}" fieldsByName="{{~/fieldsByName}}" on-aggregate="updateAggregates" on-deleteAggregate="deleteAggregate" selectedField="{{.selectedField}}" value="{{.value}}" title="{{title}}" bareTitle="{{bareTitle}}" />
		{{/aggregates}}
	</tbody>
</table>
		{/literal}
			{if $CANEDIT eq 1}
				<div style="margin-left:705px">
					<reportBtnGC on-clicked="addAggregate" text="{$MOD.label_add_item}"/>
				</div>
			{/if}
		{literal}
<br/><br/>
<div>
	<reportButtonPreview on-preview="preview"/>
</div>
</script>

<script id="reportGroupingManagerTemplate" type="text/ractive-template">
{/literal}{if $CANEDIT eq 1}{literal}
<div class="tools">
	{/literal}{if $SHOW_DETAILS}{literal}
	<includeDetails on-changed="includeDetails"  />
	{/literal}{/if}{literal}
	<isCrosstab on-changed="isCrosstab" val="{{isCrosstab}}"  aggregatesAsColumnVal="{{aggregatesAsColumn}}" />
</div>
{/literal}{/if}{literal}
<div class="{/literal}{if $CANEDIT != 1}{literal}disabled{/literal}{/if}{literal}">
{/literal}{if $REPORTCOMBINED eq true}{literal}
<sortingByCombined blocks="{{blocks}}" combinedFields="{{combinedFields}}" combinedModules="{{combinedModules}}" selectedFields="{{selectedFields}}" aggregates="{{aggregates}}" isCrosstab="{{isCrosstab}}" isCombined="{{isCombined}}" availableFields="{{availableFields}}"/>
{/literal}{/if}
{*{if $SHOW_TABLE}*}{literal}
<sortingBy blocks="{{blocks}}" canSort="{{canSort}}" selectedFields="{{selectedFields}}" aggregates="{{aggregates}}"
           isCrosstab="{{isCrosstab}}" isCombined="{{isCombined}}"
           availableFields="{{availableFields{/literal}{if $REPORTCOMBINED eq true}{literal}Possible{/literal}{/if}{literal}}}"
           fieldsByName="{{~/fieldsByName}}"
        />
{/literal}
	{if $CANEDIT eq 1}{literal}
	<div style="margin-left:731px;">
		<reportBtnGC on-clicked="addItem" text="{/literal}{$MOD.label_add_item}{literal}"/>
	</div>
    {/literal}{/if}{*{/if}*}{literal}
<br/><br/>
    <div class="ar-clearfix">
        <div style="float: left;">
            <b>{/literal}{$MOD.label_select_summaries}{literal}</b>
            <br/>
            <totalTable selectedFields="{{selectedFields}}" availableFields="{{availableFields}}" aggregates="{{aggregates}}" totalAggregates="{{totalAggregates}}" isCrosstab="{{isCrosstab}}" errorAggregates="{{errorAggregates}}" fieldsByName="{{fieldsByName}}" grandTotalBoth="{{options.grandTotalBoth}}"/>
        </div>
        <div style="float: left; margin-left: 3px;">

        {{#includeDetails == false && isCrosstab == false}}
        <calcColumns calculations="{{calculatedColumns}}" selectedFields="{{selectedFields}}" aggregates="{{aggregates}}" />
        {{/}}
        </div>
        <br/><br/>
    </div>
</div>
<reportButtonPreview on-preview="preview"/>
</script>

<!-- ------------------- Calculated columns start ------------------- -->
<script id="calculatedColumnsTemplate" type="text/ractive-template">
<b>{/literal}{$MOD.calculatedColumns}{literal}:</b>
<br/>
<table class="ar-data-table ar-calculated-column-table-right" style="min-width: 100px;">
	<thead>
		<tr>

			{{#calculations:i}}
			    <th>

                    {{name}}
                    {{#level}}
                        <button on-click='editFormula:{{i}}' class="btn btn-success">Edit</button> <button on-click='deleteFormula:{{i}}' class="btn btn-danger">Delete</button>
                    {{/}}
                    {{^level}}
                        <button on-click='addFormula:{{i}}' class="btn btn-success">Add</button>
                    {{/}}
                    <img on-click="deleteCalculation" style="cursor: pointer; float:right;" src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png" alt="Delete"/>
                </th>
			{{/}}
			<th>{/literal}Add Calculation{literal}</th>
		</tr>
	</thead>
	<tbody>
		{{#selectedFields:i}}
            <tr>



                {{#calculations}}
			        <td>

                    </td>
			    {{/}}

                {{#if i == 0}}
                    <td rowspan="{{selectedFields.length + 1}}">
                        <img on-click="addCalculation" style="cursor: pointer;" src="modules/{/literal}{$moduleName}{literal}/assets/img/cross_g.png" alt="Add"/>
                    </td>
                {{/if}}
            </tr>
		{{/selectedFields}}

		<tr>

			{{#calculations}}
			    <td></td>
			{{/}}
		</tr>
	</tbody>
</table>
</script>

<script id="calcColumnsModalTemplate" type="text/ractive-template">
<div class="ar-calculated-column-formula-editor">
  <h2>Edit formula</h2>
   Name: <input value="{{formula.name}}" />
   {{#formula.calculation}}
        <arithmeticGroup connector="{{connector}}" value="{{value}}" type="{{type}}" disableType="true">
   {{/}}
   <br />
  <button class="ar-button" on-click='cancel'>Save and close</button>
</div>
</script>

<script id="arithmeticGroupTemplate" type="text/ractive-template">

    {{#if connector != 'none'}}
        <select value="{{connector}}">
            {{#availableConnectors}}
                <option value="{{id}}">{{name}}</option>
            {{/availableConnectors}}
        </select>
    {{/if}}
    {{^disableType}}
    <select value="{{type}}">
        {{#nodeTypes}}
            <option value="{{id}}">{{name}}</option>
        {{/nodeTypes}}
    </select>
    {{/}}
<ul class="ar-arithmetic-group">
    {{#value : i }}
        <li>
            {{#if i > 0}}
                <img on-click="remove:{{i}}" style="cursor: pointer; vertical-align: middle;;" src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png" alt="Delete"/>
            {{/if}}
           {{>calcColumnsVariablesTemplate}}
        </li>
    {{/}}
    <li><button class="ar-button" on-click='add'>Add</button></li>

</ul>
</script>

<script id="calcColumnsVariablesTemplate" type="text/ractive-template">
    {{#if type == 'constant'}}
        <constant connector="{{connector}}" value="{{value}}" type="{{type}}"/>
    {{/if}}
    {{#if type == 'field'}}
        <columnField connector="{{connector}}" value="{{value}}" type="{{type}}"/>
    {{/if}}
    {{#if type == 'arithmeticGroup'}}
        <arithmeticGroup connector="{{connector}}" value="{{value}}"  type="{{type}}" disableType="false"/>
    {{/if}}
    {{#if type == 'logicGroup'}}
        <logicGroup connector="{{connector}}" value="{{value}}"  type="{{type}}"/>
    {{/if}}
</script>

<script id="logicGroupTemplate" type="text/ractive-template">

    {{#if connector != 'none'}}
        <select value="{{connector}}">
            {{#availableConnectors}}
                <option value="{{id}}">{{name}}</option>
            {{/availableConnectors}}
        </select>
    {{/if}}

    <select value="{{type}}">
        {{#nodeTypes}}
            <option value="{{id}}">{{name}}</option>
        {{/nodeTypes}}
    </select>

<ul class="ar-logic-group">
    {{#value }}

            {{#ifLogic}}
                <li><b>If</b>
                {{#operand1}}
                    {{>calcColumnsVariablesTemplate}}
                {{/}}
                </li>
                <li>
                    <select value="{{operator}}">
                        {{#availableLogicActions}}
                            <option value="{{id}}">{{name}}</option>
                        {{/availableConnectors}}
                    </select>
                </li>
                {{#if operator != 'empty'}}
                    {{#if operator != 'notEmpty'}}
                        <li>
                            {{#operand2}}
                                {{>calcColumnsVariablesTemplate}}
                            {{/}}
                        </li>
                    {{/if}}
                {{/if}}
                <li><b>Then</b>
                {{#result}}
                    {{>calcColumnsVariablesTemplate}}
                {{/}}
                </li>
            {{/}}

            {{#elseIfLogic:i}}
                <li><img on-click="removeElseIf:{{i}}" style="cursor: pointer; vertical-align: middle;;" src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png" alt="Delete"/><b>Else If</b>
                {{#operand1}}
                    {{>calcColumnsVariablesTemplate}}
                {{/}}
                </li>
                <li>
                    <select value="{{operator}}">
                        {{#availableLogicActions}}
                            <option value="{{id}}">{{name}}</option>
                        {{/availableConnectors}}
                    </select>
                </li>
                {{#if operator != 'empty'}}
                    {{#if operator != 'notEmpty'}}
                        <li>
                        {{#operand2}}
                            {{>calcColumnsVariablesTemplate}}
                        {{/}}
                        </li>
                    {{/if}}
                {{/if}}
                <li><b>Then</b>
                {{#result}}
                    {{>calcColumnsVariablesTemplate}}
                {{/}}
                </li>
            {{/}}
            <button class="ar-button" on-click='addElseIf'>Add Else If</button>

            {{#elseLogic}}
                <li><b>Else</b>
                {{#result}}
                    {{>calcColumnsVariablesTemplate}}
                {{/}}
                </li>
            {{/}}

    {{/}}

</ul>
</script>

<script id="constantTemplate" type="text/ractive-template">
{{#if connector != 'none'}}
    <select value="{{connector}}">
        {{#availableConnectors}}
            <option value="{{id}}">{{name}}</option>
        {{/availableConnectors}}
    </select>
{{/if}}
    <select value="{{type}}">
        {{#nodeTypes}}
            <option value="{{id}}">{{name}}</option>
        {{/nodeTypes}}
    </select>
<input value="{{value}}" />
</script>

<script id="columnFieldTemplate" type="text/ractive-template">
{{#if connector != 'none'}}
    <select value="{{connector}}">
        {{#availableConnectors}}
            <option value="{{id}}">{{name}}</option>
        {{/availableConnectors}}
    </select>
{{/if}}
    <select value="{{type}}">
        {{#nodeTypes}}
            <option value="{{id}}">{{name}}</option>
        {{/nodeTypes}}
    </select>
    <select value="{{value}}">
        {{#availableValues}}
            <option value="{{id}}">{{name}}</option>
        {{/availableValues}}
    </select>
</script>

<!-- ------------------- Calculated columns END ------------------- -->

<script id="sortingByFieldTemplate" type="text/ractive-template">
<tr>
	<td class="groupingLevel"><h3></h3></td>
	<td>
		<selectBox options="{{sortOptions}}" valueName="name" titleName="title" selected="{{sortAction}}"/>
	</td>
	<td>
		<selectBox options="{{fields}}" valueName="name" titleName="title" selected="{{name}}" />
		{{#isDate}}
			<selectBox options="{{dateOptions}}" valueName="name" titleName="title" selected="{{dateGrouping}}"/>
		{{/isDate}}
		{{#isMultiSelect}}
		<br><label><input type="checkbox" checked="{{.transform}}"> {/literal}{$MOD.label_merge_multiple_selections}{literal}</label>
		{{/isMultiSelect}}

		{{#isNumeric}}
            <div>
                <div style="margin: 3px 0 3px 0">
                    {/literal}{$MOD.groupByRange}{literal} <input type="checkbox" checked="{{groupByRange}}"  class="input-mini" />
                    {{#groupByRange}}
                        {{^includeDetails}}
                            {{#last}}
                                <selectBox options="{{groupByAggregateType}}" valueName="name" titleName="title" selected="{{groupByAggregate}}"/>
                            {{/}}
                        {{/}}
                    {{/}}
                </div>
                {{#groupByRange}}
                   {{#ranges:i}}
                   <p>
                        <label>{/literal}{$MOD.start}{literal}:</label><input type="text" value="{{start}}" placeholder="0" size="10" class="input-mini" />
                        <label>{/literal}{$MOD.end}{literal}:</label><input type="text" value="{{end}}" placeholder="0" size="10" class="input-mini" />
                        <label>{/literal}{$MOD.rangeName}{literal}:</label><input type="text" value="{{name}}" placeholder="" size="15" class="input-mini" />
                        <img style="vertical-align:middle; cursor: pointer;" on-click="removeRange:{{i}}" src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png"/>
                   </p>
                   {{/}}
                   <br/>
                    <button on-click='addRange' class="btn btn-success">New range</button>
                {{/}}
            </div>
		{{/isNumeric}}
	</td>
	<td>
	{{#sortAction == "sort" || sortAction == "groupsort" }}
        {{#hasAggregates}}
        <selectBox options="{{getAggregates}}" valueName="name" titleName="title" selected="{{aggregate}}"/>
        {{/hasAggregates}}

		<selectBox options="{{sortDirections}}" valueName="name" titleName="title" selected="{{sortDirection}}"/>
	{{/sortAction}}

	{{#isCombined == false && isCrosstab == false}}
	<div>
	{/literal}{$MOD.label_show_top}{literal} <input type="text" value="{{showTop}}" placeholder="All" size="5" class="input-mini" />
	</div>
	{{/seq}}

    {{#isCombined == false && canSort == false && allowedShowAll}}
	<div>
	    {/literal}{$MOD.showAllValues}{literal} <input type="checkbox" checked="{{showAllValues}}"  class="input-mini" />
	</div>
    {{/}}

	</td>
	{{#isCrosstab}}
	<td>
		<selectBox options="{{positions}}" valueName="name" titleName="title" selected="{{position}}"/>
	</td>
	{{/isCrosstab}}
	<td>
		<a href="#" on-click="delete:{{seq}}" class="tooltipX">
			<img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png"/>
			<span>{/literal}{$MOD.label_remove_item}{literal}</span>
		</a>
	</td>
</tr>
</script>


<script id="sortingByCombinedFieldTemplate" type="text/ractive-template">
		<selectBox options="{{fields}}" valueName="name" titleName="title" selected="{{selectedValue}}" />
</script>

<script id="sortingByTemplate" type="text/ractive-template">
<table class="ar-data-table">
	<thead>
		<tr>
			<th>{/literal}{$MOD.label_level}{literal}</th>
			<th>{/literal}{$MOD.label_action}{literal}</th>
			<th>{/literal}{$MOD.label_group_by}{literal}</th>
			<th>{/literal}{$MOD.label_sort}{literal}</th>
			{{#isCrosstab}}
			<th>{/literal}{$MOD.label_position}{literal}</th>
			{{/isCrosstab}}
			<th style="width:12px;">&nbsp;</th>
		</tr>
	</thead>
	<tbody>
	{{#selectedFields:i}}
		<sortingByField canSortParam="{{ ( (i<1) || selectedFields[i-1].sortAction!='sort') }}" fields="{{fields}}"
                        canSort="{{canSort}}" sortOptions="{{sortOptions}}" title="{{title}}" name="{{name}}"
                        sortAction="{{sortAction}}" aggregate="{{aggregate}}" dateGrouping="{{.dateGrouping}}"
                        sortDirection="{{sortDirection}}" aggregates="{{aggregates}}" position="{{position}}"
                        isFirst="{{isFirst}}" seq="{{i}}" showAggregates="{{showAggregates}}"
                        fieldsByName="{{~/fieldsByName}}" on-deleted="deleteSort" on-fieldChanged="updateField"
		                transform="{{transform}}" showTop="{{.showTop}}" ranges="{{ranges}}" groupByRange="{{groupByRange}}"
		                groupByAggregate="{{groupByAggregate}}" last="{{i < (selectedFields.length-1) ? false : true}}"
				/>
	{{/selectedFields}}
	</tbody>
</table>
</script>

<script id="sortingByCombinedTemplate" type="text/ractive-template">
<table class="ar-data-table">
	<thead>
		<tr>
			<th>{/literal}{$MOD.label_level}{literal}</th>
			<th>{/literal}{$MOD.label_action}{literal}</th>
			<th>{/literal}{$MOD.label_group_by}{literal}</th>
			<th>{/literal}{$MOD.label_date_group}{literal}</th>
			<th>{/literal}{$MOD.label_sort}{literal}</th>
			{{#isCrosstab}}
			<th>{/literal}{$MOD.label_position}{literal}</th>
			{{/isCrosstab}}
		</tr>
	</thead>
	<tbody>
    <tr>
        <td class="groupingLevel">
            <h3></h3>
        </td>
        <td>
            <selectBox options="{{sortOptions}}" valueName="name" titleName="title" selected="{{combinedSelectedFields.sortAction}}"/>
        </td>
        <td>
            {{#combinedFields:moduleId}}
            <sortingByCombinedField fields="{{.}}" selectedValue="{{combinedSelectedFields.fields[moduleId]}}" title="{{title}}" name="{{name}}" sortAction="{{combinedSelectedFields.sortAction}}" dateGrouping="{{combinedSelectedFields.dateGrouping}}" sortDirection="{{combinedSelectedFields.sortDirection}}" position="{{combinedSelectedFields.position}}" seq="{{moduleId}}" combinedModulesCount="{{combinedModulesCount}}" /><br />
            {{/combinedFields}}
        </td>
        <td>
            <selectBox options="{{dateOptions}}" valueName="name" titleName="title" selected="{{combinedSelectedFields.dateGrouping}}"/>
        </td>

        <td>
            <selectBox options="{{sortDirections}}" valueName="name" titleName="title" selected="{{combinedSelectedFields.sortDirection}}"/>
        </td>
        {{#isCrosstab}}
        <td>
            <selectBox options="{{positions}}" valueName="name" titleName="title" selected="{{combinedSelectedFields.position}}"/>
        </td>
        {{/isCrosstab}}
    </tr>
	</tbody>
</table>
</script>

<script id="reportAggregateTemplate" type="text/ractive-template">
{/literal}{* #3938 [start] - validate aggregates *}{literal}
		<tr style="{{#seq===invalidAggregate}}border:2px solid red;{{/seq===invalidAggregate}}">
			<td><selectBox options="{{availableFields}}" valueName="name" titleName="title" on-selectedValue="fieldSelected" selected="{{selectedField}}" /></td>

			{/literal}
			    {foreach from=$aggregatesDefinitions key=index item=descriptor}
                    {literal}
                        <td><input type="checkbox" checked="{{value.{/literal}{$index}{literal}}}" disabled="{{disabled.{/literal}{$index}{literal}}}" /></td>
                    {/literal}
                {/foreach}
			{literal}
			<td><a href="#" on-click="remove" class="tooltipX">
				<img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png"/>
				<span>{/literal}{$MOD.label_remove_item}{literal}</span>
			</a></td>
		</tr>
{/literal}{* #3938 [end] *}{literal}
</script>

<script id="filterRuleGroupTemplate" type="text/ractive-template">
<tr class="{{#sequence}}filter group{{/sequence}}">
	<td colspan="5">{{#sequence}}<fieldConnector connector="{{connector}}" readOnly="{{readOnly}}"/>{{/sequence}}</td>
	<td style="vertical-align:middle;">
		{{#canDelete && sequence && !readOnly}}
			<a href="#" on-click="delete:{{sequence}}">
				<img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png"/>
			</a>
		{{/canDelete}}
	</td>
</tr>
{{#filters:i}}
	<filterRule
	    on-deleteRule="ruleDeleted"
	    sequence="{{i}}"
	    fieldName="{{fieldName}}"
	    value="{{value}}"
	    condition="{{condition}}"
	    connector="{{connector}}"
	    blocks="{{blocks}}"
        fieldHTML="{{~/fieldHTML}}"
        selectedAccessRight="{{selectedAccessRight}}"
        commonFilter="{{commonFilter}}"
    />
{{/filters}}
</script>

<script id="filterRuleTemplate" type="text/ractive-template">
<tr class="filter">
	<td style="vertical-align:middle;{{^sequence}}padding:0;{{/sequence}}">{{#sequence}}<fieldConnector connector="{{connector}}" readOnly="{{readOnly}}" />{{/sequence}}</td>
	<td style="vertical-align:middle;"><fieldSelector fieldHTML="{{fieldHTML}}" selectedField="{{fieldName}}" readOnly="{{readOnlyPublicField}}" /></td>
	<td style="vertical-align:middle;"><fieldCondition fieldType="{{fieldType}}" condition="{{condition}}" readOnly="{{readOnlyPublic}}" selectedAccessRight="{{selectedAccessRight}}" /></td>
	<td style="vertical-align:middle;" class="conditions"><fieldFilterValue fieldType="{{fieldType}}" condition="{{condition}}" value="{{value}}" availableValues="{{availableValues}}" readOnly="{{readOnlyPublic}}" selectedAccessRight="{{selectedAccessRight}}" /></td>
	<td style="vertical-align:middle;">{{^readOnly}}<selectBox options="{{accessRights}}" valueName="name" titleName="title" descriptionName="description" selected="{{selectedAccessRight}}" />{{/readOnly}}</td>
	<td style="vertical-align:middle;"><input type="checkbox" checked="{{commonFilter}}" /> Add to common filters</td>
	<td style="vertical-align:middle;">
	    {{^readOnly}}
			<a href="#" on-click="delete:{{sequence}}" class="tooltipX">
				<img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png"/>
				<span>{/literal}{$MOD.label_remove_filter}{literal}</span>
			</a>
        {{/readOnly}}
	</td>
</tr>
</script>



<script id="chartTypeTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
	<label>{/literal}{$MOD.label_type}{literal}: <selectBoxImg id="cts" options="{{chartTypes}}" valueName="name" titleName="title" selected="{{chartType}}"/></label>
</div>
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<script id="funnelChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
	<div><label>{/literal}{$MOD.label_cumulated}{literal}: <input type="checkbox" checked="{{cumulated}}" /></label></div>
	<div><label>{/literal}{$MOD.label_funnel_group_by}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}" /></label></div>
	<div><label>{/literal}{$MOD.label_value}{literal}: <selectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}"/></label></div>
	<div><label>{/literal}{$MOD.label_show_percents}{literal}: <input type="checkbox" checked="{{showPercents}}" /></label></div>
	<div><label>{/literal}{$MOD.label_decimal_digits}{literal}: <selectBox options="{{chartDecimals}}" valueName="value"  titleName="title" selected="{{decimalDigits}}"/></label></div>
	{{#cumulated}}
	{{#sortableValues.length}}
	<div style="padding-top:10px;">
		<i>{/literal}{$MOD.label_drag_values_hint}{literal}</i>
		<ul id="sortableValues" class="ui-sortable">
		{{#sortableValues}}
			<li decorator='sortable' class="ui-state-default ui-sortable-handle">{{value}}</li>
		{{/sortableValues}}
		</ul>
	</div>
	{{/sortableValues.length}}
	{{/cumulated}}
</div>
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<script id="gaugeChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
	<div><label>{/literal}{$MOD.label_group}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	{{#availableGroupSegments.length}}
	<div><label>{/literal}{$MOD.label_group_segment}{literal}: <selectBox options="{{availableGroupSegments}}" valueName="name" titleName="title" selected="{{xAxisSegment}}"/></label></div>
	{{/availableGroupSegments.length}}
	<div><label>{/literal}{$MOD.label_value}{literal}: <selectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}"/></label></div>
	<div><label>{/literal}{$MOD.label_decimal_digits}{literal}: <selectBox options="{{chartDecimals}}" valueName="value"  titleName="title" selected="{{decimalDigits}}"/></label></div>
	{/literal}{$MOD.label_value_ranges}{literal}:

	<div style="display:table;">
		{{#valueZones:i}}
		<div>
			<input type="text" value="{{from}}" size="10" /> - 
			<input type="text" value="{{to}}" size="10" />
 			<selectBox options="{{availableValueZones}}" valueName="name" titleName="title" selected="{{clazz}}"/>
 			{{#i != 0}}
 			<a href="#" on-click="removeValueZone:{{i}}"><img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png" alt="Remove" style="vertical-align:middle" /></a>
 			{{/i}}
		</div>
		{{/valueZones}}
		<div style="padding-top:3px;text-align:right;">
			<a href="#" on-click="addValueZone">
				<img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross_g.png" alt="Add"/>
			</a>
		</div>
	</div>
	<div>
		<label>{/literal}{$MOD.label_show_gauge_labels}{literal}: <input type="checkbox" checked="{{showLabels}}" /></label>
	</div>
	<div>
		<label>{/literal}{$MOD.label_show_gauge_zone_labels}{literal}: <input type="checkbox" checked="{{showZoneLabels}}" /></label>
	</div>
</div>
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<script id="pieChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
	<div><label>{/literal}{$MOD.label_legend}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	<div><label>{/literal}{$MOD.label_value}{literal}: <selectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}"/></label></div>
	<div><label>{/literal}{$MOD.label_show_percents}{literal}: <input type="checkbox" checked="{{showPercents}}" /></label></div>
	<div><label>{/literal}{$MOD.label_decimal_digits}{literal}: <selectBox options="{{chartDecimals}}" valueName="value"  titleName="title" selected="{{decimalDigits}}"/></label></div>
</div>
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<script id="barChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
    {{#swapAxis}}
	<div><label>{/literal}{$MOD.label_primary_horizontal}{literal}: <multiSelectBox aggregates="{{aggregates}}" groups="{{groups}}" options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}" disableSelectBox="{{disableSelectBox}}" /></label></div>
	<div><label>{/literal}{$MOD.label_secondary_vertical}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
    {{/swapAxis}}
    {{^swapAxis}}
	<div><label>{/literal}{$MOD.label_primary_horizontal}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	<div><label>{/literal}{$MOD.label_secondary_vertical}{literal}: <multiSelectBox aggregates="{{aggregates}}" groups="{{groups}}" options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}" disableSelectBox="{{disableSelectBox}}" /></label></div>
    {{/swapAxis}}

	<div><label>{/literal}{$MOD.label_legend}{literal}: <multiSelectBox aggregates="{{aggregates}}" groups="{{groups}}" options="{{availableLegends}}" valueName="name" titleName="title" selected="{{legend}}" disableSelectBox="{{false}}" /></label></div>
	<div><label>{/literal}{$MOD.label_decimal_digits}{literal}: <selectBox options="{{chartDecimals}}" valueName="value"  titleName="title" selected="{{decimalDigits}}"/></label></div>
    <div><label>{/literal}{$MOD.label_show_percents}{literal}: <input type="checkbox" checked="{{showPercents}}" /></label></div>
    <div><label>{/literal}{$MOD.label_swap_axis}{literal}: <input type="checkbox" checked="{{swapAxis}}" /></label></div>
</div>
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<script id="horizontalBarChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
   <label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
   <div><label>{/literal}{$MOD.label_primary_horizontal}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
   <div><label>{/literal}{$MOD.label_secondary_vertical}{literal}: <multiSelectBox aggregates="{{aggregates}}" groups="{{groups}}" options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}" disableSelectBox="{{disableSelectBox}}" /></label></div>
   <div><label>{/literal}{$MOD.label_legend}{literal}: <multiSelectBox aggregates="{{aggregates}}" groups="{{groups}}" options="{{availableLegends}}" valueName="name" titleName="title" selected="{{legend}}" disableSelectBox="{{false}}" /></label></div>
   <div><label>{/literal}{$MOD.label_decimal_digits}{literal}: <selectBox options="{{chartDecimals}}" valueName="value"  titleName="title" selected="{{decimalDigits}}"/></label></div>
</div>
<div class="tools">
   <chartButtons on-preview="preview"/>
</div>
<div>
   <label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<script id="lineChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
	<div><label>{/literal}{$MOD.label_primary_horizontal}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	<div><label>{/literal}{$MOD.label_secondary_vertical}{literal}: <multiSelectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}" disableSelectBox="{{disableSelectBox}}" /></label></div>
	<div><label>{/literal}{$MOD.label_legend}{literal}: <multiSelectBox aggregates="{{aggregates}}" groups="{{groups}}" options="{{availableLegends}}" valueName="name" titleName="title" selected="{{legend}}" disableSelectBox="{{false}}" /></label></div>
	<div><label>{/literal}{$MOD.label_decimal_digits}{literal}: <selectBox options="{{chartDecimals}}" valueName="value"  titleName="title" selected="{{decimalDigits}}"/></label></div>
</div>
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<script id="combinedChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
	<div><label>{/literal}{$MOD.label_primary_horizontal}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	<div><label>{/literal}{$MOD.label_secondary_vertical}{literal}: <multiSelectBox options="{{availableAxis1}}" valueName="name" titleName="title" selected="{{yAxis}}" disableSelectBox="{{false}}" /></label><selectBox options="{{availableTypes}}" valueName="name" titleName="title" selected="{{yAxisType}}" />{{#yAxisType == 'bar'}}<label><input type="checkbox" checked="{{bars1Stacked}}" />{/literal}{$MOD.label_stacked}{literal}</label>{{/yAxisType == 'bar'}}</div>
	<div><label>{/literal}{$MOD.label_third_vertical}{literal}: <multiSelectBox options="{{availableAxis2}}" valueName="name" titleName="title" selected="{{yAxis2}}" disableSelectBox="{{false}}" /></label><selectBox options="{{availableTypes}}" valueName="name" titleName="title" selected="{{yAxis2Type}}" />{{#yAxis2Type == 'bar'}}<label><input type="checkbox" checked="{{bars2Stacked}}" />{/literal}{$MOD.label_stacked}{literal}</label>{{/yAxis2Type == 'bar'}}</div>
	<div><label>{/literal}{$MOD.label_legend}{literal}: <multiSelectBox options="{{availableLegends}}" aggregates="{{aggregates}}" valueName="name" titleName="title" selected="{{legend}}" disableSelectBox="{{false}}" /></label></div>
	<div><label>{/literal}{$MOD.label_decimal_digits}{literal}: <selectBox options="{{chartDecimals}}" valueName="value"  titleName="title" selected="{{decimalDigits}}"/></label></div>
</div>
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<script id="mapChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
	<div><label>{/literal}{$MOD.label_map_for}{literal}: <selectBox options="{{availableMaps}}" valueName="name" titleName="title" selected="{{mapType}}"/></label></div>
	{{#mapType == 'city'}}
	<div><label>{/literal}{$MOD.label_identify_country}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{country}}" disableSelectBox="{{false}}" /></label></div>

	<div><label>{/literal}{$MOD.label_identify_state}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{state}}"/></label></div>

	<div><label>{/literal}{$MOD.label_identify_city}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	{{/mapType}}

	{{#mapType == 'state'}}
	<div><label>{/literal}{$MOD.label_identify_country}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{country}}" disableSelectBox="{{false}}" /></label></div>

	<div><label>{/literal}{$MOD.label_identify_state}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	{{/mapType}}

	{{#mapType == 'country'}}
	<div><label>{/literal}{$MOD.label_identify_country}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	{{/mapType}}

	<div><label>{/literal}{$MOD.label_value}{literal}: <selectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}"/></label></div>

	<div><label><input type="checkbox" checked="{{marker}}" /> Map with pie chart</label></div>
	{{#marker}}
	<div><label>{/literal}{$MOD.label_legend}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{markerAxisX}}"/></label></div>
	<div><label>{/literal}{$MOD.label_value}{literal}: <selectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{markerAxisY}}"/></label></div>
	{{/marker}}
</div>

<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
</script>

<script id="areaChartLegendTemplate" type="text/ractive-template">
<div class="chartSizeBox">
	<label>{/literal}{$MOD.label_chart_size}{literal}: <selectBox options="{{chartSizes}}" valueName="value" titleName="title" selected="{{chartSize}}" on-selected="resizeChart" /></label>
</div>
<div>
	<div><label>{/literal}{$MOD.label_primary_horizontal}{literal}: <selectBox options="{{availableGroups}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	<div><label>{/literal}{$MOD.label_secondary_vertical}{literal}: <multiSelectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}" disableSelectBox="{{disableSelectBox}}" /></label></div>
	<div><label>{/literal}{$MOD.label_legend}{literal}: <multiSelectBox aggregates="{{aggregates}}" groups="{{groups}}" options="{{availableLegends}}" valueName="name" titleName="title" selected="{{legend}}" disableSelectBox="{{false}}" /></label></div>
	<div><label>{/literal}{$MOD.label_decimal_digits}{literal}: <selectBox options="{{chartDecimals}}" valueName="value"  titleName="title" selected="{{decimalDigits}}"/></label></div>
	{{#sortableValues.length}}
	<div style="padding-top:10px;">
		<i>{/literal}{$MOD.label_drag_values_hint}{literal}</i>
		<ul id="sortableValues" class="ui-sortable">
		{{#sortableValues}}
			<li decorator='sortable' class="ui-state-default ui-sortable-handle">{{value}}</li>
		{{/sortableValues}}
		</ul>
	</div>
	{{/sortableValues.length}}
</div>
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<label>{/literal}{$MOD.label_title}{literal}: <input style="width: 560px;" type="text" value="{{chartTitle}}" /></label>
</div>
</script>

<!--
<script id="chartLabelTemplate" type="text/ractive-template">
<div class="tools">
	<chartButtons on-preview="preview"/>
</div>
<div>
	<div><label>Legend: <selectBox options="{{availableLegends}}" valueName="name" titleName="title" selected="{{legend}}"/></label></div>
	<div><label>Primary Horizontal Axis: <selectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{xAxis}}"/></label></div>
	<div><label>Secondary Vertical Axis: <selectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{yAxis}}"/></label></div>
	<div><label>Third Vertical Axis:  <selectBox options="{{availableAxis}}" valueName="name" titleName="title" selected="{{y2Axis}}"/></label></div>
</div>
<div>
{{#availableGroups:i}}
	<label><input type="radio" value="{{name}}" checked="{{name == labelName}}" name="{{labelName}}"/> {{title}}</label><br />
{{/availableGroups}}
</div>
</script>
-->

<script id="chartComponentTemplate" type="text/ractive-template">
<chartComponent points='{{points}}'/>
</script>

<script id="chartViewTemplate" type="text/ractive-template">
{{#type == "map"}}
	<div id="choropleth" style="height:100%"></div>
{{else}}
<svg></svg>
{{/type}}

{{#showLinks}}
<br />
<div>
	<a id="exportChartAs" target="_blank" style="cursor:pointer">{/literal}{$MOD.label_save_chart}{literal}</a>
	<a id="addToDashboard" style="cursor:pointer">{/literal}{$MOD.label_add_to_dashboard}{literal}</a>
	<div style="float:right;">
		{/literal}{$MOD.label_chart_height}{literal}
		<a href="javascript:void(0);" on-click="increaseHeight">{/literal}{$MOD.label_chart_height_increase}{literal}</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" on-click="decreaseHeight">{/literal}{$MOD.label_chart_height_decrease}{literal}</a>
	</div>
</div>
{{/showLinks}}
</script>

<script id="reportAccessTemplate" type="text/ractive-template">

	<label>
		<input type="checkbox" checked="{{updatePermissions}}" />
        {/literal}{$MOD.updatePermissions}{literal}
	</label>
    {/literal}{if $CANEDIT eq 1}{literal}
    <label>
        <input type="checkbox" checked="{{allowDrilldownReadOnly}}" />
        {/literal}{$MOD.allowDrilldownReadOnly}{literal}
    </label>
    <label>
        <input type="checkbox" checked="{{allowExportReadOnly}}" />
        {/literal}{$MOD.allowExportReadOnly}{literal}
    </label>
    {/literal}{/if}{literal}
    <br>
    <div class="{/literal}{if $CANEDIT != 1 && $isAdmin != 1}{literal}disabled{/literal}{/if}{literal}">
    {/literal}{$MOD.label_owner}{literal}: <selectBox titleName="name" valueName="id" selected="{{owner}}" options="{{availableOwners}}" addDecorator="select2"/>
    <select value="{{globalSharing}}">
        <option value="PUB">{/literal}{$MOD.label_public}{literal}</option>
        <option value="PRIV">{/literal}{$MOD.label_private}{literal}</option>
    </select>
    {{#globalSharing=="PUB"}}
    {/literal}{$MOD.label_everyone}{literal}<reportAccessRights level="{{globalSharingRights}}" />
    {{/globalSharing=="PUB"}}
    <br><br>
    {{#globalSharing=="PRIV"}}
    <div>
        <input type="text" id="sharing-users-available-search" style="width:276px;border:1px solid #ddd;padding:3px;margin-bottom:2px;" placeholder="{/literal}{$MOD.label_type_to_search}{literal}" value="{{filter}}" />
        <a href="#" on-click="cleanFilter" id="sharing-users-available-clear" style="margin-left:2px;"><img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross_grey.png" alt="x" style="height:8px;width:8px;" /></a>
    </div>
    <div style="display:inline-block;">
        <select  style="width:300px;height:100px;" multiple="multiple" on-change="changed" value="{{markedUsers}}">
            {{#filteredUsers:id}}
            {{^selected}}
            <option value="{{id}}">{{name}}</option>
            {{/selected}}
            {{/filteredUsers:id}}
        </select>
    </div>
    <div style="display:inline-block;vertical-align:top;padding-top:50px">
        <a href="#" on-click="selectUsers:{{markedUsers}}">
            <img alt="->" src="modules/{/literal}{$moduleName}{literal}/assets/img/arrow_right.png" />
        </a>
    </div>
    <div style="margin-bottom:-7px;border:1px solid darkgrey;min-height:100px;display:inline-block;width: 30em;">
        <table>
        {{#usersById:id}}
            {{#selected}}
            <tr>
                <td>{{name}}</td>
                <td><reportAccessRights level="{{accessRights}}"/></td>
                <td><a href="#" on-click="removeUser:{{id}}" style="margin-left:2px;"><img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross_grey.png" alt="x" style="height:8px;width:8px;" /></a></td>
            </tr>
            {{/selected}}
        {{/usersById:id}}
        <table>
    </div>
    {{/globalSharing=="PRIV"}}
    </div>
</script>

<script id="reportSchedulingTemplate" type="text/ractive-template">
<div class="{/literal}{if $CANEDIT != 1 && $isAdmin != 1}{literal}disabled{/literal}{/if}{literal}">
    <label><input type="checkbox" checked="{{isScheduled}}" /> {/literal}{$MOD.label_schedule_report}{literal}</label><br>
    {{#isScheduled}}
    {/literal}{$MOD.label_frequency}{literal}:
        <selectBox titleName="title" valueName="value" selected="{{interval}}" options="{{intervalAvailableValues}}"/>
    {{#interval==1 || interval==2}}
            {{#interval==2}}
            {/literal}{$MOD.label_week_of_month}{literal}: <selectBox selected="{{intervalOptions.1}}" options="{{monthweeks}}" titleName="title" valueName="val"/>
            {{/interval==2}}
            {/literal}{$MOD.label_day}{literal}: <selectBox selected="{{intervalOptions.0}}" options="{{weekdays}}" titleName="title" valueName="val"/>

    {{/interval==1 || interval==2}}
    {{#interval==3 || interval==4}}
        {{#interval==4}}
            {/literal}{$MOD.label_month}{literal}:
            <selectBox selected="{{intervalOptions.0}}" options="{{months}}" titleName="title" valueName="val"/>
        {{/interval==4}}
            {/literal}{$MOD.label_day}{literal}:
            <selectBox selected="{{intervalOptions.1}}" options="{{days}}" titleName="title" valueName="val"/>
    {{/interval==3 || interval==4}}
    {/literal}{$MOD.label_time}{literal}: <selectBox selected="{{timeH}}" options="{{hours}}" titleName="h" valueName="h" /> : <selectBox selected="{{timeM}}" options="{{minutes}}" titleName="m" valueName="m" /> (hh:mm)
    <label><input style="vertical-align:middle;" type="checkbox" checked="{{options.doNotSendEmpty}}" /> {/literal}{$MOD.label_doNotSendEmpty}{literal} </label><a class="tooltipX">(?)<span>{/literal}{$MOD.label_doNotSendEmptyTooltip}{literal}</span></a>
    <br>
    <strong>{/literal}{$MOD.label_export_format}{literal}</strong><br>
		    <label><input type="checkbox" checked="{{scheduledFormats.xlsx}}"> {/literal}{$MOD.label_export_send_xlsx}{literal}</label>
		    {{#scheduledFormats.xlsx}}
		    <label><input type="checkbox" checked="{{options.excelWithHeaders}}" />{/literal}{$MOD.excelWithHeaders}{literal}</label>
		    {{/scheduledFormats.xlsx}}
		    <label><input type="checkbox" checked="{{scheduledFormats.pdf}}"> {/literal}{$MOD.label_export_send_pdf}{literal}</label>
		    <label><input type="checkbox" checked="{{scheduledFormats.pdfxls}}"> {/literal}{$MOD.label_export_send_pdfxls}{literal}</label>
		    <label><input type="checkbox" checked="{{scheduledFormats.url}}"> {/literal}{$MOD.label_export_send_url}{literal}</label>
    <br>
    <div>
        <input type="text" id="schedule-users-available-search" style="width:276px;border:1px solid #ddd;padding:3px;margin-bottom:2px;" placeholder="{/literal}{$MOD.label_type_to_search}{literal}" value="{{filter}}" />
        <a href="#" on-click="cleanFilter" id="schedule-users-available-clear" style="margin-left:2px;"><img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross_grey.png" alt="x" style="height:8px;width:8px;" /></a>
    </div>
        <div style="display:inline-block;">
            <select  style="width:300px;height:100px;" multiple="multiple" on-change="changed" value="{{markedUsers}}">
                {{#filteredUsers:id}}
                {{^selected}}
                <option value="{{id}}">{{name}}</option>
                {{/selected}}
                {{/filteredUsers:id}}
            </select>
        </div>
        <div style="display:inline-block;vertical-align:top;padding-top:50px">
            <a href="#" on-click="selectUsers:{{markedUsers}}">
                <img alt="->" src="modules/{/literal}{$moduleName}{literal}/assets/img/arrow_right.png" />
            </a>
        </div>
        <div style="margin-bottom:-7px;border:1px solid darkgrey;min-height:100px;display:inline-block;width: 30em;vertical-align:top;">
            <table>
                {{#usersById:id}}
                {{#selected}}
                <tr>
                    <td>{{name}}</td>
                    <td><a href="#" on-click="removeUser:{{id}}" style="margin-left:2px;"><img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross_grey.png" alt="x" style="height:8px;width:8px;" /></a></td>
                </tr>
                {{/selected}}
                {{/usersById:id}}
                </table>
        </div>
    {{#emailpermission}}
    <br>
    	<div style="display:inline-block; margin-top:5px;">
    		 {/literal}{$MOD.label_custom_email}{literal}: <input type="text" name="schedemail" value="{{email}}">
    		 <a href="#" style="vertical-align:middle;" on-click="addCustomEmail:{{email}}">
                <img alt="->" src="modules/{/literal}{$moduleName}{literal}/assets/img/arrow_right.png" /></a>
    	</div>
    {{/emailpermission}}
    {{/isScheduled}}
    <br>
    </div>
</script>

<script id="reportLabelsTemplate" type="text/ractive-template">
{{#labels.length}}
<table class="ar-data-table {/literal}{if $CANEDIT != 1}{literal}disabled{/literal}{/if}{literal}">
	<thead>
		<tr>
			<th>{/literal}{$MOD.label_original_report_label}{literal}</th>
			<th>{/literal}{$MOD.label_new_report_label}{literal}</th>
		</tr>
	</thead>
	<tbody>
		{{#labels}}
		<tr>
			<td>{{origValue}}</td>
			<td><input type="text" style="border:1px solid #ccc;width:97%;" value="{{value}}" /></td>
		</tr>
		{{/labels}}
	</tbody>
</table>
<br /><br />
<reportButtonPreview on-preview="preview" />
{{/labels.length}}
</script>

<script id="templatesManagerTemplate" type="text/ractive-template">

<label class="ar-label" for="templateNameSelect">{/literal}{$MOD.selectExcelTemplate}{literal}:</label><br/>
<select id="templateNameSelect" value="{{options.excelTemplateId}}" {/literal}{if $CANEDIT eq 0}disabled="disabled"{/if}{literal} >
    {{#availableTemplates}}
        <option value="{{name}}">{{title}}</option>
    {{/}}
</select>

{{#if pending}}
<img src="modules/AnalyticReporting/assets/css/select2-spinner.gif" alt="Loading..." />
{{/if}}

{{#if availableWorksheets}}
<div style="margin:10px 0;">
<label class="ar-label">{/literal}{$MOD.selectHiddenWorksheets}{literal}:</label><br/>
    {{#each availableWorksheets}}
    <div>
        <input type="checkbox" value="{{name}}" name="{{options.hiddenWorksheets}}" /> {{name}}
    </div>
    {{/each}}
</div>
{{/if}}

<br />
<table>
    <thead>
        <tr>
            <th></th>
            <th>{/literal}{$MOD.row}{literal}</th>
            <th>{/literal}{$MOD.column}{literal}</th>
            <th>{/literal}{$MOD.sheet}{literal}</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        {{#options.virtualReportIdsWithOptions:i}}
            <tr>
                <td>
                    <select decorator="select2" value="{{id}}" {/literal}{if $CANEDIT eq 0}disabled="disabled"{/if}{literal}>
                        {{#availableReports}}
                            <option value="{{name}}">{{title}}</option>
                        {{/}}
                    </select>
                </td>
                <td><input size="5" value='{{shiftRows}}' {/literal}{if $CANEDIT eq 0}disabled="disabled"{/if}{literal} /></td>
                <td><input size="5" value='{{shiftColumns}}' {/literal}{if $CANEDIT eq 0}disabled="disabled"{/if}{literal} /></td>
                <td><input size="5" value='{{sheet}}' {/literal}{if $CANEDIT eq 0}disabled="disabled"{/if}{literal} /></td>
                <td>
                    {/literal}{if $CANEDIT eq 1}{literal}
                    <button class="ar-button red" on-click='removeReportFromTemplate:{{i}}'>{/literal}{$MOD.label_remove}{literal}</button>
                    {/literal}{/if}{literal}
                </td>
            </tr>
        {{/}}
    </tbody>
</table>
{/literal}{if $CANEDIT eq 1}{literal}
    <br />
    <button class="ar-button green" on-click='addReportToTemplate'>{/literal}{$MOD.addReport}{literal}</button>
{/literal}{/if}{literal}
<br /><br />


</script>

<script id="reportCalcFieldManagerTemplate" type="text/ractive-template">
<table class="ar-data-table {/literal}{if $CANEDIT != 1}{literal}disabled{/literal}{/if}{literal}">
    <thead>
    <tr>{/literal}
        <th>{$MOD.label_field}</th>
        <th>{$MOD.label_calc_formula}</th>
        <th>{$MOD.label_formula}</th>
        <th>Custom formula</th>
        <th>&nbsp;</th>
    </tr>
    {literal}
    </thead>
    <tbody>
    {{#calcFields:i}}
    <tr>
        <td>
        	{{# calcFields[i].val.op == "if"}}
	        	Type:
	            <selectBox selected="{{val.fieldtype}}" options="{{fieldTypes}}" titleName="title" valueName="name" />
		    {{/}}
        	<input type="text" value="{{calcFields[i].title}}">
        </td>
        <td><calcField availableFields="{{~/availableFields}}" fns="{{~/fns}}" val="{{calcFields[i].val}}"/></td>
        <td><calcFieldDisplay fieldsByName="{{~/fieldsByName}}" fns="{{~/fns}}" val="{{calcFields[i].val}}"/></td>
        <td><input type='checkbox' checked='{{calcFields[i].enableCustomSQL}}'>Override formula <br/> <a href="#" on-click="editSQL:{{i}}" >Edit formula</a> </td>
        <td><a href="#" on-click="removeItem:{{i}}" class="tooltipX">
                <img src="modules/{/literal}{$moduleName}{literal}/assets/img/cross.png"/>
                <span>{/literal}{$MOD.label_remove_item}{literal}</span>
        </a></td>
    </tr>
    {{/calcFields}}
    </tbody>
</table>
{/literal}
{if $CANEDIT eq 1}
    <div style="margin-left:705px">
        <reportBtnGC on-clicked="addField" text="{$MOD.label_add_item}"/>
    </div>
{/if}{literal}
    <reportButtonPreview on-preview="preview"/>

<br/><br/>
</script>
<script id="reportCalcFieldTemplate" type="text/ractive-template">
<div style="display: inline-block;border: 0px solid #000000; padding: 0.66em;border-radius:0.33em;background: {{#level % 2}}#d0e5f5{{else}}#ffffff{{/level % 2}}">
    <selectBox selected="{{val.op}}" options="{{fns}}" titleName="title" valueName="name" />

    {{# selectedFn.name == "if"}}
        {{#val.valType:i}}

            {{#i == 0}}
                {{>reportCalcFieldTypesTemplate}}
                <br/>
                {{conditionLabel}}:
                <selectBox selected="{{val.cond}}" options="{{condTypes}}" titleName="title" valueName="name" />


            {{/}}


            {{#i == 1}}
                {{#val.cond == "equal"}}
                    {{>reportCalcFieldTypesTemplate}}
                {{else}}
                    {{#val.cond == "nequal"}}
                        {{>reportCalcFieldTypesTemplate}}
                    {{/}}
                {{/}}
            {{/}}


            {{#i == 2}}
                <br/>
                {{thenLabel}}:
                {{>reportCalcFieldTypesTemplate}}
            {{/}}

            {{#i == 3}}
                <br/>
                {{otherLabel}}:
                {{>reportCalcFieldTypesTemplate}}
            {{/}}
        {{/valType:i}}


    {{else}}
        {{# selectedFn.name == "addDate"}}
           {{#val.valType:i}}
            {{#i == 0}}
                {{>reportCalcFieldFTypesTemplate}}
            {{/}}
            {{#i == 1}}
                {{>reportCalcFieldCTypesTemplate}}
            {{/}}
            {{/valType:i}}
           <selectBox options="{{dateTimeTypes}}" valueName="name" titleName="title" selected="{{val.val[2]}}" />
        {{else}}
            {{# selectedFn.name == "subtractDate"}}
               {{#val.valType:i}}
                {{#i == 0}}
                    {{>reportCalcFieldFTypesTemplate}}
                {{/}}
                {{#i == 1}}
                    {{>reportCalcFieldCAndFTypesTemplate}}
                {{/}}
                {{/valType:i}}
               <selectBox options="{{dateTimeTypes}}" valueName="name" titleName="title" selected="{{val.val[2]}}" />
               <label>{/literal}{$MOD.label_businessHours}{literal}:&nbsp<input style="vertical-align: middle;" type="checkbox" checked="{{val.val[3]}}" /></label>
            {{else}}
                {{#val.valType:i}}
                   {{>reportCalcFieldTypesTemplate}}
                {{/valType:i}}
            {{/}}
        {{/}}
    {{/}}
</div>
</script>
<script type="text/ractive-template" id="reportCalcFieldTypesTemplate">
    <div style="display: inline-block;border: 1px #000000 dotted; border-radius: 0.25em; margin: 0.25em; padding: 0.25em">
        <selectBox selected="{{.}}" options="{{opTypes}}" titleName="title" valueName="name" />
        {{# val.valType[i]=="c"}}
            {{#i == 1}}
                {{# val.valType[0] == "f"}}
                    {{#availableFieldValues(val.val[0], availableFields).length}}
                        <select decorator="select2" value="{{val.val[i]}}" multiple="multiple">
                            {{#availableFieldValues(val.val[0], availableFields)}}
                            <option value="{{val}}">{{title}}</option>
                            {{/}}
                        </select>
                    {{/.length}}
                    {{^availableFieldValues(val.val[0], availableFields).length}}
            <input type="text" value="{{val.val[i]}}" />
        {{/}}
                {{else}}
                    <input type="text" value="{{val.val[i]}}" />
                {{/}}
            {{else}}
                <input type="text" value="{{val.val[i]}}" />
            {{/}}
        {{/}}
        {{# val.valType[i]=="f"}}

            <selectBox options="{{availableFieldsFiltered}}" valueName="name" titleName="title" selected="{{val.val[i]}}" addDecorator="select2" />
        {{/}}
        {{# val.valType[i]=="op"}}
            <calcField fns="{{fns}}" val="{{val.val[i]}}" level="{{level+1}}" availableFields="{{~/availableFields}}" fieldsByName="{{~/fieldsByName}}" />
        {{/}}
    </div>
</script>

<script type="text/ractive-template" id="reportCalcFieldCAndFTypesTemplate">
    <div style="display: inline-block;border: 1px #000000 dotted; border-radius: 0.25em; margin: 0.25em; padding: 0.25em">
        <selectBox selected="{{.}}" options="{{opTypesCAndFAndToday}}" titleName="title" valueName="name" />
        {{# val.valType[i]=="c"}}
            <input type="text" value="{{val.val[i]}}" />
        {{/}}
        {{# val.valType[i]=="f"}}
            <selectBox options="{{availableFieldsFiltered}}" valueName="name" titleName="title" selected="{{val.val[i]}}" addDecorator="select2" />
        {{/}}
        {{# val.valType[i]=="Today"}}
        {{/}}
    </div>
</script>

<script type="text/ractive-template" id="reportCalcFieldFTypesTemplate">
    <div style="display: inline-block;border: 1px #000000 dotted; border-radius: 0.25em; margin: 0.25em; padding: 0.25em">
        <selectBox selected="{{.}}" options="{{opTypesFAndToday}}" titleName="title" valueName="name" />
        {{# val.valType[i]=="f"}}
            <selectBox options="{{availableFieldsFiltered}}" valueName="name" titleName="title" selected="{{val.val[i]}}" addDecorator="select2" />
        {{/}}
        {{# val.valType[i]=="Today"}}
        {{/}}
    </div>
</script>

<script type="text/ractive-template" id="reportCalcFieldCTypesTemplate">
    <div style="display: inline-block;border: 1px #000000 dotted; border-radius: 0.25em; margin: 0.25em; padding: 0.25em">
        <selectBox selected="{{.}}" options="{{opTypesC}}" titleName="title" valueName="name" />
        {{# val.valType[i]=="c"}}
            <input type="text" value="{{val.val[i]}}" />
        {{/}}
    </div>
</script>

<script type="text/ractive-template" id="reportCalcFieldDisplayTemplate">
{{fnName}}
{{#fnName != 'If'}}({{/}}
{{#fnArgs:i}}
    {{.}}
    {{# val.valType[i]=="c"}}{{val.val[i]}}{{/}}
    {{# val.valType[i]=="f"}}{{fieldsByName[val.val[i]].bareTitle}}{{/}}
    {{# val.valType[i]=="op"}}<calcFieldDisplay fns="{{fns}}" val="{{val.val[i]}}" level="{{level+1}}" />{{/}}
    {{# val.valType[i]=="today"}}{/literal}{$MOD.label_today}{literal}{{/}}
{{/}}
{{#fnName != 'If'}}){{/}}
</script>

<script id="calcFieldCustomSQLTemplate" type="text/ractive-template">
<div class="ar-calc-customsql">
  <h2>Field formula</h2>
  <span class="ar-calc-customsql-fieldname">{{fieldSQL}}</span>
  <h2>Custom formula</h2>
  <textarea rows="10" cols="118" value='{{customSQL}}'></textarea>
  <h2>Field Name Convertor</h2>
  <div class="ar-calc-customsql-fieldselector">
    <selectBox selected="{{selectedField}}" options="{{availableFields}}" titleName="title" valueName="name" addDecorator="select2"/>
    <span class="ar-calc-customsql-fieldname">#{{selectedField}}#</span>
  </div>

  <button class="ar-button red" on-click='saveCustomSQL'>Save</button>
  <button class="ar-button" on-click='cancelCustomSQL'>Cancel</button>
</div>
</script>

<script type="text/ractive-template" id="reportPaginationTemplate">
{{#isPagination}}
{/literal}{$MOD.label_page_no}{literal}
<ul>
{{#pagination}}
	{{#currentPage}}
		<li class="active">{{pageNumber}}</li>
	{{/currentPage}}
	{{^currentPage}}
		{{#pageSeparator}}
		{{symbol}}
		{{/pageSeparator}}
		{{^pageSeparator}}
		<li on-click="changePage(pageNumber)">
			{{pageNumber}}
		</li>
		{{/pageSeparator}}
	{{/currentPage}}
{{/pagination}}
</ul>
{{/isPagination}}

{{#showLimitInput}}
<span {{#isPagination}}style="margin-left:20px;"{{/isPagination}}>
{/literal}{$MOD.label_show}{literal} <input value="{{meta.limit}}" size="3" maxlength="3" class="input-mini" /> {/literal}{$MOD.label_records_per_page}{literal}
<span>
{{/showLimitInput}}

{{#positionTop}}
<span style="margin-left:20px;">
{/literal}{$MOD.label_freeze_first}{literal} <input type="text" id="frozenColumn" name="frozenColumn" size="3" value="{{frozenColumn}}" /> {/literal}{$MOD.label_columns}{literal}
</span>
{{/positionTop}}

</script>

<script type="text/ractive-template" id="addToDashboardModal">

<div style="padding-top:10px;">
    <input type="radio" name="addType" value="self" checked />{/literal}{$MOD.add_to_own_home}{literal}<br>
    <input type="radio" name="addType" value="role" />{/literal}{$MOD.add_to_role_home}{literal}
    <select name="chosenRoleID">
        {{#availableRoles}}
            <option value="{{id}}">{{name}}</option>
        {{/availableRoles}}
    </select>
</div>

</script>

<script type="text/ractive-template" id="importReportsTemplate">

    <form method="post" id="import-reports" enctype="multipart/form-data">
        <input type="hidden" name="module" value="{/literal}{$moduleName}{literal}" />
        <input type="hidden" name="action" value="importReports" />
        <input type="hidden" name="_action" value="import" />
        <label><input type="radio" name="importType" value="withCategories" checked/>{/literal}{$MOD.label_import_type_structure}{literal}</label><br />
        <label><input type="radio" name="importType" value="inCategory"/>{/literal}{$MOD.label_import_type_category}{literal}</label>
        <select name="category">
            {{#categories}}
                <option value="{{name}}">{{title}}</option>
            {{/categories}}
        </select>
        <br />
        <input name="importFile" type="file" />
    </form>

</script>



{/literal}
<!-- // TEMPLATES -->
