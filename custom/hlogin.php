<?php
// ini_set('display_errors', 1);
// error_reporting(E_ALL);
  // start a new session (required for Hybridauth)
  session_start();
 
  // change the following paths if necessary
  $config   = dirname(__FILE__) . '/hybridauth/config.php';
  require_once( "hybridauth/Hybrid/Auth.php" );

  try{
  	// create an instance for Hybridauth with the configuration file path as parameter
  	$hybridauth = new Hybrid_Auth( $config );
 
  	// try to authenticate the user with twitter,
  	// user will be redirected to Twitter for authentication,
  	// if he already did, then Hybridauth will ignore this step and return an instance of the adapter
  	$google = $hybridauth->authenticate( "Google" );
 
  	$hybridauth->redirect( "profile.php?provider=Google" );
	} catch( Exception $e ){
			// In case we have errors 6 or 7, then we have to use Hybrid_Provider_Adapter::logout() to
			// let hybridauth forget all about the user so we can try to authenticate again.

			// Display the recived error,
			// to know more please refer to Exceptions handling section on the userguide
			switch( $e->getCode() ){
				case 0 : $error = "Unspecified error."; break;
				case 1 : $error = "Hybriauth configuration error."; break;
				case 2 : $error = "Provider not properly configured."; break;
				case 3 : $error = "Unknown or disabled provider."; break;
				case 4 : $error = "Missing provider application credentials."; break;
				case 5 : $error = "Authentification failed. The user has canceled the authentication or the provider refused the connection."; break;
				case 6 : $error = "User profile request failed. Most likely the user is not connected to the provider and he should to authenticate again.";
					     $google->logout();
					     break;
				case 7 : $error = "User not connected to the provider.";
					     $google->logout();
					     break;
			}
		}
  	// well, basically your should not display this to the end user, just give him a hint and move on..
  	echo "<br /><br /><b>Original error message:</b> " . $e->getMessage();
?>
