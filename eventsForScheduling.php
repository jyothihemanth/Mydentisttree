<?php
    include "db_conn.php";
    // include "validateAccesstoken.php";

    $response = array();
    $params = json_decode(file_get_contents("php://input"));
      $userId = $_SERVER['HTTP_UID'];

       $getDid = "SELECT   dentist_id from dentists where user_id = '$userId' ";
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $dentistId = $row['dentist_id'];
     
     // if(isset())
     $today = "SELECT * FROM dentist_schedule WHERE CURDATE() between start_date AND end_date AND dentist_id ='$dentistId' ";
     $result= mysqli_query($conn,$today);
     $count = mysqli_num_rows($result);
      
      
     if($count >= 1)
     {
        
     	$response['scheduleEvent'] = array();
        $scheduleEvent_info['scheduleEvent'] = array();
     	while($row = mysqli_fetch_assoc($result))
     	 {
             
              $resp['scheduleId'] = $row['schedule_id'];
             $resp['startTime'] = $row['start_time'];
             $resp['endTime'] = $row['end_time'];
             $resp['event'] = "active"; 
             $response['api_status'] = 200;
              
               $scheduleEvent_info['scheduleEvent'] = $resp;
               array_push($response['scheduleEvent'], $scheduleEvent_info['scheduleEvent']);        
     	 }
     } else
     {     $response['api_status'] = 419; 
           $response['event'] = "inactive";
           
     }
    

       echo json_encode($response,JSON_UNESCAPED_SLASHES);

       

    ?>