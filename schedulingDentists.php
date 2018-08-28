<?php
include "db_conn.php";

$response = array();
$params = json_decode(file_get_contents("php://input"));
  $userId = $_SERVER['HTTP_UID'];
   $getDid = "SELECT  dentist_id,provider_id from dentists where user_id = '$userId' ";
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $dentistId = $row['dentist_id'];
       $providerId = $row['provider_id'];
        

if(isset($params->session)  || isset($params->applicableFrom) || isset($params->days))

 {
 	 
     $wk_days = $params->days;
     $wk_days_all = implode(",",$wk_days);
    $day_of_week = date('N', strtotime('$wk_days'));
    echo $day_of_week;
     $startDate = $params->applicableFrom;
    
     $session_WT = $params->session;
     $startTime1 = $session_WT[0]->sessionStart;
     $endTime1 = $session_WT[0]->sessionEnd;  

        $today = date("Y-m-d");
  	
				if($startDate < $today) {
					$response['api_status'] = 416;
					$response['message'] = "You cannot set schedule for previous days";
				}else

				{

            for ($i = 0; $i < count($startTime1); $i++)
             {
               //  $sstartTime = date('H:i', strtotime($start_time));
               //     echo $sstartTime;
               //  $sendTime = date('H:i', strtotime($end_time));
               // echo  $sendTime;
           
                $sql = "SELECT * FROM dentist_schedule WHERE start_time = '$startTime1' AND end_time = '$endTime1' AND start_date = 
                '$startDate'  AND provider_id = '$providerId' AND dentist_id = '$dentistId' ";
            
                $result = mysqli_query($conn,$sql);
                $count = mysqli_num_rows($result);
               if($count >= 1) 
               {
               	$response['api_status'] = 417;
                $response['message'] = "This schedule is alredy in use,please select different schedule";  
                  
               }else{

                 $enddate = date("Y-m-d", mktime(0, 0, 0, date("m", strtotime($fromdate)), date("d", strtotime($fromdate))+60, date("Y", strtotime($fromdate))));
                  echo $enddate;

               $schedule_status = '1';
              $applicable = 'specific';
              $sql1 = "INSERT INTO dentist_schedule(dentist_id,provider_id,days,start_time,end_time,applicable,start_date,end_date,schedule_status)VALUES('$dentistId','$providerId','$wk_days_all','$startTime1','$endTime1','$applicable','$startDate','$endDate','$schedule_status')";
        
              if(mysqli_query($conn,$sql1))
               {
                  $sqlRoster = "INSERT INTO roaster(dentist_id,applicable_from,day_no,start_time,end_time,booked,created) VALUES('$dentistId','$startDate','$day_no','$startTime','$endTime','$booked','$created')";
              if(mysqli_query($conn,$sqlRoster))
              {
            	$response['api_status'] = 200;
            $response['message'] ='Schedule saved successfully';
              }else{
              		$response['api_status'] = 418;
              	$response['message'] = "couldnot save schedule";
              }
          }
          // else{

          // }
        }
    }
  }
} 
else{       $response['api_status'] = 400;
            $response['message'] = "required fields are missing";
        }

       echo json_encode($response);

        ?>