9<?php
	include "db_conn.php";
	// include "validateAccesstoken.php";

	$response = array();
	$params = json_decode(file_get_contents("php://input"));


	if(isset($params->dentistId) && isset($params->date))
	{

		$scheduleId 	       = $params->scheduleId;
		$providerId   	       = $params->providerId;
		$patientId  	       = $params->patientId;
		$dentistId  	       = $params->dentistId;
		$date 		           = $params->date;
		$time  		           = $params->time;
		$treatmentDuration     = $params->treatmentDuration;
		$purpose  		       = $params->purpose;
 
      // $sql = "SELECT * 
      // FROM leaves l,dentist_schedule ds 
      // WHERE 
      // '$date' BETWEEN ds.start_date AND ds.end_date 
      
      // AND '$date' BETWEEN l.from_date AND l.to_date AND ds.dentist_id = '$dentistId' "; 
      $sql = "SELECT * FROM leaves WHERE '$date' BETWEEN from_date AND to_date AND dentist_id = '$dentistId'";
	  
	  $result = mysqli_query($conn,$sql);
	  $count = mysqli_num_rows($result);
	  if($count>=1)
	  {
	  	$response['api_status'] = 200;
	  	$response['message'] = "Doctor is on leave on this day.Please select different date";
	  }	else{
	  	 
	  	    $sql1 = "SELECT * FROM dentist_schedule WHERE '$date' BETWEEN start_date AND end_date AND dentist_id = '$dentistId'";
            
           	$result1 = mysqli_query($conn,$sql1);
	        $count1 = mysqli_num_rows($result1);
	        if($count1>=1)
	         {
               $sql2 = "SELECT session_time,no_appts_per_session FROM appointments where appointment_date = '$date'";
               $result2 = mysqli_query($conn,$sql2);
               $rowSql2 = mysql_fetch_assoc($result2);
                $sessionTime = $rowSql2['session_time'];
                $noApptPerSession = $rowSql2['no_appts_per_session'];
                  if($noApptPerSession <= 10)
                  {
                  	$noApptPerSession = $noApptPerSession + 1;
                  	$sqlInsert = "INSERT INTO appointments (provider_id,schedule_id,patient_id,patient_name,patient_contact,dentist_id,appointment_date,start_time,treatment_duration,purpose,session_time,no_appts_per_session,appointment_type,appt_status,belongs_to) VALUES ( '$providerId','$scheduleId','$patientId','$patientName','$patientContact','$dentistId','$date','$time','$treatmentDuration','$purpose','$sessionTime','$noApptPerSession','$appointmentType','$apptStatus','$belongsTo')";

                  	if(mysqli_query($conn,$sqlInsert))
                  	{
                  		echo $sqlInsert;
                  	  $response['api_status'] = 200;
	         	      $response['message'] = "Appointment booked successfully";	
                  	} 
                  	else
                  	{
                      $response['api_status'] = 200;
	         	      $response['message'] = "Sorry!! unable to book appointment";	
                  	}
                  }else
                  {
                     $response['api_status'] = 200;
	         	      $response['message'] = "Sorry!! this session is full,please select another session";	   
                  }

	         	
	         }	else
	         {
	         	$response['api_status'] = 200;
                $response['message'] = "This date is not doctor's working day";
	   	     }
        }
  }
   else
  {
        $response['api_status'] = 401; // Partial Content 
        $response["message"] = "Required Fields are Missing";
       
  }

echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>