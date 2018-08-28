<?php
    
    include "db_conn.php";
    // include "validateAccesstoken.php";
    
    $response = array();
    $params = json_decode(file_get_contents("php://input"));

   if(isset($params->apptId))
   {
   	$patientId = $params->patientId;
   	$providerId = $params->providerId;
   	$apptId = $params->apptId;
       
   $sql = "SELECT * from appointments WHERE  appt_id = '$apptId'";
    
    $result = mysqli_query($conn,$sql);
     $count = mysqli_num_rows($result);
       if($count >=1)
         {
         	
           if(isset($params->status))
           {
           	 $status = $params->status;
           	
           	 $sql= "UPDATE appointments SET appt_status = '$status' WHERE appt_id = '$apptId'";
           	  
             if(mysqli_query($conn,$sql))
             {
               $response['api_status'] = 200;
               $response['message'] = "your appointment status is  " .$status;
              }
	        }

         }
         else
         {
                echo  "No such patient exists";
         }   
        }else
         {
           $response['api_status'] = 401;
           $response['message'] = "required fields are missing";
         }     


 echo json_encode($response,JSON_UNESCAPED_SLASHES);


 ?>



   