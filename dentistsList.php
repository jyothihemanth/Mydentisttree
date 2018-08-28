<?php
    
    include "db_conn.php";
    // include "validateAccesstoken.php";
    // $stateName = $_POST['stateName'];
    $response = array();
    $params = json_decode(file_get_contents("php://input"));
     $userId = $_SERVER['HTTP_UID'];
     

     $sql1 = "SELECT provider_id FROM dentists where user_id = '$userId' ";
  
    $res = mysqli_query($conn,$sql1);
    $row = mysqli_fetch_assoc($res);
    $providerId = $row['provider_id'];
    
    $sql = "SELECT * from dentists where provider_id ='$providerId'";

    $result  = mysqli_query($conn,$sql);
    
    $count = mysqli_num_rows($result);
    if($count >=1)
    {
      $response['dentistsList']=array();
    
    while($row = mysqli_fetch_assoc($result))
    {

        $dentists['dentistsId'] = $row['dentist_id'];
        $dentists['dentistsName']   = $row['name'];
        $dentists['dentistsEmail'] = $row['email'];
        $dentists['dentistsMobile'] = $row['mobile'];
         $response['api_status'] = 200;
        array_push($response['dentistsList'],$dentists);
            
     }
   } 
    else{
        $response['api_status'] = 409;// Not Found
        $response['message']    = "Sorry! Unable to show result!";
    }
    echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>