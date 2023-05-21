<?php
$exists = true;
$website = "http://scrm.poly.edu.vn:5188";
$file_headers = @get_headers($website);
if($file_headers[0] =='HTTP/1.1 200 OK')
{
	$exists = false;
}
if($exists == true){
  shell_exec("bash modules/AsteriskIntegration/server_restart.sh '5188' '210.245.80.53' '5038' 'admin' 'b98bcd1963d9003bdf84b7efbc7d0ccb' '210.245.80.53' '80'");
}