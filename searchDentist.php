<?php

	include "db_conn.php";
    // include "validateAccesstoken.php";
	$response = array();
	$params = json_decode(file_get_contents("php://input"));
       $userId = $_SERVER['HTTP_UID'];
     

     $sql1 = "SELECT dentist_id FROM dentists where user_id = '$userId' ";
    
    $res = mysqli_query($conn,$sql1);
    $row = mysqli_fetch_assoc($res);
    $dentistId = $row['dentist_id'];

 

		$query = "SELECT dentist_id,name ,mobile,email FROM dentists WHERE  dentist_id = '$dentistId'";

		$result = mysqli_query($conn,$query);

        $display_dentist['dentists_info'] =array();
        $response['dentists_info'] = array();
        while($row1 = mysqli_fetch_assoc($result))
        {
           
            $resp['dentistId']=$row1['dentist_id'];
            $resp['dentistName'] =$row1['name'];
            $resp['dentistMobile']=$row1['mobile'];
           
            $display_dentist['dentists_info'] = $resp;

            array_push($response['dentists_info'],$display_dentist['dentists_info']);

        }

        // $query1 = " SELECT dentist_id,name ,mobile,email FROM dentists WHERE   mobile LIKE '$items%';";
        
        // $result1 = mysqli_query($conn,$query1);
        // $display_dentist['dentists_mobile'] =array();
        // $response['dentists_mobile'] = array();
        // while($row1 = mysqli_fetch_assoc($result1)){
           
        //     $res['dentistId']    =$row1['dentist_id'];
        //     $res['dentistName'] =$row1['name'];
        //     $res['dentistMobile']=$row1['mobile'];
           
        //     $display_dentist['dentists_mobile'] = $res;
        //     array_push($response['dentists_mobile'],$display_dentist['dentists_mobile']);
        // }
        
 //    }
	// else{

 //        $response['api_status'] = 401; // Partial Content 
 //        $response["message"] = "Required Field(s) Missing";
 //    }

echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>