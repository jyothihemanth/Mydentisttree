<?php

	include "db_conn.php";
    // include "validateAccesstoken.php";
	$response = array();
	$params = json_decode(file_get_contents("php://input"));

	if (isset($_REQUEST['items']))  
      {
       $items = $_REQUEST['items'];

		$query = " SELECT dentist_id,name ,mobile,email FROM dentists WHERE   name LIKE '%$items%';";
		
		$result = mysqli_query($conn,$query);
        $display_dentist['dentists_name'] =array();
        $response['dentists_name'] = array();
        while($row1 = mysqli_fetch_assoc($result)){
           
            $res['dentistId']=$row1['dentist_id'];
            $res['dentistName'] =$row1['name'];
            $res['dentistMobile']=$row1['mobile'];
           
            $display_dentist['dentists_name'] = $res;

            array_push($response['dentists_name'],$display_dentist['dentists_name']);

        }

        $query1 = " SELECT dentist_id,name ,mobile,email FROM dentists WHERE   mobile LIKE '$items%';";
        
        $result1 = mysqli_query($conn,$query1);
        $display_dentist['dentists_mobile'] =array();
        $response['dentists_mobile'] = array();
        while($row1 = mysqli_fetch_assoc($result1)){
           
            $res['dentistId']    =$row1['dentist_id'];
            $res['dentistName'] =$row1['name'];
            $res['dentistMobile']=$row1['mobile'];
           
            $display_dentist['dentists_mobile'] = $res;
            array_push($response['dentists_mobile'],$display_dentist['dentists_mobile']);
        }
        
    }
	else{

        $response['api_status'] = 401; // Partial Content 
        $response["message"] = "Required Field(s) Missing";
    }

echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>