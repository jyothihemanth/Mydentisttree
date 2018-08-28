<?php
     include "db_conn.php";
     

    $response = array();
    $params = json_decode(file_get_contents("php://input"));
    

    if (isset($params->email) && isset($params->password)){
        
        $email =$params->email;
        $password=$params->password;
        $pass = hash('sha256',$password);
     

        $query = "SELECT user_id , access_token,provider_type_id,provider_id FROM user_mst   WHERE  email = '$email' AND password = '$pass' AND user_status = 'active' ";
        // echo $query;
        //  $query = $conn->prepare("SELECT user_id , access_token,provider_type_id,provider_id FROM user_mst   WHERE  email = ? AND password = ? AND user_status = 'active'");
        // $query->bind_param("ss",$email,$password);   
        // $query->execute();
        // ------------------
        // $result = $query->get_result();
        // if ($result->num_rows > 0) {
        // $row = $result->fetch_assoc();
        $result = mysqli_query($conn,$query);
    
         $count = mysqli_num_rows($result);
         if($count>=1)
         {

         while($row = mysqli_fetch_assoc($result))
           {
         
            $response['data']=array();
        
            $data['accessToken'] = $row['access_token'];
            $data['userId'] = $row['user_id'];
            $data['providerTypeId'] = $row['provider_type_id'];
            $data['providerId'] = $row['provider_id'];
            $response['api_status'] = 200;   
            $response['message']= "Login successfull";
             array_push($response['data'],$data);
          }
         } 
        else{
            $response['api_status'] = 500;
            $response['message'] = "Not a valid login credentials or inactive status";
        }   
    }else
    {
        $response['api_status']=0000;
        $response['message'] = "required fields are missing";
    }
echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>