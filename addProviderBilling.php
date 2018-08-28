<?php 
  include "db_conn.php";

  $response = array();
  $params = json_decode(file_get_contents("php://input"));
    $userId = $_SERVER['HTTP_UID'];

     $getDid = "SELECT  provider_id from dentists where user_id = '$userId' ";
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $providerId = $row['provider_id'];

if((isset($params->documentId) || isset($params->invoicePath) || isset($params->currency) || isset($params->seq) || isset($params->dentistId) || isset($params->billNum) || isset($params->billDate) || $params->appointmentId) || isset($params->patientId) || isset($params->totalAmount) || isset($params->netamount)|| isset($params->discountAmount) || isset($params->recDateTime) || isset($params->gstTax))
{

  $documentId = $params->documentId;
  $invoicePath  = $params->invoicePath;
   $currency = $params->currency;
   $seq = $params->seq;
   $dentistId = $params->dentistId;
   $billNum = $params->billNum;
   $billDate = $params->billDate;
   $patientId = $params->patientId;
   $appointmentId = $params->appointmentId;
    $totalAmount = $params->totalAmount;
     $netAmount = $params->netAmount;
      $discountAmount = $params->discountAmount;
    $recDateTime  = $params->recDateTime;
    $gstTax = $params->gstTax;


   $sql = "INSERT INTO provider_billing(provider_id,document_id,invoice_path,currency,seq,dentist_id,
   bill_num,bill_date,appointment_id,patient_id,total_amount,net_amount,discount_amount,rec_date_time,gst_tax)VALUES('$providerId','$documentId','$invoicePath','$currency','$seq','$dentistId','$billNum','$billDate','$patientId','$appointmentId','$totalAmount','$netAmount','$discountAmount','$recDateTime','$gstTax')";
 

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

