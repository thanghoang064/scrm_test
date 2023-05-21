{php}
global $sugar_config;

{/php}
<div class="moduleTitle">
    <h2 class="module-title-text">
        <a href="#">Google SignIn</a><span class="pointer">»</span> CONFIGURATION
    </h2>
    <div class="clear"></div>
</div>

<form id="Gateway_opt" name="Gateway_opt" method="POST" action="">
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="dcQuickEdit">
        <tr>
            <td style="padding-bottom: 2px;" width="100%">
                <input title="SAVE" name="save_googlesingin"  class="button" type="submit" value="SAVE">
                <input title="CANCEL" onclick="document.location.href = 'index.php?module=Administration&action=index'" class="button" type="button" value="CANCEL">
            </td>
        </tr>
    </table>

   

    <div class="clear"></div>
    <div class="clear"></div>
    <br>
    <div name="twilio" id="twilio">
        <div class="panel panel-default">
            <div class="panel-heading ">
                <a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
                    <div class="col-xs-10 col-sm-11 col-md-11">
                       Configure the Google APIs parameters
                    </div>
                </a>
            </div>

            <div class="panel-body panel-collapse collapse in" id="detailpanel_-1">
                <div class="tab-content">
                    <!-- tab_panel_content.tpl -->
                    <br>
                    <div class="row edit-view-row">
                         <div>
                            <div class="col-xs-12 col-sm-4 label">
                            Enable Google SignIn :
                            </div>
                            <div class="col-xs-12 col-sm-8 edit-view-field " type="varchar">
                                <input type="checkbox" name="enabled_google" id="enabled_google" size="50" maxlength="255" {$enabled_google}>
                            </div>
                            <!-- [/hide] -->
                        </div>
                    </div>    
                    <div class="row edit-view-row">    
                        <div>
                            <div class="col-xs-12 col-sm-4 label">
                            Client ID :
                            </div>
                            <div class="col-xs-12 col-sm-8 edit-view-field " type="varchar">
                                <input type="text" name="client_id" id="client_id" size="50" maxlength="255" value="{$client_id}">
                            </div>
                            <!-- [/hide] -->
                        </div>
                        <div>
                            <div class="col-xs-12 col-sm-4 label">
                            Client secret :
                            </div>
                            <div class="col-xs-12 col-sm-8 edit-view-field " type="varchar">
                                <input type="text" name="client_secret" id="client_secret" size="50" maxlength="255" value="{$client_secret}">
                            </div>
                        </div>

                    </div>
                    <div class="row edit-view-row">
                        <div>
                            <div class="col-xs-12 col-sm-4 label">
                            Redirect URL
                            </div>
                            <div class="col-xs-12 col-sm-8 edit-view-field " type="varchar">
                                <input type="text" name="redirect_url" id="redirect_url" size="50" maxlength="255" value="{$redirect_url}">
                            </div>
                        </div> 
                    </div>
                    <br>
                     <div class="clear"></div>
                     <div class="clear"></div>
                </div>
            </div>
        </div>

    </div>

</form>
<script type="text/javascript">
    {literal}

        $(document).ready(function () {

            $("#test_whatsapp").click(function () {
                var sel_gateway = $('#gateway').val();
                //alert("Handler for .click() called." + sel_gateway);
                $('#Testing_WhatsAPP').modal('toggle');
                
                $.ajax({
                    url: 'index.php?entryPoint=Whatsapp_Options',
                    type: 'POST',
                    data: {action: 'get_testwhatsapp_body'},
                    success: function (get_body) {
                        //document.getElementById("des").value = errorResponse;
                        //alert(get_body);
                        $("#whatsapptesting_dashboardDialog").empty();
                        $("#whatsapptesting_dashboardDialog").append(get_body);
                    }
                });



            });

        });
    {/literal}
</script>

