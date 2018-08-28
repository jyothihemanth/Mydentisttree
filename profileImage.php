
<?php
 include "db_conn.php";
 // include "validate_access_token.php";

 
 $id = $_SERVER['HTTP_UID'];
 // $token=$_SERVER['HTTP_TOKEN'];
 
 $response = array();
   if(isset($_FILES['image']))
   {
       
      $file_name = $_FILES['image']['name'];
      $file_tmp =$_FILES['image']['tmp_name'];
       $ext = pathinfo($file_name,PATHINFO_EXTENSION);
        $filename = $id.".".'jpg';
        echo $filename;
         $move = move_uploaded_file($file_tmp,"/profileImages/".$filename);
         if($move)
         {
               
                 $tmpmove="/profileImages/".$filename;
                  $url = profile_image.$id.".jpg"; 
                   $status = "Active";
            $sql = "INSERT INTO featured_details('user_id',img_url,status)VALUES('$id','$url',$status')";
                  if(mysqli_query($conn,$sql))
                  {

                 $response['api_status'] = 200;
                 $response['message'] = "Your profile photo updated successfully";
                  }
                   else
                  {
                 $response['api_status'] = 200;
                 $response['message'] = "Sorry!unable to update your profile photo";
                  }
         
       }
       else{
              $response['message'] = "profile image move failed";
       }

 }

 else
   {
     $response['message'] = "Image not found";
    }
       
        echo json_encode($response,JSON_UNESCAPED_SLASHES); 
      
       
   ?>
