<?php

	include "db_conn.php";
    // include "validateAccesstoken.php";
     $userId=$_SERVER['HTTP_UID'];
    $response = array();
    $params = json_decode(file_get_contents("php://input"));
  
         $getDid = "SELECT dentist_id,provider_id from dentists where user_id = '$userId' ";
         $result = mysqli_query($conn,$getDid);
         $row = mysqli_fetch_assoc($result);
         $dentistId = $row['dentist_id'];
         $providerId = $row['provider_id'];
         $count = mysqli_num_rows($result);
           if($count>=1)
           {

     $query2 = "SELECT * from leaves WHERE  from_date >= CURDATE()  AND to_date >=CURDATE() ORDER BY 'from_date' AND provider_id = '$providerId' AND dentist_id = '$dentistId'";
    // $query2 = "SELECT * from leaves where dentist_id ='$dentistId';";
    $result1 = mysqli_query($conn,$query2);

    $dentistLeaves['dentistLeaves'] =array();
    $response['dentistLeaves'] = array();
    while($row1 = mysqli_fetch_assoc($result1))
      {
        $dentistId=$row1['dentist_id'];
        $res['leaveId']=$row1['leave_id'];
        $res['dentistId']=$row1['dentist_id'];
        $res['providerId']=$row1['provider_id'];
        $res['fromDate']=$row1['from_date'];
        $res['toDate']=$row1['to_date'];
        $res['leaveStatus'] = $row1['leave_status'];
        $dentistLeaves['dentistLeaves'] = $res;
        array_push($response['dentistLeaves'],$dentistLeaves['dentistLeaves']);
       }
    } 
    else
       {
          $getDid = "SELECT provider_id from provider_details where user_id = '$userId' ";
    
         $result = mysqli_query($conn,$getDid);
         $row = mysqli_fetch_assoc($result);
         $count = mysqli_num_rows($result);
         $providerId = $row['provider_id'];
           if($count>=1)
           {
              // $query2 = "SELECT * from leaves where provider_id ='$providerId';";
           $query2 = "SELECT * from leaves WHERE  from_date <= CURDATE() AND to_date >=CURDATE() ORDER BY 'from_date' AND provider_id = '$providerId' ";
   
    $result1 = mysqli_query($conn,$query2);
    $providerLeaves['providerLeaves'] =array();
    $response['providerLeaves'] = array();
          
        while($row1 = mysqli_fetch_assoc($result1))
      {
        $dentistId=$row1['dentist_id'];
        $res['leaveId']=$row1['leave_id'];
         $res['dentistId']=$row1['dentist_id'];
        // $res['providerId']=$row1['provider_id'];
        $res['fromDate']=$row1['from_date'];
        $res['toDate']=$row1['to_date'];
         $res['leaveStatus'] = $row1['leave_status'];
        $providerLeaves['providerLeaves'] = $res;
        array_push($response['providerLeaves'],$providerLeaves['providerLeaves']);
       }
     }
       else
       {
         $response['api_status'] = 000;
         $response['message'] = "No leaves to show";

       }
        

    }
       
    

echo json_encode($response,JSON_UNESCAPED_SLASHES);

	
?>