<?php
    
    include "db_conn.php";
    // include "validateAccesstoken.php";
    
    $response = array();
    $params = json_decode(file_get_contents("php://input"));

    $userId = $_SERVER['HTTP_UID'];
    $sql1 = "SELECT dentist_id,provider_id FROM dentists where user_id = '$userId' ";

    $res = mysqli_query($conn,$sql1);
    $row = mysqli_fetch_assoc($res);
    $dentistId = $row['dentist_id'];
    $providerId = $row['provider_id'];
    
    
    $sql = " SELECT * from dentists where dentist_id='$dentistId' AND provider_id = '$providerId' ";

    $result  = mysqli_query($conn,$sql);
    
    $count = mysqli_num_rows($result);
    $row = mysqli_fetch_assoc($result);
    if($count >=1){

        $response['myProfile']=array();
        $myProfile['name']    = $row['name'];
        $myProfile['email']   = $row['email'];
        $myProfile['mobile']  = $row['mobile']; 
         $myProfile['gender']  = $row['gender']; 
          $myProfile['aadharNo']  = $row['aadhar_no']; 
          $myProfile['panNo']  = $row['pan_no']; 
          $myProfile['dentalLicenceNo_1']  = $row['dental_licence_no_1']; 
          $myProfile['dentalLicenceNo_2']  = $row['dental_licence_no_2']; 
          $myProfile['dentalSpecialization']  = $row['dental_specialization']; 
          $myProfile['qualification']  = $row['qualification']; 
          $myProfile['address']  = $row['address']; 
          $myProfile['city']  = $row['city']; 
          $myProfile['state']  = $row['state']; 
           $myProfile['country']  = $row['country'];
          $myProfile['pinCode']  = $row['pincode'];
          $myProfile['universityDetails']  = $row['university_details'];
          $myProfile['practicingSince']  = $row['practicing_since']; 
           $myProfile['dental_reg_no']  = $row['dental_reg_no']; 
          // $myProfile['country']  = $row['country'];
          // $myProfile['state']  = $row['state']; 
          // $myProfile['country']  = $row['country'];
          $myProfile['profile_image']= profile_image.$user_id.".jpg";
          $myProfile['bank_account_name']  = $row['bank_ac_name'];
          $myProfile['bank_account_number']  = $row['bank_ac_no'];
          $myProfile['bank_name']  = $row['bank_name'];
          $myProfile['ifsc_code']  = $row['ifsc_code'];
          $response['api_status'] = 200; 
        array_push($response['myProfile'],$myProfile);
          
    }
    else{
        $response['api_status'] = 409;// Not Found
        $response['message']    = "Sorry! Unable to show result!";
    }
    echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>