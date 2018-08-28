<?php
    include "db_conn.php";
    include "validate_access_token.php";

    $userId= $_SERVER['HTTP_UID'];
     // $accessToken =$_SERVER['HTTP_TOKEN'];

    $response = array();
    $params = json_decode(file_get_contents("php://input"));
    
   

    $query1 = "SELECT dentist_id FROM dentists WHERE user_id= '$userId' AND dentist_status = 'active'";

    $result = mysqli_query($conn,$query1);
    $count = mysqli_num_rows($result);
    $row = mysqli_fetch_assoc($result);
    $dentistId = $row['dentist_id'];
    if($count >=1)
        {
        if(isset($params->gender) || isset($params->dob) || isset($params->aadharNo) || isset($params->panNo) || isset($params->dentalLicenceNo_1) ||isset($params->dentalLicenceNo_2) ||isset($params->dental_specialization) || isset($params->qualification) || isset($params->provider_id) || isset($params->address) || isset($params->city) || isset($params->state) || isset($params->country) || isset($params->pinCode) || isset($params->universityDetails) ||isset($params->practicingSince)|| isset($params->regDate) || isset($params->bank_account_name) || isset($params->bank_account_number) || isset($params->bank_name) || isset($params->ifsc_code) || isset($params->mobile) || isset($params->dental_reg_no) || isset($params->dentalSpecialization))
        {

            $gender              = $params->gender;
            $dob                =$params->dob;
            $aadharNo           = $params->aadharNo;
            $panNo              = $params->panNo;
            $dentalRegNum       = $params->dental_reg_no;
            $dentalLicenceNo_1 = $params->dentalLicenceNo_1;
            $dentalLicenceNo_2 = $params->dentalLicenceNo_2;
            $dentalSpecialization = $params->dentalSpecialization;
            $practicingSince    = $params->practicingSince;
            $mobile             = $params->mobile;
            $qualification      = $params->qualification;
            $providerId         = $params->provider_id;
            $address            = $params->address;
            $city               = $params->city;
            $state              = $params->state;
            $country            = $params->country;
            $pinCode            = $params->pinCode;
            $universityDetails  = $params->universityDetails;
            $regDate            = $params->regDate;
            $bankAcName         = $params->bank_account_name;
            $bankAcNo           = $params->bank_account_number;
            $bankName           = $params->bank_name;
            $ifscCode           = $params->ifsc_code;

            $query2 = "UPDATE dentists set  
            gender = '$gender',dob = '$dob',aadhar_no = '$aadharNo',pan_no = '$panNo',dental_licence_no_1 = '$dentalLicenceNo_1',dental_licence_no_2 ='$dentalLicenceNo_1',dental_specialization = '$dentalSpecialization',practicing_since = '$practicingSince',
                        qualification='$qualification',address='$address',
                        city='$city', state='$state', country='$country', pincode='$pinCode', 
                        university_details='$universityDetails', mobile ='$mobile',reg_date = '$regDate',bank_ac_name = '$bankAcName',bank_ac_no ='$bankAcNo ',bank_name ='$bankName',ifsc_code='$ifscCode',dental_reg_no = '$dentalRegNum'
                        WHERE dentist_id = '$dentistId' AND dentist_status ='active' ;";
         
            if( mysqli_query($conn,$query2)){

                $response['api_status'] =200;
                $response['message'] = "Your profile Updated successfully";
            } 
            else{
                $response['api_status'] =410;
                $response['message'] = "Sorry! Unable to Update Profile!";
            }


        }

     }
    else{
             $response['api_status']=000;
             $response['message'] = "The dentist currenly not active";
    }
    echo json_encode($response,JSON_UNESCAPED_SLASHES);  

?>