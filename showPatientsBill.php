<?php

    include "db_conn.php";
    // include "validateAccesstoken.php";
     $userId = $_SERVER['HTTP_UID'];
    
    $response = array();
	  $params = json_decode(file_get_contents("php://input"));
  	 $offset = 0;
    $limit = 10;
    
 $sql = "SELECT provider_id FROM provider_details where user_id = '$userId'";

  $result = mysqli_query($conn,$sql);
  $row = mysqli_fetch_assoc($result);
   $providerId = $row['provider_id'];

    if(isset($params->patientId))
    {
       $patientId = $params->patientId;
    $sql = "SELECT * FROM provider_billing where  provider_id = '$providerId' AND patient_id = '$patientId'";

    $result = mysqli_query($conn,$sql);
    $response['patientbill'] = array();
    $patientbill_info['patientbill'] = array();
    while($row = mysqli_fetch_assoc($result))
     {
      
       $res['patientId'] = $row['patient_id'];
        $res['patientName'] = $row['patient_name'];
        $res['dentisId'] = $row['dentist_id'];
        $res['billNum'] = $row['billnum'];
        $res['gender'] = $row['gender'];
        $res['appointment_id'] = $row['appointment_id'];
        $res['total_amount'] = $row['total_amount'];
        $res['net_amount'] = $row['net_amount'];
        $res['discount_amount'] = $row['discount_amount'];
        $res['billDate'] = $row['bill_date'];
       $res['gstTax'] = $row['gst_tax'];
       // $res['mobile'] = $row['mobile'];
       // $res['mobileAlt'] = $row['mobile_alt'];
       // $res['dateReg'] = $row['date_reg'];
       // $res['email'] = $row['email'];
       
       $patientbill_info['patientbill'] = $row;
       array_push($response['patientbill'], $patientbill_info['patientbill']);
    }
   }else
   {
       $response['api_status'] = 401;
       $response['message'] = "required fields are missing";
   } 

   echo json_encode($response,JSON_UNESCAPED_SLASHES);

 ?>