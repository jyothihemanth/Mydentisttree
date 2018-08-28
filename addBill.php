<?php 
  include "db_conn.php";

  $response = array();
  $params = json_decode(file_get_contents("php://input"));

if(isset($params->billId) || isset($params->description) || isset($params->quantity) || isset($params->billRate) || isset($params->discount) || isset($params->discountType) || isset($params->itemTax) || $params->amount)
{

  $billId = $params->billId;
  $description  = $params->description;
   $quantity = $params->quantity;
   $billRate = $params->billRate;
   $discount = $params->discount;
   $discountType = $params->discountType;
   $itemTax = $params->itemTax;
   $amount = $params->amount;

   $sql = "INSERT INTO bill_items(bill_id,description,quantity,bill_rate,
   discount,discount_type,item_tax,amount)VALUES('$billId','$description','$quantity','$billRate','$discount','$discountType','$itemTax','$amount')";

   if(mysqli_query($conn,$sql))
   {
   	$response['api_status']=200;
   	$response['message'] = "record inserted successfully";
   }else{
   	$response['api_status']=200;
   	$response['message'] = "sorry!! could not able to enter";
   }
  }else
   {
    $response['api_status'] = 401;
    $response['message'] = "required fields are missing";
   } 
echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>

