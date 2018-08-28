<?php 
  include "db_conn.php";

  $response = array();
  $params = json_decode(file_get_contents("php://input"));

  if(isset($params->billId))
  {
    $billId = $params->billId;
   $sql = "SELECT * FROM provider_billing WHERE bill_id = '$billId'";

   $result = mysqli_query($conn,$sql);
   $count = mysqli_num_rows($result);

   $response['billDetails'] = array();
   $billDetails_info['billDetails'] = array();
 while($row = mysqli_fetch_assoc($result))
   {
        $res['billId'] = $row['bill_id'];
        $res['document_id'] = $row['document_id'];
       $res['invoicePath']  = $row['invoice_path'];
       $res['currency']  = $row['currency'];
      $res['seq']  = $row['seq'];
      $res['dentistId'] = $row['dentist_id'];
      $res['billNum']= $row['bill_num'];
      $res['billDate'] =  $row['bill_date'];
      $res['appointmentId'] = $row['appointment_id'];
      $res['patientId'] = $row['patient_id'];
      $res['totalAmount'] = $row['total_amount'];
      $res['netAmount'] = $row['net_amount'];      
       $res['discountAmount'] = $row['discount_amount'];
       $res['gst_tax']  = $row['gst_tax'];
       $res['recDateTime']  = $row['rec_date_time'];
       $response['api_status'] = 200;
       $billDetails_info['billDetails'] = $res;
      array_push($response['billDetails'],$billDetails_info['billDetails']);

   }
 }else{
   $response['api_status'] = 400;
  $response['message'] = "required fields are missing";
 }
 
echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>

