<?php

    include "db_conn.php";
    // include "validateAccesstoken.php";
    $userId = $_SERVER['HTTP_UID'];
    
    $response = array();
	  $params = json_decode(file_get_contents("php://input"));
  	 $offset = 0;
    $limit = 10;

    $getPvd = "SELECT provider_id FROM provider_details WHERE user_id = '$userId' ";
 
     $result = mysqli_query($conn,$getPvd);
     $count = mysqli_num_rows($result);
  
     if($count >= 1)
     {       
      $row = mysqli_fetch_assoc($result);
       $providerId = $row['provider_id'];
        
    $sql = "SELECT * FROM patients where provider_id = '$providerId' order by date_reg ";
   
       $result = mysqli_query($conn,$sql);
       $count = mysqli_num_rows($result);
       
    $response['myPatients'] = array();
    $myPatients_clinic_info['myPatients'] = array();
    while($row = mysqli_fetch_assoc($result))
       {
       $patientId = $row['patient_id'];
       $myPatients['patientId'] = $row['patient_id'];
       $myPatients['patientName'] = $row['patient_name'];
       $myPatients['dob'] = $row['dob'];
       $myPatients['age'] = $row['age'];
       $myPatients['gender'] = $row['gender'];
       $myPatients['heightFeet'] = $row['height_feet'];
       $myPatients['weight'] = $row['weight'];
       $myPatients['bloodGroup'] = $row['blood_group'];
       $myPatients['dentistId'] = $row['dentist_id'];
       $myPatients['allergies'] = $row['allergies'];
       $myPatients['ailments'] = $row['ailments'];
       $myPatients['pinCode'] = $row['pincode'];
       $myPatients['mobile'] = $row['patient_mobile'];
       $myPatients['mobileAlt'] = $row['patient_mobile_alt'];
       $myPatients['dateReg'] = $row['date_reg'];
       $myPatients['email'] = $row['patient_email'];
       $response['api_status'] = 200;
       $myPatients_clinic_info['myPatients'] = $myPatients;
       array_push($response['myPatients'],$myPatients_clinic_info['myPatients'] );
        }
     
  } 
  else
   {
       $getDid = "SELECT dentist_id,provider_id from dentists where user_id = '$userId' ";
      // echo $gerDid;
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $dentistId = $row['dentist_id'];
       $providerId = $row['provider_id'];
       
 
    $sql1 = "SELECT * FROM patients where  dentist_id = '$dentistId' AND provider_id = '$providerId' order by date_reg ";
    // $sql = "SELECT * FROM patients where  dentist_id = '$dentistId' AND provider_id = '$providerId' order by date_reg   limit $limit offset $offset";

    $result1 = mysqli_query($conn,$sql1);
    $count1 = mysqli_num_rows($result1);
    if($count1 >= 1)
     {       
      $row = mysqli_fetch_assoc($result);
       $providerId = $row['provider_id'];

    $response['myPatients'] = array();
    $myPatients_info['myPatients'] = array();
    while($row = mysqli_fetch_assoc($result1))
     {
       $patientId = $row['patient_id'];
       $myPatients['patientId'] = $row['patient_id'];
       $myPatients['patientName'] = $row['patient_name'];
       $myPatients['dob'] = $row['dob'];
       $myPatients['age'] = $row['age'];
       $myPatients['gender'] = $row['gender'];
       $myPatients['heightFeet'] = $row['height_feet'];
       $myPatients['weight'] = $row['weight'];
       $myPatients['bloodGroup'] = $row['blood_group'];
       $myPatients['allergies'] = $row['allergies'];
       $myPatients['ailments'] = $row['ailments'];
       $myPatients['pinCode'] = $row['pincode'];
       $myPatients['mobile'] = $row['patient_mobile'];
       $myPatients['mobileAlt'] = $row['patient_mobile_alt'];
       $myPatients['dateReg'] = $row['date_reg'];
       $myPatients['email'] = $row['patient_email'];
         $response['api_status'] = 200;
       $myPatients_info['myPatients'] = $myPatients;
       array_push($response['myPatients'],$myPatients_info['myPatients'] );
      }

    }else
    {
        $response['api_status'] = 420;
     $response['message'] =  "patient does not exists";
    }
 }
   echo json_encode($response,JSON_UNESCAPED_SLASHES);

 ?>