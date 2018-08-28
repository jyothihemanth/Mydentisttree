<?php

    include "db_conn.php";
   
    $response = array();
    $params = json_decode(file_get_contents("php://input"));
   
    if( isset($params->providerTypeId) && isset($params->pvd_name) && isset($params->username) && isset($params->pvd_shrt) && isset($params->holiday) && isset($params->hcc_locality) && isset($params->address_line_1) && isset($params->address_line_2) && isset($params->pvd_state) && isset($params->pvd_country) && isset($params->pvd_email_1) && isset($params->pvd_email_2) && isset($params->pvd_contact_no_1) && isset($params->pvd_contact_no_2) && isset($params->pvd_parent_id) && isset($params->pvd_description) && isset($params->pvd_services) && isset($params->pvd_type) && isset($params->pvd_started_year)&& isset($params->pvd_status) && isset($params->role_id) && isset($params->full_name)){

        $full_name                  = $params->full_name;
        $pvd_name                   = $params->pvd_name;
        $providerTypeId             = $params->providerTypeId;
        $username                   = $params->username;
        $pvd_shrt                   = $params->pvd_shrt;
        $email                      = $params->email;
        $holiday                    = $params->holiday;
        $hcc_locality               = $params->hcc_locality; 
        $address_line_1             = $params->address_line_1;
        $address_line_2             = $params->address_line_2;
        $pvd_state                  = $params->pvd_state;
        $pvd_country                = $params->pvd_country;
        $pvd_email_1                = $params->pvd_email_1;
        $pvd_email_2                = $params->pvd_email_2;
        $pvd_contact_no_1           = $params->pvd_contact_no_1;
        $pvd_contact_no_2           = $params->pvd_contact_no_2;
        $pvd_parent_id              = $params->pvd_parent_id;
        $pvd_description            = $params->pvd_description;
        $pvd_services               = $params->pvd_services;
        $pvd_type                   = $params->pvd_type;
        $pvd_started_year           = $params->pvd_started_year;
        $pvd_status                 = $params->pvd_status;
        $role_id                    = $params->role_id;
        $access_token               = bin2hex(openssl_random_pseudo_bytes(16));
        
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $response['api_status']=403;
            $response['message']='EMAIL address format error'; 

           
        }
        else{  

            $query1 = "SELECT * FROM user_mst where email= '$email' ;";
            
            $db    = mysqli_query($conn,$query1);
            $count = mysqli_num_rows($db);
            

            if($count >= 1){

                $response['api_status']=408;
                $response['message']='This email address is already in use';

            }
            else{

                
                    $query2 = " INSERT INTO  user_mst (provider_type_id,role_id,full_name,email,access_token)
                                    VALUES('$providerTypeId','$role_id','$full_name','$email','$access_token');";
                   //echo $query2;
                    $db1 =mysqli_query($conn,$query2);
                    
                    $db_query = " SELECT user_id FROM user_mst where email= '$email' ;";
                    $db2 =  mysqli_query($conn,$db_query);
                    $row = mysqli_fetch_assoc($db2);
                    $user_id= $row['user_id'];
                   
                      {
                    
                        $query4 = " INSERT INTO provider_details (provider_type_id,user_id,pvd_name,email,pvd_shrt,holiday,hcc_locality,address_line_1,address_line_2,pvd_state,pvd_country,pvd_email_1,pvd_email_2,pvd_contact_no_1,pvd_contact_no_2,ovd_parent_id,pvd_description,pvd_services,pvd_type,pvd_started_year,pvd_status)
                                        
                                    VALUES('$providerTypeId','$user_id',' $pvd_name ',$email', ' $pvd_shrt','$holiday', ' $hcc_locality', '$address_line_1','$address_line_2',' $pvd_state','$pvd_country','$pvd_email_1 ', '$pvd_email_2 ','$pvd_contact_no_1', '$pvd_contact_no_2', '$pvd_parent_id', '$pvd_description', '$pvd_services', '$pvd_type','$pvd_started_year', '$pvd_status');";
                        echo $query4;          
                        if(mysqli_query($conn,$query4)){
                            $response['api_status'] = 200;   
                            $response['message']    = "Registration Successfull!";
                        }
                        else{
                            $response['api_status'] = 415;
                            $response['message']    = "Sorry Unable to Register";
                        }
                         
                    }
                    else if($providerType == 'clinic'){

                    }
                    else{


                    }
            }
        }
        
    }
    else{

        $response['api_status'] = 206; // Partial Content 
        $response["message"] = "Required Field(s) Missing";
    }
       
    
echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>
