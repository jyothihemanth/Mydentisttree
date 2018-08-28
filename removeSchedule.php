<?php
	include "db_conn.php";
	// include "validateAccesstoken.php";
    $userId=$_SERVER['HTTP_UID'];
	$response = array();
	$params = json_decode(file_get_contents("php://input"));

      
      $getDid = "SELECT  dentist_id,provider_id from dentists where user_id = '$userId' ";
       
       $result = mysqli_query($conn,$getDid);
       while($row = mysqli_fetch_assoc($result))
       {

       $dentistId = $row['dentist_id'];
       $providerId = $row['provider_id'];
              
       }
       if(isset($params->scheduleId))
       {
        $scheduleId = $params->scheduleId;
       $sql = "DELETE  FROM dentist_schedule WHERE dentist_id = '$dentistId' AND provider_id = '$providerId' AND schedule_id = '$scheduleId'";
      
	  if(mysqli_query($conn,$sql))
      {
        $response['api_status'] = 200;
        $response['message'] = "Schedule removed successfully";
      }		
		
       else{
                $response['api_status'] = 413;
                $response['message'] = " sorry! couldn't remove schedule";
            }            
      }
      else
      {
        $response['api_status'] =401;
        $response['message']= "required fields are missing";
     }
	
echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>