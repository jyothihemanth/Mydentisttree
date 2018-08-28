
<?php
include "db_conn.php";
    // include "validateAccesstoken.php";
     $userId = $_SERVER['HTTP_UID'];
     $response = array();
     $params = json_decode(file_get_contents("php://input"));

      $getDid = "SELECT   provider_id from dentists where user_id = '$userId' ";
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $providerId = $row['provider_id'];

if(isset($params->fromDate) && isset($params->toDate) && isset($params->patientId))
{
 
 $fromDate = $params->fromDate;
 $toDate = $params->toDate;
 $patientId = $params->patientId;
  
 $sql = "SELECT  DISTINCT a.patient_name,a.patient_contact,a.appointment_date,a.appt_id,pb.* 
from provider_billing pb,appointments a
where  pb.patient_id= a.patient_id
and pb.patient_id= '$patientId'
and pb.bill_date between '$fromDate' and '$toDate'
 ";

echo $sql;
$result = mysqli_query($conn,$sql);
$response['billList'] = array();
while($row = mysqli_fetch_assoc($result))
{
     $resp['billId'] = $row['bill_id'];
     $resp['providerId'] = $row['provider_id'];
     $resp['documentId'] = $row['document_id'];
     $resp['invoicePat'] = $row['invoice_path'];

$resp['currency'] = $row['currency'];

$resp['seq'] = $row['seq'];

$resp['dentistId'] = $row['dentist_id'];

$resp['documentId'] = $row['document_id'];
$resp['billNum'] = $row['bill_num'];

$resp['billDate'] = $row['bill_date'];

$resp['appointmentId'] = $row['appointment_id'];

$resp['patientId'] = $row['patient_id'];

$resp['totalAmount'] = $row['total_amount'];

$resp['discountAmount'] = $row['discount_amount'];
$resp['recDateTime'] = $row['rec_date_time'];
$resp['gstTax'] = $row['gst_tax'];
$resp['billStatus'] = $row['bill_payment_status'];
$response['api_status'] = 200;
// $response['billList'] =$resp;
array_push($response['billList'],$resp);

}
 
 }
 else
 {
   $response['api_status'] = 415;
   $response['message'] = "please select both  from and to dates";
 } 
echo json_encode($response,JSON_UNESCAPED_SLASHES);

 ?>