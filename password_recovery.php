
<?php
include "db_conn.php";
require "PHPMailerAutoload.php";
require "class.smtp.php";
require "class.phpmailer.php";

	$response = array();
	$params = json_decode(file_get_contents("php://input"));
	
	
	if(isset($params->email))
	   {

		$email = $params->email;
		// $flag=false;
		// $unlock =1;
		  if(!filter_var($email, FILTER_VALIDATE_email))
		    {
			   $response['api_status'] = 403;
		       $response['ERROR']='email address format error'; 
		    
		     }
		$sql="SELECT user_id from user_mst where email ='$email'";

		$result = mysqli_query($conn,$sql);
		$count = mysqli_num_rows($result);
		 while($rows = mysqli_fetch_assoc($result))
		 {
		// $key = $rows['pass_recovery_key'];
		 $id = $rows['user_id'];
	    }
		$to = $email;
		$subject = "MYDENTISTTREE-Password Recovery";
		
		 $messageBody ='<h3>WELCOME TO MYDENTISTTREE!</h3><br>'.'Please click the link to change your password <br>'.
       base_url'forgot_password.php?unlock=1'.'&id='.$user_id.'&email='.$email.'<br/>NOTE:Above link can be used only once';                

		if($count ==0){
			$response['api_status'] = 408;
            $response["message"] = "User is not registered yet or email not verified";
            
            
		}
		
		else {

			$mail = new PHPMailer();
            $mail->IsSMTP();
            $mail->SMTPAuth = true; // authentication enabled
            $mail->IsHTML(true); 
            $mail->SMTPSecure = 'ssl';//turn on to send html email
            // $mail->SMTPDebug = 3;
            $mail->Host = "p3plcpnl0749.prod.phx3.secureserver.net";
            $mail->Port = 465;
            $mail->Username = "jyothi@onebitconsult.com";
            $mail->Password = "jyothi123";
            $mail->SetFrom("jyothi@onebitconsult.com","MYDENTISTTREE-Password Recovery");
            $mail->Subject = $subject;
            
            $mail->Body = $messageBody;
            $mail->AddAddress($to);
            
			if ($mail->Send()) {
               $response['api_status'] = 200;
                $response['message']="Mail Sent";
            } else {
               
                $respose['api_status']= 409;
                $response['message'] =  "Mail Not Sent";
            }
		}

	}
	else{
		$response['api_status'] = 401;
		$response["message"] = "Required field(s)  missing";
	
	}

echo json_encode($response,JSON_UNESCAPED_SLASHES);

?>