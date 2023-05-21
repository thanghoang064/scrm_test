/* global process, namilib, __dirname, request, unixtimestamp, socket_port, io, nami */

if (process.argv.length !== 9)
{
    console.log("Use: <socket_port> <server_ip> <ami_port> <ami_username> <ami_password> <recordinglink_ip> <recordinglink_port>");
    process.exit();
}

socket_port = process.argv[2];
server_ip = process.argv[3];
ami_port = process.argv[4];
ami_username = process.argv[5];
ami_secret = process.argv[6];
recordinglink_ip = process.argv[7];
recordinglink_port = process.argv[8];

fs = require('fs');
namilib = require(__dirname + '/nami/nami.js');
http = require('http');
https = require('https');
express = require('express');
socket = require('socket.io');
request = require('request');
syncrequest = require('sync-request');
unixtimestamp = require('unix-timestamp');
app = express();

if (fs.existsSync(__dirname + '/configuration.json'))
{
    configuration = require(__dirname + '/configuration.json');
}
else
{
    console.log("Eror 404 : File not found - configuration.json");
    process.exit();
}

site_url = configuration.site_url;

if (configuration.hasOwnProperty("ssl"))
{
    if (configuration.ssl.hasOwnProperty("key") && configuration.ssl.hasOwnProperty("cert"))
    {
        if (configuration.ssl.key !== "" && configuration.ssl.cert !== "")
        {
            ssl_available = true;
            ssl_key = fs.readFileSync(configuration.ssl.key);
            ssl_cert = fs.readFileSync(configuration.ssl.cert);
            ssl_passphrase = configuration.ssl.passphrase;

            ssl_options = {
                key: ssl_key,
                cert: ssl_cert,
                passphrase: ssl_passphrase,
                requestCert: false,
                rejectUnauthorized: false
            };

            server = https.createServer(ssl_options, app);
            protocol = 'HTTPS';

            process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
        }
        else
        {
            ssl_available = false;

            server = http.createServer(app);
            protocol = 'HTTP';
        }
    }
}
else
{
    ssl_available = false;

    server = http.createServer(app);
    protocol = 'HTTP';
}

var activation_status;
ActivationStatus();

server.listen(socket_port, function()
{
    console.log('Socket Server Started On Port : ' + socket_port);
    console.log('Socket Server Serves : ' + protocol);
    console.log('Site URL Is : ' + site_url);
});

app.use(express.static(__dirname + '/public'));

io = socket(server);

