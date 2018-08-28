<?php

include "db_conn.php";

$response = array();
$params = json_decode(file_get_contents("php://input"));

if (isset($_REQUEST['items']))  
 {
 $items = $_REQUEST['items'];


    $query = " SELECT patient_id,patient_name ,patient_mobile FROM patients WHERE   patient_name LIKE '%$items%';";
    
    $result = mysqli_query($conn,$query);
        $display_patient['patients_name'] =array();
        $response['patients_name'] = array();
        while($row1 = mysqli_fetch_assoc($result)){
           
            $res['patientId']=$row1['patient_id'];
            $res['patientName'] =$row1['patient_name'];
            $res['patientMobile']=$row1['patient_mobile'];
           
            $display_patient['patients_name'] = $res;

            array_push($response['patients_name'],$display_patient['patients_name']);

        }

        $query1 = " SELECT patient_id,patient_name ,patient_mobile FROM patients WHERE   patient_mobile LIKE '$items%';";
        
        $result1 = mysqli_query($conn,$query1);
        $display_patient['patients_mobile'] =array();
        $response['patients_mobile'] = array();
        while($row1 = mysqli_fetch_assoc($result1)){
           
            $res['patientId']    =$row1['patient_id'];
            $res['patientName'] =$row1['patient_name'];
            $res['patientMobile']=$row1['patient_mobile'];
           
            $display_patient['patients_mobile'] = $res;
            array_push($response['patients_mobile'],$display_patient['patients_mobile']);
        }
        
    }
  else{

        $response['api_status'] = 401; // Partial Content 
        $response["message"] = "Required Field(s) Missing";
    }

echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>