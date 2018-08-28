<?php 
  include "db_conn.php";

  $response = array();
  $params = json_decode(file_get_contents("php://input"));

  $userId = $_SERVER['HTTP_UID'];

  $sql = "SELECT * FROM user_mst where user_id = '$userId'";

   $result = mysqli_query($conn,$sql);
   while($row = mysqli_fetch_assoc($result))
{
   $provider_type_id = $row['provider_type_id'];

   if($provider_type_id == 1)
   {
   	$getDid = "SELECT dentist_id from dentists where user_id = '$userId' ";
   	$result = mysqli_query($conn,$getDid);
     $row1 = mysqli_fetch_assoc($result);
      $dentistId = $row1['dentist_id'];
    
   }
   else
   {
       $dentistId = $params->dentistId;
   
   }	
   // $dentistId = $row['dentist_id'];
   $providerId = $row['provider_id'];
}
   $sql1 = "SELECT * FROM dentist_schedule WHERE dentist_id = '$dentistId' AND provider_id = '$providerId' ";

    $result = mysqli_query($conn,$sql1);
    $count = mysqli_num_rows($result);
   $dentistScheduleInfo[DSinfo] = array();
   $response[DSinfo] =array();
    while($row = mysqli_fetch_assoc($result))
    {
       $resp['scheduleId'] = $row['schedule_id'];
       $resp['dentistId'] = $row['dentist_id'];
       $resp['providerId'] = $row['provider_id'];
       $resp['days'] = $row['days'];
       $resp['startTime'] = $row['start_time'];
       $resp['endTime'] = $row['end_time'];
       $resp['applicable'] = $row['applicable'];
         $resp['startDate'] = $row['start_date'];  
         $resp['endDate'] = $row['endDate'];
          $response['api_status'] = 200;
           $resp['scheduleStatus'] = $row['schedule_status'];
             $dentistScheduleInfo[DSinfo] =$resp;

             array_push($response[DSinfo],$dentistScheduleInfo[DSinfo]);

   }
 echo json_encode($response,JSON_UNESCAPED_SLASHES);
 ?>