io.on('connection', (socket) =>
{
    extension = socket.handshake.query.extension;
    socket.join(extension);

    console.log('Client +++, Extension : ' + extension + ', Active : ' + ActiveSocketClientsCount(extension) + ', Socket Id : ' + socket.id);

    socket.on('ClickToCall', function(parameters)
    {
        if (activation_status !== false)
        { 
            number = parameters.number.replace(/[ -+*(),./\\&]/g, "");
            extension = parameters.extension;
            context = parameters.context;
            user_id = parameters.user_id;
            module_name = parameters.module_name;
            record_id = parameters.record_id;

            ExtensionStateAction = new namilib.Actions.ExtensionState();
            ExtensionStateAction.ActionID = unixtimestamp.now();
            ExtensionStateAction.Exten = extension;
            ExtensionStateAction.Context = context;

            //console.log(ExtensionStateAction);

            nami.send(ExtensionStateAction, function(response)
            {
                //console.log(response);
                if (response.status === "0")
                {
                    notification = "Đang gọi " + number + " Từ đầu số " + extension;
                    notification_type = 'info';

                    notification_event = {
                        notification: notification,
                        notification_type: notification_type
                    };

                    io.sockets.in(extension).emit('Notification', notification_event);

                    ClickToCallAction = new namilib.Actions.Originate();
                    ClickToCallAction.ActionID = unixtimestamp.now();
                    ClickToCallAction.Channel = "SIP/" + extension;
                    ClickToCallAction.WaitTime = "30";
                    ClickToCallAction.CallerID = number + " <" + extension + ">";
                    ClickToCallAction.Exten = number;
                    ClickToCallAction.Context = context;
                    ClickToCallAction.Priority = 1;
                    ClickToCallAction.Timeout = 99999;

                    //console.log(ClickToCallAction);

                    if (user_id !== undefined && module_name !== undefined && record_id !== undefined)
                    {
                        url = site_url +
                            '/index.php?entryPoint=AsteriskIntegrationController&action=ClickToCall' +
                            '&user_id=' + encodeURIComponent(user_id) +
                            '&module_name=' + encodeURIComponent(module_name) +
                            '&record_id=' + encodeURIComponent(record_id) +
                            '&number=' + encodeURIComponent(number);

                        if (ssl_available === true)
                        {
                            request.get(
                                {
                                    url: url,
                                    agentOptions:
                                    {
                                        key: ssl_key,
                                        cert: ssl_cert,
                                        passphrase: ssl_passphrase,
                                        securityOptions: 'SSL_OP_NO_SSLv3'
                                    }
                                },
                                function(error, response, data)
                                {
                                    ClickToCall(ClickToCallAction);
                                });
                        }
                        else
                        {
                            request.get(
                                {
                                    url: url
                                },
                                function(error, response, data)
                                {
                                    //console.log(data);
                                    if (response.statusCode === 200)
                                    {
                                        ClickToCall(ClickToCallAction);
                                    }
                                });
                        }
                    }
                    else
                    {
                        ClickToCall(ClickToCallAction);
                    }
                }
                else
                {
                    switch (response.status)
                    {
                        case "-1":
                            notification = "Extension " + extension + " Is Not Found";
                            notification_type = 'error';
                            break;

                        case "1":
                            notification = "Extension " + extension + " Is In Use";
                            notification_type = 'info';
                            break;

                        case "2":
                            notification = "Extension " + extension + " Is Busy";
                            notification_type = 'info';
                            break;

                        case "4":
                            notification = "Extension " + extension + " Is Unavailable";
                            notification_type = 'error';
                            break;

                        case "8":
                            notification = "Extension " + extension + " Is Busy";
                            notification_type = 'info';
                            break;

                        case "16":
                            notification = "Extension " + extension + " Is On Hold";
                            notification_type = 'info';
                            break;

                        default:
                            notification = "Extension " + extension + " Is Not Available";
                            notification_type = 'error';
                            break;
                    }

                    notification_event = {
                        notification: notification,
                        notification_type: notification_type
                    };

                    io.sockets.in(extension).emit('Notification', notification_event);
                }
            });
        }
        else
        {
            extension = socket.handshake.query.extension;

            notification_event = {
                notification: 'Please Ask Your Administrator To Validate The License, And Restart Service',
                notification_type: 'error'
            };

            if (ActiveSocketClientsCount(extension) > 0)
            {
                io.sockets.in(extension).emit('Notification', notification_event);
            }
        }
    });

    socket.on('Hangup', function(parameters)
    {
        HangupAction = new namilib.Actions.Hangup();
        HangupAction.Channel = parameters.hangupchannel;

        // console.log(HangupAction);

        nami.send(HangupAction, function(response)
        {
            // console.log(response);
            extension = socket.handshake.query.extension;

            switch (response.response)
            {
                case "Error":
                    notification_event = {
                        notification: 'Call Hangup Has Been Failed,<br/>Or Call Has Been Already Hanged up',
                        notification_type: 'error'
                    };

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        io.sockets.in(extension).emit('Notification', notification_event);
                    }
                    break;

                case "Success":
                    notification_event = {
                        notification: 'Call Hanged up Successfully',
                        notification_type: 'success'
                    };

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        io.sockets.in(extension).emit('Notification', notification_event);
                    }
                    break;
            }
        });
    });

    socket.on('Redirect', function(parameters)
    {
        RedirectAction = new namilib.Actions.Redirect();
        RedirectAction.Channel = parameters.redirectchannel;
        RedirectAction.Exten = parameters.newextension;
        RedirectAction.Context = parameters.context;
        RedirectAction.Priority = 1;

        // console.log(RedirectAction);

        nami.send(RedirectAction, function(response)
        {
            // console.log(response);
            extension = socket.handshake.query.extension;

            switch (response.response)
            {
                case "Error":
                    notification_event = {
                        notification: 'Call Transfer Has Been Failed.<br/>Call Has Been Already Transfered Or Hanged up',
                        notification_type: 'error'
                    };

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        io.sockets.in(extension).emit('Notification', notification_event);
                    }
                    break;

                case "Success":
                    notification_event = {
                        notification: 'Call Transfered Successfully',
                        notification_type: 'success'
                    };

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        io.sockets.in(extension).emit('Notification', notification_event);
                    }
                    break;
            }
        });
    });

    socket.on('CloseCallPopup', function(parameters)
    {
        extension = socket.handshake.query.extension;

        if (ActiveSocketClientsCount(extension) > 0)
        {
            io.sockets.in(extension).emit('CloseCallPopup', parameters);
        }
    });

    socket.on('ToggleOptions', function(parameters)
    {
        extension = socket.handshake.query.extension;

        if (ActiveSocketClientsCount(extension) > 0)
        {
            io.sockets.in(extension).emit('ToggleOptions', parameters);
        }
    });

    socket.on('disconnect', function(data)
    {
        extension = socket.handshake.query.extension;
        socket.leave(extension);
        console.log('Client ---, Extension : ' + extension + ', Active : ' + ActiveSocketClientsCount(extension) + ', Socket Id : ' + socket.id);
    });
});

