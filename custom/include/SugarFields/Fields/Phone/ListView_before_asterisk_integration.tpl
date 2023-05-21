{capture name=getPhone assign=phone}
	{sugar_fetch object=$parentFieldArray key=$col}
{/capture}

{assign var="phone_value" value=$phone|trim}

{if isset($displayParams.module)}
	{assign var="dt_module" value=$displayParams.module}
{else}
	{assign var="dt_module" value=$smarty.request.module}
{/if}

{if $phone_value neq '' && $dt_module neq 'Home'}
	<img onclick="AsteriskIntegrationClickToCall('{$phone_value}', '{$dt_module}', '{$parentFieldArray.ID}');" src="modules/AsteriskIntegration/images/click_to_call.png" style="cursor: pointer; margin-right: 5px; height: 16px; width: 16px;"/>
	{else}
{sugar_phone value=$phone_value usa_format=$usa_format}

{/if}

