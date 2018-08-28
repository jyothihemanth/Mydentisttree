<?php

	include "db_conn.php";
    // include "validateAccesstoken.php";
     $userId = $_SERVER['HTTP_UID'];
	$response = array();
    $params = json_decode(file_get_contents("php://input"));
     $getDid = "SELECT dentist_id,provider_id from dentists where user_id = '$userId' ";
         $result = mysqli_query($conn,$getDid);
         $row = mysqli_fetch_assoc($result);
         $dentistId = $row['dentist_id'];
         $providerId = $row['provider_id'];


    if(isset($params->leaveId ))
    {
   	
        $leaveId = $params->leaveId;

        $query = " DELETE  FROM leaves WHERE provider_id = '$providerId' AND dentist_id = '$dentistId' AND leave_id = '$leaveId'";
      
        if(mysqli_query($conn,$query))
            
            {
                $response['api_status'] = 200;//OK
                $response['message'] = "Leaves  cancelled successfully";
            }
            else{
                $response['api_status'] = 411;
                $response['message'] = "Sorry !! Unable to cancel leaves";
            }        

    }
    else{

        $response['api_status'] = 401; // Partial Content 
        $response["message"] = "Required Fields are Missing";
    }

echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>