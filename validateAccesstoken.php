<?php

  include "db_conn.php";
  $user_id=$_SERVER['HTTP_UID'];
  $token=$_SERVER['HTTP_TOKEN'];


if (($token!='') && ($user_id!=''))
{
   $sql = "SELECT * FROM user_mst WHERE access_token ='$token' AND user_id='$user_id';";
   $result = mysqli_query($conn,$sql);
   $count = mysqli_num_rows($result);

   if($count>=1)
    {
      $response['message'] ="Valid request";
      

    } 
    else
    {
      $response['message'] = "Invalid request";
      echo json_encode($response,JSON_UNESCAPED_SLASHES);
      die;
    }

}
else 
{
  $response['message'] = "Invalid request";
  echo json_encode($response,JSON_UNESCAPED_SLASHES);
  die;
}

?>
    