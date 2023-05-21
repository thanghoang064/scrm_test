{if !empty({{sugarvar key='value' string=true}})}
	{assign var="phone_value" value={{sugarvar key='value' string=true}}|trim}
	<a href="sip:{$phone_value}">{$phone_value}</a>
	{*
	{if $phone_value neq ''}
		<img onclick="AsteriskIntegrationClickToCall('{$phone_value}', '{$module}', '{$id}');" src="modules/AsteriskIntegration/images/click_to_call.png" style="cursor: pointer; margin-right: 5px; height: 16px; width: 16px;"/>
	{/if}

	{sugar_phone value=$phone_value usa_format="{{if !empty($vardef.validate_usa_format)}}1{{else}}0{{/if}}"}
*}
	{{if !empty($displayParams.enableConnectors)}}
		{{sugarvar_connector view='DetailView'}}
	{{/if}}
{/if}