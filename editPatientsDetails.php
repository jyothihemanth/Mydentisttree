<?php

    include "db_conn.php";
    // include "validateAccesstoken.php";
    $userId = $_SERVER['HTTP_UID'];
    
    $response = array();
	  $params = json_decode(file_get_contents("php://input"));
  	 $offset = 0;
    $limit = 10;
   
    // $getDid = "SELECT  provider_id from dentists where user_id = '$userId' ";
     
    //    $result = mysqli_query($conn,$getDid);
    //    $row = mysqli_fetch_assoc($result);
    //    $providerId = $row['provider_id'];
    
 if(isset($params->patientId) || isset($params->dob) || isset($params->age) || isset($params->gender) || isset($params->heightFeet) || isset($params->weight) || isset($params->bloodGroup) || isset($params->allergies) || isset($params->ailments) || isset($params->pinCode) ||isset($params->mobile)||isset($params->mobileAlt)|| isset($params->dateReg) || isset($params->email) || isset($params->patientName))
   {     

       $patientId = $params->patientId;
       $patientName = $params->patientName;
       $dob =$params->dob;
       $age= $params->age;
       $gender = $params->gender;
       $heightFeet = $params->heightFeet;
       $weight= $params->weight;
       $bloodGroup = $params->bloodGroup;
       $allergies = $params->allergies;
       $ailments = $params->ailments;
       $pinCode = $params->pinCode;
       $mobile= $params->mobile;
       $mobileAlt= $params->mobileAlt;
       $dateReg=$params->dateReg;
       $email= $params->email;
       
  $sql = "UPDATE patients SET patient_id = '$patientId',patient_name = '$patientName', dob = '$dob', age = '$age', gender = '$gender' , height_feet = '$heightFeet',weight = '$weight' ,blood_group = '$bloodGroup', allergies = '$allergies',ailments = ' $ailments', pinCode='$pinCode',patient_mobile = '$mobile',patient_mobile_alt = '$mobileAlt' , date_reg = '$dateReg',patient_email = '$email' WHERE patient_id = '$patientId'  ";

  if(mysqli_query($conn,$sql))
  {
    $response['api_status'] = 200;
    $response['message'] = "user information updated successfuly";
  }
  else{
     $response['api_status'] = 400;
    $response['message'] = "unable to update patient information ";
  }
 }
 // else{
 
 // }

   echo json_encode($response,JSON_UNESCAPED_SLASHES);

 ?>