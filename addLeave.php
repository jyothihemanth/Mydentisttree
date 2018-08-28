<?php

	include "db_conn.php";
    // include "validateAccesstoken.php";
     $userId = $_SERVER['HTTP_UID'];
	$response = array();
    $params = json_decode(file_get_contents("php://input"));


    $getDid = "SELECT  dentist_id,provider_id from dentists where user_id = '$userId' ";
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $dentistId = $row['dentist_id'];
       $providerId = $row['provider_id'];


    if(isset($params->fromDate) && isset($params->toDate) || isset($params->leaveStatus) )
    {
        $fromDate = $params->fromDate;
        $toDate   = $params->toDate;
        $leaveStatus = $params->leaveStatus;

        $query = " INSERT INTO leaves(provider_id,dentist_id,from_date,to_date,leave_status)
                        VALUES('$providerId','$dentistId', '$fromDate', '$toDate', '$leaveStatus');";
                        
        if(mysqli_query($conn,$query))
            
            {
                $response['api_status'] = 200;//OK
                $response['message'] = "Leaves added successfully";
            }
            else{
                $response['api_status'] = 411;
                $response['message'] = "Unable to add leave";
            }        

    }
    else{

        $response['api_status'] = 401; // Partial Content 
        $response["message"] = "Required Field(s) Missing";
    }

echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>