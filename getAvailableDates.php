 <?php
    include "db_conn.php";
    // include "validateAccesstoken.php";

    $response = array();
    $params = json_decode(file_get_contents("php://input"));
      $userId = $_SERVER['HTTP_UID'];
          $getDid = "SELECT   dentist_id from dentists where user_id = '$userId' ";
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $dentistId = $row['dentist_id'];
     
        $date = date("Y-m-d");
        $available_date = array();
        $index=0;
        for($i=0;$i<=60;$i++)
        {
            $date =date('Y-m-d ', strtotime("+$i days"));
            $current_week_day = date('w', strtotime($date));
            $sql = "select * from leaves where from_date<='$date' and to_date>='$date' and dentist_id=$dentistId";
            $leaves = mysqli_query($conn,$sql);

            if (isset($leaves) && count($leaves) > 0) {
                // $resp['date'] = '$date';
                // $resp['title'] = 'Leave';
                $available_date[$index]['date']= $date;
                $available_date[$index]['title']= "Leave";
                $index++;
            }else {
                $sql1 = "select applicable_from,day_no,start_time,end_time from rosters
                    where dentist_id=$dentist_id and applicable_from =( select max(applicable_from) from rosters
                    where applicable_from<='$date' and dentist_id=$dentist_id)";
                    echo $sql1;
                $schedules = mysqli_query($conn,$sql1);
                foreach ($schedules as $schedule) {
                    if (in_array($current_week_day, explode(",", $schedule['rosters']['day_no']))) {
                        //if($this->check_duplicates($date,$available_date)==false){
                        if(in_array($date,$available_date)==false){
                            $available_date[$index]['date']= $date;
                            $available_date[$index]['title']= "Available";
                            $index++;
                        }
                    }
                }
            }
        }

        //$available_date = array_unique($available_date,SORT_REGULAR);
        echo(json_encode($available_date));
   

    ?>
    
