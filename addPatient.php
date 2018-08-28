<?php

	include "db_conn.php";
      // include "validateAccesstoken.php";
	$response = array();
    $params = json_decode(file_get_contents("php://input"));
     $userId = $_SERVER['HTTP_UID'];

     $getDid = "SELECT  dentist_id,provider_id from dentists where user_id = '$userId' ";
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $dentistId = $row['dentist_id'];
       $providerId = $row['provider_id'];

    if(isset($params->mobile) )
     {
    	$name	 	= $params->name;
    	$age	 	= $params->age;
    	$address1	= $params->address1;
    	$gender  	= $params->gender;
    	$mobile  	= $params->mobile;
    	$email   	= $params->email;	
      $aadharNo  = $params->aadharNo;
      $bloodGroup = $params->bloodGroup;
      $dob         = $params->dob;
      
        // $query1 = "SELECT * 
        // FROM patients p,clinic_patients_link cp
        // WHERE p.provider_id = cp.provider_id AND p.provider_id = '$providerId';  
        // AND   p.patient_mobile = '$mobile' ";
        $query1 = "SELECT * FROM patients WHERE patient_mobile = '$mobile'";
       
        $db    = mysqli_query($conn,$query1);
        $row = mysqli_fetch_assoc($db);
        $count = mysqli_num_rows($db);
        // $patientId = $row['patient_id'];
        if($count >= 1)
          {
            $response['api_status']= 408;
            $response['message']='This mobile number is already in use';
           
          }	
        else
          {
             $query2 = "SELECT * FROM clinic_patients_link WHERE provider_id = '$providerId' AND patient_id = '$patientId'" ; 
             
             $result = mysqli_query($conn,$query2);
             $count = mysqli_num_rows($result);
             if($count >= 1)
              {
                $response['api_status']= 408;
                $response['message']= 'This user is already exsists';
                
              }else
              {
               $query3 = "INSERT INTO patients (patient_name,age,address1,gender,patient_mobile,patient_email,blood_group,aadhar_no,dentist_id,dob,provider_id)
                                VALUES( '$name', '$age', '$address1', '$gender', '$mobile','$email','$bloodGroup','$aadharNo','$dentistId','$dob','$providerId');";

                  if(mysqli_query($conn,$query3))
                  {

                     $query4 = "SELECT provider_shrt as pvdshrt from provider_details as pvd where provider_id='$providerId'";
                     $shrt = mysqli_query($conn,$query4);
                     $rowShrt = mysqli_fetch_assoc($shrt);
                      

        if (isset($rowShrt) && count($rowShrt) > 0)
          {
            $short = $rowShrt['pvdshrt'];
                     
            $sqlMpid = "select MAX(patient_id) as max_id from clinic_patients_link as Clinicpatient";
            $max = mysqli_query($conn,$sqlMpid);
            $rowMpid = mysqli_fetch_assoc($max);
            // $id = $max[0][0]['max_id'];
             $id = $rowMpid['max_id'];
             // echo $id;
             $seq = $id + 1;
            // echo $seq;
            $link_num = str_pad($short . "mdt", 8, "0", STR_PAD_RIGHT);
            $link_num = strtoupper($link_num . $seq);
            $clinic_patient_code = $link_num;
            
           }
           $queryPid = "SELECT patient_id FROM patients where patient_mobile = '$mobile'";
           $resultPid = mysqli_query($conn,$queryPid);
           $row = mysqli_fetch_assoc($resultPid);
           $patientId = $row['patient_id'];
            
            $query5 = "INSERT INTO clinic_patients_link (clinic_patient_code,provider_id,patient_id,clinic_card_no)
                                VALUES( '$clinic_patient_code','$providerId','$patientId','$clinic_card_no');";

                     

             if(mysqli_query($conn,$query5))

             {
                $response['api_status'] = 200;
                $response['message'] = "Patient information successfully registered!!";
             }
            else
             {
                $response['api_status'] = 413;
                $response['message'] = "Unable to add patient!";
             }            
         }
         // else
         // {
         //   echo "info is not stored in patient table";
         // }
       
       }
     } 
    }  
    else
    {
        $response['api_status'] = 401; 
        $response["message"] = "Required Field(s) Missing";
    }

echo json_encode($response,JSON_UNESCAPED_SLASHES);

?>