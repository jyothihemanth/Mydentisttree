<?php
    
    include "db_conn.php";
    include "validateAccesstoken.php";
    // $stateName = $_POST['stateName'];
    $response = array();
    $params = json_decode(file_get_contents("php://input"));
    
    if(isset($params->cityId))
    {
   $cityId = $params->cityId;

    $sql = "SELECT * from provider_details where city_id = '$cityId' AND provider_type_id = '2'";
 
    $result  = mysqli_query($conn,$sql);
    
    $count = mysqli_num_rows($result);

      $response['clinicsList']=array();
    while($row = mysqli_fetch_assoc($result))
    {

        $clinic['clinicId'] = $row['provider_id'];
        $clinic['clinicName']   = $row['provider_name'];
        $response['api_status'] = 200;
        array_push($response['clinicsList'],$clinic);
            
     }
   } 
    else{
        $response['api_status'] = 409;// Not Found
        $response['message']    = "Sorry! Unable to show result!";
    }
    echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>