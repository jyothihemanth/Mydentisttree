<?php

    include "db_conn.php";
      $user_id = $_SERVER['HTTP_UID'];
     $response = array();
	 $params = json_decode(file_get_contents("php://input"));
  	
    // if(isset($params->user_id))
    //  {
   
    // $user_id = $params->user_id;
    $sql = "SELECT * FROM provider_details WHERE user_id = '$user_id'";
    echo $sql;
    $result = mysqli_query($conn,$sql);
    $response['myProviders'] = array();
    $myProviders_info['myProviders'] = array();
    while($row = mysqli_fetch_assoc($result))
     {
       $provider_type_id = $row['provider_type_id'];
       $myProviders['provider_type_id'] = $row['provider_type_id'];
       $myProviders['user_id'] = $row['user_id'];
       $myProviders['pvd_name'] = $row['pvd_name'];
       $myProviders['username'] = $row['username'];
       $myProviders['password'] = $row['password'];
       // $logo = logo.$provider_type_id.".jpg";
       $myProviders['pvd_shrt'] = $row['pvd_shrt'];
       $myProviders['holiday'] = $row['holiday'];
       $myProviders['hcc_locality'] = $row['hcc_locality'];
       $myProviders['address_line_1'] = $row['address_line_1'];
       $myProviders['address_line_2'] = $row['address_line_2'];
       $myProviders['pvd_state'] = $row['pvd_state'];
       $myProviders['pvd_country'] = $row['pvd_country'];
       $myProviders['pvd_email_1'] = $row['pvd_email_1'];
       $myProviders['pvd_email_2'] = $row['pvd_email_2'];
       $myProviders['pvd_contact_no_1'] = $row['pvd_contact_no_1'];
       $myProviders['pvd_contact_no_2'] = $row['pvd_contact_no_2'];
       $myProviders['pvd_patent_id'] = $row['pvd_patent_id'];
        $myProviders['pvd_description'] = $row['pvd_description'];
       $myProviders['pvd_type'] = $row['pvd_type'];
       $myProviders['pvd_images'] = $row['pvd_images'];
       $myProviders['pvd_started_year'] = $row['pvd_started_year'];
       $myProviders['rec_cre_time'] = $row['rec_cre_time'];
       $myProviders['pvd_status'] = $row['pvd_status'];
       $myProviders_info['myProviders'] = $myProviders;
       array_push($response['myProviders'],$myProviders_info['myProviders'] );
 }
   }else
    {
      $response['api_status'] = 000;
      $response['message'] = "required fields missing";
    } 

   echo json_encode($response,JSON_UNESCAPED_SLASHES);

 ?>