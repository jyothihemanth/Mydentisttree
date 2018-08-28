<?php
    
    include "db_conn.php";
    // include "validateAccesstoken.php";
    
    $response = array();
    $params = json_decode(file_get_contents("php://input"));
    
        
    $sql = "select distinct(city_state) from cities";
    
    $result  = mysqli_query($conn,$sql);
    
    $count = mysqli_num_rows($result);

      $response['state']=array();
    while($row = mysqli_fetch_assoc($result))
    {

        $state['stateName']   = $row['city_state'];
        array_push($response['state'],$state);
            
    }
    // else{
    //     $response['api_status'] = 409;// Not Found
    //     $response['message']    = "Sorry! Unable to show result!";
    // }
    echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>