namiConfig = {
    host: server_ip,
    port: ami_port,
    username: ami_username,
    secret: ami_secret
};

nami = new namilib.Nami(namiConfig);

process.on('SIGINT', function()
{
    nami.close();
    process.exit();
});

nami.on('namiConnectionClose', function(data)
{
    console.log('Reconnecting To Asterisk Server');
    setTimeout(function()
    {
        nami.open();
    }, 5000);
});

nami.on('namiConnected', function(data)
{
    console.log('Connected To Asterisk Server using AMI');
    setTimeout(AsteriskPingAction, 10000);
});

nami.on('namiInvalidPeer', function(data)
{
    console.log("Invalid AMI Salute. Not an AMI?");
    process.exit();
});

nami.on('namiLoginIncorrect', function()
{
    console.log("Invalid Credentials");
    process.exit();
});

nami.on('namiEventDial', function(event)
{
    console.log('namiEventDial');
    console.log(event);

    if (activation_status !== false)
    {
        if (event.subevent === "Begin")
        {
            if (/[\/@]/i.test(event.dialstring))
            {
                number = ExtractNumberFromString(event.dialstring);

                if (number.length >= 7)
                {
                    extension = ExtractNumberFromString(event.channel);
                    direction = 'Outbound';

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        url = site_url +
                            '/index.php?entryPoint=AsteriskIntegrationController&action=GetNumberInfo' +
                            '&number=' + encodeURIComponent(number) +
                            '&extension=' + encodeURIComponent(extension) +
                            '&direction=' + encodeURIComponent(direction) +
                            '&uniqueid=' + encodeURIComponent(event.uniqueid) +
                            '&hangup_channel=' + encodeURIComponent(event.channel) +
                            '&redirect_channel=' + encodeURIComponent(event.destination);

                        GetNumberInfo(url);
                    }
                }
            }
            else
            {
                number = ExtractNumberFromString(event.calleridnum);

                if (number.length >= 7)
                {
                    extension = ExtractNumberFromString(event.destination);
                    direction = 'Inbound';

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        url = site_url +
                            '/index.php?entryPoint=AsteriskIntegrationController&action=GetNumberInfo' +
                            '&number=' + encodeURIComponent(number) +
                            '&extension=' + encodeURIComponent(extension) +
                            '&direction=' + encodeURIComponent(direction) +
                            '&uniqueid=' + encodeURIComponent(event.uniqueid) +
                            '&hangup_channel=' + encodeURIComponent(event.destination) +
                            '&redirect_channel=' + encodeURIComponent(event.channel);

                        GetNumberInfo(url);
                    }
                }
            }
        }
    }
});

