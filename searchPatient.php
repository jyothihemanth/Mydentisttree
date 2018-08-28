<?php

	include "db_conn.php";
    // include "validateAccesstoken.php";
	$response = array();
	$params = json_decode(file_get_contents("php://input"));
     $userId = $_SERVER['HTTP_UID'];

      $sql1 = "SELECT provider_id FROM dentists where user_id = '$userId' ";
 
    $res = mysqli_query($conn,$sql1);
    $row = mysqli_fetch_assoc($res);
    $providerId = $row['provider_id'];
     
	if(isset($params->items))
    {

		$items = $params->items;

		$query = " SELECT patient_id,patient_name ,patient_mobile FROM patients WHERE   patient_name LIKE '%$items%' AND provider_id = '$providerId';";
	    
		$result = mysqli_query($conn,$query);
        $display_patient['patients_info'] =array();
        $response['patients_info'] = array();
        $resp=array();

        while($row1 = mysqli_fetch_assoc($result))
        {   

          $resp['patientId']=$row1['patient_id'];

            $resp['patientName'] =$row1['patient_name'];
            $resp['patientMobile']=$row1['patient_mobile'];
        
            $display_patient['patients_info'] = $resp;
            $response['api_status'] = 200;
            array_push($response['patients_info'],  $display_patient['patients_info']);

        }
    

        $query1 = " SELECT patient_id,patient_name ,patient_mobile FROM patients WHERE   patient_mobile LIKE '%$items%' AND provider_id = '$providerId';";
    
        $result1 = mysqli_query($conn,$query1);
        // $display_patient['patients'] =array();
        // $response['patients'] = array();
        while($row1 = mysqli_fetch_assoc($result1))
        {
           
            $resp['patientId']    =$row1['patient_id'];
            $resp['patientName'] =$row1['patient_name'];
            $resp['patientMobile']=$row1['patient_mobile'];
           $response['api_status'] = 200;
            $display_patient['patients_info'] = $resp;
            array_push($response['patients_info'],  $display_patient['patients_info']);
        }
        
    }
	else{

        $response['api_status'] = 401; // Partial Content 
        $response["message"] = "Required Field(s) Missing";
    }

echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>