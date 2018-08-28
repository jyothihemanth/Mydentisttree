<?php 
  include "db_conn.php";
   // include "validateAccesstoken.php";
  $userId=$_SERVER['HTTP_UID'];
  
  $response = array();
  $params = json_decode(file_get_contents("php://input"));
   
 $checksql = "SELECT * from provider_details where user_id = '$userId'";

 $checkresult = mysqli_query($conn,$checksql);
       $countcheck = mysqli_num_rows($checkresult);
     if($countcheck>=1)
       {
          while($row = mysqli_fetch_assoc($checkresult))
            {

         // $dentistId = $params->dentistId;
       $providerName = $row['provider_name'];
        $providerId = $row['provider_id'];
       $providerContact = $row['provider_contact_no_1'];
        
           }

          $sql = "SELECT  DISTINCT a.*,d.name as dentistName,d.mobile as dentistMobile from appointments a,dentists d WHERE a.provider_id = d.provider_id AND 
d.provider_id ='$providerId'  AND a.appt_status = 'booked'";
    
       
         $result= mysqli_query($conn,$sql);
         $count = mysqli_num_rows($result);
        if($count>=1)
          {

          $response['dashboard']=array();
         $dashboard_info['dashboard'] = array();
           while($row = mysqli_fetch_assoc($result))
             {
            $dashboard['apptId'] = $row['appt_id'];
            $dashboard['patientId'] = $row['patient_id'];
            $dashboard['patientName'] = $row['patient_name'];
            $dashboard['patientContact'] = $row['patient_contact'];
             $dashboard['dentistId'] =  $row['dentist_id'];
            $dashboard['dentistName'] = $row['dentistName'];
            $dashboard['dentistContact'] = $row['dentistMobile'];
             $dashboard['providerId'] = $providerId;
              $dashboard['provider_name'] = $providerName;
               $dashboard['providerMobile'] =$providerContact;
              $dashboard['treatmentDuration'] = $row['treatment_duration'];
              $dashboard['startTime'] = $row['start_time'];
            $dashboard['appointmentDate'] = $row['appointment_date']; 
            $dashboard['apptStatus'] = $row['appt_status'];
            
            $treatmentDuration = $row['treatment_duration']; 
          
            $startTime = $row['start_time'];
                     
             $temp = strtotime("+$treatmentDuration minutes", strtotime($startTime));
             $tempTime = date('H:i:s', $temp); 
             
              $tempTime1 = strtotime("+15 minutes", strtotime($tempTime));
              $endTime =  date('H:i:s', $tempTime1);
              // $sessionTime = strtotime("-$startTime",strtotime($endTime));
            $dashboard['endTime'] = $endTime;
             $dashboard['sessionTime'] = $startTime."-". $endTime;
            $dashboard_info['dashboard'] = $dashboard;

            $response['api_status'] = 200;
            array_push($response['dashboard'],$dashboard_info['dashboard']);
             }
      
          }
          // else
          // {
          //     $response['message'] = "Hello Clinic !You dont have any appointments today." ;     
          // } 
        }else{

           $getDid = "SELECT  dentist_id,name,provider_id,mobile from dentists where user_id = '$userId' ";
     
       $result = mysqli_query($conn,$getDid);
       $count = mysqli_num_rows($result);
       if($count>=1)
       {

       while($row = mysqli_fetch_assoc($result))
       {

       $dentistId = $row['dentist_id'];
       $dentistName = $row['name'];
        $providerId = $row['provider_id'];
        $dentistContact = $row['mobile'];
        
      }
   
          $sql = "SELECT * from appointments WHERE provider_id = '$providerId' AND dentist_id = '$dentistId' AND appt_status = 'booked' AND  appointment_date >= CURDATE() ORDER BY 'appointment_date'";
     
    
        $result= mysqli_query($conn,$sql);
        $count = mysqli_num_rows($result);
        if($count>=1)
        {
         
         $response['dashboard']=array();
         $dashboard_info['dashboard'] = array();
         while($row = mysqli_fetch_assoc($result))
          {
            $dashboard['apptId'] = $row['appt_id'];
            $dashboard['patientId'] = $row['patient_id'];
            $dashboard['patientName'] = $row['patient_name'];
            $dashboard['patientContact'] = $row['patient_contact'];
            $dashboard['dentistId'] =  $dentistId;
            $dashboard['dentistName'] = $dentistName;
            $dashboard['dentistContact'] = $dentistContact;
             $dashboard['providerId'] = $providerId;
              $dashboard['treatmentDuration'] = $row['treatment_duration'];
              $dashboard['startTime'] = $row['start_time'];
            $dashboard['appointmentDate'] = $row['appointment_date']; 
            $dashboard['apptStatus'] = $row['appt_status'];
            
            $treatmentDuration = $row['treatment_duration']; 
          
            $startTime = $row['start_time'];
                     
             $temp = strtotime("+$treatmentDuration minutes", strtotime($startTime));
             $tempTime = date('H:i:s', $temp); 
             
              $tempTime1 = strtotime("+15 minutes", strtotime($tempTime));
              $endTime =  date('H:i:s', $tempTime1);
              // $sessionTime = strtotime("-$startTime",strtotime($endTime));
            $dashboard['endTime'] = $endTime;
             $dashboard['sessionTime'] = $startTime."-". $endTime;
            $dashboard_info['dashboard'] = $dashboard;

            $response['api_status'] = 200;
            array_push($response['dashboard'],$dashboard_info['dashboard']);
             }
         }
     else
        {
        $response['message'] = "Hello Doctor!You dont have any appointments today." ;     
        } 
      
      
    }
     else
    {
          $response['api_status']= 400;
           $response['message'] = "This user doesnot exists";
     }
}

     $sql1 = "SELECT appt_status,count(appt_status) as count from appointments group by appt_status";
   
        $result= mysqli_query($conn,$sql1);
        $count = mysqli_num_rows($result);
        if($count>=1)
          {
             $response['status']=array();
             $status_info['status'] = array();
            while($row1 = mysqli_fetch_assoc($result))
            {
               
               $response['api_status'] = 200;
               $status['appStatus'] = $row1['appt_status'];
               $status['statusCount'] = $row1['count'];
               $status_info['status'] = $status;
               
            array_push($response['status'],$status_info['status']);
            }

          }


     echo json_encode($response,JSON_UNESCAPED_SLASHES);


?>
