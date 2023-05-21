<?php
session_start();
	// config and whatnot
    $config = dirname(__FILE__) . '/hybridauth/config.php';
    require_once( "hybridauth/Hybrid/Auth.php" );

	$user_data = NULL;

	// try to get the user profile from an authenticated provider
	try{
		$hybridauth = new Hybrid_Auth( $config );

		// selected provider name 
		$provider = @ trim( strip_tags( $_GET["provider"] ) );

		// check if the user is currently connected to the selected provider
		if( !  $hybridauth->isConnectedWith( $provider ) ){
			// redirect him back to login page
			header( "Location: profile.php?msg=Your are not connected to $provider or your session has expired" );
                        exit;

                }

		// call back the requested provider adapter instance (no need to use authenticate() as we already did on login page)
		$adapter = $hybridauth->getAdapter( $provider );

		// grab the user profile
		$user_data = $adapter->getUserProfile();
    }
	catch( Exception $e ){  
		// In case we have errors 6 or 7, then we have to use Hybrid_Provider_Adapter::logout() to 
		// let hybridauth forget all about the user so we can try to authenticate again.

		// Display the recived error, 
		// to know more please refer to Exceptions handling section on the userguide
		switch( $e->getCode() ){ 
			case 0 : echo "Unspecified error."; break;
			case 1 : echo "Hybriauth configuration error."; break;
			case 2 : echo "Provider not properly configured."; break;
			case 3 : echo "Unknown or disabled provider."; break;
			case 4 : echo "Missing provider application credentials."; break;
			case 5 : echo "Authentification failed. " 
					  . "The user has canceled the authentication or the provider refused the connection."; 
			case 6 : echo "User profile request failed. Most likely the user is not connected "
					  . "to the provider and he should to authenticate again."; 
				   $adapter->logout(); 
				   break;
			case 7 : echo "User not connected to the provider."; 
				   $adapter->logout(); 
				   break;
		} 

		echo "<br /><br /><b>Original error message:</b> " . $e->getMessage();

		echo "<hr /><h3>Trace</h3> <pre>" . $e->getTraceAsString() . "</pre>";  
	}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<?php
	$accepted_domain_list = array('fpt.edu.vn', 'gmail.com');
	if( $user_data ){
		$user_email=$user_data->email;
		$email_chunk_list=explode("@", $user_email);
		$user_name = $email_chunk_list[0];
		$domain_name = $email_chunk_list[1];
		if(!in_array($domain_name, $accepted_domain_list)) {
			$adapter->logout();
			header( "Location: index.php?msg=You are not connected to $provider with account fpt.edu.vn  or your session has expired" );
			exit;
		}
		$_SESSION['user_name'] = $user_name;
		$_SESSION['user_email'] = $user_email;
		// var_dump($user_email);
		// exit;
		header( "Location: /index.php?action=Authenticate&module=Users" );
		exit;
	}
	
?> 
