<?php
    
    include "db_conn.php";
    // include "validateAccesstoken.php";
    $stateName = $_POST['stateName'];
    $response = array();
    $params = json_decode(file_get_contents("php://input"));
    
    if(isset($params->stateName))
    {
   $stateName = $params->stateName;

    $sql = "SELECT * from cities where city_state = '$stateName'";
    
    $result  = mysqli_query($conn,$sql);
    
    $count = mysqli_num_rows($result);

      $response['city']=array();
    while($row = mysqli_fetch_assoc($result))
    {

        $city['cityId'] = $row['city_id'];
        $city['cityName']   = $row['city_name'];
        array_push($response['city'],$city);
            
     }
   } 
    else{
        $response['api_status'] = 409;// Not Found
        $response['message']    = "Sorry! Unable to show result!";
    }
    echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>