nami.on('namiEventDialBegin', function(event)
{
    console.log('namiEventDialBegin');
    console.log(event);

    if (activation_status !== false)
    {
        if (typeof event.calleridnum !== 'undefined' && typeof event.destcalleridnum !== 'undefined')
        {
            if (event.calleridnum.length !== event.destcalleridnum.length || event.calleridnum.length == event.destcalleridnum.length)
            {
                if (/[\/@]/i.test(event.dialstring))
                {
                    number = ExtractNumberFromString(event.dialstring);

                    if (number.length >= 7)
                    {
                        extension = ExtractNumberFromString(event.channel);
                        direction = 'Outbound';

                        if (ActiveSocketClientsCount(extension) > 0)
                        {
                            url = site_url +
                                '/index.php?entryPoint=AsteriskIntegrationController&action=GetNumberInfo' +
                                '&number=' + encodeURIComponent(number) +
                                '&extension=' + encodeURIComponent(extension) +
                                '&direction=' + encodeURIComponent(direction) +
                                '&uniqueid=' + encodeURIComponent(event.uniqueid) +
                                '&hangup_channel=' + encodeURIComponent(event.channel) +
                                '&redirect_channel=' + encodeURIComponent(event.destchannel);

                            GetNumberInfo(url);
                            //console.log(url);
                        }
                    }
                }
                else
                {
                    number = ExtractNumberFromString(event.calleridnum);

                    if (number.length >= 7)
                    {
                        extension = ExtractNumberFromString(event.destchannel);
                        direction = 'Inbound';

                        if (ActiveSocketClientsCount(extension) > 0)
                        {
                            url = site_url +
                                '/index.php?entryPoint=AsteriskIntegrationController&action=GetNumberInfo' +
                                '&number=' + encodeURIComponent(number) +
                                '&extension=' + encodeURIComponent(extension) +
                                '&direction=' + encodeURIComponent(direction) +
                                '&uniqueid=' + encodeURIComponent(event.uniqueid) +
                                '&hangup_channel=' + encodeURIComponent(event.destchannel) +
                                '&redirect_channel=' + encodeURIComponent(event.channel);

                            GetNumberInfo(url);
                        }
                    }
                }
            }
        }
    }
});

nami.on('namiEventBridge', function(event)
{
    console.log('namiEventBridge');
    console.log(event);

    if (activation_status !== false)
    {
        if (['Local'].indexOf(event.channel1.split("/")[0]) > -1 && ['SIP'].indexOf(event.channel2.split("/")[0]) > -1)
        {
            if (event.callerid1 !== '' && event.callerid2 !== '')
            {
                number = event.callerid1;

                if (number.length >= 7)
                {
                    extension = ExtractNumberFromString(event.callerid2);
                    direction = 'Outbound';

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        url = site_url + '/index.php?entryPoint=AsteriskIntegrationController&action=GetNumberInfo' +
                            '&number=' + encodeURIComponent(number) +
                            '&extension=' + encodeURIComponent(extension) +
                            '&direction=' + encodeURIComponent(direction) +
                            '&uniqueid=' + encodeURIComponent(event.uniqueid1) +
                            '&hangup_channel=' + encodeURIComponent(event.channel2) +
                            '&redirect_channel=' + encodeURIComponent(event.channel1);

                        GetNumberInfo(url);
                    }
                }
            }
        }
        else if (['DAHDI', 'SIP'].indexOf(event.channel1.split("/")[0]) > -1 && ['DAHDI', 'SIP'].indexOf(event.channel2.split("/")[0]) > -1)
        {
            if (event.callerid1.length > event.callerid2.length)
            {
                number = event.callerid1;
                if (number.length >= 7)
                {
                    extension = ExtractNumberFromString(event.channel2);
                    direction = 'Inbound';

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        url = site_url + '/index.php?entryPoint=AsteriskIntegrationController&action=GetNumberInfo' +
                            '&number=' + encodeURIComponent(number) +
                            '&extension=' + encodeURIComponent(extension) +
                            '&direction=' + encodeURIComponent(direction) +
                            '&uniqueid=' + encodeURIComponent(event.uniqueid1) +
                            '&hangup_channel=' + encodeURIComponent(event.channel2) +
                            '&redirect_channel=' + encodeURIComponent(event.channel1);

                        GetNumberInfo(url);
                    }
                }
            }
            else if (event.callerid1.length < event.callerid2.length)
            {
                number = event.callerid2;
                if (number.length >= 7)
                {
                    extension = ExtractNumberFromString(event.channel1);
                    direction = 'Outbound';

                    if (ActiveSocketClientsCount(extension) > 0)
                    {
                        url = site_url + '/index.php?entryPoint=AsteriskIntegrationController&action=GetNumberInfo' +
                            '&number=' + encodeURIComponent(number) +
                            '&extension=' + encodeURIComponent(extension) +
                            '&direction=' + encodeURIComponent(direction) +
                            '&uniqueid=' + encodeURIComponent(event.uniqueid1) +
                            '&hangup_channel=' + encodeURIComponent(event.channel1) +
                            '&redirect_channel=' + encodeURIComponent(event.channel2);

                        GetNumberInfo(url);
                    }
                }
            }
        }
    }
});

