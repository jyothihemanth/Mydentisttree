<?php
	include "db_conn.php";
	// include "validateAccesstoken.php";
    $userId=$_SERVER['HTTP_UID'];
	$response = array();
	$params = json_decode(file_get_contents("php://input"));

      
      $getDid = "SELECT  dentist_id,provider_id from dentists where user_id = '$userId' ";
       // echo $getDid;
       $result = mysqli_query($conn,$getDid);
       while($row = mysqli_fetch_assoc($result))
       {

       $dentistId = $row['dentist_id'];
       $providerId = $row['provider_id'];
              
       }
  
       $sql = "SELECT * FROM dentist_schedule WHERE dentist_id = '$dentistId' AND provider_id = '$providerId'";
       // echo $sql;
	 $result = mysqli_query($conn,$sql);
     $count = mysqli_num_rows($result);
		
		if($count >=1)
            
            { 
            	$response['mySchedule'] = array();
            	$dentistSchedule_info['mySchedule'] = array();

            	while($row = mysqli_fetch_assoc($result))
            	 {
                    $res['scheduleId'] = $row['schedule_id'];
                    $res['dentistId'] = $row['dentist_id'];
                    $res['providerId'] = $row['provider_id'];
                     $response['api_status'] = 200;
                    $dentistSchedule_info['mySchedule'] = $res;
                    array_push($response['mySchedule'],$dentistSchedule_info['mySchedule']);
            	 }	
                

            }
            else{
                $response['api_status'] = 412;
                $response['message'] = " No schedules of this doctor is available";
            }            

	
echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>