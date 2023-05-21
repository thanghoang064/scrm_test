#!/bin/bash
cd /home/scrm/public_html
if [ "$#" -eq 7 ]
then
	pid=`ps aux | grep "[m]odules/AsteriskIntegration/server.js $1 $2 $3" | awk '{print$2}'`
	kill -9 $pid
	#nohup node modules/AsteriskIntegration/server.js "$1" "$2" "$3" "$4" "$5" "$6" "$7" </dev/null &>/dev/null &
	node modules/AsteriskIntegration/server.js '5188' '210.245.80.53' '5038' 'admin' 'b98bcd1963d9003bdf84b7efbc7d0ccb' 'v1.poly.edu.vn' '80' > /dev/null 2>&1 &
fi
