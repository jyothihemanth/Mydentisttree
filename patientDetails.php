<?php 
	include "db_conn.php";
	 
	$response = array();
	$params = json_decode(file_get_contents("php://input"));

   

	if (isset($params->patientId))
	{
		$patientId = $params->patientId;
		
       $sql = "SELECT * from patients WHERE patient_id = '$patientId'";
       
        if($result= mysqli_query($conn,$sql))
        {
         
         $response['patientDetails']=array();
         while($row = mysqli_fetch_assoc($result))
          {
            
            $response['patientDetails'] = $row;   
          }
        }
     else
        {
        $response['message'] = "Hello Doctor!You don't have any appointments today." ;     
        } 
    }else
    {
          $response['api_status']= 400;
          $response['message'] = "required fields are  missing";
    }

     echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>