// nami.on('namiEventBridgeEnter', function(event)
// {
    // console.dir(event);
// });

nami.on('namiEventCdr', function(event)
{
    console.log('namiEventCdr');
    console.log(event);

    if (activation_status !== false)
    {
        if (['Local'].indexOf(event.channel.split("/")[0]) > -1 && ['SIP'].indexOf(event.destinationchannel.split("/")[0]) > -1)
        {
            if (event.source !== '' && event.destination !== '')
            {
				if(ExtractNumberFromString(event.destinationchannel).length==10)
                source = ExtractNumberFromString(event.destinationchannel).substr(-10);
				else
                source = ExtractNumberFromString(event.destinationchannel).substr(-11);
			
                //source = event.source;
                destination = event.source.substr(-10);
                //destination = event.destination;
            }
        }
        else if (['DAHDI', 'SIP'].indexOf(event.channel.split("/")[0]) > -1 && ['DAHDI', 'SIP'].indexOf(event.destinationchannel.split("/")[0]) > -1)
        {
            tmpchannelnum = ExtractNumberFromString(event.channel).substr(-10);
			if(ExtractNumberFromString(event.destinationchannel).length==10)
				tmpdestinationchannelnum = ExtractNumberFromString(event.destinationchannel).substr(-10);
			else
				tmpdestinationchannelnum = ExtractNumberFromString(event.destinationchannel).substr(-11);
			
			//console.log(tmpchannelnum);
			//console.log(tmpdestinationchannelnum);
			
            if (tmpchannelnum.length < tmpdestinationchannelnum.length)
            {
                source = tmpchannelnum;
                destination = tmpdestinationchannelnum;
                destination = destination.replace(/^0+/, '');
            }
            else if (tmpchannelnum.length > tmpdestinationchannelnum.length)
            {
                source = tmpdestinationchannelnum;
                destination = tmpchannelnum;
            }
        }
		destination = event.destination;
		switchboard	= event.source;
		
        if (typeof source !== 'undefined' && typeof destination !== 'undefined')
        {
			console.log(source);
		    console.log(destination);
            url = site_url + '/index.php?entryPoint=AsteriskIntegrationController&action=LogCall' +
                '&source=' + encodeURIComponent(source) +
                '&destination=' + encodeURIComponent(destination) +
                '&disposition=' + encodeURIComponent(event.disposition) +
                '&starttime=' + encodeURIComponent(event.starttime) +
                '&answertime=' + encodeURIComponent(event.answertime) +
                '&duration=' + encodeURIComponent(event.billableseconds) +
                '&uniqueid=' + encodeURIComponent(event.uniqueid) +
                '&connectedlinenum =' + encodeURIComponent(event.connectedlinenum) +
                '&calleridnum=' + encodeURIComponent(event.calleridnum) +
                '&lastdata=' + encodeURIComponent(event.lastdata) +
                '&destexten=' + encodeURIComponent(event.destexten) +
                '&destcalleridnum=' + encodeURIComponent(event.destcalleridnum) +
                '&server_ip=' + encodeURIComponent(server_ip) +
                '&socket_port=' + encodeURIComponent(socket_port) +
                '&recordinglink_ip=' + encodeURIComponent(recordinglink_ip) +
                '&recordinglink_port=' + encodeURIComponent(recordinglink_port) +
                '&recordingfile=' + encodeURIComponent(event.recordingfile);
 
			//console.log(url);
			//io.sockets.in(destination).emit('Cdr', url);											
            LogCall(url);
        }
    }
}); 

