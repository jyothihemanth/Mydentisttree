<?php

    include "db_conn.php";
   
    $response = array();
    $params = json_decode(file_get_contents("php://input"));
   
   if( isset($params->email))
   {
      
      $email = $params->email;
      $sql = "UPDATE user_mst SET user_status = 'active' WHERE email = '$email'"; 
      if(mysqli_query($conn,$sql))
      {
        $response['api_status'] = 200;
        $response['message'] = "user status activated"; 
      }else
      {
        $response['api_status'] = 410;
        $response['message'] = "unbale to active user status";
      }
      
      
    }
    echo json_encode($response,JSON_UNESCAPED_SLASHES);
    // else
   // {
   //    // 
   // }
  ?> 