<?php 
	include "db_conn.php";
	 // include "validateAccesstoken.php";
  $userId=$_SERVER['HTTP_UID'];
	$response = array();
	$params = json_decode(file_get_contents("php://input"));

   $getDid = "SELECT  dentist_id,provider_id from dentists where user_id = '$userId' ";

       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $dentistId = $row['dentist_id'];
       $providerId = $row['provider_id'];
	
       $sql = "SELECT * from appointments WHERE appointment_date = CURDATE() ORDER BY appointment_date AND provider_id = '$providerId' AND dentist_id = '$dentistId' ";
      
        $result= mysqli_query($conn,$sql);
        $count = mysqli_num_rows($result);
        if($count>=1)
        {
         
         $response['myAppoinments']=array();

         $response['api_status'] = 200; 
         $myAppoinments_info['myAppoinments'] = array();
         while($row = mysqli_fetch_assoc($result))
          {
            $myAppoinments['apptId'] = $row['appt_id'];
            $myAppoinments['providerId'] = $row['provider_id'];
            $myAppoinments['scheduleId'] = $row['schedule_id'];
            $myAppoinments['patientId'] = $row['patient_id'];
            $myAppoinments['patientName'] = $row['patient_name'];
            $myAppoinments['patientContact'] = $row['patient_contact'];
            $myAppoinments['dentistId'] = $row['dentist_id'];
            $myAppoinments['appointmentDate'] = $row['appointment_date'];
            $myAppoinments['time'] = $row['start_time'];
            $myAppoinments['treatmentDuration'] = $row['treatment_duration'];
            $myAppoinments['purpose'] = $row['purpose'];
            $myAppoinments['appointmentType'] = $row['appointment_type'];
            $myAppoinments['apptStatus'] = $row['appt_status'];
            $myAppoinments['belongsTo'] = $row['belongs_to'];
            $myAppoinments['createdData'] = $row['created_date'];
            $myAppoinments['updated_date'] = $row['updated_date'];
            $myAppoinments_info['myAppoinments'] = $myAppoinments;
            array_push($response['myAppoinments'],$myAppoinments_info['myAppoinments']);             
          }
        }
     else
        {
         $response['api_status'] = 414; 
        $response['message'] = "Hello Doctor!You dont have any appointments today." ;     
        } 
    // }else
    // {
    //       $response['api_status']= 400;
    //       $response['message'] = "required fields are  missing";
    // }

     echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>