nami.open();

function GetNumberInfo(url)
{
    if (ssl_available === true)
    {
        request.get(
            {
                url: url,
                agentOptions:
                {
                    key: ssl_key,
                    cert: ssl_cert,
                    passphrase: ssl_passphrase,
                    securityOptions: 'SSL_OP_NO_SSLv3'
                }
            },
            function(error, response, data)
            {
                if (response.statusCode === 200)
                {
                    DialEventCallPopup(data);
                }
            });
    }
    else
    {
        request.get(
            {
                url: url
            },
            function(error, response, data)
            {
                if (response.statusCode === 200)
                {
                    DialEventCallPopup(data);
                }
            });
    }
}

function LogCall(url)
{
    // console.log(url);

    if (ssl_available === true)
    {
        request.get(
            {
                url: url,
                agentOptions:
                {
                    key: ssl_key,
                    cert: ssl_cert,
                    passphrase: ssl_passphrase,
                    securityOptions: 'SSL_OP_NO_SSLv3'
                }
            },
            function(error, response, data)
            {
                if (response.statusCode === 200)
                {
                    CdrEventCallPopup(data);
                }
            });
    }
    else
    {
        request.get(
            {
                url: url
            },
            function(error, response, data)
            {
                if (response.statusCode === 200)
                {
                    CdrEventCallPopup(data);
                }
            });
    }
}

function ClickToCall(ClickToCallAction)
{
    nami.send(ClickToCallAction, function(response)
    {
        switch (response.response)
        {
            case "Success":
                notification = "Đang thực hiện cuộc gọi tới " + number + " Từ đầu số " + extension;
                notification_type = "success";
                break;

            default:
                notification = "Cuộc gọi đến " + number + " Từ đầu số " + extension + " đã huỷ";
                notification_type = "error";
                break;
        }

        notification_event = {
            notification: notification,
            notification_type: notification_type
        };

        io.sockets.in(extension).emit('Notification', notification_event);
    });
}

function ActivationStatus()
{
    var activation_result = syncrequest('GET', site_url + '/index.php?entryPoint=AsteriskIntegrationController&action=ActivationStatus');
    activation_result_parse = JSON.parse(activation_result.getBody('utf8'));
    activation_status = activation_result_parse.status;
}

function DialEventCallPopup(data)
{
    dial_event_result = JSON.parse(data);

    if (ActiveSocketClientsCount(dial_event_result.extension) > 0)
    {
        io.sockets.in(dial_event_result.extension).emit('Dial', dial_event_result);
    }
}

function CdrEventCallPopup(data)
{
    cdr_event_result = JSON.parse(data);

    //console.log(cdr_event_result);

    if (cdr_event_result != null)
    {
        if (ActiveSocketClientsCount(cdr_event_result.extension) > 0)
        {
            io.sockets.in(cdr_event_result.extension).emit('Cdr', cdr_event_result);
        }
    }
}

function AsteriskPingAction()
{
    PingAction = new namilib.Actions.Ping();
    PingAction.ActionID = unixtimestamp.now();

    nami.send(PingAction, function(response)
    {
        if (response.response === "Success")
        {
            setTimeout(AsteriskPingAction, 10000);
        }
    });
}

function ExtractNumberFromString(string)
{
    if (/[\/]/.test(string))
    {
        string = string.split("/", 2)[1];
    }
    if (/[@]/.test(string))
    {
        string = string.split("@", 1)[0];
    }
    if (/[-]/.test(string))
    {
        string = string.split("-", 1)[0];
    }
    return string;
}

function ActiveSocketClientsCount(extension)
{
    if (io.sockets.adapter.rooms[extension] !== undefined)
    {
        return io.sockets.adapter.rooms[extension].length;
    }
    else
    {
        return 0;
    }
}
