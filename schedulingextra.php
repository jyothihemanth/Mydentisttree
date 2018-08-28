<?php
include "db_conn.php";

$response = array();
$params = json_decode(file_get_contents("php://input"));
  $userId = $_SERVER['HTTP_UID'];
   $getDid = "SELECT  dentist_id,provider_id from dentists where user_id = '$userId' ";
       $result = mysqli_query($conn,$getDid);
       $row = mysqli_fetch_assoc($result);
       $dentistId = $row['dentist_id'];
       $providerId = $row['provider_id'];

if(isset($params->startTime) && isset($params->end) && isset($params->days[i]) && isset($params->applicableFrom) && isset($params->dentistConsultationDuration) && isset($params->time_between_consulation)  && isset($params->selected_date))

 {
     $startTime = $params->startTime;
     $endTime = $params->end;
     $days = $params->days[i];
     print_r($days);
     $applicableFrom = $params->applicableFrom;
      $selected_date = $params->selected_date;

     			$today = date("Y-m-d");
				$setd = date("Y-m-d", strtotime($startTime));
				if($setd < $today)
				 {
					echo "You cannot set schedule for previous days";
				}
				else 
				{
					
				 	$datetime1 = strtotime($startTime);
					$datetime2 = strtotime($endTime);
					$interval  = abs($datetime2 - $datetime1);
					$totalMinutesAvailable   = round($interval / 60);
					// $conDuration = $this->Session->read("dentist.Dentist.consultation_duration");
					$conDuration = $params->dentistConsultationDuration;
					// $timeToNext = $this->Session->read("dentist.Dentist.time_between_consulation");
					$timeToNext = $params->time_between_consulation;
					if($totalMinutesAvailable >= $conDuration) {
						$success = 0;
						$totalMins = $conDuration + $timeToNext;
						if($data["repeat"] == "selected_date") 
						{
							$fromdate = date("Y-m-d H:i:s", strtotime($data["start"]));
							$enddate = date("Y-m-d H:i:s", strtotime($data["end"]));
							while($fromdate < $enddate) {
								// $sdata["dentist_id"] = $this->Session->read("dentist.Dentist.id");
								$sdata["dentist_id"] = $dentistId;
								$sdata["date"] = date("Y-m-d", strtotime($data["start"]));
								$sdata["from_time"] = date("H:i:s", strtotime($fromdate));
								$sdata["to_time"] = date("H:i:s", strtotime($fromdate." +$conDuration minutes"));
								$to_time_date = date("Y-m-d H:i:s", strtotime($fromdate." +$conDuration minutes"));
								if($to_time_date > $enddate)
									break;	
								$fromdate = date("Y-m-d H:i:s", strtotime($to_time_date." +$timeToNext minutes"));
								$schedule_status = 1;
								$sql = "INSERT INTO dentist_schedule(dentist_id,provider_id,days,start_time,end_time,applicable,start_date,end_date,schedule_status)VALUES('$dentistId','$providerId',' $data['days']','$sdata["from_time"]','$sdata["to_time"]','$applicableFrom','$fromdate','$enddate','$schedule_status')";
								// $this->Schedule->create();
								// $this->Schedule->save($sdata);
								$success = 1;
							}
						}
						else {
							list($fh, $fm, $fs) = explode(":", date("H:i:s", strtotime($data["start"])));
							list($th, $tm, $ts) = explode(":", date("H:i:s", strtotime($data["end"])));
							$fromdate = date("Y-m-d", strtotime($data["start"]));
							$enddate = date("Y-m-d", mktime(0, 0, 0, date("m", strtotime($fromdate)), date("d", strtotime($fromdate))+$data["repeat"], date("Y", strtotime($fromdate))));
							//echo $fromdate."-".$enddate;
							while($fromdate <= $enddate) {
								$sdata["dentist_id"] = $this->Session->read("lawyer.Lawyer.id");
								$sdata["date"] = date("Y-m-d", strtotime($fromdate));
								$sdata["from_time"] = date("H:i:s", strtotime($data["start"]));
								$sdata["to_time"] = date("H:i:s", strtotime($data["end"]));
								$this->Schedule->create();
								$this->Schedule->save($sdata);
								$ffdate = date("Y-m-d $fh:$fm:$fs", strtotime($fromdate));
								$eedate = date("Y-m-d $th:$tm:$ts", strtotime($fromdate));
								while($ffdate < $eedate) {
									$sdata["dentist_id"] = $dentistId;
									$sdata["date"] = date("Y-m-d", strtotime($ffdate));
									$sdata["from_time"] = date("H:i:s", strtotime($ffdate));
									$sdata["to_time"] = date("H:i:s", strtotime($ffdate." +$conDuration minutes"));
									$to_time_date = date("Y-m-d H:i:s", strtotime($ffdate." +$conDuration minutes"));
									if($to_time_date > $eedate)
										break;	
									$ffdate = date("Y-m-d H:i:s", strtotime($to_time_date." +$timeToNext minutes"));
									//pr($sdata);
									$this->Schedule->create();
									$this->Schedule->save($sdata);
									$success = 1;
								}
								$fromdate = date("Y-m-d", mktime(0, 0, 0, date("m", strtotime($fromdate)), date("d", strtotime($fromdate))+1, date("Y", strtotime($fromdate))));
								$success = 1;		
							}
						}
						if(isset($success) && $success == 1) {
							echo "fine";
						}
						else {
							echo "Something is wrong please try after sometime.";
						}
					}
					else {
						echo "The minimum time to book schedule should be at least ".$this->Session->read("dentist.Dentist.consultation_duration")." minutes";
					}
				}
			}
			else {
				echo "All fields are required";
			}
		
        // echo json_encode($response,JSON_UNESCAPED_SLASHES);
?>

	