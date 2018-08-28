<?php
    
    include "db_conn.php";
    // include "validateAccesstoken.php";
    $stateName = $_POST['stateName'];
    $response = array();
    $params = json_decode(file_get_contents("php://input"));
    
    if(isset($params->date) && isset($params->dentistId))
    {
   $date = $params->date;
   $dentistId = $params->dentistId;

    $sql = "SELECT * from appointments where appointment_date  = '$date' AND dentist_id = '$dentistId'";
    
    $result  = mysqli_query($conn,$sql);
    
    $count = mysqli_num_rows($result);

      $response['sessionList']=array();
    while($row = mysqli_fetch_assoc($result))
    {

        $sessionList['sessionTime'] = $row['session_time'];
         $sessionList['noApptsPerSession'] = $row['no_appts_per_session'];
        $response['api_status'] = 200;
        array_push($response['sessionList'],$sessionList);
            
     }
   } 
    else{
        $response['api_status'] = 409;// Not Found
        $response['message']    = "Sorry! Unable to show sessions!";
    }
    echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>