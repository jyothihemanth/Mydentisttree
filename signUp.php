<?php


    include "db_conn.php";
    

    $response = array();
    $params = json_decode(file_get_contents("php://input"));
   
             if(isset($params->fullName) || isset($params->email) || isset($params->providerId) || isset($params->dentalRegNo) || isset($params->password)  || isset($params->mobile) 
              || isset($params->pinCode) || isset($params->panNo) || isset($params->dentalLicenceNo_1) || isset($params->dentalLicenceNo_2) || isset($params->aadharNo) || isset($params->pinCode) 
                || isset($params->stateName) || isset($params->cityId) 
         )
                   {
                  

        $fullName                   =$params->fullName ;
        $email                      = $params->email;
        $providerTypeId             = 1;

         $providerId                 = $params->providerId;
         $pass                       = $params->password;
         $password                   = hash('sha256',$pass);
         $roleId                    = 1;
         $dentalRegNo              = $params->dentalRegNo;
         $mobile                     = $params->mobile;
        $aadharNo                 = $params->aadharNo; 
        $panNo                     = $params->panNo;
        $dentalLicenceNo_1        = $params->dentalLicenceNo_1;
        $dentalLicenceNo_2        = $params->dentalLicenceNo_2;
        $dentalSpecialization      = $params->dentalSpecialization;
        $qualification              = $params->qualification;
        $dob                        = $params->dob;
        $gender                     = $params->gender;
        $address                    = $params->address;
        $pinCode                    = $params->pinCode;
         $cityId                       = $params->cityId;
         $stateName                    =$params->stateName;
          $clinicId                  = $params->providerId;
        $country                    = $params->country;
        $practicingSince           = $params->practicingSince;
        $accessToken               = bin2hex(openssl_random_pseudo_bytes(16));
        
        
       
        // if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        //     $response['api_status']=403;
        //     $response['message']='EMAIL address format error'; 

           
        // }
        // else{  
          
            $query1 = "SELECT * FROM user_mst where email= '$email' ;";
             
            $db    = mysqli_query($conn,$query1);
            $count = mysqli_num_rows($db);
            

            if($count >= 1)
            {

                $response['api_status']=408;
                $response['message']='This email address is already in use';

            }
            else{

                
                    $query2 = " INSERT INTO  user_mst (provider_type_id,provider_id,role_id,full_name,email,password,access_token)
                                    VALUES('$providerTypeId','$clinicId','$roleId','$fullName','$email','$password','$accessToken');";
                    // echo $query2;
                    $db1 = mysqli_query($conn,$query2);
                    
                    $db_query = " SELECT user_id FROM user_mst where email= '$email' ;";
                    $db2 =  mysqli_query($conn,$db_query);
                    $row = mysqli_fetch_assoc($db2);
                    $userId= $row['user_id'];
                
                   
                    
                        $query4 = " INSERT INTO dentists (user_id,provider_id,dental_reg_no,email,mobile,aadhar_no,pan_no,
                                        dental_licence_no_1,dental_licence_no_2,name,dental_specialization,qualification,dob,gender,address,pincode,city,state,country)
                                    VALUES('$userId','$providerId','$dentalRegNo','$email', '$mobile', '$aadharNo', '$panNo', '$dentalLicenceNo_1', '$dentalLicenceNo_2','$fullName','$dentalSpecialization', '$qualification','$dob', '$gender', '$address', '$pinCode', '$cityId', '$stateName', '$country');";
                           // echo $query4;
                        if(mysqli_query($conn,$query4)){
                            $response['api_status'] = 200;   
                            $response['message']    = "Registration Successfull!Your account will be verified soon!!";
                        }
                        else{
                            $response['api_status'] = 410;
                            $response['message']    = "Sorry Unable to Register";
                        }
                         
                    }
                    
            }
         // }
        
  else{

        $response['api_status'] = 401; // Partial Content 
        $response["message"] = "Required Fields are Missing";
    }
       
    
echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>
