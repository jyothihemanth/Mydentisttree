-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2018 at 09:07 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_dent`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointments_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `dentist_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `approximate_start_time` varchar(5) NOT NULL,
  `purpose` varchar(500) NOT NULL,
  `appointment_type` varchar(25) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `belongs_to` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointments_id`, `schedule_id`, `clinic_id`, `patient_id`, `dentist_id`, `date`, `time`, `approximate_start_time`, `purpose`, `appointment_type`, `status`, `belongs_to`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 1, 1, '2017-06-20', '10:00:00', '5', 'Right teeth problem', NULL, 'Booked', '', '2017-06-19 21:10:31', '2017-06-20 04:25:31'),
(2, 0, 2, 1, 1, '2017-06-20', '11:00:00', '5', 'Left teeth problem', NULL, 'Booked', '', '2017-06-19 21:11:00', '2017-06-20 04:26:12'),
(3, 0, 1, 2, 1, '2017-06-21', '12:00:00', '5', 'Canal therapy', NULL, 'Booked', '', '2017-06-20 04:27:02', '2017-06-20 04:27:28'),
(4, 0, 1, 1, 2, '2017-06-20', '10:00:00', '5', 'Right teeth problem', NULL, 'Booked', '', '2017-06-19 21:10:31', '2017-06-20 04:25:31'),
(5, 0, 2, 1, 2, '2017-06-20', '11:00:00', '5', 'Left teeth problem', NULL, 'Booked', '', '2017-06-19 21:11:00', '2017-06-20 04:26:12'),
(6, 0, 1, 2, 2, '2017-06-21', '12:00:00', '5', 'Canal therapy', NULL, 'Booked', '', '2017-06-20 04:27:02', '2017-06-20 04:27:28'),
(7, 0, 1, 1, 3, '2017-06-20', '10:00:00', '5', 'Right teeth problem', NULL, 'Booked', '', '2017-06-19 21:10:31', '2017-06-20 04:25:31'),
(8, 0, 2, 1, 3, '2017-06-20', '11:00:00', '5', 'Left teeth problem', NULL, 'Booked', '', '2017-06-19 21:11:00', '2017-06-20 04:26:12'),
(9, 0, 1, 2, 3, '2017-06-21', '12:00:00', '5', 'Canal therapy', NULL, 'Booked', '', '2017-06-20 04:27:02', '2017-06-20 04:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_comments`
--

CREATE TABLE `appointment_comments` (
  `appointment_comments_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `dentist_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `comments` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

CREATE TABLE `bill_items` (
  `bill_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `bill_rate` varchar(10) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`bill_id`, `description`, `quantity`, `bill_rate`, `discount`, `amount`) VALUES
(1, '1', 1, '1', '0.00', '1.00'),
(2, 'consultation', 1, '200', '0.00', '200.00'),
(3, 'implant', 1, '400', '0.00', '400.00'),
(4, 'implant', 1, '20000', '2000.00', '20000.00'),
(5, 'consultation', 1, '500', '25.00', '500.00'),
(6, 'consultation', 1, '3000', '300.00', '3000.00'),
(7, 'cleaning', 2, '500', '100.00', '1000.00'),
(8, 'test1', 1, '5000', '500.00', '5000.00'),
(9, 'test2', 2, '2000', '600.00', '4000.00'),
(10, '', 10, '10', '10.00', '100.00'),
(11, '', 20, '40', '160.00', '800.00'),
(12, '', 2, '40', '8.00', '80.00'),
(13, '', 10, '420', '84.00', '4200.00'),
(14, 'patient', 20, '20', '80.00', '400.00'),
(15, 'pills', 20, '220', '440.00', '4400.00'),
(16, 'skil', 20, '40', '80.00', '800.00'),
(17, 'pills', 20, '10', '60.00', '200.00'),
(18, 'pills', 20, '400', '800.00', '8000.00'),
(19, 'oills', 10, '40', '80.00', '400.00'),
(20, 'liss', 2, '4002', '320.16', '8004.00'),
(21, 'pills', 2, '40', '8.00', '80.00'),
(22, 'oill', 2, '10', '2.00', '20.00'),
(23, 'clinics', 3, '420', '252.00', '1260.00'),
(24, 'pills', 2, '420', '84.00', '840.00'),
(25, 'pills', 4, '100', '40.00', '400.00'),
(26, 'pills', 2, '40', '8.00', '80.00'),
(27, 'vikas', 20, '100', '0.00', '2000.00'),
(28, 'piulls', 12, '10', '62.40', '120.00'),
(29, 'pills', 20, '40', '8.00', '800.00'),
(30, 'pills', 3, '40', '6.00', '120.00'),
(31, 'clinic', 5, '5', '0.25', '25.00'),
(32, 'pills', 2, '40', '8.00', '80.00'),
(33, 'pills', 2, '50', '10.00', '100.00'),
(34, 'pills', 4, '52', '0.00', '208.00'),
(35, 'sjnj', 2, '222', '44.40', '444.00'),
(36, 'pills', 20, '40', '0.00', '800.00'),
(37, 'clinic', 44, '20', '17.60', '880.00'),
(38, 'pills', 20, '10', '40.00', '200.00'),
(39, 'pills', 20, '10', '20.00', '200.00'),
(40, 'pills', 4, '100', '0.00', '400.00'),
(41, 'pills', 40, '20', '0.00', '800.00');

-- --------------------------------------------------------

--
-- Table structure for table `case_summary`
--

CREATE TABLE `case_summary` (
  `case_id` int(11) NOT NULL,
  `appointment_id` varchar(25) NOT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `details_diagnosis` varchar(512) DEFAULT NULL,
  `medication_changes` varchar(50) DEFAULT NULL,
  `diet` varchar(50) DEFAULT NULL,
  `next_followup` varchar(50) DEFAULT NULL,
  `reffered_doctor` varchar(50) DEFAULT NULL,
  `future_action` varchar(50) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `tests_to_be_done` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_summary`
--

INSERT INTO `case_summary` (`case_id`, `appointment_id`, `diagnosis`, `details_diagnosis`, `medication_changes`, `diet`, `next_followup`, `reffered_doctor`, `future_action`, `status`, `tests_to_be_done`) VALUES
(1, '2', '', NULL, '', '', '', NULL, '', '', ''),
(2, '2', '', NULL, '', '', '', NULL, '', '', ''),
(3, '2', '', NULL, '', '', '', NULL, '', '', ''),
(4, '2', '', NULL, '', '', '', NULL, '', '', ''),
(5, '3', '', NULL, '', '', '', NULL, '', '', ''),
(6, '3', 'yes ues', NULL, '', '', '', NULL, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clinic_patients_link`
--

CREATE TABLE `clinic_patients_link` (
  `clinic_patient_id` int(11) NOT NULL,
  `clinic_patient_code` varchar(20) DEFAULT NULL,
  `provider_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `reg_date` varchar(20) DEFAULT NULL,
  `clinic_card_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clinic_patients_link`
--

INSERT INTO `clinic_patients_link` (`clinic_patient_id`, `clinic_patient_code`, `provider_id`, `patient_id`, `reg_date`, `clinic_card_no`) VALUES
(1, 'VSMDT0001', 9, 107, '2017-08-22', NULL),
(2, 'VSMDT000108', 9, 108, '2017-08-22', NULL),
(3, 'VSMDT000109', 9, 109, '2017-08-22', NULL),
(4, 'VSMDT000110', 9, 110, '2017-08-22', NULL),
(5, 'VSMDT000111', 9, 111, '2017-08-22', NULL),
(6, 'VSMDT000112', 9, 112, '2017-08-22', NULL),
(7, 'VSMDT000113', 9, 113, '2017-08-22', NULL),
(8, 'VSMDT000114', 9, 114, '2017-08-22', NULL),
(9, 'VSMDT000115', 9, 115, '2017-08-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `conferences`
--

CREATE TABLE `conferences` (
  `conference_id` int(11) NOT NULL,
  `conference_name` varchar(40) DEFAULT NULL,
  `conference_startdate` date DEFAULT NULL,
  `conference_enddate` date NOT NULL,
  `conference_url` varchar(40) NOT NULL,
  `conference_status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conferences`
--

INSERT INTO `conferences` (`conference_id`, `conference_name`, `conference_startdate`, `conference_enddate`, `conference_url`, `conference_status`) VALUES
(1, '24ISOI', '0000-00-00', '0000-00-00', 'www.24isoi.com', 'active'),
(2, 'Indian Society For Dental Research', '0000-00-00', '0000-00-00', 'www.isdr2017.in', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `dental_products`
--

CREATE TABLE `dental_products` (
  `dental_product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `offer_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dental_products`
--

INSERT INTO `dental_products` (`dental_product_id`, `name`, `price`, `category_id`, `brand_id`, `dealer_id`, `description`, `image`, `offer_price`) VALUES
(1, 'Mouth Mirror', '3000.00', 2, 1, 9, 'Double Sided Mouth Mirror', '8.jpg', '2600.00'),
(2, 'Teeth Polisher', '4300.00', 2, 1, 9, 'Air Prophy Unit', '7.jpg', '3600.00'),
(3, 'PROBE+MOUTH MIRROR+TWEEZER', '11000.00', 2, 1, 9, 'PROBE+MOUTH MIRROR+TWEEZER', '6.jpg', '8600.00'),
(4, 'Handpieces', '7000.00', 2, 1, 9, 'Handpieces', '4.jpg', '5600.00'),
(5, 'Ultrasonic Scaler', '6800.00', 2, 1, 9, 'Woodpecker Ultrasonic Scaler', '9.jpg', '5600.00');

-- --------------------------------------------------------

--
-- Table structure for table `dentist_schedule`
--

CREATE TABLE `dentist_schedule` (
  `id_dentist_schedule` int(10) UNSIGNED NOT NULL,
  `dentists_dentist_id` int(11) NOT NULL,
  `days` varchar(100) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `applicable` enum('forever','specific') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dentist_schedule`
--

INSERT INTO `dentist_schedule` (`id_dentist_schedule`, `dentists_dentist_id`, `days`, `start_time`, `end_time`, `applicable`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 'Mon,Fri,Sat', '10:00:00', '13:00:00', 'forever', '2017-06-17', NULL, 1, '2017-06-16 19:33:09', '2017-06-16 19:33:09'),
(4, 1, 'Mon,Fri,Sat', '14:00:00', '20:00:00', 'forever', '2017-06-17', NULL, 1, '2017-06-16 19:33:09', '2017-06-16 19:33:09'),
(5, 1, 'Sat', '00:00:00', '00:00:00', 'specific', '2017-06-18', NULL, 1, '2017-06-18 11:39:06', '2017-06-18 11:39:06'),
(6, 1, 'Sat', '00:00:00', '00:00:00', 'specific', '2017-06-18', NULL, 1, '2017-06-18 11:39:06', '2017-06-18 11:39:06'),
(7, 1, 'Sat, Fri, Mon', '00:00:00', '00:00:00', 'forever', '2017-06-18', NULL, 1, '2017-06-18 12:38:27', '2017-06-18 12:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `enclosures`
--

CREATE TABLE `enclosures` (
  `enclosures_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `Temp_Abutment` int(5) NOT NULL,
  `Stock_Abutment` int(5) NOT NULL,
  `Castable_Abutment` int(5) NOT NULL,
  `Lab_Analogue` int(5) NOT NULL,
  `Impression` int(5) NOT NULL,
  `Photos` int(5) NOT NULL,
  `Model` int(5) NOT NULL,
  `Bite_Registration` int(5) NOT NULL,
  `Impression_coping` int(5) NOT NULL,
  `Articulator` int(5) NOT NULL,
  `Teeth_Set` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `holiday_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `isoi_delegates`
--

CREATE TABLE `isoi_delegates` (
  `delegate_id` int(11) NOT NULL,
  `member_type` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `member_no` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `isoi_delegates`
--

INSERT INTO `isoi_delegates` (`delegate_id`, `member_type`, `name`, `gender`, `designation`, `Address`, `member_no`, `city`, `state`, `pincode`, `telephone`, `mobile`, `email`) VALUES
(1, 'ISOI MEMBER', 'DR. SEGIN CHANDRAN KR', 'Male', 'Oral and Maxillo Facial Surgeon', 'TC 6/686 Aardram Kochar Road Jagathy jn', '', 'Thiruvananthapuram', 'Kerala', '695014', '4712339420', '9526066001', 'seginchandran@gmail.com'),
(2, 'ISOI MEMBER', 'DR. GANESH RAO', 'Male', 'MAXILLOFACIAL SURGEON', 'SWISS BANGLORE', '1233', 'BANGLORE', 'Karnataka', '560093', '', '9480277329', 'ganesh.r@swiss-smile.in'),
(3, 'STUDENT NON MEMBER', 'DR. AMOL N', 'Male', 'Post Graduate', 'HKESN dental college', '', 'gulbarga', 'Karnataka', '585105', '9036993516', '9036993516', 'amol3030@gmail.com'),
(4, 'STUDENT NON MEMBER', 'DR. MRIDU DUBEY', 'Female', 'student', '#339, KSHEMA ladies hostel, nithyananda nagar deralakatte', '', 'mangalore', 'Karnataka', '575018', '', '9620651798', 'mridu.dubey@gmail.com'),
(5, 'ISOI MEMBER', 'DR. SUDHINDRA MAHOORKAR', 'Male', 'Proffessor', 'HKESN dental college', '', 'gulbarga', 'Karnataka', '585105', '', '9845288144', 'drsudhindramds@gmail.com'),
(6, 'ISOI MEMBER', 'DR. SUDHINDRA KULKARNI', 'Male', 'PROFESSOR AND HEAD OF DEPARTMENT', 'DEPT. OF IMPLANTOLOGY SDM COLLEGE OF DENTAL SCIENCES AND HOSPITAL, DHARWAD,', '', 'DHARWAD', 'Karnataka', '580009', '8362468142', '9886212329', 'drsudhindrak@gmail.com'),
(7, 'NON ISOI MEMBER', 'DR. ARUNKUMAR B.R.', 'Male', 'Dentist', 'No.28, 2nd Cross, 2nd Floor, Ramarathna Nilaya , New Kempegowda Layout, Kathriguppe, Banashankari 3rd Stage', '', 'Bengaluru', 'Karnataka', '560085', '8026794611', '9448519183', 'chandrusbr72@gmail.com'),
(8, 'NON ISOI MEMBER', 'DR. CHANDRASHEKAR B.R.', 'Male', 'Dentist', 'No.28, 2nd Cross, 2nd Floor, Ramarathna Nilaya , New Kempegowda Layout, Kathriguppe, Banashankari 3rd Stage', '', 'Bengaluru', 'Karnataka', '560085', '8026794611', '9449637149', 'chandrusbr@yahoo.com'),
(9, 'ISOI MEMBER', 'DR. SRINIVAS GHOSALA', 'Male', 'MAXILLOFACIAL SURGEON', 'SMILE TRAIN', '123', 'HYDERABAD', 'Andhra Pradesh', '5', '', '9849016969', 'srinathdr@gmail.com'),
(10, 'NON ISOI MEMBER', 'DR. JINSA P DEVASSY', 'Female', 'ASSISSTANT PROFESSOR', 'PUTHUSSERY HOUSE POPPANI ROAD PERUMBAVOOR PO ERNAKULAM KERALA', '', 'ERNAKULAM', 'Kerala', '683542', '9496501819', '9496501819', 'jinsa.pd@gmail.com'),
(11, 'STUDENT NON MEMBER', 'DR. RAMEEZ EBRAHIM', 'Male', 'Implantologist', '#50 , thomas town post opp Canara bank ATM Hutchins main road', '', 'BANGALORE', 'Karnataka', '560084', '9946123089', '9946123089', 'rameezstnr@gmail.com'),
(12, 'NON ISOI MEMBER', 'DR. SHAMBHU H SHIVANNA', 'Male', 'PROSTHODONTIST', '152, 39th cross, 9th block, jayanagar opp karnataka ban', '', 'bangalore', 'Karnataka', '560069', '9886766474', '9886766474', 'hsshambhu@gmail.com'),
(13, 'ISOI MEMBER', 'DR. ABDULHASEEB QUADRI', 'Male', 'mds in oral and maxillofacial surgery', 'Subbiah dental college, purle, holebenavalli post,', '', 'shimoga', 'Karnataka', '577222', '', '9972467097', 'abdulhaseeb11@gmail.com'),
(14, 'NON ISOI MEMBER', 'DR. JAYAPRAKASH ITTIGI', 'Male', 'M.D.S.', 'Professor and head dept of prosthodontics Subbaiah institute of dental science', '', 'Shivamogga', 'Karnataka', '577201', '', '9986191119', 'dritjp@yahoi.com'),
(15, 'NON ISOI MEMBER', 'DR. MAHESH C S', 'Male', 'Associate professor', 'Dept of prosthodontistis... Subbaiah dental college NH 13 Shimoga', '', 'Shimoga', 'Karnataka', '577201', '', '9686220840', 'mahesh18dec@gmail.com'),
(16, 'NON ISOI MEMBER', 'DR. GURURAJU C.R.', 'Male', 'READER', 'DEPT OF ORAL & MAXILLOFACIAL SURGERY SUBBAIAH DENTAL COLLEGE NH-13 SHIMOGA', '', 'SHIMOGA', 'Karnataka', '577222', '8181269922', '9980746746', 'drgururajucr@gmail.com'),
(17, 'STUDENT NON MEMBER', 'DR. SRIKANT VERMA', 'Male', 'Post graduate', 'Vydehi institute of dental sciences, white field', '', 'BANGALORE', 'Karnataka', '560066', '8777838204', '9449116157', 'srikant19097@gmail.com'),
(18, 'STUDENT MEMBER', 'DR. SNEHAL JAIN', 'Female', 'private practitioner', 'SG Jain Multispeciality Dental Clinic, #17, Devanga High School Road, RS Puram.', '', 'coimbatore', 'Tamil Nadu', '641002', '', '9486832712', 'sgjaindental@gmail.com'),
(19, 'ISOI MEMBER', 'DR. ARUN KUMAR K', 'Male', 'oral surgeon', '166, 4th cr, v v nagar, subramanyapura post', '', 'BENGALURU', 'Karnataka', '560061', '8026669197', '9535200563', 'drarun.k@rediffmail.com'),
(20, 'ISOI MEMBER', 'DR. KHUSHAL CHAND KHATRI', 'Male', 'PROSTHODONTIST', 'JAHNAVI HOSPITAL , NAHTA HOSPOTAL ROAD , BALOTRA', 'AC/L/898/RAJ', 'BALOTRA', 'Rajasthan', '344022', '', '9414108054', 'jahnavikhushal@gmail.com'),
(21, 'NON ISOI MEMBER', 'DR. TRUPTI. C. KOLUR', 'Female', 'CONSULTANT', 'HEAD & NECK ONCOLOGY DEPT, MAZUMDAR SHAH MEDICAL CENTER, NARAYANA HEALTH CITY,BOMMASANDRA', '', 'BANGALORE', 'Karnataka', '560099', '', '9880402063', 'truptikolur@yahoo.com'),
(22, 'STUDENT NON MEMBER', 'DR. SNEHA SEKHSARIA', 'Female', 'POST GRADUATE STUDENT', 'Coorg Institute of Dental sciences, K K Campus, Maggula Village, Virajpet', '', 'Virajpet, Kodagu', 'Karnataka', '571218', '8762992192', '8762992192', 'sneha.sekhsaria@gmail.com'),
(23, 'ISOI MEMBER', 'DR. B.R.SHIVANAND', 'Male', 'BDS', 'Sudanti comodontic centre opp krishna palace Station Road', '1115', 'HOSPET', 'Karnataka', '583201', '9449564531', '9449564531', 'drbrshivanand@gmail.com'),
(24, 'NON ISOI MEMBER', 'DR. BASANAGOUDA C PATIL', 'Male', 'Professor', 'HKES Dental college Gulbarga', '', 'Gulbarga', 'Karnataka', '585101', '8792789214', '8792789214', 'drpatilbc@gmail.com'),
(25, 'ISOI MEMBER', 'DR. MOHAN R SAKRI', 'Male', 'MDS', 'Dr saki is multispeciality dental clinic,SVM college complex.', '#Ac/L/1116/KAR', 'ILKAL-587125', 'Karnataka', '587125', '9035680501', '9035680501', 'mohansakri@yahoo.com'),
(26, 'STUDENT MEMBER', 'DR. JAYASHANKAR.B.V', 'Male', 'MDS', 'bangalore maxillofacial associate vikram hospital bengalore', '', 'MYSORE DISTRICT', 'Karnataka', '571301', '2267715', '8095059360', 'dr.bv.jayasahankar@gmail.com'),
(27, 'NON ISOI MEMBER', 'DR. NIMISH NIMEYA', 'Male', 'Dental surgeon', 'R 202, Anupam Apartments, 4 , CBD, East Arjun Nagar DELHI-32', '', 'DELHI', 'Delhi', '110032', '22306106', '9873387337', 'nimeyanimish@yahoo.com'),
(28, 'ISOI MEMBER', 'DR. DR AMIT CHABLANI', 'Male', 'MDS', '401,Villa Flaviana, G. P. Marg, Off. Gokhale Road, Dadar west, Mumbai - 400 028', '', 'Mumbai', 'Maharashtra', '400028', '', '9820859036', 'dramitchablani@gmail.com'),
(29, 'ISOI MEMBER', 'DR. TUSHAR TARWATE', 'Male', 'Dr', 'DENTACARE International, HEALTH PLAZA 1st Floor, Janoba chowk, Nr Datta Mandir, Wakad-Dange Chowk Road, Wakad', 'Ac/L/1541/MAH', 'Pune', 'Maharashtra', '411057', '2027504141', '9890689101', 'drtushartarwate@gmail.com'),
(30, 'NON ISOI MEMBER', 'DR. MOHAN KRISHNARAO KULKARNI', 'Male', 'B.D.S', '601 Gulmarg society, K.W Chitale road, near Portuguese church, Dadar west, Mumbai -400 028', '', 'Mumbai', 'Maharashtra', '400028', '2224374850', '9870223161', 'denatlsolotions2@yahoo.co.in'),
(31, 'NON ISOI MEMBER', 'DR. GAUTAM KUMAR', 'Male', 'B.D.S', 'F 213 DELTA 1 GREATER NOIDA', '', 'GREATER NOIDA', 'Uttar Pradesh', '201308', '', '9999770837', 'muskandentalclinic.gn@gmail.com'),
(32, 'ISOI MEMBER', 'DR. SANTOSH A NANDIMATH', 'Male', 'AST.PROF', 'V S DENTAL COLLEGE & HOSPITAL', 'AC/L/1043/KAR', 'BENGALURU', 'Karnataka', '560004', '', '9902989079', 'drsantosh_n@yahoo.co.in'),
(33, 'STUDENT NON MEMBER', 'DR. AASHI CHAWLA', 'Female', 'Post Graduate', '#48 pocket 2 army layout vasant vihar vidyanagar cross billamaranahalli', '', 'bengaluru', 'Karnataka', '562157', '', '8050488794', 'chawla.aashi.ac@gmail.com'),
(34, 'ISOI MEMBER', 'DR. SHILPA SHETTY', 'Female', 'Professoe & Head', 'V S Dental College and Hospital', '', 'BANGALORE', 'Karnataka', '560004', '', '9448061370', 'drshilpashetty@gmail.com'),
(35, 'STUDENT NON MEMBER', 'DR. SILPA MADHURI CHIKKALA', 'Female', 'POST GRADUATE', 'room no 223 unit 3 sir mvit and kcds girls hostel', '', 'bangalore', 'Karnataka', '562157', '', '9902980051', 'dr.shilpamadhuri@gmail.com'),
(36, 'NON ISOI MEMBER', 'DR. NITESH RAI', 'Male', 'PROFESSOR', '502, 11TH B CROSS , 4TH MAIN , 3RD BLOCK BEL LAYOUT VIDYARANYAPURA', '', 'bangalore', 'Karnataka', '560097', '', '9341219483', 'rainitesh@yahoo.co.in'),
(37, 'STUDENT NON MEMBER', 'DR. I N SWETHA SRIKARI', 'Female', 'POST GRADUATE', 'room no 118 unit 3 sir mvit and kcds girls hostel', '', 'bangalore', 'Karnataka', '562157', '', '9741198138', 'nottyshrika@gmail.com'),
(38, 'NON ISOI MEMBER', 'DR. ARATI TALIKOTI', 'Female', 'READER', 'INFINIT DENTAL SOLUTIONS, NO152/A&B,39TH CROSS,9TH BLOCK,JAYANAGAR', '', 'Bengaluru, PIN - 560069', 'Karnataka', '560069', '8026644828', '9980468431', 'draratitalikoti@gmail.com'),
(39, 'NON ISOI MEMBER', 'DR. SWATI R BHARADWAJ', 'Female', 'MDS Oral Surgery', 'Flat 2, Krishnakunj Apt, Plot 174,Sector 25, Pradhikaran, Nigdi', 'Still under process', 'Pune', 'Maharashtra', '411044', '', '8956954976', 'swatirbharadwaj@gmail.com'),
(40, 'NON ISOI MEMBER', 'DR. SAVITA KALLUR', 'Female', 'Practitioner', 'Kallur dentistry Shivaji road Near upali burz', '', 'Vijaypur', 'Karnataka', '586101', '8352252685', '9880924618', 'ravikallur@rediffmail.com'),
(41, 'NON ISOI MEMBER', 'DR. RAVI KALLUR', 'Male', 'Practitioner', 'Kallur dentistry Shivaji road Near upali burz', '', 'Vijaypur', 'Karnataka', '586101', '8352252685', '9900180189', 'ravikallur@rediffmail.com'),
(42, 'STUDENT NON MEMBER', 'DR. ARYA GUPTA', 'Female', 'DOCTER', 'TUPUDANA NEAR DEVI MANDAP PO-HATIA', '', 'RANCHI', 'Jharkhand', '834003', '', '9934653959', 'guptaarya1913@gmail.com'),
(43, 'STUDENT NON MEMBER', 'DR. SUSHMA RANI V', 'Female', 'MDS', '#05 GROUND FLOOR NATARAJA COMPLEX RAMAMURTHYNAGAR MAIN ROAD', '', 'BANGALORE', 'Karnataka', '560016', '', '9740950793', 'sushmarani.2610@gmail.com'),
(44, 'ISOI MEMBER', 'DR. SATISH PATIL', 'Male', 'Professor', 'H.no 10-2/61. S B College road Anand nagar. Gulbarga', '', 'Gulbarga', 'Karnataka', '585103', '', '9448124464', 'satpat71@gmail.com'),
(45, 'ISOI MEMBER', 'DR. PRASHANT PATIL', 'Male', 'Professor & HOD', 'H.no.1-891/64/28. Shastri nagar gulbarga', '', 'Gilbarga', 'Karnataka', '585102', '8472272888', '7829199009', 'pradhantomdr@gmail.com'),
(46, 'NON ISOI MEMBER', 'DR. AKASH CHAKRAVARTHY', 'Male', 'M.D.S', 'PLOT.NO:1, NETAJI NAGAR, KAPRA, SAINIKPURI', '', 'HYDERABAD', 'Andhra Pradesh', '500062', '4027113096', '8056260586', 'drakashchakravarthy@gmail.com'),
(47, 'NON ISOI MEMBER', 'DR. RAHUL ATARA', 'Male', 'M.D.S', 'Ataras dental clinic heera plaza complex near telephone exchange square beside Airtel gallery CA road', '', 'Nagpur', 'Maharashtra', '440009', '', '9923400720', 'dr.rahulatara@gmail.com'),
(48, 'ISOI MEMBER', 'DR. ABDUL RAZAK', 'Male', 'Professor', 'MES Dental college Palachodu Perinthalmanna', '', 'Perinthalmanna', 'Kerala', '676101', '', '9961455556', 'drrazakcitident@hotmail.com'),
(49, 'STUDENT NON MEMBER', 'DR. HARISH KUMAR M', 'Male', 'Post Graduate', '133 3rd main ITI Layout Mallathalli', '', 'Bengaluru', 'Karnataka', '560056', '', '9945364741', 'drharishkumar17@gmail.com'),
(50, 'ISOI MEMBER', 'DR. KRSS CHOWDARY', 'Male', 'fellowship isoi', 'Sarada Dental care Communist Bazar Challapalli', '#Ac/L/1135/AP', 'Challapalli', 'Andhra Pradesh', '521126', '', '9394245999', 'kesavadent@gmail.com'),
(51, 'NON ISOI MEMBER', 'DR. SAVITHA PN', 'Female', 'PROSTHODONTIST', '313 ,1ST BLOCK 5TH MAIN KORAMANGALA', '', 'BANGALORE', 'Karnataka', '560034', '8025534531', '9901990820', 'drsavithapn@gmail.com'),
(52, 'NON ISOI MEMBER', 'DR. PRAJNA P SHETTY', 'Female', 'senior lecturer', '#932,prajyoth,sunderram shetty nagar, vijaya bank layout, bannergatta road, bangalore-76', '', 'bangalore', 'Karnataka', '560076', '9880200298', '9880200298', 'prajna.shetty21@gmail.com'),
(53, 'NON ISOI MEMBER', 'DR. RAJKRISHNAN CHANDRASEKHARAN', 'Male', 'Chief', 'Dr.Rajkrishnan Dental Clinic North Fort Gate Tripunithura', '', 'Kochi', 'Kerala', '682301', '9847440013', '9847440013', 'mail@rajkrishnan.com'),
(54, 'STUDENT NON MEMBER', 'DR. HEENA SINGH', 'Female', 'Dentist', 'S.p-8 sector c aliganj Opposite regional science city', '', 'Lucknow', 'Uttar Pradesh', '226024', '', '7905389869', 'hinasingh2050@gmail.com'),
(55, 'ISOI MEMBER', 'DR. DHIRENDRA G.SIRUR', 'Male', 'Assistant Professor', 'Sirur Dental Clinic Prabhakar Colony Vidyanagar Hubli', '', 'Hubli', 'Karnataka', '580021', '9481280004', '9481280004', 'dhirusirur@gmail.com'),
(56, 'ISOI MEMBER', 'DR. TRUPTHI S MIRAZKAR', 'Female', 'MDS , ORAL AND MAXILLOFACIAL SURGEON', 'No.29, 1st floor, 3rd stage, Vinayaka layout, Vijaynagar', 'AC/L/961/KAR', 'BANGALORE', 'Karnataka', '560040', '8023358288', '9886143736', 'dr.trupthi@gmail.com'),
(57, 'ISOI MEMBER', 'DR. KISHAN PANICKER G', 'Male', 'MDS- oral surgery', '4,3RD MAIN, AGS LAYOUT,AREHALLI, UTTARAHALLI, SUBRAMANYAPURA POST, BANGALORE-560061', '', 'Bangalore', 'Karnataka', '560061', '', '9036070438', 'kishanmaxfax@gmail.com'),
(58, 'ISOI MEMBER', 'DR. MUHAMMAD SHAFIE', 'Male', 'Diplomat implantologist', 'DENTONIC ORAL SURGERY, RAJBAGH SRINAGAR ,KASHMIR', 'AC/L/678/j&k', 'SRINAGAR', 'Jammu and Kashmir', '190001', '1942450919', '9419016511', 'drshafidentalcare@gmail.com'),
(59, 'ISOI MEMBER', 'DR. SIDDHARTHA JENA', 'Male', 'ORAL SURGEON', 'KTH CIVILTOWNSHIP', 'AC/L/896/ODISHA', 'ROURKELA', 'Orissa', '769004', '', '9439874140', 'siddhartha.jena7@gmail.com'),
(60, 'NON ISOI MEMBER', 'DR. JEEVAN SHETTY', 'Male', 'Periodontist', '406,BR Odyssey, Ramanashree California Layout ,Yelahanka', '', 'Bangalore', 'Karnataka', '560064', '8197636491', '8197636491', 'dejpshetty@yahoo.co.in'),
(61, 'STUDENT NON MEMBER', 'DR. PRATHYUSH AJITH KUMAR', 'Male', 'student', 'Branemark Osseointegration Center India (Bangalore). No.3, 21st Main Road, Siddeshwarnagar, Marenahalli Behind Maruthi Mandir, Vijaynagar, Bangalore-40', '', 'BANGALORE', 'Karnataka', '560040', '', '8123958306', 'manandgoud7@gmail.com'),
(62, 'NON ISOI MEMBER', 'DR. AMAN SINGH', 'Male', 'PRIVATE PRACTITIONER', 'Branemark Osseointegration Center India (Bangalore). No.3, 21st Main Road, Siddeshwarnagar, Marenahalli Behind Maruthi Mandir, Vijaynagar, Bangalore-40', '', 'BANGALORE', 'Karnataka', '560040', '', '8892087161', 'baba.aman53@gmail.com'),
(63, 'NON ISOI MEMBER', 'DR. SHIVA REDDY', 'Male', 'PRIVATE PRACTITIONER', 'Branemark Osseointegration Center India (Bangalore). No.3, 21st Main Road, Siddeshwarnagar, Marenahalli Behind Maruthi Mandir, Vijaynagar, Bangalore-40', '', 'BANGALORE', 'Karnataka', '560040', '', '9989474548', 'praneethraj22@gmail.com'),
(64, 'NON ISOI MEMBER', 'DR. PRANEETH RAJ PACHIMALLA', 'Male', 'PRIVATE PRACTITIONER', 'Branemark Osseointegration Center India (Bangalore). No.3, 21st Main Road, Siddeshwarnagar, Marenahalli Behind Maruthi Mandir, Vijaynagar, Bangalore-40', '', 'BANGALORE', 'Karnataka', '560040', '', '9739515080', 'praneethraj22@gmail.com'),
(65, 'NON ISOI MEMBER', 'DR. M ANAND KUMAR', 'Male', 'PRIVATE PRACTITIONER', 'Branemark Osseointegration Center India (Bangalore). No.3, 21st Main Road, Siddeshwarnagar, Marenahalli Behind Maruthi Mandir, Vijaynagar, Bangalore-40', '', 'BANGALORE', 'Karnataka', '560040', '', '9966800800', 'manandgoud7@gmail.com'),
(66, 'ISOI MEMBER', 'DR. ASHISH YUHANNA', 'Male', 'GENERAL DENTIST & IMPLANTOLOGIST', '5A/C7 LOHIAPURAM JOEL HOSPITAL AVAS VIKAS COLONY', 'Ac/L/1267/UP', 'FARRUKHABAD', 'Uttar Pradesh', '209625', '9415146058', '9415146058', 'drashishjoel@gmail.com'),
(67, 'NON ISOI MEMBER', 'DR. SANTOSH Y NELOGI', 'Male', 'reader', 'department of prosthodontics . KLE university , KLEVK instituteof dental science . belgaum', '', 'belgaum', 'Karnataka', '590010', '', '9886968809', 'drsantoshnelogi@gmail.com'),
(68, 'ISOI MEMBER', 'DR. ANJANI KUMAR JHA', 'Male', 'Oral & Maxillofacial Surgeon', 'Prashant Memorial Charitable Hospital Road no 4, Juranchapra', '', 'Muzaffarpur', 'Bihar', '842001', '', '9939189470', 'Jha.anjanikumar235@gmail.com'),
(69, 'NON ISOI MEMBER', 'DR. NARESH KUMAR V', 'Male', 'PROSTODONTIST', 'F.NO; 102, SHIVA GANGA ENCLAVE,OPP HERITAGE FRESH, VEG MARKET ROAD, NALLAKUNTA.', '', 'HYDERABAD', 'Andhra Pradesh', '50004', '', '9160161777', 'nareshdr7@gmail.com'),
(70, 'NON ISOI MEMBER', 'DR. ZARNA TALUJA', 'Female', 'ORTHODONTIST', 'DIVYAM ORTHODONTIC CARE AND IMPLANT CENTER 204, SHIVASHRAY COMPLEX, LAXMI THEATER CROSS ROAD', '', 'ANAND', 'Gujarat', '388001', '2692244832', '9426422832', 'drzarnaorthodontist@gmail.com'),
(71, 'NON ISOI MEMBER', 'DR. MANJUNATH', 'Male', 'Professor and HOD', 'Department of Oral & Maxillofacial Surgery, A. J. Institute of Dental Sciences, Kuntikana', '', 'Mangalore', 'Karnataka', '575004', '', '9343340700', 'drmanju08@gmail.com'),
(72, 'ISOI MEMBER', 'DR. MAHENDRA AZAD', 'Male', 'CLINICAL DIRECTOR & CHEIF CONSULTANT', 'CLOVE DENTAL, HQ SOUTH INDIA APARNA CREST,2ND FLOOR, ROAD NO 2, ABOVE RENAULT SHOWROOM, BANJARA HILLS', 'AC/L/1110/AP', 'HYDERABAD', 'Andhra Pradesh', '500034', '4023403568', '9391035500', 'mahendra_azad@yahoo.com'),
(73, 'NON ISOI MEMBER', 'DR. SUNIL S SHROFF', 'Male', 'Oral and Maxillofacial Surgeon', '104, Shalimar Residency, 1st floor, flat no-103, 2nd main road, Sheshadripuram', '', 'Bangalore', 'Karnataka', '560020', '', '9108097860', 'shroffsunil@gmail.com'),
(74, 'NON ISOI MEMBER', 'DR. CHIRAG TALUJA', 'Male', 'ENDODONTIST', 'DIVYAM DENTAL CARE AND IMPLANT CENTER GF-3, SHREE SANTRAM NILAYAM COMLEX, OPP. ALKA CINEMA, SANTRAM ROAD', '', 'NADIAD', 'Gujarat', '387001', '2682569494', '9427382006', 'drchiragtaluja@yahoo.com'),
(75, 'NON ISOI MEMBER', 'DR. VINOTH KUMAR GANESHAN', 'Male', 'CHIEF DENTIST', 'AMBIGAI DENTAL CLINIC, REBA COMPLEX, BUS STAND, KOTAGIRI, THE NILGIRIS', '', 'KOTAGIRI, NILGIRIS', 'Tamil Nadu', '643217', '4266274334', '9442274334', 'dentistvinoth@gmail.com'),
(76, 'ISOI MEMBER', 'DR. CHAKRADHAR', 'Male', 'BDS , MS', 'Saikrupa dental care, No-874, Raineo house Modi hospital main road. Bangalore-560079', 'Ac/L/1060/KAR', 'Bangalore', 'Karnataka', '560079', '8023221422', '9845162355', 'drchakradhar.144@gmail.com'),
(77, 'ISOI MEMBER', 'DR. MANJUNATH S SARANGI', 'Male', 'Dentist', '#808 B BLOCK GOPALAN RESIDENCY NO 1 BHUVANESHVARINAGAR KP AGRAHARA (VIJAYNAGAR PIPELINE ROAD)', '', 'BENGALURU', 'Karnataka', '560023', '23508641', '9845094475', 'sarangimanjunath@gmail.com'),
(78, 'NON ISOI MEMBER', 'DR. ELDO KOSHY', 'Male', 'Professor', 'DR.KOSHYS DENTAL IMPLANT AND PROSTHODONTIC CLINIC,PALARIVATTOM,COCHIN-682025', '', 'ERNAKULAM', 'Kerala', '682025', '4842336620', '9388836620', 'eldokoshy@koshysdentalclinic.com'),
(79, 'NON ISOI MEMBER', 'DR. PARTHA SARATHI SAHA', 'Male', 'oral and maxillofacial surgeon', 'A-1 kailash apartment , H.S Road , Paltan bazar', '', 'guwhati', 'Assam', '781008', '', '9886863296', 'parth_856@yahoo.co.in'),
(80, 'NON ISOI MEMBER', 'DR. PRANOY MUKHERJEE', 'Male', 'Dentist', '401 B Somerset Apartments 18 MG Road', '', 'Bangalore', 'Karnataka', '560001', '9916227277', '9916227277', 'pranoydent@gmail.com'),
(81, 'NON ISOI MEMBER', 'DR. SAPHAL SHETTY', 'Male', 'Dentist', 'Confident Dental Care, 117, WOC rd', '', 'Bangalore', 'Karnataka', '560086', '', '9980910000', 'saphal@confidentdentalcare.in'),
(82, 'NON ISOI MEMBER', 'DR. NIRALI ABHAY SHAH', 'Female', 'DENTAL SURGEON', '702/ AVANTI CHS,KASTURBA GANDHI NAGAR,LNPAPAN ROAD, WORLI,MUMBAI', '', 'MUMBAI', 'Maharashtra', '400018', '9820127749', '9819241464', 'drshahnirali@gmail.com'),
(83, 'STUDENT NON MEMBER', 'DR. VENISA CUTINHA', 'Female', 'Student', '111/1, Dr.Syamala Reddy dental college, hospital and research centre, Munnekolala, Marathahalli.', '', 'Bangalore', 'Karnataka', '560037', '', '9535669747', 'venisacutinha@hotmail.com'),
(84, 'NON ISOI MEMBER', 'DR. ROHIT ANAND', 'Male', 'P.G. Student', 'Hazaribag college of dental sciences and hospital,Demotand', '', 'Hazaribag', 'Jharkhand', '825301', '', '9955641141', 'drrohitanand200@gmail.com'),
(85, 'NON ISOI MEMBER', 'DR. BINOD SHANKAR', 'Male', 'P.G. Student', 'Hazaribag college of dental sciences and hospital,Demotand', '', 'hazaribag', 'Jharkhand', '825301', '', '8271810354', 'rohitanand.anand200@gmail.com'),
(86, 'NON ISOI MEMBER', 'DR. RITU KUMARI', 'Female', 'P.G. Student', 'vasundhara palm island, flat no-mist 205, behind agarwal nursing home,karamtoli chawk ,bariatu road, ranchi', '', 'ranchi', 'Jharkhand', '834008', '', '8986813254', 'ssinharitu.r45@gmail.com'),
(87, 'NON ISOI MEMBER', 'DR. HEMANTH.M', 'Male', 'Orthodontist', '1598/A,27th Cross,Bhanshankari 2nd Stage', '', 'Bangalore', 'Karnataka', '560070', '', '9845459666', 'drhemanth@yahoo.com'),
(88, 'STUDENT NON MEMBER', 'DR. SHANMUGA PRIYA', 'Female', 'Student', '111/1, Dr.Syamala Reddy Dental college, Hospital and Research Centre, Munnekolala, Marathahalli.', '', 'Bangalore', 'Karnataka', '560037', '', '8754810150', 'vino689@gmail.com'),
(89, 'STUDENT NON MEMBER', 'DR. ANKITA KUMARI', 'Female', 'Student', '111/1,Dr.Syamala Reddy Dental College, Hospital and research centre, Munnekolala, Marathahalli.', '', 'Bangalore', 'Karnataka', '560037', '', '9008927972', 'drankita990@gmail.com'),
(90, 'STUDENT MEMBER', 'DR. IFFAT SHAKIL AHMED RUMANI', 'Female', 'DOCTOR', 'C-101 ABBA APARTMENT S.V. ROAD JOGESHWARI WEST MUMBAI 400102', 'Ac/L/1731/MAH', 'MUMBAI', 'Maharashtra', '400102', '', '9773661599', 'rumaniiffat@gmail.com'),
(91, 'NON ISOI MEMBER', 'DR. NILESH PATEL', 'Male', 'BDS', 'B K DENTAL CLINIC ABOVE MAMTA MEDICAL NR. B K CINEMA', '', 'MEHSANA', 'Gujarat', '384002', '255985', '9227978414', 'patelsola@gmail.com'),
(92, 'ISOI MEMBER', 'DR. SANDEEP GURAV', 'Male', 'Asst. Prof', 'Dept of Dental and Prosthetic Surgery. Tata Memorial hospital, Parel Mumbai', 'Ac/L/1497/MAH', 'Mumbai', 'Maharashtra', '400012', '2224177225', '9769387712', 'drsandeepgurav@gmail.com'),
(93, 'STUDENT NON MEMBER', 'DR. ANJALI', 'Female', 'PG STUDENT', 'JAIPUR DENTAL COLLEGE DHAND AMER', '', 'JAIPUR', 'Rajasthan', '302028', '', '8769538521', 'singhanjali28@gmail.com'),
(94, 'ISOI MEMBER', 'DR. ANJAN KUMAR SHAH', 'Male', 'maxillofacial surgeon', 'BRIGADE APARTMENT RAJAJINAGAR', '1', 'Bangalore', 'Karnataka', '560093', '', '9620180771', 'anjankumarshah@gmail.com'),
(95, 'ISOI MEMBER', 'DR. SRINATH', 'Male', 'maxillofacial surgeon', '#31/32, Crescent Road, Mallige Medical Center, Racecourse Road, LandmarkNear- Sivananda Circle, Bangalore', '', 'banglore', 'Karnataka', '560093', '', '9844041408', 'srinathdr@gmail.com'),
(96, 'STUDENT NON MEMBER', 'DR. NEHA AGARWAL', 'Female', 'PG STUDENT', 'JAIPUR DENTAL COLLEGE DHAND AMER', '', 'JAIPUR', 'Rajasthan', '302028', '', '8696341263', 'nehaagrawal.dr@gmail.com'),
(97, 'STUDENT MEMBER', 'DR. ANVI GUPTA', 'Female', 'MDS STUDENT', 'VS DENTAL COLLEGE & HOSPITAL Near KIMS Hospital KR Rd, Parvathipuram Vishweshwarapura Shankarapura, Bengaluru, Karnataka 560004', '', 'BANGALORE', 'Karnataka', '560004', '', '7795186194', 'anvi001@gmail.com'),
(98, 'ISOI MEMBER', 'DR. PRATHIBA MOHAN', 'Female', 'DOCTOR', 'mumbai', '', 'Mumbai', 'Maharashtra', '400059', '', '9820142273', 'drvsmohan@gmail.com'),
(99, 'ISOI MEMBER', 'DR. V S MOHAN', 'Male', 'DOCTOR', 'Building No 9 Flat No 1, Azad Road, Verma Nagar, Andheri East, Mumbai, Maharashtra - 400059', '96', 'Mumbai', 'Maharashtra', '400059', '', '9820142279', 'drvsmohan@gmail.com'),
(100, 'ISOI MEMBER', 'DR. MOHAMMED', 'Male', 'MDS', 'Areekat Dental clinic Relief hospital&truma centre', 'AC/l/737/Ker', 'Kondotty', 'Kerala', '673638', '9747500555', '9947225555', 'arkotm@gmail.com'),
(101, 'STUDENT NON MEMBER', 'DR. IBADAT JAMIL', 'Female', 'dentist', 'fahimabad colony kanpur', '', 'Kanpur', 'Delhi', '208001', '', '7309262030', 'ibadatjamil@gmail.com'),
(102, 'NON ISOI MEMBER', 'DR. SRIVATSA KENGASUBBIAH', 'Male', 'PROFESSOR', 'AMMA NAANA DENTAL CENTER, no 23c halls road, Kilpauk', '', 'Chennai', 'Tamil Nadu', '600010', '4442859956', '9444018844', 'vatsasri77@yahoo.co.in'),
(103, 'STUDENT MEMBER', 'DR. ANISH KAPOOR', 'Male', 'DENTIST', 'j-2/45 Vijay Nagar', '', 'Kanpur', 'Uttar Pradesh', '208001', '9935420786', '9935420786', 'dranishkapoor@gmail.com'),
(104, 'NON ISOI MEMBER', 'DR. DR.VIPIN DEHANE', 'Male', 'MDS', 'apple Dental Clinic, 21, main road,Nandanvan Square Opp Ram Bhandar', '', 'Nagpur', 'Maharashtra', '440009', '9422903990', '9422903990', 'dr.vipindehane@gmail.com'),
(105, 'NON ISOI MEMBER', 'DR. RAJA V K', 'Male', 'mds', '7 gandhi nagar nanjundapuram post', '', 'coimbatore', 'Tamil Nadu', '641036', '9344624269', '9344624269', 'clipsraja@rediffmail.com'),
(106, 'ISOI MEMBER', 'DR. ANAND RAJ', 'Male', 'MDS', 'SMILES DENTAL CLINIC, F-5, PURVA APTS, OPP PADOLE HOSPITAL, SWAVALAMBI NAGAR SQUARE,', 'Ac/L/1678?MAH', 'NAGPUR', 'Maharashtra', '440022', '', '9373127535', 'dranandraj@yahoo.com'),
(107, 'ISOI MEMBER', 'DR. SAGAR SHAH', 'Male', '-', '32Reasons dental centre, Krishna kunj bldg 2nd floor, flat 8. K.M. Munshi Marg. Girgaum chowpatty', 'AC/L/1028/MAH', 'mumbai', 'Maharashtra', '400007', '23611849', '9820187657', 'info@32reasons.com'),
(108, 'NON ISOI MEMBER', 'DR. I.MOHAMED JAWAHAR ALI', 'Male', 'GENERAL PRACTITIONER', '31 a, sathapadi street, chidambaram', '', 'CHIDAMBARAM', 'Tamil Nadu', '608001', '9894854412', '9894854412', 'JAWAHARDENTIST@GMAIL.com'),
(109, 'NON ISOI MEMBER', 'DR. DR.M.J.YASMEEN JAWAHAR', 'Female', 'MAXILLO FACIAL SURGEON', '58,IKBAL DENTAL HOSPITAL', '', 'CHIDAMBARAM', 'Tamil Nadu', '608001', '9791399437', '9791399437', 'JAWAHARDENTIST@GMAIL.com'),
(110, 'ISOI MEMBER', 'DR. DHRUV ARORA', 'Male', 'PROSTHODONTIST', 'DENTAL HEALERS B6 Greater Kailash ENCLAVE 1', '1526', 'NEW DELHI', 'Delhi', '110048', '8800918604', '8800918604', 'drdhruvarora@gmail.com'),
(111, 'NON ISOI MEMBER', 'DR. COL(MS) M HUNDAL', 'Female', 'Senior Specialist; Prosthodontia', 'Armed Forces Dental Clinic, Thyagraja Marg, New Delhi-110011', 'TR-3795', 'New Delhi', 'Delhi', '110011', '1126874442', '9711606954', 'maninderhundal10471@gmail.com'),
(112, 'NON ISOI MEMBER', 'DR. M ANIL GOUD', 'Male', 'Director', 'Asian Dental Academy above KFC restaurant main road Kothapet', '', 'hyderabad', 'Andhra Pradesh', '500035', '24050777', '9989116547', 'drgoudanil@gmail.com'),
(113, 'NON ISOI MEMBER', 'DR. SWATI B. SETTY', 'Female', 'Professor', 'Dept of Periodontics SDM College Of Dental Sciences & Hospital Sattur, Dharwad, Karnataka', '', 'Dharwad', 'Karnataka', '580009', '9845680773', '9845680773', 'drssetty@gmail.com'),
(114, 'STUDENT NON MEMBER', 'DR. KAMESWARI GUDIPATI', 'Female', 'PG student', 'DR Kameswari w/o Dr T Ramakrishna Hno 704 ,5th Lane pandaripuram', '', 'GUNTUR', 'Andhra Pradesh', '522002', '9440913003', '9440913003', 'drgudipati@gmail.com'),
(115, 'NON ISOI MEMBER', 'DR. JAYANT GAYAKI', 'Male', 'DENTIST', 'GAYAKI DENTAL CLINIC,183 OPP KIRTI 1 APPT,NANDANVAN CEMENT ROAD,NAGPUR', '', 'NAGPUR', 'Maharashtra', '440009', '', '9373107705', 'drjayantgayaki@gmail.com'),
(116, 'NON ISOI MEMBER', 'DR. AMIT S. VATHARE', 'Male', 'MDS, PROSTHODONTICS, SENIOR LECTURER,', 'Vathare multispeciality Dental Clinic n Implant centre. 11th lane, above Datta Mandir, Shivaji chowk, Near Bus Stand, Jaysingpur.', '', 'JAYSINGPUR', 'Maharashtra', '416101', '', '9923798056', 'vathare_amit@yahoo.com'),
(117, 'NON ISOI MEMBER', 'DR. DIGVIJAY S DESHPANDE', 'Male', 'MDS. PROSTHODONTICS, SENIOR LECTURER', 'deshpande dental clinic, first floor , mohite plaza , civil garpir road, ganesh nager 3rd lane', '', 'sangli', 'Maharashtra', '416416', '7588866101', '7588866101', 'drdigz1987@gmail.com'),
(118, 'NON ISOI MEMBER', 'DR. JANAK KAPADIA', 'Male', 'Prof & HOD (Perio) Vasantdada Patil Dental College, Sangli', 'Kapadias Multispecialty Dental Care Centre, Opp. IDBI BANK, 679/E ward, 3rd lane, Shahupuri, Kolhapur', '', 'Kolhapur', 'Maharashtra', '416001', '', '9860344655', 'kapadiajanak@yahoo.com'),
(119, 'STUDENT NON MEMBER', 'DR. AJIT NAIR', 'Male', 'PG Student', '21/701 Siddhachal Phase 3, Off. Pokharan road no.2 Thane west', '', 'Thane', 'Maharashtra', '400610', '', '9619021010', 'ajitsnair@gmail.com'),
(120, 'NON ISOI MEMBER', 'DR. V.THUTHIKARAN', 'Male', 'Dental surgeon', 'J.J.Dental Tower CUST Junction Cochin Kerala', '', 'Cochin', 'Kerala', '682033', '94777356261', '9447796026', 'drthuthik2000@yahoo.co.in'),
(121, 'ISOI MEMBER', 'DR. UMMAR MANGALATH', 'Male', 'Professor', 'Mangalath house, Changuvetty, Kottakkal Post,Malappuram Dt. Kerala', '', 'kottakkal', 'Karnataka', '676503', '4832743615', '9847017231', 'drmummar@gmail.com'),
(122, 'STUDENT NON MEMBER', 'DR. JYOTSNA SINGH', 'Female', 'post graduate student', 'bharati vidyapeeth dental college and hospital sector 7 cbd belpada', '', 'navi Mumbai', 'Maharashtra', '400614', '', '9619542204', 'jyotsnasingh127@gmail.com'),
(123, 'ISOI MEMBER', 'DR. KARL A SOUSA', 'Male', 'Dr.', '1st flr., Marchon Bldg., Opp. Lohia Maidan,', '233', 'Margao', 'Goa', '403601', '8322732339', '9822102369', 'drkarlsousa@gmail.com'),
(124, 'NON ISOI MEMBER', 'DR. PRASHANTH G V', 'Male', 'PROFESSOR AND HOD IN PERIODONTICS', 'KAVITHA DENTAL CARE 497 EAST END MAIN ROAD 9TH BLOCK JAYANAGAR', '', 'BENGALURU', 'Karnataka', '560069', '', '9845336270', 'drprashanthgv@rediffmail.com'),
(125, 'STUDENT NON MEMBER', 'DR. NIDHI GUPTA', 'Female', 'JUNIOR RESIDENT', 'ROOM NO- 81,NAGARJUNA GIRLS HOSTEL,B.H.U.,VARANASI', '', 'VARANASI', 'Uttar Pradesh', '221005', '', '7081981998', 'nidhims9@gmail.com'),
(126, 'STUDENT NON MEMBER', 'DR. DEEPIKA VASUDEVAN', 'Female', 'MDS Student', 'd/o Gurudattu reddy, flat number 201,Sai residency, Beside Sai mess,Gunadala,', '', 'Vijayawada', 'Andhra Pradesh', '520008', '', '9573808071', 'drdeepikavasudevan505@gmail.com'),
(127, 'ISOI MEMBER', 'DR. MEENU MAHAJAN', 'Female', 'Dentist', '1338 sector 37', '', 'FARIDABAD', 'Haryana', '121003', '9818870084', '9818870084', 'drmeenu26@rediffmail.com'),
(128, 'STUDENT NON MEMBER', 'DR. PAVAN KUMAR KATHUROJU', 'Male', 'post graduate student', 'plot 200, road no.2, rock town colony, besides reliance petrol bunk lane, l b nagar', '', 'hyderabad', 'Andhra Pradesh', '500068', '', '9848887908', 'pavankathuroju@gmail.com'),
(129, 'STUDENT NON MEMBER', 'DR. APARNA BABU', 'Female', 'post graduate', '105/134, om kalptaru CHS,dixit road, vile paele east,mumbai', '', 'vileparle', 'Maharashtra', '400057', '8291019202', '8291019202', 'babuaparna@gmail.com'),
(130, 'STUDENT NON MEMBER', 'DR. SWATHI SHANKAR', 'Female', 'PG RESIDENT', 'ROOM No: 301, Dept. of PROSTHODONTICS GOVT. DENTAL COLLEGE, THIRUVANANTHAPURAM', '', 'THIRUVANANTHAPURAM', 'Kerala', '695011', '8129415640', '8129415640', 'swathishankar01@gmail.com'),
(131, 'STUDENT NON MEMBER', 'DR. NIDHI NEHA BODRA', 'Female', 'POST GRADUATE STUDENT', 'DEPARTMENT OF ORAL AND MAXILLOFACIAL SURGERY, GOVERNMENT DENTAL COLLEGE AND RESEARCH INSTITUTE BANGALORE.', '', 'BANGALORE', 'Karnataka', '560002', '', '7814212902', 'visit9390nidhi@gmail.com'),
(132, 'STUDENT NON MEMBER', 'DR. HARSHA M', 'Male', 'PG STUDENT', 'NO. 40, DENTAL COLLEGES BOYS HOSTEL', '', 'DAVANGERE', 'Karnataka', '577004', '9986618092', '9986618092', 'harshakiranvardhana@gmail.com'),
(133, 'STUDENT NON MEMBER', 'DR. RANI JAYATHA.P.R', 'Female', 'POST GRADUATE STUDENT', 'mahe institute of dental sciences, chalakara,mahe', '', 'MAHE', 'Puducherry', '673310', '9495604037', '9495604037', 'ranijayatha@gmail.com'),
(134, 'ISOI MEMBER', 'DR. N S MAMATHA', 'Female', 'PROFESSOR', 'RAJARAJESWARI DENTAL COLLEGE AND HOSPITAL', 'AC/L/928/KAR', 'BANGALORE', 'Karnataka', '560060', '', '9880194412', 'drmamathans@gmail.com'),
(135, 'ISOI MEMBER', 'DR. AJAY AJIT PALA', 'Male', 'Doctor', '13 A, Hemdeep bunglaws, behind dollar avenue, near tube company, old padre road, Vadodara, Gujarat', '', 'vadodara', 'Gujarat', '390010', '', '8320771579', 'drajaypala@gmail.com'),
(136, 'NON ISOI MEMBER', 'DR. GOPAL GOEL', 'Male', 'DOCTOR', 'KARSHNI KUTEER A-141, SECOND FLOOR, VIVEK VIHAR-I DELHI', '', 'DELHI', 'Delhi', '110095', '9868235811', '9868235811', 'drgopalgoel@yahoo.com'),
(137, 'STUDENT NON MEMBER', 'DR. ABDUL BASITH MTP', 'Male', 'POST GRADUATE STUDENT', 'MK HOUSE KAIKOTKADAVE PO ELAMBACHI', '', 'PAYYANNUR', 'Kerala', '671311', '4672271183', '9446076406', 'basithmtp@gmail.com'),
(138, 'NON ISOI MEMBER', 'DR. ABHIJEET SHYAM DANDEKAR', 'Male', 'Prosthodontist', 'Ruby Advanced Dental Center, Shop no: 105, Block - A CRYSTAL ARCADE, Rajiv Nagar', '', 'Raipur', 'Chhattisgarh', '492001', '', '9575552162', 'abhijeet2984@gmail.com'),
(139, 'NON ISOI MEMBER', 'DR. FLEMINGSON LAZARUS', 'Male', 'DENTAL SURGEON', 'George dental clinic 6 Stephens road grazer town', '', 'bengaluru', 'Karnataka', '560005', '', '9448512502', 'drflemingson@gmail.com'),
(140, 'NON ISOI MEMBER', 'DR. SAUMYA PANDEY', 'Female', 'Reader', 'Purvanchal Institute of Dental Sciences, Gorakhpur', '', 'Gorakhpur', 'Uttar Pradesh', '273209', '', '8853533059', 'drsaumyapandey@gmail.com'),
(141, 'STUDENT NON MEMBER', 'DR. ZOYA MULLA', 'Female', 'POST GRADUATE', '#50 , opp canara bank ATM , Thomas town post , Hutchins main Road , Cookes town', '', 'BANGALORE', 'Karnataka', '560084', '8951767950', '8951767950', 'zoyamulla@yahoo.com'),
(142, 'NON ISOI MEMBER', 'DR. PRAMOD SHARMA', 'Male', 'Professor', 'A - 390, New Minal Residency, J K Road', '', 'Bhopal', 'Madhya Pradesh', '462023', '', '9826351967', 'pramodmds@yahoo.com'),
(143, 'STUDENT NON MEMBER', 'DR. ABIRAMI V', 'Female', 'POST GRADUATE STUDENT', 'NO 3 SECOND STREET JANCY NAGAR PONDY 4', '', 'PUDUCHERRY', 'Puducherry', '605004', '', '9655805794', 'abivaithy5@gmail.com'),
(144, 'STUDENT NON MEMBER', 'DR. AKHILA S ABOOBACKER', 'Female', 'POST GRADUATE STUDENT', 'PARAMBADAN HOUSE CHANDAKUNNU PO NILAMBUR MALAPURAM KERALA', '', 'NILAMBUR', 'Kerala', '679329', '', '9746529883', 'drakhilaabbobacker@gmail.com'),
(145, 'STUDENT NON MEMBER', 'DR. S R HERENE', 'Female', 'STUDENT NON MEMBER', 'NO 13, VISWAS APARTMENT, 5TH MAIN, 11TH CROSS, MALLESWARAM, BENGALURE', '', 'BENGALURE', 'Karnataka', '560055', '', '9916999445', 'herenerajan@gmail.com'),
(146, 'STUDENT NON MEMBER', 'DR. SWATI SINGH', 'Female', 'PG student', 'Rajarajeswari dental college, kumbalgodu, bangalore, karnataka', '', 'bangalore', 'Karnataka', '560074', '', '8073470631', 'swatisingh@hotmail.co.in'),
(147, 'STUDENT NON MEMBER', 'DR. WRITURAJ SUTRADHAR', 'Male', 'PG STUDENT', 'ROOM NO 1, RAJARAJESWARI DENTAL COLLEGE AND HOSPITAL, BOYS HOSTEL, KUMBALGODU', '', 'BANGALORE', 'Karnataka', '560074', '', '7829821089', 'writuraj.sutradhar@gmail.com'),
(148, 'NON ISOI MEMBER', 'DR. PRATEEK ANAND', 'Male', 'B.D.S', 'HIG 4 MUKUTNAGAR', '', 'Raigarh', 'Chhattisgarh', '496001', '7762220110', '7587195187', 'prateek.anand20@gmail.com'),
(149, 'STUDENT MEMBER', 'DR. K.NONGDAMBA', 'Male', 'POST GRADUATE', 'ADITYA DENTAL COLLEGE , NALWANDI NAKA BEED -431122, MAHARASHTRA,', '', 'BEED', 'Maharashtra', '431122', '9096463625', '9096463625', 'nongdamba5oo@gmail.com'),
(150, 'NON ISOI MEMBER', 'DR. LALITH VIVEKANANDA', 'Male', 'Periodontist and implantologist', 'Pralash Dental and Medical care Chamrajpet', '', 'Bangalore', 'Karnataka', '560018', '', '9945609666', 'drlaliva@gmail.com'),
(151, 'NON ISOI MEMBER', 'DR. ULHAS', 'Male', 'Professor', 'dental clinic', '', 'Bengaluru', 'Karnataka', '560040', '', '9611837113', 'uamasi@yahoo.com'),
(152, 'STUDENT MEMBER', 'DR. V DINAKAR BABU', 'Male', 'Dental Surgeon', '256, 1st cross, 2nd block, B.S.K. 3rd stage', '', 'Bangalore', 'Karnataka', '560085', '', '9740844114', 'dinakarbabu@yahoo.com'),
(153, 'NON ISOI MEMBER', 'DR. IRSHAD CHAUDHARY', 'Male', 'Doctor', 'Pimple saudagar pune', '', 'Pune', 'Maharashtra', '411027', '', '8956115799', 'drirshadchaudhary@ymail.com'),
(154, 'NON ISOI MEMBER', 'DR. NEHA MOTI MILANI', 'Male', 'DR', 'D-102, Runwal Regency, Opp. Sadhu VAswani Mission', '', 'Pune', 'Maharashtra', '411001', '2026111088', '9890077776', 'milanineha@gmail.com'),
(155, 'STUDENT MEMBER', 'DR. MULIMANI BAPUGOUDA', 'Male', 'MDS STUDENT', 'GOVT. DENTAL COLLEGE & RESEARCH INSTITUTE, FORT', '', 'BANGALORE', 'Karnataka', '560002', '8026705053', '8217648788', 'drmbapugouda@gmail.com'),
(156, 'NON ISOI MEMBER', 'DR. VILAS PADMAKAR NEWASKAR', 'Male', 'Professor', '401 aura 2 grande exotica Bicholi mardanaindote', '', 'indore', 'Madhya Pradesh', '452016', '9827028864', '9827028864', 'vilasnewaskar@yahoo.com'),
(157, 'ISOI MEMBER', 'DR. SHIVANAND ASPALLI', 'Male', 'Head of the Department,', 'Department of Periodontology & oral Implantology, A.M.E S Dental College & Hospital', 'Ac/L/988/KAR', 'RAICHUR', 'Karnataka', '584103', '', '9886000809', 'drsaspalli@gmail.com'),
(158, 'NON ISOI MEMBER', 'DR. SPHOORTHI ANUP BELLUDI', 'Female', 'Professor', 'I - 804 Brigade Gateway Apartments, Railway Parallel Road, Malleswaram', '', 'Bangalore', 'Karnataka', '560055', '', '9916010380', 'doc_sphoo@yahoo.com'),
(159, 'ISOI MEMBER', 'DR. HEMANG ZALA', 'Male', 'DENTAL SURGEON', '208-9sajanad palace Opp Rahul Tower satellite', '', 'Ahmedabad', 'Gujarat', '380015', '9426322303', '9426322303', 'hemang.zala@dentalgujarat.com'),
(160, 'STUDENT NON MEMBER', 'DR. SOORAJ NAYAK', 'Male', 'student non member', 'pg student,OMFS,GDCRI,bangalore', '', 'bangalore', 'Karnataka', '560002', '', '9448754287', 'soorajnayak28@gmail.com'),
(161, 'ISOI MEMBER', 'DR. GOVARDHANA RAO T D', 'Male', 'MDS', '33-25-36 pushpa hotel road kasturibaipet', '', 'VIJAYAWADA', 'Andhra Pradesh', '520010', '', '9440174181', 'drgovardhanrao@gmail.com'),
(162, 'NON ISOI MEMBER', 'DR. SAMEER KARA', 'Male', 'CONSULATANT', '11,HANUMANTAPPA LAYOUT, ULSOOR ROAD', '', 'BANGALORE', 'Karnataka', '560042', '9845258049', '9845258049', 'karasameer@gmail.com'),
(163, 'ISOI MEMBER', 'DR. TARIK PATEL', 'Male', 'DOCTOR', 'B 15 NAVRATNA APP. NEAR BARODA EXPRESS WAY, CTM CROSS ROAD,AHMEDABAD 380026', 'Ac/L/1773/GUJ', 'Ahmedabad', 'Gujarat', '380026', '', '8130522296', 'drtarikpatel@gmail.com'),
(164, 'NON ISOI MEMBER', 'DR. R.SATHISH', 'Male', 'Professor', 'No 27 ,Ashraya nilaya,4thmain,paramahamsa road,yadavagiri,mysore', '', 'Mysore', 'Karnataka', '570020', '', '9845310737', 'drsathish75@gmail.com'),
(165, 'STUDENT NON MEMBER', 'DR. DEEPANNWITA', 'Female', 'MDS 3RD YEAR', 'NO. 50, HUTCHINS MAIN ROAD, OPPOSITE REVIVAL CENTRE CHURCH, ST THOMAS TOWN', '', 'BANGALORE', 'Karnataka', '560084', '', '9589784700', 'deepanwita.mishraa@gmail.com'),
(166, 'STUDENT NON MEMBER', 'DR. FAIZA FATHIMA', 'Female', 'post graduate in periodontics', 'sri ram nivas,#660,16th cross,phillana garden 3rd stage', '', 'banaglore', 'Karnataka', '560084', '8792424284', '8073939535', '5zaajbj@gmail.com'),
(167, 'STUDENT NON MEMBER', 'DR. NIKHILA CHANDRAMOHAN', 'Female', 'Post graduate student', 'Hno 302, Aishwarya Apartments,4th block Koramangala', '', 'Bangalore', 'Karnataka', '560034', '', '9538579669', 'niki_cm91@hotmail.com'),
(168, 'STUDENT NON MEMBER', 'DR. SWETHA A', 'Female', 'POST GRADUATE', '#44, 1st floor Yamuna resdiency, 3rd cross vasanthnagar', '', 'BANGALORE', 'Karnataka', '560052', '', '9886319803', 'gabs_0202@yahoo.com'),
(169, 'STUDENT NON MEMBER', 'DR. SUMEET KAUR', 'Female', 'Post graduate student', 'Hno 302, Aishwarya Apartments -1,4th block Koramangala', '', 'Bangalore', 'Karnataka', '560034', '', '8553677514', 'sum8778@gmail.com'),
(170, 'ISOI MEMBER', 'DR. SANTOSH SHINGOTE', 'Male', 'Prof.', 'Dept. Of prosthodontics, Vasantdada Patil dental college Sangli Maharashtra', '', 'Sangli', 'Maharashtra', '416416', '', '9822546092', 'drsds78@yahoo.com'),
(171, 'NON ISOI MEMBER', 'DR. SHEETAL SAKLECHA', 'Female', 'prosthodontist', 'Santosh dental care, Santosh Hospital, 6/1,promenade road, Fraser town,Near coles park', '', 'Bangalore', 'Karnataka', '560005', '8040848899', '9945620630', 'santoshdentalcare@gmail.com'),
(172, 'NON ISOI MEMBER', 'DR. ATUL KULKARNI', 'Male', 'Professor', 'Shree Laxmi Dental, sonar Bawdi, Minaxi Circle', '', 'Vijayapur', 'Karnataka', '586101', '', '9342244676', 'atulkulki@hotmail.com'),
(173, 'NON ISOI MEMBER', 'DR. DEEP PANDYA', 'Male', 'BDS', 'DENTAL WORLD. 101/ RUSHABHRAJ AVENUE, NEAR BHADUATNAGAR BUSSTAND, ISANPUR ROAD, MANINAGAR', '', 'AHMEDABAD', 'Gujarat', '380008', '9909927737', '9909927737', 'deep5020@gmail.com'),
(174, 'NON ISOI MEMBER', 'DR. SAHITH KUMAR SHETTY', 'Male', 'Associate professor', 'Flat G2, Brigade Elite 2,KRS Main Road,V V Mohalla', '', 'Mysore', 'Karnataka', '570002', '9880246572', '9880246572', 'sahithkumarshetty@yahoo.co.in'),
(175, 'STUDENT NON MEMBER', 'DR. YASAR SIRAJ PATEL', 'Male', 'Post Graduate OMFS', 'G-1, Gulistan A Apartment. Nr. Cambay Classes, Shahpur Turkiwad Surat', '', 'Surat', 'Gujarat', '395003', '', '9426136281', 'patelyasar@hotmail.com'),
(176, 'STUDENT MEMBER', 'DR. TANYA SETHI', 'Female', 'Student', 'NRI GIRLS HOSTEL JNMC Campus Nehru Nagar', 'TS16404', 'Belgaum', 'Karnataka', '590010', '', '8880422603', 'tanyasethi03@yahoo.com'),
(177, 'NON ISOI MEMBER', 'DR. NEHAL PRAJAPATI', 'Male', 'BDS', 'Maruti Dental Clinic ,KrishnaMall, Station Road beside Vijaya Bank.', '', 'Bardoli', 'Gujarat', '394601', '', '9825122286', 'nehalprajapati15@yahoo.com'),
(178, 'NON ISOI MEMBER', 'DR. ANUDEEP KUKREJA', 'Male', 'BDS', '101/102, Sai Complex,Alankar Theater , behind Suraj medical', '', 'Bardoli', 'Gujarat', '394601', '2622228382', '9586881865', 'anudeeparora@gmail.com'),
(179, 'NON ISOI MEMBER', 'DR. MANJUNATH N M', 'Male', 'ASSOCIATE PROFESSOR', 'NO 001, ANUGRAHA ENCLAVE, MUNISHWARA TEMPLE STREET, KARIYANAPALYA, BANGALORE', '', 'Bangalore', 'Karnataka', '560084', '', '9845776625', 'drmanjunath_7766@yahoo.com'),
(180, 'NON ISOI MEMBER', 'DR. NOOPUR PANDIT', 'Female', 'BDS', 'A-12 Nitinagar Row House, b/h Sai Ashish Soc. , Althan Canal Road.', '', 'Surat', 'Gujarat', '395017', '2612263300', '9427660781', 'noopurpandit@yahoo.com'),
(181, 'NON ISOI MEMBER', 'DR. RAMAKANT DANDRIYAL', 'Male', 'professor', '116,ashish royal park', '', 'bareilly', 'Uttar Pradesh', '243006', '', '9319774176', 'drramakant03@gmail.com'),
(182, 'ISOI MEMBER', 'DR. DEEPAK ASHOK AGRAWAL', 'Male', 'ASSOCIATE PROFESSOR', '64/A, PATEL NAGAR , SAPNA SANGEETA ROAD, IN FRONT OF VIKRAM TOWER, INDORE', 'yes', 'INDORE', 'Madhya Pradesh', '452001', '7312462225', '9826475025', 'fordeepak1@yahoo.co.in'),
(183, 'ISOI MEMBER', 'DR. PFUKROLO KOZA', 'Male', 'Periodontist', 'Advanced Dental Aesthetic & Implant Clinic SOZO Complex, 2nd floor , ICICI Bank Mohonkhola', 'Ac/L/1472/NAGALAND', 'KOHIMA', 'Nagaland', '797001', '', '9856589499', 'drkozakodf@gmail.com'),
(184, 'STUDENT NON MEMBER', 'DR. PIYUSH VATSA', 'Male', 'Post Graduate', 'Room no 2, dept of OMFS, GDCRI , Fort', '', 'Bangalore', 'Karnataka', '560002', '9916257129', '9108283570', 'ROHAN05DELHI@GMAIL.com'),
(185, 'ISOI MEMBER', 'DR. AKANKSHA ZAMAD', 'Female', 'MDS (PROSTHODONTIST)', 'ZAMAD CLINICS 565, TIKEKAR ROAD, DHANTOLI', '', 'NAGPUR', 'Maharashtra', '440012', '', '9561166561', 'drmohitzamad@gmail.com'),
(186, 'ISOI MEMBER', 'DR. KANDARPA S SRINIVAS', 'Male', 'Managing Director, Srinivas Complete Dental Care', 'Srinivas complete dental care, #55-8-34/15, Opp. Alluri Sitaramaraju Statue, Seethammadhara Jn. VISAKHAPATNAM-530013', '#Ac/L/969/AP', 'VISAKHAPATNAM', 'Andhra Pradesh', '530013', '8912708600', '9393100882', 'drkssrinivas@gmail.com'),
(187, 'STUDENT NON MEMBER', 'DR. BILAAL SIDHIQUE ABUBACKER', 'Male', 'POST GRADUATE STUDENT', 'FARKAS 21/774,G S AYYANKAR ROAD,P O KALLAI, KERALA', '', 'CALICUT', 'Kerala', '673003', '', '9446020737', 'bilaal2191@gmail.com'),
(188, 'STUDENT NON MEMBER', 'DR. JAYSA.J.J.', 'Female', 'POSTGRADUATE STUDENT', 'AZEEZIA COLLEGE OF DENTAL SCIENCE AND RESEARCH MEEYANNOOR P.O KOLLAM', '', 'KOLLAM', 'Kerala', '691357', '9446530591', '9446530591', 'jaysajayakumar@gmail.com'),
(189, 'NON ISOI MEMBER', 'DR. IRENE CHRYSTAL SHASHIKANT', 'Female', 'BDS, PGFI', 'Flat No.905, A2 Block, Genesis Ecosphere Apartment, Neeladri Road, Electronic City Phase I,', '', 'Bangalore', 'Karnataka', '560100', '', '9538096286', 'irenekristal@gmail.com'),
(190, 'NON ISOI MEMBER', 'DR. DHANYA BALAKRISHNA', 'Female', 'MDS - Oral and Maxillofacial surgery', 'No. 88, SOS Post office, Ramanashree nagar, Kammanahalli road, Bannerghatta Road', '', 'Bengaluru', 'Karnataka', '560076', '', '9945896778', 'dbdhanya27@gmail.com'),
(191, 'NON ISOI MEMBER', 'DR. KARTHIKEYAN S', 'Male', 'bds, certification in implantology', 'vignesh dental care no 108, st.johns road, sivan chetty gardens, near lavanya theatre', '', 'bangalore', 'Karnataka', '560042', '', '9741491955', 'dr.karthikeyan_sun@yahoo.in'),
(192, 'STUDENT NON MEMBER', 'DR. ABHINAV ANIL KUMAR', 'Male', 'PG STUDENT', 'M.R.AMBEDKAR DENTAL COLLEGE, COOK TOWN,', '', 'BANGALORE', 'Karnataka', '560005', '', '9600239905', 'abhinav25392@gmail.com'),
(193, 'STUDENT MEMBER', 'DR. BAPUGOUDA MULIMANI', 'Male', 'STUDENT', 'GOVERNMENT DENTAL COLLEGE', '', 'BANGALORE', 'Karnataka', '560002', '9449854011', '9449854011', 'drmbapugoud@gmail.com'),
(194, 'ISOI MEMBER', 'DR. SANJAY MOHANCHANDRA', 'Male', 'DR', 'ASHIRWAD DENTAL CLINIC NO 680 17TH CROSS 26TH MAIN JP NAGAR 6TH PHASE NEAR NANDINI HOTEL', '', 'BANGALORE', 'Karnataka', '560078', '8026638291', '9845037921', 'sanjmohan@gmail.com'),
(195, 'NON ISOI MEMBER', 'DR. MANJULA S', 'Female', 'Reader', '#3F, Pinewodpark Apartment, Ambedkar Road, Near RTO office, chamarajapuram', '', 'Mysore', 'Karnataka', '570005', '', '9980163331', 'manjulamaxfax@gmail.com'),
(196, 'NON ISOI MEMBER', 'DR. SUNIL KUMAR R', 'Male', 'PROSTHODONTIST', 'souparnika(h),chevarambalam(po),', '', 'calicut', 'Kerala', '673017', '9447339852', '9447339852', 'drsunilkumarr@gmail.com'),
(197, 'NON ISOI MEMBER', 'DR. SHUBHA C N', 'Female', 'Certified Implantologist', 'Pralash Dental and Medical care Sirsi Road Chamarajpet', '', 'Bangalore', 'Karnataka', '560018', '8026706363', '9900517699', 'subbilali@gmail.com'),
(198, 'NON ISOI MEMBER', 'DR. RIMSHA AHMED', 'Female', 'Prostodontist', '159/4 Upper Roop Nagar, JDA housing Colony', '', 'Jammu', 'Jammu and Kashmir', '180013', '1912593574', '9419195786', 'rimzahmed1989@gmail.com'),
(199, 'NON ISOI MEMBER', 'DR. CHANDRASEKARAN MURUGAVEL', 'Male', 'M.D.S', 'No.33, arcot road, valasaravakkam , chennai-600087', '', 'CHENNAI', 'Tamil Nadu', '600087', '', '9841469495', 'dr_mrgvl@yahoo.co.in'),
(200, 'ISOI MEMBER', 'DR. J RAGHUNAND SINDHE', 'Male', 'Post Graduate Student', 'No. 17/1, 1st Cross, R.R.M.R. Extension, K.H. Road Cross', 'Ac/L/1123/KAR', 'Bangalore', 'Karnataka', '560027', '8022234705', '9886155151', 'raghujs1@yahoo.co.in'),
(201, 'NON ISOI MEMBER', 'DR. SNEHA DANI', 'Female', 'Assistant Professor', '1151, 18th C Main, 5 th Block, Rajajinagar', '', 'Bangalore', 'Karnataka', '560010', '8023382474', '9886303543', 'drsnehadani@gmail.com'),
(202, 'NON ISOI MEMBER', 'DR. MANJUNATH P N', 'Male', 'Implantologist', 'Balaji Dental Clinic, SHK Complex, Siddapura, Vartur Mn Rd, Whitefield post', '', 'Bangalore', 'Karnataka', '560066', '9342962359', '9342962359', 'manjubdc9@gmail.com'),
(203, 'STUDENT MEMBER', 'DR. RANJEET GHADAGE', 'Male', 'PG student', 'Trimurti niwas, yashwant nagar, lengre road, Vita', '', 'sangli', 'Maharashtra', '415311', '', '9404887956', 'ranjeet.ghadage11@gmail.com'),
(204, 'STUDENT MEMBER', 'DR. ANJALI MENDHE', 'Female', 'PG student', 'A-603, Sawlaram-Shrushti, New RTO road, Kalyan (W)', '', 'Kalyan', 'Maharashtra', '421301', '', '7972956065', 'anjali.mendhe@hotmail.com'),
(205, 'STUDENT MEMBER', 'DR. AMER BADAM', 'Male', 'PG student', 'House no. 4/11/43/P , Azam colony, Roshan gate,', '', 'Aurangabad', 'Maharashtra', '431001', '', '9975099235', 'aamerbadaam@gmail.com'),
(206, 'ISOI MEMBER', 'DR. PRAKASH.H.P', 'Male', 'Dental Surgeon', '#181 Gauri , 13TH MAIN 7TH CROSS HSR LAYOUT,5TH SECTOR', '', 'BANGALORE', 'Karnataka', '560102', '25631120', '9845242043', 'DENTISTPRAKASH@GMAIL.com'),
(207, 'STUDENT MEMBER', 'DR. NAKUL WARE', 'Male', 'PG student', '1359 yashwant nagar, Lengare Road, Vita Tal. Khanapur. Dist. sangli 415311', '', 'Vita/Khanapur', 'Maharashtra', '415311', '', '9420397527', 'drwarenakul@gmail.com'),
(208, 'STUDENT MEMBER', 'DR. ROHAN RANVEER', 'Male', 'PG student', '14,Vasundhara colony, In nandanwan colony, Bhavsingpura road', '', 'Aurangabad', 'Maharashtra', '431002', '', '9970418588', 'rohanranveer1@gmail.com'),
(209, 'STUDENT MEMBER', 'DR. SWATI TIWADI', 'Female', 'PG student', '195/9A shri hari apts, samrat chowk, opposite to chidgupkar hospital, solapur', '', 'solapur', 'Maharashtra', '413002', '2172742633', '9890727903', 'swati.tiwadi@gmail.com'),
(210, 'NON ISOI MEMBER', 'DR. SHRUTHI.G', 'Female', 'BDS, PGFI', '#24, 2nd Main Road, Nanjappa Layout, Adugodi', '', 'Bangalore', 'Karnataka', '560030', '22219452', '9845779864', 'shrugs11@gmail.com'),
(211, 'ISOI MEMBER', 'DR. UTTAM CHAND KHINCHA', 'Male', 'Periodontist', 'Khincha dental clinic', '', 'bangalore', 'Karnataka', '560023', '', '9845017040', 'drkhincha@gmail.com'),
(212, 'ISOI MEMBER', 'DR. RAMESH AV', 'Male', 'Professor', 'dental health clinic bull temple road', '', 'bangalore', 'Karnataka', '560018', '', '9880097108', 'rameshalampalli@yahoo.co.in'),
(213, 'STUDENT NON MEMBER', 'DR. NETHRAVATHI P', 'Female', 'BDS, PGFI', 'Mugulnage, no -178 Shirke. Kengeri satellite town', '', 'Bangalore', 'Karnataka', '560060', '9886196482', '9886196482', 'tanavinod916@gmail.com'),
(214, 'NON ISOI MEMBER', 'DR. JOANN PAULINE GEORGE', 'Female', 'Professor', 'flat no 1 berachah apartments no-6, Stephens road', '', 'bangalore', 'Karnataka', '560005', '', '9448541637', 'dr.joannpaulinegeorge@gmail.com'),
(215, 'NON ISOI MEMBER', 'DR. NIKHILA GHOLAP', 'Female', 'B.D.S.', '767/5 , KOTWAL COMPLEX , BHANDARKAR ROAD , ABOVE HOTEL PANCHAVATI GAURAV', '', 'PUNE', 'Maharashtra', '411004', '2025659586', '9890900721', 'nikhila.gholap@gmail.com'),
(216, 'ISOI MEMBER', 'DR. AMIT GUPTA', 'Male', 'Consultant', '75, Jai Jawan colony 3rd near Jaipuriya Hospital opposite world trade park jaipur', 'RAJ 1777', 'Jaipur', 'Rajasthan', '302018', '1412722122', '9460192111', 'guptaamit4@yahoo.com'),
(217, 'STUDENT NON MEMBER', 'DR. JOSHY P ABRAHAM', 'Male', 'POSTGRADUATE STUDENT', 'AZEEZIA COLLEGE OF DENTAL SCIENCES AND RESEARCH, MEEYYANNOOR, DIAMOND HILLS', '', 'kollam', 'Kerala', '691357', '4792441553', '9495661553', 'joshkylm@gmail.com'),
(218, 'NON ISOI MEMBER', 'DR. GAURAV GUPTA', 'Male', 'Assistant Professor', '10/15, Vidhyadhar Nagar', '', 'Jaipur', 'Rajasthan', '302023', '1412232111', '9829560606', 'dr.gauravgupta99@gmail.com'),
(219, 'NON ISOI MEMBER', 'DR. RAJESH NAWAL', 'Male', 'Assitant Professor,MDS ( Periodontololgy & Implantology)', '163 , vivek vihar , opp. dainik bhasker office , j l n road', '', 'jaipur', 'Rajasthan', '302015', '1412616968', '7738389814', 'drnawal86@gmail.com');
INSERT INTO `isoi_delegates` (`delegate_id`, `member_type`, `name`, `gender`, `designation`, `Address`, `member_no`, `city`, `state`, `pincode`, `telephone`, `mobile`, `email`) VALUES
(220, 'STUDENT NON MEMBER', 'DR. SONY SEBASTIAN', 'Male', 'PG STUDENT', 'SONY BHAVAN ANCHAL P.O KOLLAM DISTRICT', '', 'KOLLAM', 'Kerala', '691306', '', '9447989419', 'sony5445@gmail.com'),
(221, 'NON ISOI MEMBER', 'DR. RAGHUNANDANA KARANTHA', 'Male', 'BDS', 'SANJEEVINI DENTAL CLINIC, NO 4 80FT ROAD, NEAR CHANDRALAYOUT WATER TANK, CHANDRALAYOUT', '', 'BANGALORE', 'Karnataka', '560040', '', '9449444544', 'rkarantha7@gmail.com'),
(222, 'STUDENT NON MEMBER', 'DR. SINDHU SUDHAKAR K', 'Female', 'MDS', '#P2-904, SNN Raj Serenity, Begur Main Road, Off Bannerghatta Road.', '', 'Bangalore', 'Karnataka', '560068', '8042214763', '8971511882', 'sindhuami@gmail.com'),
(223, 'NON ISOI MEMBER', 'DR. ASHWIN M PANGI', 'Male', 'Reader', 'Belgaum', '', 'Belagavi', 'Karnataka', '590010', '9739463381', '9739463381', 'ashwinm_pangi@rediffmail.com'),
(224, 'NON ISOI MEMBER', 'DR. SANJAY PRASAD', 'Male', 'Associate Professor', 'Ruchira Residency 369 Purbachal Kalitala Road Tower 5 10/6 Kolkata', '', 'Kolkata', 'West Bengal', '700078', '9434137806', '9434137806', 'drsanjay1@gmail.com'),
(225, 'ISOI MEMBER', 'DR. VILAS S. PAWAR', 'Male', 'DENTIST', 'Dental Section, Tata Institute of Fundamental Research, Dr.Homi Bhabha Road, Colaba', 'AC/L/620/Mah', 'Mumbai', 'Maharashtra', '400005', '2222782623', '9869271133', 'vsp@tifr.res.in'),
(226, 'NON ISOI MEMBER', 'DR. MAJ ANKUR THAKRAL', 'Male', 'Oral & Maxillofacial Surgeon', 'Corps Dental Unit P-8 Khulna Marg Sultania Infantry Lines Bhopal Military Station', '', 'Bhopal', 'Madhya Pradesh', '462001', '', '9425139696', 'ankur_thakral2000@yahoo.com'),
(227, 'NON ISOI MEMBER', 'DR. ABUBAKKAR MOHAMMAD KINCHANAKODI', 'Male', 'PROSTHODONTIST', 'RETREAT 902,OPPOSITE MATHIAS PARK , ATTAWAR', '', 'MANGALORE', 'Karnataka', '575001', '', '8762462953', 'drabuvasthare@gmail.com'),
(228, 'STUDENT NON MEMBER', 'DR. AMRUTA HIREMATH', 'Female', 'post graduate student', 'Sarwamangala plot no 62 patil layout lingaraj nagar north ,Hubli', '', 'Hubli', 'Karnataka', '580031', '', '9845584195', 'amrutahiremath05@gmail.com'),
(229, 'NON ISOI MEMBER', 'DR. RAMASHANKER', 'Male', 'ASSOCIATE PROFESSORE', 'A-11 shankerpuri,kamta, chinhat, lucknow.uttar pradesh, india', '', 'lucknow', 'Uttar Pradesh', '226028', '', '9450361106', 'ramashanker09@rediffmail.com'),
(230, 'NON ISOI MEMBER', 'DR. MOHAMMED HASAN SARFARAZ', 'Male', 'PROFESSOR', 'DEPARTMENT OF ORAL IMPLANTOLOGY, YENEPOYA DENTAL COLLEGE , YENEPOYA UNIVERSITY, DERLAKATTE', '', 'MANGALORE', 'Karnataka', '575018', '', '9845083778', 'drhsarfaraz@gmail.com'),
(231, 'STUDENT NON MEMBER', 'DR. VARSHA P BHAT', 'Female', 'POST GRADUATE STUDENT', '414, C Block, Gardyenia hostel, Yenepoya University, Deralakatte', '', 'MANGALORE', 'Karnataka', '575018', '', '8123568932', 'varshapbhat3@gmail.com'),
(232, 'STUDENT NON MEMBER', 'DR. ARUNJITH G', 'Male', 'POST GRADUATE STUDENT', 'ROOM NO. 515 , GARDENIA BOYS HOSTEL , YENEPOYA DENTAL COLLEGE , YENEPOYA UNIVERSITY ROAD, DERLAKAATE', '', 'MANGALORE', 'Karnataka', '575018', '', '7892075628', 'garunjith@yahoo.in'),
(233, 'STUDENT NON MEMBER', 'DR. SUBIN JOB', 'Male', 'POST GRADUATE STUDENT', 'ROOM NO 515,A BLOCK, GARDENIA BOYS HOSTEL, YENEPOYA DENTAL COLLEGE, YENEPOYA UNIVERSITY ROAD, DERLAKATTE', '', 'MANGALORE', 'Karnataka', '575018', '', '9994615170', 'subinjob88@gmail.com'),
(234, 'STUDENT NON MEMBER', 'DR. MOHAMMED RASHEED N', 'Male', 'POST GRADUATE STUDENT', 'NADAKKAVIL HOUSE CALICUT ROAD, JUBILEE JN PERINTHALMANNA PO MALAPPURAM DIST', '', 'PERINTHALMANNA', 'Kerala', '679322', '', '8075607950', 'mohdrasheed4u@gmail.com'),
(235, 'STUDENT NON MEMBER', 'DR. SHIFA', 'Female', 'POST GRADUATE STUDENT', 'Room no 314 Gardyenia ladies hostel yenepoya dental college,yenepoya university road, derlakatte.', '', 'MANGALORE', 'Karnataka', '575018', '', '9880842056', 'shifamadani@gmail.com'),
(236, 'NON ISOI MEMBER', 'DR. SUJEETH KUMAR SHETTY', 'Male', 'professor,', 'Dept of OMFS JSS Dental college SS Nagar Mysore', '', 'mysore', 'Karnataka', '570015', '', '9741517281', 'shettymaxfax@gmail.com'),
(237, 'STUDENT NON MEMBER', 'DR. SHASHIN .K ACHARYA', 'Male', 'POST GRADUATE STUDENT', 'ROOM NO:311, A BLOCK, GARDENIA PG HOSTEL, YENEPOYA DENTAL COLLEGE,YENEPOYA UNIVERSITY ROAD,DERLAKATTE.', '', 'MANGALORE', 'Karnataka', '575018', '', '7387199001', 'shashinacharya@gmail.com'),
(238, 'STUDENT NON MEMBER', 'DR. TARIQUE AHMED', 'Male', 'Post Graduate dental student', '#44/15, 1st Floor, 4th Cross, 8th Main, Papaiah Garden, Banashankari 3rd Stage', '', 'Bangalore', 'Karnataka', '560085', '8095340110', '8095340110', 'taricue@gmail.com'),
(239, 'ISOI MEMBER', 'DR. ABHISHEK GOYAL', 'Male', 'IMPLANTOLOGIST', '147 SHARDA NIKETAN PITAM PURA DELHI 110034', 'Ac/L/1308/DEL', 'DELHI', 'Delhi', '110034', '1127023416', '9582476007', 'goyal.bds@gmail.com'),
(240, 'STUDENT NON MEMBER', 'DR. S SREELEKSHMI', 'Female', 'MDS Proshodontics', '3rd year Prosthodontics and Implantology Azzezia Dental College Meeyannor, Kollam - 691537 Kerala', '', 'Kollam', 'Kerala', '691537', '8547627281', '7994551874', 'lekshmissree90@gmail.com'),
(241, 'NON ISOI MEMBER', 'DR. GIRISH GIRADDI', 'Male', 'PROFESSOR AND HEAD', 'DEPAT OF ORAL AND MAXILLOFACIAL SURGERY GOVT DENTAL COLLEGE AND HOSPITAL', '', 'BENGALURU', 'Karnataka', '560021', '', '9481709819', 'DRGIRISH@GMAIL.com'),
(242, 'ISOI MEMBER', 'DR. N.SUDHEER', 'Male', 'PROFESSOR', '1-8-155/2, SRILEKHA, PRENDERGHAST ROAD, OPP. ARYA VYSYA BHAVAN', '', 'SECUNDERABAD', 'Andhra Pradesh', '500003', '4027845633', '9885229118', 'dr_sudheer_aiims@yahoo.com'),
(243, 'STUDENT NON MEMBER', 'DR. SAGAR J', 'Male', 'postgraduate student', 'sdm college of dental sciences , sattur dharwad.', '', 'dharwad', 'Karnataka', '580009', '', '9986739387', 'sagar77j@gmail.com'),
(244, 'ISOI MEMBER', 'DR. UTKARSHA LOKESH', 'Male', 'maxillo facial surgeon prof n head', '298,between 1th and 17th cross, sampige road, malleswaram', '', 'bangalore', 'Karnataka', '560003', '8023312323', '9845108895', 'uthkarshdr@gmail.com'),
(245, 'ISOI MEMBER', 'DR. SURESH SATHIASEKAR', 'Male', 'PROFESSOR', 'Dental and Orthodontic Care,Police Station Road,Meenakshipuram', 'L 1410', 'nagercoil', 'Tamil Nadu', '629001', '9842135944', '9842135944', 'sureshsathiasekar@gmail.com'),
(246, 'NON ISOI MEMBER', 'DR. SHAHUL HAMEED', 'Male', 'assistant professor', 'VYDEHI INSTITUTE OF DENTAL SCIENCES', '', 'BANGALORE', 'Karnataka', '560066', '', '8884645500', 'drshahulimplantologist@gmail.com'),
(247, 'NON ISOI MEMBER', 'DR. RASHMI PARAMASHIVAIAH', 'Female', 'Reader', '#307,6th C Cross,#rd Main Road,Banaswadi,', '', 'Bangalore', 'Karnataka', '560043', '', '9900925844', 'rashmidhatri2013@gmail.com'),
(248, 'ISOI MEMBER', 'DR. PRANAB KUMAR ROY', 'Male', 'DENTAL SURGEON', 'PANCHSEEL VATIKA FLAT NO 4E Block 2 BH /25 MB Road birati kolkata', 'Ac/L/1112/WB', 'KOLKATA', 'West Bengal', '700051', '3325137711', '9830149218', 'proy87407@gmail.com'),
(249, 'STUDENT NON MEMBER', 'DR. LOKESH KUMAR', 'Male', 'Post graduate', 'AME s Dental College and Hospital Bijangere Road Near Polytechnic College', '', 'Raichur', 'Karnataka', '584103', '', '7996344025', 'drlokeshkumar20@gmail.com'),
(250, 'STUDENT NON MEMBER', 'DR. ANUPAMA N', 'Female', 'PG STUDENT', 'H.No:3-7-36, BEROON QUILLA, FORT AREA, RAICHUR.', '', 'RAICHUR', 'Karnataka', '584101', '', '9663196246', 'anupamanambidi@gmail.com'),
(251, 'STUDENT NON MEMBER', 'DR. AAYESHA RAZZAQUE', 'Female', 'post graduate student', 'A.M.Es Dental college, near govt polytechnic college, bijangere road', '', 'raichur', 'Karnataka', '584103', '', '9611395298', 'aayesharazzaque@gmail.com'),
(252, 'STUDENT NON MEMBER', 'DR. SANGAMMA K TIPPASHETTY', 'Female', 'PG Student', 'AME S Dental college, raichur', '', 'raichur', 'Karnataka', '584103', '', '9739084975', 'sanguk2008@gmail.com'),
(253, 'ISOI MEMBER', 'DR. DIVYA PATEL', 'Female', 'DENTIST', 'NR NAYA PADKAR LANE STATION ROAD ANAND', '642 GUJ AC', 'ANAND', 'Gujarat', '388001', '9727757607', '9825156737', 'dentistdivyapatel@gmail.com'),
(254, 'ISOI MEMBER', 'DR. DAKSHA PATEL', 'Female', 'DENTIST', 'NAVRANG HOSPITAL VIP ROAD ,KARELIBAGH, NR HDFC BANK ,VADODARA', '643 GUJ 0265', 'VADODARA', 'Gujarat', '390022', '9825017607', '9727757607', 'pdrdaksha@yahoo.com'),
(255, 'STUDENT MEMBER', 'DR. SAI SWETHAA', 'Female', 'Post graduate student', 'AME dental college Bijangere road Near govt polytechnic', '', 'Raichur', 'Karnataka', '584103', '7996344026', '7996344026', 'drsaiswethaa@gmail.com'),
(256, 'STUDENT MEMBER', 'DR. YAVANEETHA REDDY', 'Female', 'POST GRADUATE', 'POST GRADUATE, DEPT OF PROSTHODONTICS, AMES DENTAL COLLEGE, RAICHUR', '', 'RAICHUR', 'Karnataka', '584101', '7899966929', '7899966929', 'yavaneethareddy@gmail.com'),
(257, 'ISOI MEMBER', 'DR. SHALEEN KHETARPAL', 'Male', 'MDS ( PERIODONTICS)', 'SMILE MAKERS DENTAL CLINIC, BG 202, SCHEME 74 C, VIJAY NAGAR, INDORE(M.P)', 'MP/1299', 'INDORE', 'Madhya Pradesh', '452010', '', '9827529603', 'drshaleenk@gmail.com'),
(258, 'NON ISOI MEMBER', 'DR. NEETHUSREE', 'Female', 'POST GRADUATE STUDENT', 'SDM College of dental science & hospital sattur, Dharwad, Karnataka', '', 'dharwad', 'Karnataka', '580009', '', '8281511443', 'neethune2u@gmail.com'),
(259, 'STUDENT NON MEMBER', 'DR. JASBINDER KUMAR', 'Male', 'post graduate student', 'M R Ambedkar dental college and hospital No.1/36,Cooke Town, Bangalore', '', 'Bangalore', 'Karnataka', '560005', '', '8146680917', 'drjassi0226@gmail.com'),
(260, 'STUDENT NON MEMBER', 'DR. JASBINDER KUMAR', 'Male', 'MDS STUDENT', 'M R AMBEDKAR DENTAL COLLEGE AND HOSPITAL NO 1/36, COOKE TOWN, BANGALORE 560005', '', 'BANGALORE', 'Karnataka', '560005', '', '9113234427', 'drjassi0226@gmail.com'),
(261, 'STUDENT NON MEMBER', 'DR. PRATIMA GAONKAR', 'Female', 'Student', 'H.no 11, Muninga Layout, Maruthi Seva Nagar, Bangalore', '', 'Bangalore', 'Karnataka', '560033', '9503394712', '9503394712', 'pratimagaonkar@gmail.com'),
(262, 'STUDENT NON MEMBER', 'DR. ASAD M MUJAWAR', 'Male', 'MDS student', 'Al badar rural dental college and hospital gulbarga, naganhalli road near koranti hanuman temple Gulbarga, 585102', '', 'Gulbarga', 'Karnataka', '585102', '', '9594235327', 'asadprostho08@gmail.com'),
(263, 'STUDENT NON MEMBER', 'DR. BALARAJ B V', 'Male', 'Graduate', 'No.1, 1st stage, 3rd cross, Kirlokar Colony,', '', 'Bangalore', 'Karnataka', '560079', '8023221159', '8904806784', 'balu.raj49@gmail.com'),
(264, 'ISOI MEMBER', 'DR. ABHILASH VARKEY JACOB', 'Male', 'Dentist', 'Dr Jacobs Omega Dental Clinic, Near ICICI Bank Pazhaya Road Medical College PO', '', 'Trivandrum', 'Kerala', '695011', '4712557777', '9447366770', 'omegadentalclinic@gmail.com'),
(265, 'STUDENT NON MEMBER', 'DR. VIVEK R PATEL', 'Male', 'SECOND YEAR POSTGRADUATE STUDENT', 'SDM COLLEGE OF DENTAL SCIENCES AND HOSPITAL,NEAR HOTEL TRAVEL INN,DHAVALNAGAR,SATTUR,DHARWAD', '', 'DHARWAD', 'Karnataka', '580009', '9428611967', '9428611967', 'vivek2611@yahoo.co.in'),
(266, 'STUDENT NON MEMBER', 'DR. PRASHANTH L', 'Male', 'MDS', '#326, 2ND CROSS, KAPILA ROAD, BALAGANGADHARANAGAR, KENGUNTE, MALLATHALLI POST', '', 'BENGALURU', 'Karnataka', '560056', '', '9980609894', 'drprashanthusha@gmail.com'),
(267, 'NON ISOI MEMBER', 'DR. MEDAPATI RAMA HARANADHA REDDY', 'Male', 'PROFESSOR', 'DEPT. OF ORAL & MAXILLOFACIAL SURGERY, PANINEEYA DENTAL COLLEGE,ROAD NO 5, KAMALANAGAR, CHAITANYAPURI, DILSUKHNAGAR', '', 'HYDERABAD', 'Andhra Pradesh', '500006', '9246365778', '9246365778', 'scorpion.nov17@gmail.com'),
(650, 'STUDENT NON MEMBER', 'DR. MOHAMMED MUBASHEERUDDIN', 'Male', 'POST GRADUATE', 'AL BADAR DENTAL COLLEGE & HOSPITAL, DARIYAPUR, NAGANHALLI ROAD. GULBARGA.', '', 'GULBARGA', 'Karnataka', '585102', '', '7349109063', 'dr.mohammedmubasheeruddin@gmail.com'),
(651, 'STUDENT MEMBER', 'DR. ANILA KATARI', 'Female', 'Pg student', '1/36 cline road M r ambedkar dental college Cooke town Bengaluru', '', 'Bengaluru', 'Karnataka', '560083', '', '7013124075', 'Evangeleena.anila@gmail.com'),
(652, 'STUDENT NON MEMBER', 'DR. MOHAMMED IMTIAZ ALI. L', 'Male', 'POST GRADUATE STUDENT', 'M.K.BUILDING,5TH CROSS, PIPELINE ROAD, KALYANNAGAR,T.DASARAHALLI, BANGALORE-560057', '', 'Bangalore', 'Karnataka', '560057', '8028392395', '8197362752', 'imtiaz_ali80@yahoo.com'),
(653, 'STUDENT NON MEMBER', 'DR. SOHAIB SYED ALEEMUDDIN SHAHED', 'Male', 'Student', '20-3-899 shahgunj hyderabad', '', 'Hyderabad', 'Andhra Pradesh', '500002', '', '8867233786', 'Sohaib_shahed@yahoo.co.in'),
(654, 'ISOI MEMBER', 'DR. ROHAN JAMENIS', 'Male', 'Partner', 'Dr jamenis dental clinic 101 Kamdhenu, 40 /24 Bhonde colony off Karve road', '', 'Pune', 'Maharashtra', '411004', '912025433240', '9730200343', 'Rj2thdoc11@yahoo.co.in'),
(655, 'NON ISOI MEMBER', 'DR. SAVITHA DOSS', 'Female', 'Consultant', 'No.107-A,Prestige Towers Residency Road', '', 'Bangalore', 'Karnataka', '560025', '8022213296', '9972375367', 'doss.savitha@gmail.com'),
(656, 'ISOI MEMBER', 'DR. JAYAPRAKASH M.B.', 'Male', 'PROFESSOR & HEAD', 'Professor & head Department of prosthodontics Dental Institute Rajendra institute of medical sciences Morabadi', 'AC/L/597/KAR', 'Ranchi', 'Jharkhand', '834009', '', '9880331140', 'jayaprakashmb@yahoo.com'),
(657, 'STUDENT NON MEMBER', 'DR. DEEPMALA MAURYA', 'Female', '3rd year PG Student', '487, Sector 1, Vasundhara', '', 'Ghaziabad', 'Uttar Pradesh', '201012', '', '9654700957', 'deepmalamaids@gmail.com'),
(658, 'STUDENT NON MEMBER', 'DR. NABEEL KALBURGI', 'Male', 'Student', '9/561, Godbolemala 2nd Lane, Bijapur.', '', 'Vijaypur', 'Karnataka', '586101', '8147883003', '8147883003', 'mmk003nabeel@gmail.com'),
(659, 'ISOI MEMBER', 'DR. SHYAM MAHAJAN', 'Male', 'Dr', 'Smile Care. 307 Akshay Deep . Near CIDCO bus stand', '', 'Aurangabad', 'Maharashtra', '431003', '2402485832', '9822067611', 'smilecareindia@gmail.com'),
(660, 'STUDENT NON MEMBER', 'DR. NETRA PATIL', 'Female', 'Post Graduate', 'KR market V.V.Puram Bangalore', '', 'BENGALURU', 'Karnataka', '560078', '9986297574', '9986297574', 'netrapatil3292@gmail.com'),
(661, 'ISOI MEMBER', 'DR. JAISON J. VALIAKULANGARA', 'Male', 'Dr', 'VALIAKULANGARA DENTAL CLINIC', 'Ac/L/1585/KER', 'VAIKOM', 'Kerala', '686141', '', '9895022207', 'jaisonjv@gmail.com'),
(662, 'STUDENT NON MEMBER', 'DR. PATIL SANKET MAHAVIR', 'Male', '1ST YEAR PG STUDENT PROSTHODONTICS', 'M.T JAIN VIDYARTHI NILAY # 81 K R ROAD SHANKARPURAM', '', 'BANGALORE', 'Karnataka', '560004', '8553462038', '8553462038', 'patilsanket6306@gmail.com'),
(663, 'ISOI MEMBER', 'DR. SUNEET DHAWAN', 'Male', 'DOCTOR', 'H NO 169P, SECTOR-14 GURGAON', '', 'GURGAON', 'Haryana', '122001', '', '9810192522', 'dsuneet@yahoo.com'),
(664, 'STUDENT NON MEMBER', 'DR. SANGEETHA S', 'Female', 'MDS student', 'Department of periodontics, Sri rajiv gandhi college of dental sciences and hospital cholanagar, RT Nagar post', '', 'Bangalore', 'Karnataka', '560032', '', '9482929168', 'sangeetha.s297@gmail.com'),
(665, 'STUDENT NON MEMBER', 'DR. DEEKSHA JHA', 'Female', 'MDS Student', 'Department of Periodontics Sri Rajiv Gandhi College of Dental Sciences Cholanagar', '', 'Bangalore', 'Karnataka', '560032', '', '7903473601', 'deeksjha@gmail.com'),
(666, 'STUDENT NON MEMBER', 'DR. SURAJ VITTHAL RAIKAR', 'Male', 'MDS student', 'Shri rajiv gandhi dental college and Hospital cholanagar R T nagar post', '', 'Bangalore', 'Karnataka', '560032', '', '8123611215', 'sangeethas34@ymail.com'),
(667, 'NON ISOI MEMBER', 'DR. ANKITA SINGH', 'Female', 'Assistant Professor', 'Faculty of dental sciences, trauma center campus, IMS, Banaras Hindu University', '', 'Varanasi', 'Uttar Pradesh', '221005', '', '9794243771', 'ankitasingh.18642@gmail.com'),
(668, 'NON ISOI MEMBER', 'DR. V.RAVIKUMAR', 'Male', 'B.D.S.', 'V.LOGA DENTAL CLINIC, ARUMUGA ACHARI STREET, DHARMAPURI.', '', 'DHARMAPURI', 'Tamil Nadu', '636701', '', '9994541886', 'drravikavin@gmail.com'),
(669, 'ISOI MEMBER', 'DR. MOHIT ZAMAD', 'Male', 'MDS ORAL & MAXILLOFACIAL SURGEON', '565, TIKEKAR ROAD, DHANTOLI', '', 'NAGPUR', 'Maharashtra', '440012', '', '9766590747', 'drmohitzamad@gmail.com'),
(670, 'ISOI MEMBER', 'DR. MUKESH CHANDAK', 'Male', 'DENTIST', 'CHANDAK DENTAL CLINIC FIRST FLOOR, PUSHPAK VIHAR OPP. HOTEL AL ZAM ZAM DARODKAR SQUARE ,GANDHIPUTLA 54 CENTRAL AVENUE', '', 'NAGPUR', 'Maharashtra', '440032', '7122770511', '9422810491', 'drmukeshchandak@yahoo.in'),
(671, 'STUDENT NON MEMBER', 'DR. PRASANNA GOPAL', 'Male', 'MDS student', 'S no. 33, Ganga Nivas, Manikbaug, Shingad road, vadgaon bk, Pune- 411051.', '', 'Pune', 'Maharashtra', '411051', '', '8888348076', 'prasagopal26@gmail.com'),
(672, 'NON ISOI MEMBER', 'DR. ABDUL KHADER.M', 'Male', 'DOCTOR', 'AL ARAB DENTAL SURGERY&IMPLANT CENTE', '', 'TIRUR', 'Kerala', '676101', '9496757659', '9496757659', 'rakdentist@yahoo.com'),
(673, 'NON ISOI MEMBER', 'DR. RAMKUMAR KARTHIC', 'Male', 'Reader', 'No 12, Third Street', '', 'Coimbatore', 'Tamil Nadu', '641006', '9840871468', '9840871468', 'drramkumar78@gmail.com'),
(674, 'STUDENT NON MEMBER', 'DR. FAHADAH UBAID', 'Female', 'Doctor', 'Tavrekare main road 202 /3, kamil crescent, 2nd cross, kaveri layout', '', 'Banglore', 'Karnataka', '560029', '', '8979702680', 'fahadah.ubaid93@gmail.com'),
(675, 'STUDENT NON MEMBER', 'DR. YOGISH.P', 'Male', 'GENERAL DENTIST', 'DR. YOGISH.P NO.674, BASAVESHWARA NILAYA, 29 TH MAIN, BTM LAYOUT 2 ND STAGE, BANGALORE 560076', '', 'BANGALORE', 'Karnataka', '560076', '9036483681', '9036483681', 'pyogish@yahoo.com'),
(676, 'NON ISOI MEMBER', 'DR. HIMANSHU MORBIA', 'Male', 'BDS', 'MORBIA HOSPITAL LAL TEKRI, BHUJ', '', 'BHUJ', 'Gujarat', '370001', '2832222936', '9879308930', 'drhimanshumorbia@gmail.com'),
(677, 'ISOI MEMBER', 'DR. SARAVANAN RETHINAM', 'Male', 'Professor', 'RVS Dental College & Hospital Kannampalayam Coimbatore', '', 'Coimbatore', 'Tamil Nadu', '641402', '9842315554', '9842315554', 'sharvy31@gmail.com'),
(678, 'NON ISOI MEMBER', 'DR. PRIYANKA CHOUDREE', 'Female', 'Consultant', 'The Dental Works, 101-105, Park Plaza, Off Bhandarkar Road, Opp. Kamala Nehru Park', '', 'Pune', 'Maharashtra', '411004', '', '9373363414', 'priyanka@drchoudree.com'),
(679, 'ISOI MEMBER', 'DR. RITHESH K B', 'Male', 'Reader', 'AJ dental college mangalore', '', 'Mangalore', 'Karnataka', '575006', '9845245008', '9845245008', 'Rithesh.kb@gmail.com'),
(680, 'ISOI MEMBER', 'DR. P.S.THAHA', 'Male', 'CHAIRMAN', 'PMS COLLEGE OF DENTAL SCIENCE AND RESEARCH, GOLDEN HILLS, VENKODE P O, VATTAPPARA', '', 'Trivandrum', 'Kerala', '695028', '4722587556', '9447123479', 'drthaha2003@yahoo.com'),
(681, 'ISOI MEMBER', 'DR. NIMIT K GANDHI', 'Male', 'ENDODONTIST', 'SHREE SAI ORAL CARE & IMPLANT CENTRE 103, NIRMAL COMPLEX-A, ABOVE ICICI BANK, SANDH KUVA', 'Ac/L/842/GUJ', 'NAVSARI', 'Gujarat', '396445', '2637244455', '9429059994', 'drnimitgandhi@gmail.com'),
(682, 'NON ISOI MEMBER', 'DR. PRAMODH N R', 'Male', 'Reader', 'Subbaiah dental college, Shimoga', '', 'KARNATAKA', 'Karnataka', '577222', '', '9035276611', 'dr.pramodh@yahoo.in'),
(683, 'NON ISOI MEMBER', 'DR. SAMPATH KUMAR', 'Male', 'Implantologist', '223/E, Latthe Chowk, Near Kiran banglow, Tarabai Park, Kolhapur', '', 'Kolhapur', 'Maharashtra', '416003', '', '7709719689', 'sampathprostho@gmail.com'),
(684, 'ISOI MEMBER', 'DR. JASBRINDER SINGH TEJA', 'Male', 'Implantologist', 'House number 63 Sector 8-a Chandigarh', '#AC/L/679/HAR', 'chandigarh', 'Chandigarh', '160018', '', '9872077544', 'drteja@hotmail.com'),
(685, 'INTERNATIONAL DELEGATES', 'DR. SUNGMIN CHUNG', 'Male', 'Implantologist', '#214, 105, Gwanggyo-ro, Yeoungtong-gu, Suwon-si, Gyeonggi-do, Korea', '', 'Seoul', 'Karnataka', '16229', '', '9205386519', 'kyj@dentium.com'),
(686, 'ISOI MEMBER', 'DR. VINAY V KUMAR', 'Male', 'Implantologist', '37, Lazar Layout, Frazer Town, Bangalore - 56005, Karnataka, India', '', 'Bangalore', 'Karnataka', '56005', '', '9886687654', 'kumar@uni-mainz.de'),
(687, 'NON ISOI MEMBER', 'DR. G. SUDHAGAR', 'Male', 'BDS', 'Sudhagar Dental Clinic, 14, GPH ROAD, Vellore', '', 'Vellore', 'Tamil Nadu', '632004', '', '9487612141', 'arudhradentalcare@gmail.com'),
(688, 'NON ISOI MEMBER', 'DR. N CHANDRA SEKHAR', 'Male', 'Prof and HOD', 'Dr Sekhars dental care D 136 Madhuranagar Hyderabad 500038 040-65135999', '', 'Hyderabad', 'Andhra Pradesh', '500038', '', '9949824756', 'drsekharcn@gmail.com'),
(689, 'ISOI MEMBER', 'DR. HEMANSHU MEHTA', 'Male', 'B.D.S.(MUM),FELLOW AND DIPLOMAT OF ISOI', '103 JOLLY APPARTMENTS,KIROL ROAD (CAMA LANE),OPPOSITE JOLLY GYMKHANA,GHATKOPAR WEST', 'Ac/L/781/MAH', 'Mumbai', 'Maharashtra', '400086', '2225133828', '9820079840', 'drhemanshu@gmail.com'),
(690, 'ISOI MEMBER', 'DR. PARESH KALE', 'Male', 'Prosthodontist', 'Pune', '', 'pune', 'Maharashtra', '400023', '', '9822246424', 'kalepr@gmail.com'),
(691, 'STUDENT NON MEMBER', 'DR. SHINJU VINCENT', 'Female', 'MDS', 'PALLIPATTU HOUSE,KALLUPALAM NAGAR,ANGAMALY P.O', '', 'ERNAKULAM', 'Kerala', '683572', '', '9731265388', 'shinjuvincent@gmail.com'),
(692, 'STUDENT MEMBER', 'DR. M SURYA CHAITANYA REDDY', 'Male', 'MDS', 'H/No.25/633, srinivas nagar', '', 'Nandyal', 'Andhra Pradesh', '518501', '', '9010348984', 'mallusurya626@gmail.com'),
(693, 'STUDENT NON MEMBER', 'DR. SAIMA ARSHIE', 'Female', 'Mds prosthodontics 1st year student', 'KIMS staff quartes, banshankari 2, bangalore', '', 'Bangalore', 'Karnataka', '560002', '7006733376', '7006733376', 'saima.arshii@gmail.com'),
(694, 'NON ISOI MEMBER', 'DR. SUPRIYA BIJJARGI', 'Female', 'Asst. Professor', 'PMNM Dental college and hospital,', '', 'Bagalkot', 'Karnataka', '587101', '', '9741762662', 'drsupib.29@gmail.com'),
(695, 'STUDENT NON MEMBER', 'DR. MEHNAMA YOUSUF', 'Female', 'MDS IST YEAR PROSTHODONTICS', 'VSDC GIRLS HOSTEL VISHVESHPURAM, NEAR BANGALORE INSTITUTE OF TECHNOLOGY', '', 'BANGALORE', 'Karnataka', '560004', '', '7889959248', 'mehnama@gmail.com'),
(696, 'STUDENT NON MEMBER', 'DR. JOE THALIATH', 'Male', 'student', 'THALIATH HOUSE VARAPUZHA PO ERNAKULAM KERALAA', '', 'ERNAKULAM', 'Kerala', '683517', '4842512159', '7034782010', 'joethaliath12345@gmail.com'),
(697, 'NON ISOI MEMBER', 'DR. VIKRAM HINGORANI', 'Male', 'Dental & Oral Surgeon', 'Dr Hingoranis Dental Speciality Centre 5 HINGORANI HOUSE 78 A DR A B ROAD WORLI', '', 'MUMBAI', 'Maharashtra', '400018', '912224953545', '9820037098', 'drhingorani@hathway.com'),
(698, 'STUDENT NON MEMBER', 'DR. NAVIN KUMAR SAHU', 'Male', 'student', 'dept. of prosthodontics dr. syamala reddy dental college, munnekolala', '', 'bangalore', 'Karnataka', '560037', '7795159207', '7795159207', 'sahunavin01@gmail.com'),
(699, 'ISOI MEMBER', 'DR. SABHA', 'Female', 'Dentist', 'No-4, 1st main road Vinayaka layout Mysore Road', '', 'bengaluru', 'Karnataka', '560039', '', '9620247856', 'sabha863@gmail.com'),
(700, 'STUDENT NON MEMBER', 'DR. JIXSON WINSON', 'Male', 'Dental student', 'Ainiyadan house chiengalpo kalady', '', 'Errnakulam', 'Kerala', '683574', '', '9686172343', 'jixsonwinson123@gmail.com'),
(701, 'STUDENT NON MEMBER', 'DR. AHLEM AHAMED', 'Male', 'P.G student', 'Dr Syamala Reddy Dental College Munnekolola Marthahalli Bengaluru - 560 037', '', 'Bengaluru', 'Karnataka', '560037', '', '9742608819', 'ahlem.pa@gmail.com'),
(702, 'STUDENT NON MEMBER', 'DR. SHASHI BHUSHAN', 'Male', '2nd Year Postgraduate Student', 'Dr Syamala Reddy Dental college munnekolala ,marathahalli', '', 'Bangalore', 'Karnataka', '560037', '', '9620466205', 'luckybhushan.shashi@gmail.com'),
(703, 'ISOI MEMBER', 'DR. SUMIT J DESHPANDE', 'Male', 'Professor', 'Sheree dental clinic gulbarga', 'Ac/L/1547/KAR', 'Gulbarga', 'Karnataka', '585102', '', '9945750511', 'drsumitdeshpande78@gmail.com'),
(704, 'NON ISOI MEMBER', 'DR. DARSHAN S PARIKH', 'Male', 'Dental Surgeon', 'Vimal Dental Clinic #22 Tulsidas Apts, Opp J J Garden Dastur Meher Road, CAMP', '', 'Pune', 'Maharashtra', '411001', '2026069944', '9423015090', 'dr.darshanparikh@gmail.com'),
(705, 'STUDENT MEMBER', 'DR. SRAVANTHI VUPPU', 'Female', 'DENTIST', 'EXPERT DENTAL CARE NO.21, MANIKESWARI ROAD , KILPAUK', '', 'CHENNAI', 'Tamil Nadu', '600010', '', '9710117777', 'sravanthivuppu2502@gmail.com'),
(706, 'ISOI MEMBER', 'DR. RAKESH JAISWAL', 'Male', 'PROSTHODONTIST', 'C/o moti Chand rai, behind SBR College, OM nagar Jarhabhata bilaspur pin495001', '872', 'Bilaspur', 'Chhattisgarh', '495001', '', '8120733329', 'Rakeshjaiswal0611@gmail.com'),
(707, 'STUDENT NON MEMBER', 'DR. SOUMALYA BANERJEE', 'Male', 'Post Graduate Trainee', 'G.T. Road East, Chirkunda', '', 'Dhanbad', 'Jharkhand', '828202', '', '8336035736', 'smalya90@gmail.com'),
(708, 'STUDENT NON MEMBER', 'DR. SHIVAM SULOK', 'Male', 'Post Graduate Trainee', 'Archana Sadan, dumra court', '', 'Sitamarhi', 'Bihar', '843301', '', '8527687420', 'shivamsulok@gmail.com'),
(709, 'STUDENT NON MEMBER', 'DR. ANUJ KR CHOWDHARY', 'Male', 'PGT', 'Pragya Nagar Bhikhanpura', '', 'Muzaffarpur', 'Bihar', '842001', '', '8507555274', 'dr.anujtheman@gmail.com'),
(710, 'STUDENT NON MEMBER', 'DR. RAUSHAN KUMAR', 'Male', 'PGT', 'At- Lohiyanagar P+O - Suhirdanagar', '', 'Begusarai', 'Bihar', '851218', '', '8084430200', 'raushankb@gmail.com'),
(711, 'STUDENT NON MEMBER', 'DR. PUNIT JAIN', 'Male', 'postgrauate', 'A.B SHETTY dental college', '', 'manglore', 'Karnataka', '575018', '7892261625', '7892261625', 'jain.punit2103@gmail.com'),
(712, 'NON ISOI MEMBER', 'DR. CHITRANG THAKER', 'Male', 'Dentist', '21/22, Rajnigandha Shopping Centre, Gokuldham, opp Krishna temple, Goregaon east', '', 'Mumbai', 'Maharashtra', '400063', '2242663406', '9869214265', 'Chitrangthaker@gmail.com'),
(713, 'ISOI MEMBER', 'DR. RIKIN A GOGRI', 'Male', 'Dentist & CEO', '801 PREMSWAROOP CHS , SHREENAGAR ESTATE COLONY, OFF M G ROAD, BEHIND JAIN TEMPLE, GOREGAON WEST', '1142', 'MUMBAI', 'Maharashtra', '400104', '9819719655', '9819719655', 'rikingogri@gmail.com'),
(714, 'ISOI MEMBER', 'DR. AMIT GUPTA', 'Male', 'ORAL AND MAXILLOFACIAL SURGEON', 'SMILE CARE DENTAL CLINIC, SHOP NO 13,14, SWAPNAPURTI, OPP RAHEJA UNIVERSAL,THAKUR VILLAGE,KANDIVALI(E),MUMBAI', 'Ac/L/772/MAH', 'MUMBAI', 'Maharashtra', '400101', '9821472746', '9821472746', 'dramitvgupta@gmail.com'),
(715, 'ISOI MEMBER', 'DR. GAURAVPAL SINGH', 'Male', 'Reader', '122/227 Indra path Madhyam marg Mansarover Jaipur', '', 'Jaipur', 'Rajasthan', '302020', '', '9314142160', 'Singhgauravpal@yahoo.co.in'),
(716, 'NON ISOI MEMBER', 'DR. NIVEDITA MANKANI', 'Female', 'Reader', 'PMNM DENTAL COLLEGE AND HOSPITAL., BVVS CAMPUS, BAGALKOT', '', 'Bagalkot', 'Karnataka', '587101', '', '9481212040', 'drniveditam@yahoo.co.in'),
(717, 'NON ISOI MEMBER', 'DR. LOKESH NK', 'Male', 'Reader', 'Rajarajeswari dental college and hospital Mysore road Ramohalli cross', '', 'Bangalore', 'Karnataka', '560074', '', '9880600178', 'drlokesh8613@gmail.com'),
(718, 'NON ISOI MEMBER', 'DR. BINOY MATHEW', 'Male', 'PROFESSOR AND HEAD', 'mahe institute of dental sciences, chalakara,mahe', '', 'MAHE', 'Puducherry', '673310', '', '9447572103', 'binoymathews.n@gmail.com'),
(719, 'NON ISOI MEMBER', 'DR. MIRIAM MATHEW', 'Female', 'reader', 'mahe institute of dental sciences, chalakara,mahe', '', 'MAHE', 'Puducherry', '673310', '', '9744068375', 'geoliz@gmail.com'),
(720, 'NON ISOI MEMBER', 'DR. ANIL.K.SUBHASH', 'Male', 'SENIOR LECTURER', 'mahe institute of dental sciences, chalakara,mahe', '', 'MAHE', 'Puducherry', '673310', '', '8113016808', 'subash.anil@gmail.com'),
(721, 'NON ISOI MEMBER', 'DR. NANDAKISHORE B', 'Male', 'PROFESSOR', 'mahe institute of dental sciences, chalakara,mahe', '', 'MAHE', 'Puducherry', '673310', '', '8971888393', 'nandakishorebhojaraju@gmail.com'),
(722, 'STUDENT NON MEMBER', 'DR. KEERRTHANA .K.R', 'Female', 'POST GRADUATE STUDENT', 'mahe institute of dental sciences, chalakara,mahe', '', 'MAHE', 'Puducherry', '673310', '', '9562433254', 'keerthana.reghu@gmail.com'),
(723, 'STUDENT NON MEMBER', 'DR. DHANYA P NAMPOOTHIRI', 'Female', 'POST GRADUATE STUDENT', 'MAHE INSTITUTE OF DENTAL SCIENCES, CHALAKKARA ,PALLOR.P.O MAHE', '', 'MAHE', 'Puducherry', '673310', '', '8281394974', 'dhanyaprasanthunni@gmail.com'),
(724, 'STUDENT NON MEMBER', 'DR. RAFI AHMED', 'Male', 'Doctor', 'Line khanquah road,p.o+p.s+dist. Kishanganj', '', 'Kishanganj', 'Bihar', '855107', '', '9523142966', 'ahmed.ahmedrafi12@gmail.com'),
(725, 'STUDENT NON MEMBER', 'DR. HARSH DESAI', 'Male', 'pg student', '1801b siliconia apartment, Kuthar', '', 'Mangalore', 'Karnataka', '575017', '7899496260', '7899496260', 'harsh35desai@gmail.com'),
(726, 'NON ISOI MEMBER', 'DR. KAUSHAL KISHOR AGRAWAL', 'Male', 'Assistant Professor', 'Dr Kaushal Kishor Agrawal Assistant Professor Department of Prosthodontics King George Medical University Lucknow', '', 'Lucknow', 'Uttar Pradesh', '226003', '', '9721392150', 'drkaushalp@yahoo.co.in'),
(727, 'ISOI MEMBER', 'DR. BASANT CHANDNA', 'Male', 'Dentist', 'House no 13 Sec 10 a', '', 'Gurgaon', 'Haryana', '122001', '9215927500', '9896041264', 'basant.chandna@gmail.com'),
(728, 'STUDENT NON MEMBER', 'DR. NAVEEN YADAV', 'Male', 'PG STUDENT', '16, GF, A1 BLOCK, SOUTH CITY 2', '', 'GURGAON', 'Haryana', '122018', '', '9873523614', 'dr.naviny5@gmail.com'),
(729, 'STUDENT MEMBER', 'DR. SHIVANI SAXENA', 'Male', 'post graduate', 'room no.64 sapthgiri girls hostel,msrit post msruas', '', 'bangalore', 'Karnataka', '560054', '', '9407479577', 'saxenashivani81@gmail.com'),
(730, 'ISOI MEMBER', 'DR. MEHUL A PATEL', 'Male', 'Dental Surgeon', 'Dental World Lg 18, Paradise TOwer Beside Jahangir Cinema Opp Civil Hopspital', 'Ac/L/1074/GUJ', 'Navsari', 'Gujarat', '396445', '2637255001', '9712955001', 'mehulbds@hotmail.com'),
(731, 'ISOI MEMBER', 'DR. BHUSHAN BANGAR', 'Male', 'PROFESSOR', 'B 504, LUNKAD GREENLAND 2, DATTAMANDIR CHOWK VIMANNAGAR', '640', 'PUNE', 'Maharashtra', '411014', '', '9423778224', 'brbangar@yahoo.com'),
(732, 'NON ISOI MEMBER', 'DR. RAKSHITH HEGDE', 'Male', 'professor', 'A B Shetty Memorial institute of dental sciences, nithyanand nagar, deralakatte.', '', 'mangalore', 'Karnataka', '575018', '', '9845121828', 'prosthodons1234@gmail.com'),
(733, 'NON ISOI MEMBER', 'DR. T. ARUNKUMAR', 'Male', 'Dental Surgeon', 'C/O SHRE VINAYAKAA DENTAL CLINIC 1199 1ST FLOOR 26TH MAIN ROAD 9TH BLOCK JAYA NAGAR', '', 'BANGALORE', 'Karnataka', '560069', '26532130', '9844321540', 'doctarun27@yahoo.co.in'),
(734, 'STUDENT NON MEMBER', 'DR. PALLAVI', 'Female', 'PG student', 'NRI girls hostel', '', 'belgaum', 'Karnataka', '590010', '7676369346', '7676369346', 'pallavi_1526@yahoo.co.in'),
(735, 'ISOI MEMBER', 'DR. ALOK BHARDWAJ', 'Male', 'MDS', 'S 2, Shastri Nagar, Bank Lane.', '', 'jaipur', 'Rajasthan', '302016', '', '7665531451', 'bhardwajdr@gmail.com'),
(736, 'NON ISOI MEMBER', 'DR. MANOJ SHETTY', 'Male', 'professor', 'A B Shetty Memorial Institute of dental sciences, deralakatte ,Mangalore', '', 'mangalore', 'Karnataka', '575018', '9845267087', '9845267087', 'drmanojshetty@gmail.com'),
(737, 'ISOI MEMBER', 'DR. AMOL THORAT', 'Male', 'Professor', 'Row house#22, Swarvihar, sasane nagar, Hadapsar', '', 'Pune', 'Maharashtra', '411028', '2026739011', '8657481555', 'dramolthorat@rediffmail.com'),
(738, 'ISOI MEMBER', 'DR. VIJAY NAUTIYAL', 'Male', 'Professor', 'Manya Dental Hospital Ring Road Nathanpur Jogiwala', 'Ac/L/1055', 'Dehradun', 'Uttarakhand', '248001', '1352662933', '9412025151', 'nautiyalvijay3@gmail.com'),
(739, 'NON ISOI MEMBER', 'DR. RITWIK RANKA', 'Male', 'Post Graduate Student', 'Flat No. F-5 Hanuman Residency Near Emerald Appt. Hanuman Nagar', '', 'Belagavi', 'Karnataka', '590001', '', '9039997381', 'ritwik7ranka@gmail.com'),
(740, 'ISOI MEMBER', 'DR. RANGANATH', 'Male', 'Professor', 'Department of Prosthodontics Maruthi dental college', '', 'bengaluru', 'Karnataka', '560076', '', '9845016003', 'drranganath@hotmail.com'),
(741, 'STUDENT NON MEMBER', 'DR. VIJAYA CHALIKKAD RAVI', 'Female', 'post graduate', 'krishnadevarayya dental college', '', 'bengaluru', 'Karnataka', '560076', '', '7829344376', 'vijaya@gmail.com'),
(742, 'STUDENT NON MEMBER', 'DR. MAHADEEPA KAR', 'Female', 'post graduate', 'a/2, bombay dyeing colony west, mohopada', '', 'rasayani', 'Karnataka', '410222', '', '8779634161', 'mahadeepakar@gmail.com'),
(743, 'STUDENT NON MEMBER', 'DR. SNEHA NIDHI', 'Female', 'post graduate', 'dept of periodontics Maruthi dental college Bengaluru', '', 'bengaluru', 'Karnataka', '560076', '', '8147574633', 'sneha_nidhi@ymail.com'),
(744, 'STUDENT NON MEMBER', 'DR. YOGASHREE CK', 'Female', 'post graduate STUDENT', 'Maruthi dental college', '', 'bengaluru', 'Karnataka', '560076', '', '8056235480', 'yogashreey@gmail.com'),
(745, 'STUDENT NON MEMBER', 'DR. ANISHA', 'Female', 'post graduate STUDENT', 'dept of periodontology Maruthi dental college', '', 'bengaluru', 'Karnataka', '560076', '', '8147785057', 'anisha.a2009@gmail.com'),
(746, 'STUDENT NON MEMBER', 'DR. SOMIL SAXENA', 'Male', 'post gradaute', 'post graduate student dept of Periodontology aces Maruthi dental college', '', 'bengaluru', 'Karnataka', '560076', '', '9739391556', 'saxenasomil91@gmail.com'),
(747, 'STUDENT NON MEMBER', 'DR. SHALI KOKILA J', 'Female', 'Post graduate STUDENT', 'Dept of Periodontology ACES Maruthi dental college', '', 'Bengaluru', 'Karnataka', '560076', '', '8147911789', 'shali6192@gmail.com'),
(748, 'STUDENT NON MEMBER', 'DR. SHRUTHY R', 'Female', 'Post graduate STUDENT', 'Dept of Periodontology ACES Maruthi dental college', '', 'bengaluru', 'Karnataka', '560076', '', '9176264570', 'drshruthy1991@gmail.com'),
(749, 'STUDENT NON MEMBER', 'DR. HARSHITA AWASTHI', 'Female', 'post graduate STUDENT', 'Dept of periodontology AECS Maruthi dental college', '', 'bengaluru', 'Karnataka', '560076', '', '9454948911', 'harshi.awasthi@gmail.com'),
(750, 'STUDENT NON MEMBER', 'DR. GAYATHRI CHINMAYEE', 'Female', 'posT GRADUATE STUDENT', 'Dept of periodontology AECS Maruthi dental college', '', 'Bengaluru', 'Karnataka', '560076', '', '9591230850', 'drchinmayee18@gmail.com'),
(751, 'STUDENT NON MEMBER', 'DR. SONALI GOYAL', 'Female', 'posT GRADUATE STUDENT', 'dept of periodontology ACEMaruthi dental college', '', 'bengaluru', 'Karnataka', '560076', '', '9449434458', 'sonalgoyal192@gmail.com'),
(752, 'ISOI MEMBER', 'DR. ANSHUL RAI', 'Male', 'Assistant professor', '118,Moneko , reveira towne, near mata mandir', '', 'BHOPAL', 'Madhya Pradesh', '462003', '7552980225', '7869171413', 'anshul.dentalsurgery@aiimsbhopal.edu.in'),
(753, 'ISOI MEMBER', 'DR. KAPIL SINGHAL', 'Male', 'Periodontist and oral IMPLANTOLOGIST', '116 / 209 SHIPRA PATH AGARWAL FARM mansarovar', 'Ac/l/1272', 'jaipur', 'Rajasthan', '302020', '9782601131', '9782601131', 'kapil_singhal2001@yahoo.com'),
(754, 'ISOI MEMBER', 'DR. VARSHA S JADHAV', 'Female', 'Consultant Periodontist and Implantologist', 'B-10 Sadguru darshan CHS cross road no 3 near liberty garden Malad west Mumbai-64', '', 'Mumbai', 'Maharashtra', '400064', '', '9819803086', 'varshajadhav05@gmail.com'),
(755, 'NON ISOI MEMBER', 'DR. MANJIRI VAIDYA', 'Female', 'GENERAL DENTIST', 'SOBHA CORAL 115, B - BLOCK, BEHIND JAKKUR FLYING CLUB, JAKKUR, BANGALORE -64', '', 'bangalore', 'Karnataka', '560064', '9972045948', '9972045948', 'v.manjiri@yahoo.co.in'),
(756, 'ISOI MEMBER', 'DR. RAHUL JINDAL', 'Male', 'Dental Surgeon', 'Rahul Dental Hospital & Implant Center Bhliwara Ajmer Road Deoli RAJASTHAN', 'Ac/L/906/RAJ', 'Deoli', 'Rajasthan', '304804', '', '9414029101', 'rhljindal@yahoo.co.in'),
(757, 'ISOI MEMBER', 'DR. PRATEEK ARORA', 'Male', 'Dental Surgeon', '17-c, Gopalbari', 'Ac/L/1273/RAJ', 'Jaipur', 'Rajasthan', '302001', '', '9829067687', 'drprateekarora@hotmail.com'),
(758, 'ISOI MEMBER', 'DR. NISHANT GUPTA', 'Male', 'Consultant Oral Surgeon', 'KDG Medical & Dental Centre, 16, Hospital Road, C-Scheme', 'Ac/L/1674/RAJ', 'Jaipur', 'Rajasthan', '302001', '9799495139', '9799495139', 'nishantguptaomfs@gmail.com'),
(759, 'ISOI MEMBER', 'DR. JAYACHANDRAN', 'Male', 'PROFESSOR', 'NO 2/57, R2, ARRS MAJESTIC APTS, SALEM MAIN ROAD PART , SURAMANGALAM', '#AC/L/1737/TN', 'salem', 'Tamil Nadu', '636005', '7708225522', '7708225522', 'dentistcorner@yahoo.com'),
(760, 'ISOI MEMBER', 'DR. DR NITIN JAIN', 'Male', 'BDS', 'C-12/544, Main Road, Yamuna Vihar', '1657', 'Delhi', 'Delhi', '110053', '9818647907', '9818647907', 'jaindentalclinic@gmail.com'),
(761, 'STUDENT NON MEMBER', 'DR. MEGHA VERMA', 'Female', 'student', 'M S RAMAIAH DENTAL COLLEGE BANGALORE INDIA', '', 'bangalore', 'Karnataka', '560054', '', '7259695260', 'meghaverma1992@gmail.com'),
(762, 'NON ISOI MEMBER', 'DR. VIBHA SHETTY', 'Female', 'MDS', '#1,10th cross Mayur Street , bhadrappa layout Hebbal', '', 'Bangalore', 'Karnataka', '560094', '', '9845305455', 'vibshetty6@gmail.com'),
(763, 'STUDENT NON MEMBER', 'DR. ALISHA VINCENT', 'Female', 'Student', 'House no 17, 4th Cross Road Jaladarsini Layout, new bel road Bangalore', '', 'Bangalore', 'Karnataka', '560094', '', '9448912354', 'anoopbabu888@gmail.com'),
(764, 'STUDENT NON MEMBER', 'DR. ANOOP BABU', 'Male', 'BDS', '33, 4th cross, anjena murthy layout lottegollahalli RMV 2nd stage', '', 'Bangalore', 'Karnataka', '560094', '', '7204806773', 'anoopbabu888@gmail.com'),
(765, 'STUDENT NON MEMBER', 'DR. KAVISHMA SULAYA', 'Female', 'postgraduate student', 'SDM COLLEGE OF DENTAL SCIENCES AND HOSPITALS', '', 'DHARWAD', 'Karnataka', '580009', '', '9880379420', 'kavisulaya@gmail.com'),
(766, 'NON ISOI MEMBER', 'DR. KULDEEP SINGH', 'Male', 'MEDICAL OFFICER', 'RAPP HOSPITAL NPCIL RAWATBHATA P.O. BHABHA NAGAR', '', 'RAWATBHATA', 'Rajasthan', '323307', '1475233766', '9413358259', 'singhk_76@rediffmail.com'),
(767, 'STUDENT MEMBER', 'DR. SHARWAN KUMAR SINGH', 'Male', 'PG STUDENT', 'G 677 Awas Vikas 1 kalyanpur', '1791/UP/AC/L', 'Kanpur', 'Uttar Pradesh', '208017', '', '9235504026', 'sksinghdentist@gmail.com'),
(768, 'ISOI MEMBER', 'DR. SATISH BHARDWAJ', 'Male', 'mds', 's2 shastri nagar jaipur', '', 'jaipur', 'Rajasthan', '302016', '', '9828012176', 'satishclinic@yahoo.com'),
(769, 'STUDENT NON MEMBER', 'DR. SRINIDHI BHAT', 'Male', 'Senior lecturer', 'B smart dental clinic and implant center Gandhinagar Above goli vadapav', '', 'Shimoga', 'Karnataka', '577201', '', '8867768715', 'drsrinidhibhat@gmail.com'),
(770, 'ISOI MEMBER', 'DR. SUDARSHAN', 'Male', 'ASSOCIATE PROFESSOR', 'KLES INSTITUTE OF DENTAL SCIENCES NO.20 ,YESWANTHPUR SUBURB,OPP.CMTI,TUMKUR ROAD ,BANGALORE-22', '', 'BANGALORE', 'Karnataka', '560022', '8023400637', '9449104316', 'sudarshansajjan78@gmail.com'),
(1032, 'ISOI MEMBER', 'DR. RAVI SAVADI', 'Male', 'professor', 'Savadi dental care and research centre', '', 'Bangalore', 'Karnataka', '560034', '', '9900016920', 'ravisavadi@gmail.com'),
(1033, 'NON ISOI MEMBER', 'DR. KAUSTUBH TAMBEKAR', 'Male', 'Professor', '206, goldfinch pate', '', 'Solapur', 'Maharashtra', '413007', '', '9850279910', 'kaukam77@gmail.com'),
(1034, 'ISOI MEMBER', 'DR. SANTHOSH DIXIT', 'Male', 'Professor', 'Pt dndayal upadhay dental college and hospital', '', 'solapur', 'Maharashtra', '413001', '', '9326882508', 'drsanthoshdixit@yahoo.com'),
(1035, 'ISOI MEMBER', 'DR. MAHESH SUGANNA', 'Male', 'PROF & HEAD', 'MITHILA MINORITY DENTAL COLLEGE', '614', 'DARBHANGA', 'Bihar', '846001', '', '9482517333', 'maheshgolgeri@gmail.com'),
(1036, 'NON ISOI MEMBER', 'DR. BISHNUPATI SINGH', 'Male', 'Reader', 'Saristabad patna', '', 'patna', 'Bihar', '800002', '', '9612470047', 'bishnupatisingh@gmail.com'),
(1037, 'STUDENT NON MEMBER', 'DR. SHARMISHTHA GAIKWAD', 'Female', 'postgraduate student', '\"ASHOK VIHAR\", RUNWAL CASTLE-1, PLOT-238, SURVEY-97, RIGHT BHUSARI COLONY, KOTHRUD, PUNE 411038', '', 'PUNE', 'Maharashtra', '411038', '', '7066798770', 'sharmishthagaikwad@gmail.com'),
(1038, 'ISOI MEMBER', 'DR. KUMARSWAMY MJ', 'Male', 'clinician', 'cosmodental care , no-529, 1st floor, 14th cross Kr road, Bangalore', 'Ac/L/1604/KAR', 'Bangalore', 'Karnataka', '560028', '', '9886042690', 'cosmodent1@redifmail.com'),
(1039, 'ISOI MEMBER', 'DR. CHARAN SHETTY', 'Male', 'dental clinic', 'dental health care and implant centre no 9 shankarappa complex, Sanjaynagar', '', 'Bengalur', 'Karnataka', '560021', '', '9845202976', 'drcharan2003@yahoo.co.in'),
(1040, 'NON ISOI MEMBER', 'DR. RAJU SRINIVAS', 'Male', 'Dental practioner', '16/84, 8th main, Jayanagar , 3rd block', '', 'Bengaluru', 'Karnataka', '560011', '', '9341218895', 'rajusri@gmail.com'),
(1041, 'STUDENT NON MEMBER', 'DR. PRASHASTHI SHETTY', 'Female', 'POSTGRADUATE STUDENT', 'SDM COLLEGE OF DENTAL SCIENCES', '', 'DHARWAD', 'Karnataka', '580009', '', '9916120958', 'prashasthi@gmail.com'),
(1042, 'ISOI MEMBER', 'DR. SHANKAR GUHAN S', 'Male', 'MDS ORAL SURGERY', 'ARUDHRA DENTAL CLINIC 53 AVM AVENUE 1ST MAIN ROAD VIRUGAMBAKKAM', '2001', 'CHENNAI', 'Tamil Nadu', '600092', '4423774469', '9444404336', 'arudhradentalcare@gmail.com'),
(1043, 'STUDENT NON MEMBER', 'DR. SALIAN BHAVYA KESHAV', 'Female', 'postgraduate student', 'Depatment of prosthodontics, SDMcollege of dental sciences', '', 'Dharwad', 'Karnataka', '580009', '', '9920485069', 'bhavyasalian20@ymail.com'),
(1044, 'STUDENT NON MEMBER', 'DR. SHABANABANU SHAIKH', 'Female', 'postgraduate student', 'Department of prosthodontics , SDM college of dental scinces', '', 'Dharwad', 'Karnataka', '580009', '', '9731539551', 'drshabanashaikh92@gmail.com'),
(1045, 'NON ISOI MEMBER', 'DR. BINDUSHREE', 'Female', 'postgraduate student', 'department of prosthodontics , SDM college of dental sciences .', '', 'Dharwad', 'Karnataka', '580009', '', '8884738335', 'binduedupuganti75@gmail.com'),
(1046, 'STUDENT NON MEMBER', 'DR. REENA LOBO', 'Female', 'POST GRADUATE', '#404, NEW STAFF QUARTERS, MVIT, HUNASAMARANAHALLI, INTERNATIONALAIRPORT ROAD,', '', 'BENGALURU', 'Karnataka', '562157', '', '9844617387', 'reenalob@gmail.com'),
(1047, 'NON ISOI MEMBER', 'DR. YOKESH V RATNAM', 'Male', 'Proprietor', 'Smile dental clinic #531/A New Bel Road dollars Colony Bangalore', '', 'Bangalore', 'Karnataka', '560094', '', '9448202199', 'yokeshvratnam@gmail.com'),
(1048, 'ISOI MEMBER', 'DR. K. ARUN KUMAR', 'Male', 'MDS ORAL & MAXILLOFACIAL SURGEON', 'Maruthi Dental & Face Surgical Centre 511,NSR Road Saibaba Colony', '870', 'Coimbatore', 'Tamil Nadu', '641011', '9043723203', '9842256356', 'akofms@gmail.com'),
(1049, 'STUDENT NON MEMBER', 'DR. NIKITA MALI', 'Female', 'Postgraduate', 'Kims ladies hostel Room no. 453 24th main Banashankari 2nd stage Bengaluru-560070', '', 'Bangalore', 'Karnataka', '560070', '', '9972594036', 'itsmenikita.89@gmail.com'),
(1050, 'ISOI MEMBER', 'DR. K.MANIKANDAN', 'Male', 'MDS', 'Tooth town dental clinic, 5, Thirugnanasambandar road, race course', '', 'coimbatore', 'Tamil Nadu', '641018', '9486774499', '9486774499', 'manikandan_kn@yahoo.com'),
(1051, 'STUDENT NON MEMBER', 'DR. AASTHA DOGRA', 'Female', 'postgraduate student', 'Vsdc kims hospital', '', 'Banglore', 'Karnataka', '560004', '8091142041', '9986720262', 'aasthadogra23@gmail.com'),
(1052, 'ISOI MEMBER', 'DR. G.NATARAJAN', 'Male', 'Endodontist and implantologist', 'Shree Saikrupa Dental Care 40/23, Sarojini street, T.Nagar', 'Ac/L/1420/TN', 'Chennai', 'Tamil Nadu', '600017', '4424312029', '9840086926', 'drnatarajan.g@gmail.com'),
(1053, 'STUDENT NON MEMBER', 'DR. DIVYA MISHRA', 'Female', 'MDS', 'V.S. Dental college and hospital', '', 'Bengaluru', 'Karnataka', '560004', '', '8147059871', 'Devya_123@hotmail.com'),
(1054, 'STUDENT NON MEMBER', 'DR. BELMIN BENJAMIN', 'Female', 'POST GRADUATE STUDENT', '326/22, VELIPARAMBIL HOUSE, COCHIN', '', 'ERNAKULAM', 'Kerala', '682507', '4842227060', '9387787007', 'belmin14@gmail.com'),
(1055, 'STUDENT NON MEMBER', 'DR. ANJALY ARAVIND', 'Female', 'POST GRADUATE STUDENT', 'ANNOOR DENTAL COLLEGE PUTHUPPADY PO', '', 'MUVATTUPUZHA', 'Kerala', '686673', '9496324304', '9496324304', 'dranjalyaravind@gmail.com'),
(1056, 'STUDENT NON MEMBER', 'DR. JACOB GEORGE', 'Male', 'PG STUDENT', 'ANNOOR DENTAL COLLEGE PUTHUPADY MUVATTUPUZHA, ERNAKULAM DT', '', 'MUVATTUPUZHA', 'Kerala', '686673', '9496566470', '9496566470', 'jac06geo@gmail.com'),
(1057, 'STUDENT NON MEMBER', 'DR. VYSAKH G DAS', 'Male', 'PG STUDENT', 'ANNOOR DENTAL COLLEGE, PUTHUPPADY PO MUVATTUPUZHA', '', 'MUVATTUPUZHA', 'Kerala', '686673', '9048840099', '9048840099', 'vysakhgdas1@gmail.com'),
(1058, 'STUDENT NON MEMBER', 'DR. ARYA SUDARSANAN', 'Female', 'POST GRADUATE STUDENT', 'ANJANEYAM, TC-76/2524(1), ANAYARA P.O, TRIVANDRUM, KERALA 695029', '', 'TRIVANDRUM', 'Kerala', '695029', '4842227060', '8301835986', 'aryagithesh@gmail.com'),
(1059, 'STUDENT NON MEMBER', 'DR. MERLYN GEORGE', 'Female', 'PG STUDENT', 'ANNOOR DENTAL COLLEGE PUTHUPADY MUVATTUPUZHA, ERNAKULAM DT.', '', 'Muvattupuzha', 'Kerala', '686673', '9544350240', '9544350240', 'mer.geo08@gmail.com'),
(1060, 'STUDENT NON MEMBER', 'DR. YAPI JAMOH', 'Female', 'Post graduation student', 'Address c/o shri venkateshwara ,svls building , room no 8,2nd floor, suggata road ,via international airport road', '', 'Bangalore', 'Karnataka', '562157', '', '8296474066', 'yapijamoh73@gmail.com'),
(1061, 'STUDENT NON MEMBER', 'DR. ARUNDHATI SINGH', 'Female', 'Post graduate student', 'Kcds girls hostel, hunsmaranahalli, Yelahanka', '', 'Bangalore', 'Karnataka', '562157', '', '9035456818', 'titir.maiti@gmail.com'),
(1062, 'STUDENT NON MEMBER', 'DR. PRASOON S BABU', 'Male', 'Post graduate student', 'Viruppel house , kokkadu p o, kottarakara', '', 'Kollam', 'Kerala', '691538', '', '9035178284', 'prasoonsbabu@gmail.com'),
(1063, 'NON ISOI MEMBER', 'DR. RAVI SHANKAR Y', 'Male', 'VICE PRINCIPAL', 'GITAM DENTAL COLLEGE GANDHINAGAR CAMPUS RUSHIKONDA', '', 'VIZAG', 'Andhra Pradesh', '530045', '8912840365', '9885307066', 'raviys124@gmail.com'),
(1064, 'NON ISOI MEMBER', 'DR. VENKATESH SEKHAR', 'Male', 'PRIVATE PRACTITIONER', 'OLD NO. 42/2, NEW NO. 113/2, JUSTICE RAMASWAMY ROAD, KAMARAJ AVENUE, ADYAR.', '', 'CHENNAI', 'Tamil Nadu', '600020', '4424640841', '9840147327', 'molarvenki@hotmail.com'),
(1065, 'STUDENT NON MEMBER', 'DR. VYDOORYA NAGESH', 'Female', 'Mds Student', 'No.28 2nd floor 9th A main 36th cross 5th block Jayanagar', '', 'bangalore', 'Karnataka', '560041', '', '9632691369', 'vydo1691@gmail.com'),
(1066, 'ISOI MEMBER', 'DR. ISMAIL', 'Male', 'dental surgeon', 'sithara House vettichira post punnathala valanchery', 'Ac/L/1137/KER', 'Malappuram', 'Kerala', '676552', '9349899737', '9349899737', 'dr.ismailcholayil@gmail.com'),
(1067, 'ISOI MEMBER', 'DR. TONY THOMADS', 'Male', 'BDS , PG CERTIFICATE IN ADVANCE ORAL IMPLANTOLOGY(MANIPAL)', 'CHITTUR DENTAL CARE DIVINE MERCY COMPLEX NEAR SBI HOSPITAL JUNCTION CHITTUR', '', 'PALAKKAD', 'Kerala', '678101', '4923224699', '9495039645', 'dr.tony.jmj@gmail.com'),
(1068, 'STUDENT MEMBER', 'DR. PRIYANKA RAI', 'Female', 'POST GRADUATE STUDENT', 'VOKKALIGARA SANGHA DENTAL COLLEGE AND HOSPITAL, NEAR KIMS HOSPITAL K.R ROAD VISHWESHWARAPURA', '', 'BANGALORE', 'Karnataka', '560004', '9986727628', '9466655247', 'PRIYANKARAI.PR32@GMAIL.com'),
(1069, 'STUDENT NON MEMBER', 'DR. KOUSTABH KUMAR', 'Male', 'Postgraduate', 'Sir mvit college campus, Boys hostel,Hunasamaranahalli,Bangalore', '', 'Bangalore', 'Karnataka', '562157', '', '7259210607', 'Koustabh10@gmail.com'),
(1070, 'STUDENT NON MEMBER', 'DR. HARIS ALI BHAT', 'Male', 'Post graduate', 'Mvit college campus , Mens hostel , Hunasamaranahalli, Bangalore', '', 'Bangalore', 'Karnataka', '562157', '', '8147190570', 'hrsali111@gmail.com'),
(1071, 'NON ISOI MEMBER', 'DR. NAVEEN SHAMNUR', 'Male', 'professor', '2736,2 main 4 cross, M.C.C \"B\" block', '', 'Davangere', 'Karnataka', '577004', '9448455699', '9449822941', 'naveens2005@gmail.com'),
(1072, 'ISOI MEMBER', 'DR. SUNITHA NAVEEN SHAMNUR', 'Female', 'Professor', '2736,2 main 4 cross, M.C.C \"B\" block', 'AC/L/1580/KAR', 'Davangere', 'Karnataka', '577004', '9448455699', '9448455699', 'naveens2005@gmail.com'),
(1073, 'ISOI MEMBER', 'DR. SACHIN RASAL', 'Male', 'Senior Resident', 'B 138, Emerald Park city, Bagsewaniya, Near AIIMS Hospital', 'Applied for', 'Bhopal', 'Madhya Pradesh', '462026', '', '7738992347', 'sachinrasal7@gmail.com'),
(1074, 'STUDENT NON MEMBER', 'DR. GREESHMA C', 'Male', 'POST GRADUATE', 'no.526, 8th cross MCECHS layout, dr.shivaramkaranth nagar', '', 'BENGALURU', 'Karnataka', '560077', '', '9886627884', 'greeshma.c17@gmail.com'),
(1075, 'STUDENT NON MEMBER', 'DR. PABBATI KRISHNA VARDHAN', 'Male', 'POST GRADUATE', 'f-302,h.no:12-2-422/37,priya colony, gudimalkapur hyderabad-28', '', 'hyderabad', 'Andhra Pradesh', '500028', '9985544633', '9742904979', 'krishna.vardhan89@gmail.com'),
(1076, 'STUDENT NON MEMBER', 'DR. PRIYANKA DAS JESABEL', 'Female', 'Post graduate student', 'No31 3rd cross, railway layout ,pilana garden 3rd stage', '', 'Bangalore', 'Karnataka', '560045', '', '8050903937', 'dasjesabel@gmail.com'),
(1077, 'STUDENT NON MEMBER', 'DR. SUSHANT MATH', 'Male', 'POSTGRADUATE STUDENT', 'KRISHNADEVARAYA COLLEGE OF DENTAL SCIENCES,HUNASEMARANAHALLI,', '', 'BANGALORE', 'Karnataka', '562157', '', '9742374870', 'sb_math1988@yahoo.co.in'),
(1078, 'STUDENT NON MEMBER', 'DR. SUDHEER YERRAKULA', 'Male', 'PG STUDENT', 'S/O. VEERAIAH Y KANAPARTHY, NAGULUPPALAPADU (MD) ONGOLE (DT) ANDHRAPRADESH 523180.', '', 'ONGOLE', 'Andhra Pradesh', '523180', '', '9790867237', 'sudheeryerrakula@gmail.com'),
(1079, 'STUDENT NON MEMBER', 'DR. SAMEERA Y', 'Female', 'PostGraduate', 'Marutham Enclave,Block G2, Flat 3, 44, 6th Main Road, Mogapppair Eri Scheme', '', 'Chennai', 'Tamil Nadu', '600037', '', '9894873087', 'ysameera.in@gmail.com'),
(1080, 'STUDENT NON MEMBER', 'DR. SONU ELSA JOHN', 'Female', 'PG STUDENT', 'PARAPPALLIL JOUSE , OMALLOOR P.O PANNIYALLI , PATHANAMTHITTA , KERALA -689647', '', 'PATHANAMTHITTA', 'Kerala', '689647', '', '9940620246', 'bacxsonu@yahoo.com'),
(1081, 'NON ISOI MEMBER', 'DR. GAYATHRIDEVI S K', 'Female', 'ASSITANT PROFESSOR, DEPARTMENT OF PROSTHODONTICS, FACULTY OF DENTAL SCIENCES', '509,12TH A MAIN ROAD A SECTOR YELAHANKA NEW TOWN,BANGALORE', '', 'BANGALORE', 'Karnataka', '560064', '80288462183', '9886762183', 'drgayathridevisk@gmail.com'),
(1082, 'NON ISOI MEMBER', 'DR. ANUMEHA JHA', 'Female', 'TUTOR', '3, MAIDAN PATH CHOUBEY COLONY', '', 'RAIPUR', 'Chhattisgarh', '492001', '', '8817787092', 'ANUMEHAJHA16@GMAIL.com'),
(1083, 'NON ISOI MEMBER', 'DR. MAHENDRA ANANT', 'Male', 'LECTURER', 'DEPARTMENT OF PROSTHODONTICS, GOVERNMENT DENTAL COLLEGE,', '', 'RAIPUR', 'Chhattisgarh', '492001', '', '9993907918', 'mahendra.anant@gmail.com'),
(1084, 'ISOI MEMBER', 'DR. NEERAJ KUMAR CHANDRAKER', 'Male', 'READER', 'GOVERNMENT DENTAL COLLEGE', 'Ac/L/5014/CHHATTISGARH', 'RAIPUR', 'Chhattisgarh', '492001', '7714049389', '9752995399', 'dr_neerajkc@yahoo.com');
INSERT INTO `isoi_delegates` (`delegate_id`, `member_type`, `name`, `gender`, `designation`, `Address`, `member_no`, `city`, `state`, `pincode`, `telephone`, `mobile`, `email`) VALUES
(1085, 'STUDENT NON MEMBER', 'DR. FAIZ MOHAMED TANVEER', 'Male', 'post graduate student', 'no.331, TTK Road, Royapettah', '', 'chennai', 'Tamil Nadu', '600014', '4428117401', '9884464784', 'drtanveermds@gmail.com'),
(1086, 'ISOI MEMBER', 'DR. SAVITHRI', 'Female', 'MDS', 'NO 13, 6TH CROSS,PALACE GUTTAHALLI', '', 'BANGALORE', 'Karnataka', '560003', '', '9740004550', 'drsavithri@rediffmail.com'),
(1087, 'STUDENT NON MEMBER', 'DR. SAVITHA J N', 'Female', 'POST GARDUATE STUDENT', 'NO 46 MIG 2ND STAGE KHB COLONY BASAVESHWARNAGAR', '', 'BENGALURU', 'Karnataka', '560079', '', '9481545141', 'drsavithajn@gmail.com'),
(1088, 'ISOI MEMBER', 'DR. JITHIN B', 'Male', 'Assistant Surgeon District Hospital,Mananthavady, Kerala', 'Shivam, Korakunnu Road, Moozhikkal, Chelavoor P.O, Kozhikode Dist.', 'L/1505/KER', 'Kozhikode', 'Kerala', '673571', '4952731021', '9947554701', 'jb37jb@gmail.com'),
(1089, 'STUDENT NON MEMBER', 'DR. BHARTI WASAN', 'Female', 'pg student', '#5, block E 4, near police station, rajpura town', '', 'rajpura', 'Punjab', '140401', '', '8556951578', 'bhartiwasanxyz@gmail.com'),
(1090, 'ISOI MEMBER', 'DR. ASHISH KAPOOR', 'Male', 'Head of department of', 'A 11 Rose apartment sector 14 rohini', '', 'DELHI', 'Delhi', '110085', '1127550689', '9718990183', 'ashishkapoor1975@rediffmail.com'),
(1091, 'ISOI MEMBER', 'DR. SWATI SACHIN GUNDA', 'Female', 'BDS', 'Savali,H ghatge colony,kadamwadi road , near Lisa hotel,kolhapur 416003', '', 'Kolhapur', 'Maharashtra', '416003', '2641776', '9822323146', 'swatisgunda@gmail.com'),
(1092, 'ISOI MEMBER', 'DR. C JAGADEESH', 'Male', 'BDS,CROWN & BRIDGE SPECIALIST(GERMANY)', '#687,9TH A MAIN,1ST STAGE, INDIRANAGAR, NEAR CMH HOSPITAL, BANGALORE-560038', '#Ac/L/960/KAR', 'BANGALORE', 'Karnataka', '560038', '', '9845044897', 'drcjagadeesh@gmail.com'),
(1093, 'ISOI MEMBER', 'DR. RAVI NARULA', 'Male', 'professor and head', '# 68, dhaliwal colony, opp income tax office, patiala', '', 'patiala', 'Punjab', '147001', '', '9815037127', 'ravinarula10@yahoo.com'),
(1094, 'ISOI MEMBER', 'DR. DAYA S', 'Male', 'Lecturer', '1110/37 Vidyanagar 1st bus stop tarlabalu extension near nandi hostel davangere', 'AC/L/1711/KAR', 'Davangere', 'Karnataka', '577004', '819223057', '9886223059', 'Dayas55@gmail.com'),
(1095, 'ISOI MEMBER', 'DR. GANESH S', 'Male', 'Reader', 'MIG -1319, 1st floor, 9th cross, 2nd main, 2nd stage,viswadathri road, vivekananda nagar', 'Ac / L / 1808/KAR', 'MYSURU', 'Karnataka', '570023', '', '9886722458', 'hidrganesh@gmail.com'),
(1096, 'STUDENT NON MEMBER', 'DR. DIGANTH J AJJUR', 'Male', 'BDS', '#687,9TH A MAIN, 1ST STAGE ,INDIRANAGAR, NEAR CMH HOSPITAL, BANGALORE 560038', '', 'BANGALORE', 'Karnataka', '560038', '', '9845044847', 'diganthajjur@gmail.com'),
(1097, 'NON ISOI MEMBER', 'DR. IBBANI P.P', 'Female', 'BDS,MDS (PERIODONTICS)', '120/y, sadashivanilaya,16th main,3 block, rajajinagar,bangalore,karnataka.', '', 'bangalore', 'Karnataka', '560010', '', '9620132920', 'ibbanipp@gmail.com'),
(1098, 'ISOI MEMBER', 'DR. SHARAT SHETTY', 'Male', 'M.D.S.', 'PROSMILE, A-404, GALLERIA, HIRANANDANI GARDENS, POWAI', '', 'MUMBAI', 'Maharashtra', '400076', '2225797517', '9820418986', 'drsharatshetty@gmail.com'),
(1099, 'STUDENT MEMBER', 'DR. RAJALAKSHMI S', 'Female', 'Prosthodontist', 'No.43, 1st main, 1st cross, Ashirvad Colony, Hormavu main road', '', 'Bangalore', 'Karnataka', '560043', '', '9787870970', 'dr.rajalakshmis@gmail.com'),
(1100, 'STUDENT MEMBER', 'DR. HARSHITHA ALVA', 'Female', 'Prothodontist', '75 Sapthagiri Nilaya 2nd floor 6th Cross 2nd Main J.p.nagar 6th phase', '', 'Bangalore', 'Karnataka', '560098', '', '9986773623', 'drharshitha@gmail.com'),
(1101, 'NON ISOI MEMBER', 'DR. BHUSHAN KALARIA', 'Male', 'b.d.s.', 'cosmetic dental care, 220 city shops, behind p.p. fulvala, Dr yagnik road', '', 'rajkot', 'Gujarat', '360001', '9825340089', '9825340089', 'kalariabhushan1977@gmail.com'),
(1102, 'STUDENT NON MEMBER', 'DR. S.SHOBHANA', 'Female', 'fellowship student', 'OL NO.10, NEW NO.12, PUDUPET GARDEN 2ND LANE , ROYAPETTAH ,', '', 'chennai', 'Tamil Nadu', '600014', '9176820567', '9176820567', 'shobha.suriya@gmail.com'),
(1103, 'STUDENT NON MEMBER', 'DR. V Y SHIVASHANKAR', 'Male', 'FELLOWSHIP STUDENT', 'NO. 6 / 9, FIRST STREET, BALAJI NAGAR, ANAKAPUTHUR', '', 'CHENNAI', 'Tamil Nadu', '600070', '', '7299470762', 'shankar.genius@gmail.com'),
(1104, 'STUDENT NON MEMBER', 'DR. MANASA SREE CHANDANA.C', 'Female', 'fellowship student', 'C.MANASA SREE CHANDANA , D/O.RADHA KUMAR, GOLLALAGUNTA,DOOR.NO.4-21-20/2, MANDAPETA, EAST GODAVARI, A.P', '', 'MANDAPETA', 'Andhra Pradesh', '533308', '', '8309899634', 'doctormanasa94@gmail.com'),
(1105, 'STUDENT NON MEMBER', 'DR. G.DEVIKA', 'Female', 'fellowship student', 'MIG-169,d no:39-33-68,MADHAVADHARA VUDA COLONY.', '', 'VISAKHAPATNAM', 'Andhra Pradesh', '530018', '', '8886848801', 'sanjanadeepu23@gmail.com'),
(1106, 'STUDENT NON MEMBER', 'DR. C.D.SUGANTHI', 'Female', 'fellowship student', '4/106 B, S1, Mcgill foundation , 5th street, saminathan nagar kottivakkam', '', 'chennai', 'Tamil Nadu', '600041', '4442122497', '9884592170', 'cds2912@gmail.com'),
(1107, 'ISOI MEMBER', 'DR. ASHISH GUPTA', 'Male', 'Student', 'T-221 street no 3 Gautampuri delhi 11053', '', 'Delhi', 'Delhi', '110053', '', '8800410696', 'dr.ashishrdgupta@gmail.com'),
(1108, 'STUDENT NON MEMBER', 'DR. SWETHA D', 'Female', 'PG Student in Oral & Maxillofacial Surgery', '#3, Ashirvad, 1st A Main, 3rd B Cross, Gururaj Layout, Doddanekundi, Marathahalli', '', 'Bangalore', 'Karnataka', '560037', '', '9620901518', 'swetha.ramesh@yahoo.co.in'),
(1109, 'ISOI MEMBER', 'DR. BIBHUKESH PANIGRAHI', 'Male', 'DENTAL SURGEON', 'BAIKUNTHA NAGAR 5th lane BERHAMPUR -760001 ODISHA', 'ac/L/1230/OR', 'BERHAMPUR', 'Orissa', '760001', '6802281411', '9937089370', 'bibhukesh@gmail.com'),
(1110, 'ISOI MEMBER', 'DR. NISHA DHADKE', 'Female', 'Senior Dentist', 'navjyotriling chsg, C wing, 202, fimcity road Riddhi gardens, malad east.', '#Ac/L/1512/MAH', 'Mumbai', 'Maharashtra', '400097', '', '9769919687', 'Drnishadhadke@gmail.com'),
(1111, 'ISOI MEMBER', 'DR. ANUJ JAIN', 'Male', 'Senior Resident', 'All India Institute of Medical Sciences', 'Applied For', 'Bhopal', 'Madhya Pradesh', '442024', '', '8055251111', 'dranujinghvi@gmail.com'),
(1112, 'NON ISOI MEMBER', 'DR. DEEPMALA', 'Male', 'SENIOR LECTURER', 'KLE DENTAL COLLEGE', '', 'BANGALORE', 'Karnataka', '56022', '', '9845384202', 'dr_deepmala_s@yahoo.co.in'),
(1113, 'NON ISOI MEMBER', 'DR. IPSHA SINGH', 'Female', 'SENIOR LECTURER', 'KLE INSTITUTE OF DENTAL SCIENCE,YESHWANTPUR', '', 'BANGALORE', 'Karnataka', '560022', '', '9902823778', 'ipsha.s@gmail.com'),
(1114, 'NON ISOI MEMBER', 'DR. SUDHAKAR A', 'Male', 'SENIOR LECTURER', 'KLE INSTITUTE OF DENTAL COLLEGE,YESHWANTPUR', '', 'BANAGALORE', 'Karnataka', '560022', '', '9945961100', 'drsudhakar32@gmail.com'),
(1115, 'NON ISOI MEMBER', 'DR. YAMINI NANDINI', 'Female', 'READER', 'KLE INSTITUTE OF DENTAL SCIENCE, YESHWANTPUR', '', 'BANGALORE', 'Karnataka', '560022', '', '9686036983', 'dryamini_nandini07@yahoo.co.in'),
(1116, 'STUDENT NON MEMBER', 'DR. SIDDHARTH HOSAKERE', 'Male', 'General dentist', '#126, 1st floor, BEML layout, Basaveshwarnagar', '', 'Bangalore', 'Karnataka', '560079', '', '9980895215', 'siddhuhoskere@gmail.com'),
(1117, 'ISOI MEMBER', 'DR. SUPRIYA MANVI', 'Female', 'PROFESSOR', '1702, 14th main 31st cross bsk 2nd stage bangalore', '1011', 'bangalore', 'Karnataka', '560070', '8026715554', '9448145452', 'supriyamanvi@rediffmail.com'),
(1118, 'ISOI MEMBER', 'DR. HARMEET SINGH', 'Male', 'JUNIOR STAFF SURGEON(DENTAL)', 'B-118A,MANSAROVER GARDEN', 'Ac/L/1538/DEL', 'NEW DELHI', 'Delhi', '110015', '9891503181', '9891503181', 'dentistharmeet@gmail.com'),
(1119, 'ISOI MEMBER', 'DR. TUSAR KANTI NAYAK', 'Male', 'Orthodontist', 'Kalinga center for advanced dental care 526 madusudan Nager Bhubaneswar 751012', 'AC/L/1232/Orissa', 'Bhubaneswar', 'Orissa', '751012', '', '9776015050', 'drtusar@gmail.com'),
(1120, 'ISOI MEMBER', 'DR. AMIT KUMAR PRUSTY', 'Male', 'Dentist', 'Abhiram Dental Implant & Orthodontic Centre House No Lt-22,Choudwar,Charbatia,Cuttack', 'Ac/L/1233/Orissa', 'Cuttack', 'Orissa', '754028', '6712494052', '9861047875', 'drkumarprusty@gmail.com'),
(1121, 'STUDENT NON MEMBER', 'DR. MANJUSHA MV', 'Female', 'POST GRADUATE STUDENT', 'GOMATI BLOCK MSR HOSTELS GNANAGANGOTHRI CAMPUS MSRIT POST MSR NAGAR BANGALORE', '', 'BANGALORE', 'Karnataka', '560054', '9538156761', '9538156761', 'manjuniranjana@gmail.com'),
(1122, 'NON ISOI MEMBER', 'DR. SHEFALI JATIN GUPTA', 'Female', 'MDS', 'Harsh multi speciality hospital, Near Mahaveer chauk', '', 'Muzaffarnagar', 'Uttar Pradesh', '253001', '', '8954402912', 'harvir_baba@rediffmail.com'),
(1123, 'ISOI MEMBER', 'DR. JATIN GUPTA', 'Male', 'BDS', 'Hope multi speciality hospital, near Mahaveer chauk.', 'AC/L:1806/UP', 'Muzaffarnagar', 'Uttar Pradesh', '253001', '', '8859405366', 'Shine.dental@yahoo.com'),
(1124, 'ISOI MEMBER', 'DR. HEMANT BAKAL', 'Male', 'Dentist', 'G 2, SARASWATI APTS., KRANTINAGAR, ALTO- PORVORIM GOA', '', 'Porvorim', 'Goa', '403521', '', '9822139176', 'smilestonesgoa@gmail.com'),
(1125, 'ISOI MEMBER', 'DR. P K BARUAH', 'Male', 'Dental surgeon', 'GNB Road', 'AC/L/1478', 'Tinsukia', 'Assam', '786125', '', '9435035602', 'baruahpk03@gmail.com'),
(1126, 'ISOI MEMBER', 'DR. NIKHALESH NILAWAR', 'Male', 'BDS', 'Nilawars multispeciality dental clinic first floor sadoday arcade opposite bank of Baroda dharampeth', 'Ac/L/1130/MAH', 'Nagpur', 'Maharashtra', '440010', '7126615898', '9823076265', 'nilawar.drnikhalesh@gmail.com'),
(1127, 'STUDENT NON MEMBER', 'DR. SWATHI IYENGAR NR', 'Female', 'POST GRADUATE STUDENT', '76/7, 1B &C, HVS HOMES 4, BETWEEN 4TH & 6TH MAIN, 15TH CROSS, MALLESHWARAM', 'non member', 'BANGALORE', 'Karnataka', '560055', '8028387701', '9620700297', 'ranjani.nr@gmail.com'),
(1128, 'ISOI MEMBER', 'DR. ROOPA RAJEEV', 'Female', 'Endodontist and Cosmetic Dentist', '476/A 3rd Stage,3rd Block, Basaveshwara Nagar,Bangalore', '', 'banglore', 'Karnataka', '560079', '23220191', '9886228708', 'drrooparajeev@gmail.com'),
(1129, 'ISOI MEMBER', 'DR. JITENDRA REVAMKAR', 'Male', 'Chief Dental Surgeon', '#476/A,3rd Stage,3rd Block,Basaveshwra Nagar,Bangalore', '', 'Bangalore', 'Karnataka', '560079', '23220191', '9886760182', 'jitendrarevamkar@gmail.com'),
(1130, 'ISOI MEMBER', 'DR. NIGAM BUCH', 'Male', 'MDS Periodontist', 'Sanjivani center for advance dentistry, 3rd floor, Ekta complex', 'L/826/GUJ', 'Rajkot', 'Gujarat', '360005', '2812465354', '2812465354', 'drnigambuch@gmail.com'),
(1131, 'ISOI MEMBER', 'DR. KOMAL MAJUMDAR', 'Female', 'Dentist', '2, gulmohar co op hsg soc sector 6 kopar khairne', '', 'navi mumbai', 'Maharashtra', '400709', '8828348423', '8828348423', 'komalmajumdar@gmail.com'),
(1132, 'ISOI MEMBER', 'DR. DHAWAL GOYAL', 'Male', 'ASSOCIATE PROFESSOR', 'PLOT NO 11, HARI PATH ,DEVI NAGAR,NEW SANGANER ROAD, JAIPUR', '', 'JAIPUR', 'Rajasthan', '302020', '', '9636080006', 'dhawalomfs@gmail.com'),
(1133, 'NON ISOI MEMBER', 'DR. NILLACHANDRA KSHETRIMAYUM', 'Male', 'Consultant Orthodontic', 'Malom Bazar P.O. TULIHAL MALOM TULIYAIMA', '', 'IMPHAL WEST', 'Manipur', '795140', '', '7308920473', 'nillachandra@rediffmail.com'),
(1134, 'ISOI MEMBER', 'DR. ABHISHEK SHAH', 'Male', 'MDS (Perio), Fellow and Diplomate ICOI, ISOI', 'Denticare Dental Care Centre, 2, Mehta Row House, Behind Sargam Shopping Centre, Parle Point', 'Ac/L/1088/GUJ', 'Surat', 'Gujarat', '395007', '', '8238444777', 'abhi2885@gmail.com'),
(1135, 'NON ISOI MEMBER', 'DR. MOHAMMED UMER SHARIEFF', 'Male', 'ORAL AND MAXILLOFACIAL PATHOLOGIST', '37,J.J .RNAGAR MAIN ROAD CHAMRAJPET BANGALORE', 'NON ISOI MEMBER', 'BANGALORE', 'Karnataka', '560018', '', '9535505531', 'md.umer_sharieff@ymail.com'),
(1136, 'NON ISOI MEMBER', 'DR. PRAGYA RAJ', 'Male', 'Senior lecturer', '78 MIG sector-3 barra-2', '', 'Kanpur', 'Uttar Pradesh', '208027', '9886080278', '9886080278', 'Pragya273@gmail.com'),
(1137, 'NON ISOI MEMBER', 'DR. REETIKA GADDALE', 'Female', 'Reader, Dept of Periodontics', 'H.no -6-2-72/71, Flat no -204, Manik Hills Apartments, Manikprabhu Layout', '', 'Raichur', 'Karnataka', '584103', '', '7795733050', 'reetikag_25@yahoo.co.in'),
(1138, 'NON ISOI MEMBER', 'DR. CHARUDATTA NAIK', 'Male', 'Assistant Professor', 'B 104 Ambika CHS V B Phadke Road Mulund East', '', 'Mumbai', 'Maharashtra', '400081', '2225636760', '9819014417', 'csnaik@gmail.com'),
(1139, 'ISOI MEMBER', 'DR. CHETAN DESAI', 'Male', 'PROSTHODONTIST', '3rd Floor, Bombay Mutual Terrace, 534 Sandhurst Bridge, Opera House', 'from society records', 'Mumbai', 'Maharashtra', '400007', '2223613781', '9322875426', 'drchetandesai@gmail.com'),
(1140, 'STUDENT NON MEMBER', 'DR. B.RAMYAKRISHNA', 'Female', 'POST GRADUATE STUDENT', 'AMES Dental college and Hospital, Bijengere Road, Raichur- 584103, Karnataka.', '', 'Raichur.', 'Karnataka', '584103', '', '7996344022', 'bopparamyakrishna008@gmail.com'),
(1141, 'STUDENT NON MEMBER', 'DR. RADHIKA.B', 'Female', 'POST GRADUATE STUDENT', 'AMES Dental college and Hospital, Bijengere Road, Raichur- 584103, Karnataka.', '', 'Raichur.', 'Karnataka', '584103', '9844601813', '9844601813', 'samanyuh@gmail.com'),
(1142, 'STUDENT NON MEMBER', 'DR. SWATI SINGH', 'Female', 'POST GRADUATE STUDENT', 'AMES Dental college and Hospital, Bijengere Road, Raichur- 584103, Karnataka.', '', 'Raichur.', 'Karnataka', '584103', '9482989535', '9482989535', 'swatisingh08d0735@gmail.com'),
(1143, 'STUDENT NON MEMBER', 'DR. MOHAMMED MERAJUDDIN AWESI', 'Male', 'POST GRADUATE STUDENT', 'A.M.ES DENTAL COLLEGE & HOSPITAL, RAICHUR.', '', 'RAICHUR', 'Karnataka', '584103', '', '9886871352', 'merajawesidr@gmail.com'),
(1144, 'STUDENT NON MEMBER', 'DR. MOUMITA PAL', 'Female', 'post graduate student', 'A.M.E s Dental College and Hospital. Bijangera road, Raichur- 584103', '', 'Raichur', 'Karnataka', '584103', '7849062406', '7849062406', 'moumitapalwb@gmail.com'),
(1145, 'STUDENT NON MEMBER', 'DR. SIMANTINI BHATTACHARJEE', 'Female', '1st year PG student', 'A.M.E S Dental College and hospital, Bijangera Road, beside Govt Polytechnic College,', '', 'Raichur', 'Karnataka', '584103', '', '8016939889', 'simantini009@gmail.com'),
(1146, 'ISOI MEMBER', 'DR. VENKATESWARA A REDDY', 'Male', 'PROFESSOR', '140, 3rd main, 1st block, koramangala', '', 'BANGALORE', 'Karnataka', '560034', '8041313828', '9343434393', 'DRVENKI12@GMAIL.com'),
(1147, 'NON ISOI MEMBER', 'DR. D.V.VIDHYASAGAR', 'Male', 'PROFESSOR', '69, SAGAR DENTAL CARE, DEVASANDRA MAIN ROAD, KRISHNARAJAPURAM,', '', 'BANGALORE', 'Karnataka', '560036', '9342819717', '9342819717', 'drsagardv@gmail.com'),
(1148, 'NON ISOI MEMBER', 'DR. CHALASANI ANISH KUMAR', 'Male', 'Dental Implantologist', '40-5/3-10a, Tikkle Road, Labbipet, Vijayawada Andhra Pradesh', '', 'Vijayawada', 'Andhra Pradesh', '520010', '', '9985178528', 'docchalasani@gmail.com'),
(1149, 'NON ISOI MEMBER', 'DR. VIMI M THAPAR', 'Female', 'Dental surgeon', '12 Swargandha CHS Shreenagar Near Tata Fission Thane', 'Do not remember', 'Mumbai', 'Maharashtra', '400604', '2225811708', '9920903925', 'vimithapar67@yahoo.com'),
(1150, 'NON ISOI MEMBER', 'DR. S.P.SINGH', 'Male', 'BDS', '61-A SAKET GARH ROAD HAPUR', '', 'HAPUR', 'Uttar Pradesh', '245101', '7500989900', '9457858602', 'drspsingh32@gmail.com'),
(1151, 'ISOI MEMBER', 'DR. ARMAAN BHIWANI', 'Male', 'Specialist Implantologist', 'Armaan Dental Clinic, Rohtak Gate', '', 'Bhiwani', 'Haryana', '127021', '1664253399', '9813412186', 'jangraarmaan@gmail.com'),
(1152, 'NON ISOI MEMBER', 'DR. RAGHAVENDRA REDDY YELLANUR', 'Male', 'Reader', 'H no 87/777/1, lecturers colony,B-camp', '', 'Kurnool', 'Andhra Pradesh', '518002', '8518275562', '8019472345', 'rimpo2001@yahoo.co.in'),
(1153, 'ISOI MEMBER', 'DR. ABHILASH', 'Male', 'READER', 'Sudanta Dental Clinic & Implant Centre, 1100, FIRST FLOOR Opp. To Rajkamal Theatre, Shivarampet, Vinoba Road', 'Ac/L/1769/KAR', 'MYSORE', 'Karnataka', '570001', '8214257026', '9480327026', 'drabhilashmysore@gmail.com'),
(1154, 'ISOI MEMBER', 'DR. SRINIDHI', 'Male', 'Periodontist', 'Rajiv dental clinic hanumanthnagar Bangalore', 'L341/KAR', 'Bangalore', 'Karnataka', '560023', '', '9845381195', 'd.srinidhi@gmail.com'),
(1155, 'ISOI MEMBER', 'DR. ASHAY GOKHALE', 'Male', 'DENTIST', '32/2B ERANDWANE AMOL', '', 'PUNE', 'Maharashtra', '411004', '', '9822338355', 'gokhaleashay@yahoo.com'),
(1156, 'ISOI MEMBER', 'DR. VEERENDRA KUMAR B', 'Male', 'PROF & HOD', '266,4TH MAIN,BRINDAVAN EXTENSION ARAKERE MICO LAYOUT B G ROAD', '', 'BANGALORE', 'Karnataka', '560076', '8026485946', '9341215303', 'drveeru@yahoo.com'),
(1157, 'NON ISOI MEMBER', 'DR. GOURAV KUMAR SAHU', 'Male', 'MDS, ENDODONTIST', 'SMILE DESIGN DENTAL CARE , COURTPETA SQUARE , OPPOSITE TO LORD JAGANNATH TEMPLE', '', 'BERHAMPUR', 'Orissa', '760004', '6802280096', '9902165372', 'dr.gourav4852@gmail.com'),
(1158, 'STUDENT NON MEMBER', 'DR. ANITA PAL', 'Female', 'POST GRADUATE TRAINEE', 'RAJA RAJESWARI DENTAL COLLEGE AND HOSPITAL, RAMOHALLI CROSS, MYSORE ROAD, KUMBALGODU', '', 'BANGALORE', 'Karnataka', '50074', '', '7718977070', 'anitapal602@gmail.com'),
(1159, 'NON ISOI MEMBER', 'DR. MADHAN', 'Male', 'consultant oral and maxillofacial surgeon', 'neeraja woods, #8, flat no. f1,5th cross, kammanahalli main road', '', 'bangalore', 'Karnataka', '560084', '8025420818', '9845678810', 'drmadhang@gmail.com'),
(1160, 'NON ISOI MEMBER', 'DR. NAGESH DOLARE', 'Male', 'MDS', 'Flat no 1, Aman Apartment,opp kalika temple, old agra road, Nashik', '', 'NASHIK', 'Maharashtra', '422001', '', '9860207046', 'nagesh_dolare@yahoo.com'),
(1161, 'ISOI MEMBER', 'DR. MADHURI GIRISH', 'Female', 'DENTAL SURGEON', 'MAGIPRIYA, D/4,3RD CROSS, K H B COLONY, NEAR MAGADI ROAD, BASAVESHWARANAGAR', 'L/1724/KAR', 'BANGALORE', 'Karnataka', '560079', '8023158549', '9845915857', 'iamdrmadhuri@yahoo.in'),
(1162, 'NON ISOI MEMBER', 'DR. GIRISH K S', 'Male', 'PROFESSOR', 'MAGIPRIYA, D/4,3RD CROSS, K H B COLONY, NEAR MAGADI ROAD, BASAVESHWARANAGAR', '', 'BANGALORE', 'Karnataka', '560079', '9845570310', '9845570310', 'drgirishks@yahoo.com'),
(1163, 'STUDENT NON MEMBER', 'DR. JIJO JACOB', 'Male', 'POST GRADUATE STUDENT ORAL & MAXILLOFACIAL SURGERY', 'RAJARAJESHWARI DENTAL COLLEGE & HOSPITAL # 14 RAMOHALLI CROSS , MYSORE ROAD KUMBALGODU BANGALORE', '', 'BANGALORE', 'Karnataka', '560074', '', '8050049355', 'dr.jijo02@gmail.com'),
(1164, 'STUDENT NON MEMBER', 'DR. TARUN NAGPAL', 'Male', 'PG TRAINEE', 'TF-301 SPLENDOUR APARTMENT BEHIND AMBEDKAR DENTAL COLLEGE LLOYD ROAD COOKE TOWN BANGALORE,KARNATAKA', '', 'BANGLORE', 'Karnataka', '560005', '', '7829288813', 'tnagpalkailaras@gmail.com'),
(1165, 'STUDENT NON MEMBER', 'DR. KATARI.ALOK CHANDAR', 'Male', 'PG student', '89/1,1st cross vivekanandha nagar,jayabharath nagar', '', 'Bangalore', 'Karnataka', '560033', '8123165226', '8123165226', 'Alokkatari@email.com'),
(1166, 'STUDENT NON MEMBER', 'DR. JADEJA KAJALBA BHARATSINH', 'Female', 'PG STUDENT', 'TO, JADEJA KAJALBA, C/O MR. CHANDAR, HOUSE NO: 31, 2ND FLOOR, 4TH CROSS JAY BHARATNAGAR', '', 'BANGALORE', 'Karnataka', '560033', '', '8296615748', 'jadejakajal9@gmail.com'),
(1167, 'STUDENT NON MEMBER', 'DR. PRIYESH SHAH', 'Male', 'PG TRAINEE', '8, KASTUR BHUVAN,2ND FLOOR,PANDITA RAMABAI ROAD,GAMDEVI,MUMBAI', '', 'MUMBAI', 'Maharashtra', '400007', '2223806256', '9967265086', 'shahpriyesh90@gmail.com'),
(1168, 'STUDENT NON MEMBER', 'DR. DAISY.L', 'Female', 'PG STUDENT', 'NO. 50, HUTCHINS ROAD EXTENSION, ST. THOMAS TOWN, BANGALORE-84', '', 'BANGALORE', 'Karnataka', '560084', '', '9738714057', 'drdaisyloyola@gmail.com'),
(1169, 'ISOI MEMBER', 'DR. PANKAJ SHAH', 'Male', 'MDS', 'Sahaj dental clinic Tagore road near bank of Baroda astron chowk', '1176', 'rajkot', 'Gujarat', '360001', '2463666', '9426783421', 'shahpankaj35@gmail.com'),
(1170, 'ISOI MEMBER', 'DR. VINIT PANDHI', 'Male', 'MDS', '9/E, Hari niwas, Pushtikar soc., Patel estate road, Jogeshwari West', 'Ac/L/1613/MAH', 'Mumbai', 'Maharashtra', '400102', '', '9819733990', 'drvinitp@hotmail.com'),
(1171, 'NON ISOI MEMBER', 'DR. SRINIVAS GADIPELLY', 'Male', 'professor', 'Flat 404 sagacity heights Tilak Nagar , new Nallakunta', '', 'hyderabad', 'Andhra Pradesh', '500004', '9948806974', '9948806974', 'apollomaxfacs@gmail.com'),
(1172, 'STUDENT NON MEMBER', 'DR. VIVEK BAGGA', 'Male', 'mds', '12/10 A FIRST FLOOR , MOUNAGURUMUTT TEMPLE ROAD COX TOWN', '', 'BANGALORE', 'Karnataka', '56005', '9972182453', '9972182453', 'drvivekbagga@gmail.com'),
(1173, 'ISOI MEMBER', 'DR. BHATAWADEKAR MAHESH MADHAV', 'Male', 'Dentist', '215,Raja Rammohan Roy Rd, opp Vidyarthi Book Depot,Girgaum', '', 'mumbai', 'Maharashtra', '400004', '23876074', '9820084929', 'maheshdoc6@gmail.com'),
(1174, 'NON ISOI MEMBER', 'DR. DINESH D', 'Male', 'Professor', '#1,service road,remco layout,Vijaynagar', '', 'Bangalore', 'Karnataka', '560040', '23403052', '9900599759', 'drdineshd@yahoo.com'),
(1175, 'ISOI MEMBER', 'DR. ALKA GUPTA', 'Female', 'Professor', 'D 2 HIG Behind shopping complex AB Road Indore 452010 MP', '', 'Indore', 'Madhya Pradesh', '452010', '917312551066', '9826290293', 'dr.alka2000@gmail.com'),
(1176, 'NON ISOI MEMBER', 'DR. VIKAS JAIN', 'Male', 'Periodontist', 'SG Jain Multispeciality Dental Clinic, #17, Devanga High School Road, RS Puram', '', 'COIMBATORE', 'Tamil Nadu', '641002', '', '9443251118', 'Vikasjaindent@gmail.com'),
(1177, 'ISOI MEMBER', 'DR. AVADHESH BHARDWAJ', 'Male', 'President Cosmetic dental surgery centre', 'Avyukta Advance dental Solution, Shop Number 3, Barkha Bahar socitey, Near Videocon tower, Thakur complex, Kandivali east', 'L/1174/MAH', 'mumbai', 'Maharashtra', '400066', '9967650306', '9967650306', 'bhardwajavadh@gmail.com'),
(1178, 'ISOI MEMBER', 'DR. RUTUPARNA SASANE', 'Male', 'Reader', '1st floor shree swami maruti Niwas opp maruti mandir ShivajI road', '', 'Panvel', 'Maharashtra', '410206', '', '9021621337', 'drsasane27@gmail.com'),
(1179, 'NON ISOI MEMBER', 'DR. SUNIL HM', 'Male', 'Dentist', 'Dr.Sunil s Dental and Implant care, First floor Arkis Arcade, Main Road, Tilak Nagar', '', 'Shimoga', 'Karnataka', '577201', '8182403003', '9886955002', 'sunil.anavatti@gmail.com'),
(1180, 'NON ISOI MEMBER', 'DR. BYJU PAUL KURIAN', 'Male', 'PROFESSOR', 'ANNOOR DENTAL COLLEGE MUVATUPUZHA', '', 'COCHIN', 'Kerala', '686673', '', '9447049455', 'dr.byjupaulkurian@gmail.com'),
(1181, 'ISOI MEMBER', 'DR. BIJU PHILIP', 'Male', 'Periodontist', 'Vettickattil Dental Clinic, Kappalandimukku, Mattancherry, Kochi -682002', 'AC/L/1403/KER', 'Kochi', 'Kerala', '682002', '914842220848', '9447760848', 'sushabiju@yahoo.co.in'),
(1182, 'NON ISOI MEMBER', 'DR. JOSE PAUL', 'Male', 'Professor and Head', 'Dr pauls speciality dental clinic, Medical mission Junction, kolenchery', '', 'kochi', 'Kerala', '682311', '', '9447160069', 'drjospol@gmail.com'),
(1183, 'STUDENT MEMBER', 'DR. SWATHI SRIDHAR', 'Female', 'General dentist', '#4,first floor,10,manjunatha colony,JP Nagar 2nd phase', '', 'Bangalore', 'Karnataka', '560078', '8026595712', '9538005674', 'Swathi.anilover@gmail.com'),
(1184, 'ISOI MEMBER', 'DR. RAVI BHAYANA', 'Male', 'IMPLANTOLOGIST', 'ODON DENTAL CARE,,UNITNO.15-16 GAUR GREEN CITY , GAUR GRAVITY, VAIBHAV KHAND,INDIRAPURAM,', '', 'GHAZIABAD', 'Uttar Pradesh', '201014', '1204134407', '9811256763', 'rvbhayana@yahoo.com'),
(1185, 'ISOI MEMBER', 'DR. VIJAY KHANDELWAL', 'Male', 'ORAL IMPLANTOLOGIST', '7,MAHARAJA HARI SINGH NAGAR NEAR BHERUJI CHOURAYA JODHPUR(RAJASTHAN)342001', '1689/RAJ', 'JODHPUR', 'Rajasthan', '342001', '9414358288', '9414358288', 'DRVIJAY8288@GMAIL.com'),
(1186, 'NON ISOI MEMBER', 'DR. PREETHI', 'Female', 'oral and maxillofacial surgeon', 'tower 7a, 404, Godrej woodsman estate, hebbal', '', 'bangalore', 'Karnataka', '560024', '', '9900473554', 'lakshminarayanan.preethi@gmail.com'),
(1187, 'ISOI MEMBER', 'DR. T. KRISHNA MOHAN', 'Male', 'Professor', 'Sibar Institute of Dental Sciences, Takkellapadu, Guntur', '', 'Guntur', 'Andhra Pradesh', '522509', '', '9848885655', 'krishna_t1959@yahoo.co.in'),
(1188, 'ISOI MEMBER', 'DR. CHANDAN S N', 'Male', 'Reader', '1455, Sanje Ravi Road, C & D Block, Kuvempunagar, Mysore', '606', 'Mysore', 'Karnataka', '570023', '', '9448307430', 'drchandansn@gmail.com'),
(1189, 'ISOI MEMBER', 'DR. TATHAGAT SINGH', 'Male', 'READER', 'ADVANCED DENTAL CARE CENTRE BELOW MOTI MAHAL RESTAURANT OPPOSITE NILGIRI BHAWAN NEAR PANCHMUKHI HANUMAN MANDIR EAST BORING CANAL ROAD PATNA', 'Ac/L/1138/BIHAR', 'PATNA', 'Bihar', '800001', '6122532187', '9955187187', 'dr.tathagat@yahoo.co.in'),
(1190, 'ISOI MEMBER', 'DR. RAGHAVENDRA PIDAMALE', 'Male', 'Reader, Dept of Pedodontics, KVGDC Sullia', 'Sri Durga Specialty Dental Clinic & Impant Centre Opp Bus Stand PN complex', '', 'Belthangady', 'Karnataka', '574214', '', '9448203610', 'drpidamale@yahoo.com'),
(1191, 'NON ISOI MEMBER', 'DR. SHAHEEN NIAZ', 'Male', 'Doctor', 'Modern dental specialty centre Puthoor road Panoor', '', 'Thalassery', 'Kerala', '670692', '4906066333', '9846090995', 'drshaheenniaz@gmail.com'),
(1192, 'NON ISOI MEMBER', 'DR. PREETHY MENON S', 'Female', 'Prosthodontist', '#92, 5th A cross, 3rd main, HIG colony, Dollars Colony, RMV 2nd Stage', '', 'Bangalore', 'Karnataka', '560094', '', '9844094059', 'preethymenons@gmail.com'),
(1193, 'ISOI MEMBER', 'DR. LOKESH BABU K T', 'Male', 'Professor', 'Dr.Lokesh Babu No.976, Ashirvad enclave, Flat no.1c, 8 th cross, 24 th main, HSR layout, sector- 1 Bangalore 560102', '', 'Bangalore', 'Karnataka', '560102', '', '9845659666', 'dr.lokesh13@yahoo.com'),
(1194, 'NON ISOI MEMBER', 'DR. CHAITRA PATIL', 'Female', 'MDS', 'DEPT OF ORAL N MAXILLOFACIAL SURGERY, KCDS, MVIT CAMPUS, YALAHANKA', '', 'BANGALORE', 'Karnataka', '562157', '', '9620096936', 'chaitra.appasaheb@gmail.com'),
(1195, 'ISOI MEMBER', 'DR. BIPIN CHANDRA REDDY', 'Male', 'ASSOCIATE PROFESSOR', '70,2nd block,3rd cross,koramangala', '', 'bangalore', 'Karnataka', '560034', '8025530336', '9845198582', 'bipinreddy@gmail.com'),
(1196, 'NON ISOI MEMBER', 'DR. MINAL MAHANTSHETTY', 'Female', 'Private practitioner', '#13 Naveen Residency, 2nd Main Road, Amarjyoti layout, Cholanagar, RT Nagar', '', 'Bangalore', 'Karnataka', '560032', '', '9844052355', 'shettyminal@gmail.com'),
(1197, 'ISOI MEMBER', 'DR. SACHEEV NANDA', 'Male', 'MDS', '201 chetna apartments, East street', '', 'Pune', 'Maharashtra', '411001', '', '9822291447', 'sacheev@gmail.com'),
(1198, 'ISOI MEMBER', 'DR. PREM NANDA', 'Male', 'MDS', '201 chetna apartments, East street', '', 'Pune', 'Maharashtra', '411001', '', '9890030183', 'drpremnanda@gmail.com'),
(1199, 'STUDENT NON MEMBER', 'DR. NALLURI CHARLETTE DEENA', 'Female', 'Postgraduate student', 'c/o B.Bullaiah, Vinobhanagar, 1st lane, old guntur', '', 'Guntur', 'Andhra Pradesh', '522001', '', '7674009666', 'deenabharath168@gmail.com'),
(1200, 'STUDENT NON MEMBER', 'DR. HARIPRIYANKA KUCHIPUDI', 'Female', 'Postgraduate student', '#222, 1st main, 2nd stage, west of chord road', '', 'Bangalore', 'Karnataka', '560086', '', '9945500372', 'drpriya.kuchipudi@gmail.com'),
(1201, 'ISOI MEMBER', 'DR. DILIP D NAKRANI', 'Male', 'BDS', '59 shantivan society, L.h. road', 'Ac/L/1675/GUJ', 'surat', 'Gujarat', '395006', '9099720759', '9099720759', 'dilipnakrani@gmail.com'),
(1202, 'ISOI MEMBER', 'DR. NISHIT PATEL', 'Male', 'BDS,Implantologist', 'M/21,Krishna Comp,Near Sardar Bridge, Gujarat Gas Circle,Adajan', 'Ac/L/1153/GUJ', 'surat', 'Gujarat', '395009', '9426393263', '9426393263', 'ndpatelsurat@gmail.com'),
(1203, 'ISOI MEMBER', 'DR. RAJAT BHARGAVA', 'Male', 'DIRECTOR', 'SMILES UNLIMITED DENTAL CENTRE 27-A , VIKAS NAGAR , LAKHANPUR,', 'AC/L/1544/UP', 'KANPUR', 'Uttar Pradesh', '208024', '9336493236', '9336493236', 'drrajatbhargava@gmail.com'),
(1204, 'ISOI MEMBER', 'DR. HARDIK KAVATHIA', 'Male', 'B.D.S Implantologist', 'HK Dental Implant Centre,307,third floor, western business hub,green city road,behind trinity business park,pal,adajan.,', 'Ac/L/1685/GUJ', 'surat', 'Gujarat', '395009', '9726312241', '9726312241', 'hhhh2775@gmail.com'),
(1205, 'ISOI MEMBER', 'DR. DIGVIJAYA PRAVEEN PATIL', 'Male', 'MDS (Prosthodontics)', 'Speciality Dental Care, Shums Plaza, Shaupuri 4th lane', '', 'Kolhapur', 'Maharashtra', '416001', '9604685059', '9604685059', 'drdppatil@gmail.com'),
(1206, 'NON ISOI MEMBER', 'DR. GOVIND RAMESH CHANGULE', 'Male', 'Assistant professor', '15,kranti sadan, moreshwar housing society,garkheda, Aurangabad,maharashta', '', 'AURANGABAD', 'Maharashtra', '431005', '9923182345', '9923182345', 'drgovindchangule@gmail.com'),
(1207, 'NON ISOI MEMBER', 'DR. PREETI MAURYA', 'Female', 'Dentist', 'E-1404, Vaishnavi Nakshatra, Tumkur Road, Yeshwanthpur, Bangalore-560022', '', 'Bangalore', 'Karnataka', '560022', '', '9739480850', 'preetimaurya.bvp@gmail.com'),
(1208, 'ISOI MEMBER', 'DR. MANJUNATH.S.B.', 'Male', 'prosthodontist', '511,\"ANUGRAHA\", 17th Cross,4th Main, 4th Phase,J.P.Nagar.', 'AC/L/1650/KAR', 'Bangalore', 'Karnataka', '560041', '8026532454', '9845460423', 'sbmnath@ymail.com'),
(1209, 'ISOI MEMBER', 'DR. ROHIT SRIKANTHAN', 'Male', 'READER', '#1348, SAI KUTEERA, TF-7 Chikkallasandra', '1790/KAR', 'Bangalore', 'Karnataka', '560061', '', '9845439046', 'rohit.srikanthan@gmail.com'),
(1210, 'NON ISOI MEMBER', 'DR. VIVEK BHAT G.K', 'Male', 'consultant oral & maxillofacial surgeon & implantologist', 'kombraje,houseN0:513, 12 A MAIN ROAD, YELAHANKA NEWTOWN', '', 'BENGALURU', 'Karnataka', '560064', '8028462310', '9845218743', 'vivekbhatfaciomax@gmail.com'),
(1211, 'NON ISOI MEMBER', 'DR. SHRADDHA RANI', 'Female', 'Senior lecturer', 'Flat no 302, block A, Vamika enclave, Murlichak, Jagdeo path. PO- BV College', '', 'Patna', 'Bihar', '800014', '', '9934782262', 'shraddha.bds@gmail.com'),
(1212, 'NON ISOI MEMBER', 'DR. ELAMPAVAI.E', 'Female', 'ORAL PATHOLOGIST', '#748(247/2),M.V.I ROAD,D.V.G ROAD 3RD CROSS,B.T.S LAYOUT,AREKERE', '', 'BANGALORE', 'Karnataka', '560076', '', '9886708263', 'elampavai.e@gmail.com'),
(1213, 'NON ISOI MEMBER', 'DR. ELANANGAI.E', 'Female', 'PROSTHODONTIST', '#748(247/2),M.V.I.ROAD,D.V.G ROAD 3RD CROSS,B.T.S LAYOUT,AREKERE', '', 'BANGALORE', 'Karnataka', '560076', '', '9886774163', 'elanangai.sing@gmail.com'),
(1214, 'NON ISOI MEMBER', 'DR. S R PREM', 'Male', 'GENERAL DENTIST', 'DENTAL CARE CENTRE NO 165 GROUND FLOOR 9TH CROSS INDIRANAGAR I STAGE', '', 'BANGALORE', 'Karnataka', '560038', '8042042538', '9845092809', 'gprem73@hotmail.com'),
(1215, 'ISOI MEMBER', 'DR. M C SHARMA', 'Male', 'Professor', 'Gold Signature, 95 Mosque Road, Fraser Town', 'L/750/KAR', 'Bangalore', 'Karnataka', '560005', '25801212', '9483500001', 'colonelsdentalspa@gmail.com'),
(1216, 'NON ISOI MEMBER', 'DR. BINU MATHEWS', 'Male', 'DENTIST', 'GRACE FAMILY DENTAL CLINIC NO 1 DINNUR MAIN ROAD R T NAGAR NEXT TO R T NAGAR PUBLIC SCHOOL', '', 'Bangalore', 'Karnataka', '560032', '23334633', '9483764633', 'mygracedental@gmail.com'),
(1217, 'ISOI MEMBER', 'DR. UDAY SHETTY', 'Male', 'BDS', '2 Anil Apt MTNL Lane Dadar West', '', 'Mumbai', 'Maharashtra', '400028', '222438181', '9820858181', 'drudayshetty@yahoo.com'),
(1218, 'ISOI MEMBER', 'DR. PRAVEEN DORLE', 'Male', 'DR', 'DORLE DENTAL CLINIC ,G2, Vishwas plaza,OPP Anand nursing home, Sangli Road MIRAJ', 'AC/L/1648/MAH', 'MIRAJ', 'Maharashtra', '416410', '2332211955', '9372111955', 'Ashmiarhan@gmail.com'),
(1219, 'NON ISOI MEMBER', 'DR. ANUPAMA C', 'Female', 'Assistant professor', 'Dept of Prosthodontics JSS Dental College and Hospital S S Nagar', '', 'Mysore', 'Karnataka', '570015', '9379463612', '9379463612', 'dranupamavenu@gmail.com'),
(1220, 'ISOI MEMBER', 'DR. NK KUMAWAT', 'Male', 'Director', 'NK Dental Hospital 11 greater kailash colony behind Apex Mall Lalkothi Tonk Road Jaipur', 'Ac/L/530/R', 'jaipur', 'Rajasthan', '302015', '141274161', '9414717666', 'drnkkumawat@gmail.com'),
(1221, 'NON ISOI MEMBER', 'DR. VISHALAKSHI NAGARAJ', 'Female', 'Assistant implantologist cum business manager designation', 'No 7, 202, 2nd floor, 5th main, 14th cross, wilson garden', '', 'Bangalore', 'Karnataka', '560030', '', '9448419636', 'dr.vishalakshi@rediffmail.com'),
(1222, 'NON ISOI MEMBER', 'DR. PURVA BAKSHI', 'Female', 'Consultant Periodontologist', 'Vivekanand Dental Clinic, Vinekanand General Hospital, Deshpande Nagar,', '', 'Hubli', 'Karnataka', '580029', '', '7768803434', 'purvabakshi@gmail.com'),
(1223, 'ISOI MEMBER', 'DR. MIHIR KULKARNI', 'Male', 'Assistant Professor', 'Department of Periodontics, SDM College of Dental Sciences, Sattur, Dharwad - 580009', 'AC/L/1475/KAR', 'Hubli-Dharwad', 'Karnataka', '580009', '9886484039', '9886484039', 'mihir.mrk271@gmail.com'),
(1224, 'ISOI MEMBER', 'DR. MADHUMATHI SINGH', 'Female', 'professor and head', '107, 1 main, 1 cross2nd stage , nagarbhavi,', 'AC/L/958/KAR', 'bangalore', 'Karnataka', '560040', '', '9844116475', 'madhumati_dr@rediffmail.com'),
(1225, 'NON ISOI MEMBER', 'DR. SM KOTRASHETTI', 'Male', 'Professor and head d', 'Department of oral surgery KLE dental college and hospital', '', 'Bengaluru', 'Karnataka', '590001', '', '9448116959', 'kotra27@gmail.com'),
(1226, 'ISOI MEMBER', 'DR. NEELKANT WARAD', 'Male', 'MDS-OMFS, PROF & HOD', 'WARAD HITECH DENTAL CLINIC, OPP PREM PLYWOOD, NEAR MILAN MEDICALS, SHIVAJI CIRCLE, M G ROAD, VIJAYAPUR', 'Active life 1784 karnataka', 'Bijapur', 'Karnataka', '586101', '8352257949', '9448102949', 'drwarad@yahoo.com'),
(1227, 'ISOI MEMBER', 'DR. MAHANTESHA', 'Male', 'ASSOCIATE PROFFESSOR', 'NANDI JEWELS APPARTMENT,FLAT NO 202,SITE NO 4, 12TH A CROSS,16TH MAIN.BTM 2ND STAGE', '', 'BANGALORE', 'Karnataka', '560076', '', '9844611562', 'mahanperio@gmail.com'),
(1228, 'NON ISOI MEMBER', 'DR. BINDU C RAMESH', 'Female', 'Oral surgeon', 'D.no-950, 1st main, 3rd cross KN Extension yeshwantpur', '', 'Bangalore', 'Karnataka', '560022', '', '9740093663', 'binduramesh80@yahoo.com'),
(1229, 'NON ISOI MEMBER', 'DR. MUQEET BAIG', 'Male', 'Oral surgeon', 'No-7/2, langford garden richmond town', '', 'bangalore', 'Karnataka', '560025', '', '9844336678', 'muqeetbaig7@gmail.com'),
(1230, 'NON ISOI MEMBER', 'DR. RUPALI PANPATE', 'Female', 'General Practicer', 'SA407,NAL campus, new scientist apartment', '', 'Bangalore', 'Karnataka', '560017', '', '9019857757', 'drrupalipanpate@gmail.com'),
(1231, 'NON ISOI MEMBER', 'DR. MANJUNATH GS', 'Male', 'Reader', 'Emerald apartment no-104 flat no - 302, 3rd block, HRBR layout', '', 'Bangalore', 'Karnataka', '560043', '', '9886238564', 'manjunathmaxsac@gmail.com'),
(1232, 'ISOI MEMBER', 'DR. VEERAPPAN PERIAKARUPPAN', 'Male', 'genaral practioner', 'c 146 6th cross thillaninager', '', 'trichy', 'Tamil Nadu', '620018', '9843064970', '9843064970', 'ctvrperi@yahoo.com'),
(1233, 'ISOI MEMBER', 'DR. B SRINIVASA RAO', 'Male', 'MDS', 'DR B SRINIVAS RAO, B 101, KEERTHI RIVERA. 6TH G CROSS, KAGGADASPURA, CV RAMANNAGAR BANGLORE 93', '954', 'BANGLORE', 'Karnataka', '560093', '8040912187', '9980477725', 'drsrinivasmds@gmail.com'),
(1234, 'STUDENT MEMBER', 'DR. SHANTIPRIYA REDDY', 'Female', 'Professor and Head of Department', 'Dr. Syamala Reddy Dental College and Research Centre.', '', 'Banglore', 'Karnataka', '560037', '', '9845798131', 'priyaperio28@yahoo.co.in'),
(1235, 'ISOI MEMBER', 'DR. KARTHIKEYAN BV', 'Male', 'Reader', '#13, 6th c cross sai ram layout major sandeep unnikrishnan road Attur, Yelahanka', '1046', 'Bangalore', 'Karnataka', '560005', '8029720737', '9449545157', 'drkarthikeyanbv@gmail.com'),
(1236, 'ISOI MEMBER', 'DR. TEJRAJ P KALE', 'Male', 'Professor', 'Shivneri, Plot No 61/62, Jadhav Nagar, Near NCC Office, Belagavi', '1781', 'Belagavi', 'Karnataka', '590001', '8312422891', '9448472891', 'tejrajkale@yahoo.com'),
(1237, 'NON ISOI MEMBER', 'DR. SHARON COLACO DIAS', 'Female', 'PROFFESOR', 'E-18,EPSILON VILLAS,YEMLUR MAIN ROAD,BANGALORE-560037', '', 'BANGALORE', 'Karnataka', '560037', '', '9886199281', 'drsharondias@gmail.com'),
(1238, 'ISOI MEMBER', 'DR. MADHUSUDAN KRISHNA', 'Male', 'Professor and H.O.D, dept of public health dentistry', '15/2, flat 204, pradhan wren apts, 8th main, RPC layout, Vijayanagar 2nd stage', '', 'Bangalore', 'Karnataka', '560040', '', '9986682200', 'drmadhkris@gmail.com'),
(1239, 'ISOI MEMBER', 'DR. G PRIYA LOCHANA', 'Female', 'DENTAL SURGEON', 'New 55/old 25, Agraharam st., chintadripet', '#Ac/L/1339/TN', 'CHENNAI', 'Tamil Nadu', '600002', '4428456850', '9941413881', 'priyalochana.87@gmail.com'),
(1240, 'ISOI MEMBER', 'DR. HARISH', 'Male', 'Professor', 'Department Of Prosthodontics Rajarajeswari dental college and hospital', '', 'bangalore', 'Karnataka', '560040', '', '9880310009', 'harish2869@yahoo.com'),
(1241, 'ISOI MEMBER', 'DR. M CHAMUNDEESWARI', 'Female', 'DENTAL SURGEON', 'New 55/old 25,Agraharam st., chintadripet chennai-2', '#Ac/L/1188/TN', 'chennai', 'Tamil Nadu', '600002', '4428456850', '9884097104', 'mceswari@yahoo.co.in'),
(1242, 'ISOI MEMBER', 'DR. SANKALP MITTAL', 'Male', 'Asst professor', '604, Gautam marg, Nirman nagar AB,', '', 'Jaipur', 'Rajasthan', '302019', '', '9828341051', 'drsankalpmittal@yahoo.com'),
(1243, 'NON ISOI MEMBER', 'DR. CHAITANYA', 'Female', 'Oral & maxillofacial surgeon', '#38SVGNSS layout Near water tank Basaveshwaranagar', '', 'Bangalore', 'Karnataka', '560079', '', '9880134141', 'Drchaitanya.s.h@gmail.com'),
(1244, 'NON ISOI MEMBER', 'DR. ADARSH C.M.', 'Male', 'PROFESSOR', '19/64, 5TH MAIN, 5TH CROSS, N R COLONY, BULL TEMPLE ROAD', '654', 'BANGALORE', 'Karnataka', '560019', '8026677998', '9845451585', 'cmadarsh@yahoo.com'),
(1245, 'ISOI MEMBER', 'DR. SRIHARI. V', 'Male', 'Reader', 'T-06, Krishna Greens Apt, Doddabommasandra', '', 'Bangalore', 'Karnataka', '560097', '8040948653', '9916898484', 'vsrihari78@yahoo.com'),
(1246, 'NON ISOI MEMBER', 'DR. SOUMYA B G', 'Female', 'Professor', '#710,3A cross, 7th main, HRBR layout, I block, Kalyanagar.', '', 'Bangalore', 'Karnataka', '560043', '', '9886120257', 'drbgsoumya@gmail.com'),
(1247, 'ISOI MEMBER', 'DR. JOHNSON DLIMA', 'Male', 'PROFESSOR', 'VAILANKANNI VILLA, CHURCH ROAD KUNDAPURA', '', 'UDUPI DISTRICT', 'Karnataka', '576201', '9048650447', '9890441127', 'dlimajohnson@hotmail.com'),
(1248, 'STUDENT NON MEMBER', 'DR. PULLURI ANUDEEP GUPTHA', 'Male', 'POST GRADUATE IN ORAL AND MAXILLOFACIAL SURGERY', 'H.no : 35/2, II floor , Hutchins road 6 Th cross , Saint Thomas town', '', 'Bangalore', 'Karnataka', '560084', '9066582505', '9066582505', 'anumaxfac@gmail.com'),
(1249, 'NON ISOI MEMBER', 'DR. KRANTHI KUMAR S', 'Male', 'MDS', 'DEPT. OF ORAL SURGERY KCDS, MVIT CAMPUS YALAHANKA', '', 'BANGALORE', 'Karnataka', '562157', '', '9036524257', 'sidde.kranthi@gmail.com'),
(1250, 'NON ISOI MEMBER', 'DR. GAURAV PATEL', 'Male', 'Private Practicenor', 'C 401, DNA Iris Apartment, Nellurahalli Borewell Foad, Whitefield Bangalore 560066 Karnataka India', '', 'Bangalore', 'Karnataka', '560066', '', '9243323626', 'searchdrgaurav@gmail.com'),
(1251, 'ISOI MEMBER', 'DR. D.SATYANARAYANA', 'Male', 'periodontist', '26/3 RT , saidabad colony , Near ram temple arch', 'L/970/AP', 'Hyderabad', 'Andhra Pradesh', '500059', '', '9440172852', 'drsatyanarayanad@gmail.com'),
(1252, 'NON ISOI MEMBER', 'DR. FASEENA.K.K', 'Female', 'SENIOR DENTAL SURGEON, IMPLANTOLOGIST- CORNWELL COMPREHENSIVE DENTAL & IMPLANT CENTER', 'CORNWELL COMPREHENSIVE DENTAL & IMPLANT CENTER NO 11, CORNWELL ROAD, LANGFORD GARDEN , BANGALORE - 560025', '', 'BANGALORE', 'Karnataka', '560025', '8042114432', '9995909433', 'fazeena.mjd@gmail.com'),
(1253, 'NON ISOI MEMBER', 'DR. NADIRA JABEEN S', 'Female', 'SENIOR DENTAL SURGEON, IMPLANTOLOGIST - CORNWELL COMPREHENSIVE DENTAL& IMPLANT CENTER', 'CORNWELL COMPREHENSIVE DENTAL & IMPLANT CENTER NO 11, CORNWELL ROAD , LANGFORD GARDEN , BANGALORE - 560025', '', 'BANGALORE', 'Karnataka', '560025', '8042114432', '9036365056', 'nadirarrdc@gmail.com'),
(1254, 'ISOI MEMBER', 'DR. ANURADHA NAVANEETHAM', 'Female', 'PROF & HOD ,ORAL & MAXILLO FACIAL SURGERY,IMPLANTOLOGIST -M R AMBEDKAR DENTAL COOLEGE, CONSULTANT - HOSMAT HOSPITAL', 'CORNWELL COMPREHENSIVE DENTAL &IMPLANT CENTER NO.11, CORNWELL ROAD, LANGFORD GARDEN ,BANGALORE- 560025', '', 'BANGALORE', 'Karnataka', '560025', '8042114432', '9341218602', 'anufaxmax@gmail.com'),
(1255, 'NON ISOI MEMBER', 'DR. SATISH KUMARAN PUGAZHENDI', 'Male', 'Consultant', '#412 1st Main 1st Stage 2nd Block HBR Layout', '', 'Bangalore', 'Karnataka', '560043', '8025435684', '9449089287', 'arcott21@yahoo.com'),
(1256, 'NON ISOI MEMBER', 'DR. JOSE FRANCIS ALAPATT', 'Male', 'Dental surgeon', 'Homely dental care kattor', '', 'Thrissur', 'Kerala', '680702', '4802874438', '9447308106', 'drjosefrancisalapatt@gmail.com'),
(1257, 'NON ISOI MEMBER', 'DR. PAUL THALIATH', 'Male', 'BDS', 'THALIATH DENTAL CLINIC ABOVE SOUTH INDIAN BANK VARAPUZHA PO', '', 'ERNAKULAM', 'Kerala', '683517', '4842512228', '9847084547', 'paulthaliath@yahoo.co.in'),
(1258, 'NON ISOI MEMBER', 'DR. NAMRATHA NAGESH', 'Female', 'Dental Surgeon & Endodontist', 'Nagu Dental Clinic 1st Floor, 16th Cross, 24th Main, J P Nagar, 5th Phase,', '', 'Bengaluru', 'Karnataka', '560078', '26594390', '9945916769', 'namnag12@gmail.com'),
(1259, 'ISOI MEMBER', 'DR. WALIMBE RAKESH S.', 'Male', 'Dentist', 'DOCC Disha Sq. Sutgirni chauk Garkheda Parisar Auangabad', '#Ac/L/1720/MAH', 'Aurangabad', 'Maharashtra', '431005', '2402451577', '9822770880', 'wrs.docc@gmail.com'),
(1260, 'ISOI MEMBER', 'DR. GIRISH K KULKARNI', 'Male', 'Dentist', 'Complete Smile Care Dental Clinics FF1sunil Terraces Bus Stand Complex Main Road Latur', '#Ac/1719/L/MAH', 'Latur', 'Maharashtra', '413531', '2382249145', '9371100306', 'drgirishkulkarni@gmail.com'),
(1261, 'NON ISOI MEMBER', 'DR. SRILAKSHMI J', 'Female', 'Reader', 'No.401 staff quarters Oxford dental college Hosur Road Bommanahalli Bangalore', '', 'Bangalore', 'Karnataka', '560068', '', '9900018348', 'drsrilakshmi.j@gmail.com'),
(1262, 'NON ISOI MEMBER', 'DR. UMASHANKAR D N', 'Male', 'Reader', 'No 32 4th cross 5th main old ganganagar bangalore 560032', '', 'Bangalore', 'Karnataka', '560032', '9886875863', '9886875863', 'drumashankar1978@gmail.com'),
(1263, 'NON ISOI MEMBER', 'DR. MAHESH KUMAR R', 'Male', 'Professor', 'maheshwari 1st cross, behind MG stadium, kuvempunagar', '', 'tumkur', 'Karnataka', '572101', '9845417365', '9845417365', 'mahu017@gmail.com'),
(1264, 'NON ISOI MEMBER', 'DR. MADHU PREETHA', 'Female', 'Professor', 'No. 54, 2 nd main road, amarjyothi layout, anandnagar', '', 'Bangalore', 'Karnataka', '560032', '8023532553', '9886619492', 'drmadhupreetha@gmail.com'),
(1265, 'STUDENT NON MEMBER', 'DR. AKILA', 'Female', 'MDS', 'mallige dental unit', '', 'bangalore', 'Karnataka', '560000', '', '9900549944', 'dr.akhila.n@gmail.com'),
(1266, 'ISOI MEMBER', 'DR. K.G.NAGESH', 'Male', 'Head', 'Nagu Dental Clinic 1st Floor, 16th Cross, 24th Main, J P Nagar, 5th Phase,', '400', 'Bengaluru', 'Karnataka', '560078', '26594390', '9845036505', 'drkgnagesh@gmail.com'),
(1267, 'ISOI MEMBER', 'DR. MANISH KUMAR SINGH', 'Male', 'ORAL AND MAXILLOFACIAL SURGEON', '76/7, 1B &C, HVS HOMES 4, BETWEEN 4TH & 6TH MAIN, 15TH CROSS, MALLESHWARAM', '1775', 'BANGALORE', 'Karnataka', '560055', '8023465899', '9738948701', 'dr.manish199@gmail.com'),
(1268, 'ISOI MEMBER', 'DR. MAHESH KUMAR.M', 'Male', 'Senior lecturer', 'Specialists Dental Clinic.26/5.KBL complex New bank colony konankunte', '', 'Bangalore', 'Karnataka', '560062', '8026323132', '9980277333', 'maheshKumarm_m@yahoo.in'),
(1269, 'ISOI MEMBER', 'DR. SOMESH GROVER', 'Male', 'Specialist Implantologist', 'Dr. Grover s Dental Clinic A-229, Supermart 1, DLF Phase 4,', 'OL - 439', 'Gurgaon', 'Haryana', '122009', '9810636828', '9818024018', 'drgimplants@gmail.com'),
(1270, 'STUDENT NON MEMBER', 'DR. SPARSHA L MANAE', 'Female', 'GENERAL DENTIST', 'NO.22,3RD CROSS CENTRAL EXCISE LAYOUT VIJAYANAGAR', '', 'BANGALORE', 'Karnataka', '560040', '', '7829034297', 'sparshamanae@gmail.com'),
(1271, 'ISOI MEMBER', 'DR. MEHUL ARVINDBHAI PATEL', 'Male', 'Proprietor', 'Dental world LG 18, paradise tower, Opp civil hospital ,', 'Ac/L/1074/GUJ', 'Navsari', 'Gujarat', '396445', '9898250015', '9898250015', 'mehuolbds@hotmail.com'),
(1272, 'ISOI MEMBER', 'DR. RITHESH K', 'Male', 'READER', '769 8TH CROSS 5TH MAIN MC LAYOUT VIJAYANAGAR', 'Ac/L/1652/KAR', 'BANGALORE', 'Karnataka', '560040', '23381139', '9972544252', 'rithesh14@yahoo.com'),
(1273, 'ISOI MEMBER', 'DR. RAJESH JAMBURE', 'Male', 'Professor', 'Jambure dental clinic, Chetna Nagar Kalda corner, Darga road', '', 'Aurangabad', 'Maharashtra', '431003', '9370645300', '9370645300', 'rajeshjambure@gmail.com'),
(1274, 'NON ISOI MEMBER', 'DR. SEEMA PATTANAIK', 'Female', 'Professor', 'Flat no 3 , regal solitaire, mayur vihar untawadi', '', 'Nashik', 'Maharashtra', '422008', '', '9657671098', 'pattanaik_seema@yahoo.in'),
(1275, 'ISOI MEMBER', 'DR. BIKASH PATTANAIK', 'Male', 'Professor', 'Flat no 3, regal solitaire, mayur vihar Untawadi', 'not received no', 'Nashik', 'Maharashtra', '422008008', '', '9503519898', 'bikashdentist@gmail.com'),
(1276, 'NON ISOI MEMBER', 'DR. NAMRATHA UMESH', 'Female', 'Prosthodontist and Implantologist', '733, A Block, Sahakaranagar,', 'ac/L/1067/KAR', 'bangalore', 'Karnataka', '560092', '8023636923', '9880822622', 'dentalconceptz92@gmail.com'),
(1277, 'ISOI MEMBER', 'DR. PRABHUJI', 'Male', 'professor and head', 'Dept of periodontics Krishnadevarayya dental college and hospital', '', 'bengaluru', 'Karnataka', '560040', '', '9448057407', 'prabhuji@gmail.com'),
(1278, 'ISOI MEMBER', 'DR. VEERENDRA KUMAR SC', 'Male', 'Professor', 'Dental clinic', '', 'bangalore', 'Karnataka', '560044', '', '9844016274', 'imveeru@gmail.com'),
(1279, 'ISOI MEMBER', 'DR. T V NARAYAN', 'Male', 'Professor', 'Impression dental care', '', 'bamgalore', 'Karnataka', '560046', '', '9243101014', 'TVnarayan@gmail.com'),
(1280, 'ISOI MEMBER', 'DR. SHIVASHANKER', 'Male', 'director', 'Confidental lab kamakshipalya', '', 'bamgalore', 'Karnataka', '560073', '', '9886701568', 'shiva@gmail.com'),
(1281, 'ISOI MEMBER', 'DR. BEENA ROOPAK', 'Female', 'Reader', 'Dept of oral surgery Rajarajeswari dental college and hospital', '', 'bangalore', 'Karnataka', '560021', '', '9341260159', 'drbeenaroopak@gmail.com'),
(1282, 'ISOI MEMBER', 'DR. C V MOHAN', 'Male', 'director', 'Dental clinic', '', 'bangalore', 'Karnataka', '560032', '', '9845114794', 'drcvmohan@gmail.com'),
(1283, 'ISOI MEMBER', 'DR. GIRISH RAO', 'Male', 'Director', 'Mukh dental care Jayanagar', '', 'Bangalore', 'Karnataka', '560044', '', '9844023537', 'girsherao@gmail.com'),
(1284, 'ISOI MEMBER', 'DR. DEEPAK S', 'Male', 'Reader', 'ambedkar dental college', '', 'Bangalore', 'Karnataka', '560040', '', '9886766741', 'drrac@yahoo.com'),
(1285, 'ISOI MEMBER', 'DR. ABHILASH PASARE', 'Male', 'Professor', 'smiles and more implant center 318/A, 24th cross , 27th main HSR 2nd sector Banglore', '', 'bangaore', 'Karnataka', '560102', '', '9845088563', 'drabhilashpr@gmail.com'),
(1286, 'ISOI MEMBER', 'DR. PURSHOTAM MANI', 'Male', 'Professor', 'Dental clinic Bangalore', '', 'bangalore', 'Karnataka', '560032', '', '9845016976', 'manvipurush@gmail.com'),
(1287, 'ISOI MEMBER', 'DR. PRAFULLA', 'Male', 'Professor', 'Dental clinic Bangalore', '', 'bangalore', 'Karnataka', '560032', '', '9845203217', 'tumathiprafulla@yahoo.co.in'),
(1288, 'ISOI MEMBER', 'DR. NAVEEN RAJ', 'Male', 'general practiciner', 'Srilakshmi s dental and implant clinic no-4, tent road, mudulapalya', '', 'Bangalore', 'Karnataka', '560040', '', '9739034517', 'drnaveenraj1980@gmail.com'),
(1289, 'STUDENT NON MEMBER', 'DR. SYED AJMAL PASHA', 'Male', 'Student', 'No 5650 lakshmanaiah layout subhashnagar near Tb bus stop Nelamangala', '', 'Bangalore', 'Karnataka', '562123', '', '9986525814', 'Khadri143@gmail.com'),
(1290, 'ISOI MEMBER', 'DR. RAMESH CHOWDHARY', 'Male', 'Director', 'Branemark osseointegration center india no-3, 21st main , vijaynagar', '', 'Bengaluru', 'Karnataka', '560040', '9845206898', '9845206898', 'drramc@yahoo.com'),
(1291, 'ISOI MEMBER', 'DR. S.J.GOVINDARAJ', 'Male', 'IMPLANTOLOGIST', 'CROWN DENTAL CARE G-3, ARUL ARCADE, NO.7 7TH CROSS NANJAPPA GARDEN MAIN ROAD BABUSABPALYA KALYAN NAGAR POST', 'AC/L/578/KAR', 'BANGALORE', 'Karnataka', '560043', '8553136773', '9448001343', 'govindsj@gmail.com'),
(1292, 'ISOI MEMBER', 'DR.AAA', 'Male', 'dfdfd', 'afadf', 'isoion', 'adfdf', 'Kerala', '2323', '', '9632104861', 'conference@a1logics.com');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language_id`, `name`, `created`, `modified`) VALUES
(1, 'English', '2016-10-22 16:36:29', '2016-10-22 16:36:29'),
(2, 'Hindi', '2016-10-22 16:36:29', '2016-10-22 16:36:29'),
(3, 'english', '2017-07-13 00:00:00', '2017-07-14 00:00:00'),
(4, 'telgu', '2017-07-12 00:00:00', '2017-07-12 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `leaves_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `dentist_id` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`leaves_id`, `provider_id`, `dentist_id`, `from_date`, `to_date`, `status`) VALUES
(1, 1, 29, '2017-03-25', '0000-00-00', 'stomach cramps'),
(3, 1, 21, '2017-03-25', '0000-00-00', 'fever'),
(4, 1, 21, '2017-03-26', '0000-00-00', 'fever'),
(6, 1, 21, '2017-03-28', '0000-00-00', 'fever'),
(8, NULL, 2, '2017-08-23', '2017-08-23', 'what'),
(9, NULL, 2, '2017-08-29', '2017-08-28', 'hhhh'),
(10, NULL, 2, '2017-08-29', '2017-08-28', 'deal'),
(11, NULL, 2, '2017-08-31', '2017-08-31', 'holiday'),
(12, NULL, 2, '2017-08-31', '2017-08-29', 'diwali'),
(14, NULL, 2, '2017-08-29', '2017-08-31', 'leave'),
(16, NULL, 2, '2017-08-31', '2017-08-30', 'leave'),
(18, NULL, 2, '2017-08-31', '2017-08-30', 'holiday'),
(19, NULL, 2, '2017-08-30', '2017-08-30', 'holiday'),
(20, NULL, 2, '2017-08-30', '2017-08-30', 'holiday'),
(21, NULL, 2, '2017-08-31', '2017-08-30', 'jjj'),
(22, NULL, 2, '2017-08-31', '2017-08-30', 'd'),
(23, NULL, 2, '2017-08-31', '2017-08-31', 'holiday'),
(24, NULL, 2, '2017-09-06', '2017-09-06', 'leave'),
(25, NULL, 2, '2017-09-06', '2017-09-06', 'ssjjj'),
(26, NULL, 2, '2017-06-12', '2017-06-30', 'stomach pain'),
(32, NULL, 2, '2017-06-12', '2017-06-30', 'something'),
(33, NULL, 2, '2017-06-12', '2017-06-30', 'something'),
(34, NULL, 2, '2017-06-12', '2017-06-30', 'something'),
(35, NULL, 2, '2017-06-12', '2017-06-30', 'something');

-- --------------------------------------------------------

--
-- Table structure for table `message_notifications`
--

CREATE TABLE `message_notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_type` enum('patient','dentist') NOT NULL,
  `type_id` int(11) NOT NULL,
  `message_type` enum('m','n') NOT NULL,
  `message` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vendor_id_link` varchar(400) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `age` varchar(3) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `height_feet` varchar(10) DEFAULT '',
  `weight` varchar(10) DEFAULT '',
  `blood_group` varchar(10) DEFAULT NULL,
  `allergies` varchar(200) DEFAULT '',
  `ailments` varchar(100) DEFAULT '',
  `habits` varchar(100) DEFAULT '',
  `photo_url` varchar(500) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL,
  `mobile_alt` varchar(11) DEFAULT NULL,
  `date_reg` datetime DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(25) DEFAULT NULL,
  `access_token` varchar(100) DEFAULT NULL,
  `login_type` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `name`, `vendor_id_link`, `dob`, `age`, `gender`, `height_feet`, `weight`, `blood_group`, `allergies`, `ailments`, `habits`, `photo_url`, `address1`, `address2`, `pincode`, `mobile`, `mobile_alt`, `date_reg`, `email`, `password`, `password_reset_token`, `access_token`, `login_type`, `created_at`, `updated_at`) VALUES
(1, 'Suhail', NULL, '1993-10-04', '23', 'Male', '', '', '', '', NULL, NULL, NULL, '', '', '', '9591444785', NULL, NULL, 'suhailh36@outlook.com', NULL, NULL, '1679091c5a880faf6fb5e6087eb1b2dc', NULL, '2017-06-19 15:13:38', '2017-07-21 20:47:34'),
(2, 'Vikas', NULL, '2017-03-26', '33', 'Male', '', '', '', '', '', '', NULL, '', '', '', '9738006878', NULL, NULL, 'vikas.dhanraj@gmail.com', NULL, NULL, '', NULL, '2017-06-19 15:13:38', '2017-06-19 15:13:38'),
(3, 'anandh', NULL, NULL, '23', NULL, '', '', 'A+', '', '', '', NULL, NULL, NULL, NULL, '9632715587', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 11:43:18', '2017-08-16 11:43:18'),
(4, 'mahendra', NULL, NULL, '23', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '961265526', NULL, NULL, 'ma@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 11:46:07', '2017-08-16 11:46:07'),
(5, 'vikasL', NULL, NULL, '24', NULL, '', '', 'A+', '', '', '', NULL, NULL, NULL, NULL, '952445555', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 11:50:47', '2017-08-16 11:50:47'),
(6, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 11:50:52', '2017-08-16 11:50:52'),
(7, 'vikky', NULL, NULL, '23', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '965216516', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 11:56:43', '2017-08-16 11:56:43'),
(8, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 11:57:15', '2017-08-16 11:57:15'),
(9, 'vikas', NULL, NULL, '23', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '956261255', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 12:00:51', '2017-08-16 12:00:51'),
(10, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 12:00:55', '2017-08-16 12:00:55'),
(11, 'vikky', NULL, NULL, '23', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '416665161', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 12:01:46', '2017-08-16 12:01:46'),
(12, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 12:01:49', '2017-08-16 12:01:49'),
(13, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 12:25:56', '2017-08-16 12:25:56'),
(14, 'suhail', NULL, NULL, '23', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '9449511446', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:15:03', '2017-08-16 13:15:03'),
(15, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 13:16:06', '2017-08-16 13:16:06'),
(16, 'mahi', NULL, NULL, '52', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '959545225', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:16:45', '2017-08-16 13:16:45'),
(17, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 13:16:50', '2017-08-16 13:16:50'),
(18, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 13:16:53', '2017-08-16 13:16:53'),
(19, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 13:20:16', '2017-08-16 13:20:16'),
(20, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 13:22:04', '2017-08-16 13:22:04'),
(21, '', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-08-16 13:22:08', '2017-08-16 13:22:08'),
(22, 'suhail', NULL, NULL, '52', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7829408245', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:36:47', '2017-08-16 13:36:47'),
(23, 'anand', NULL, NULL, '32', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7852245265', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:42:41', '2017-08-16 13:42:41'),
(24, 'mah', NULL, NULL, '23', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '785248558', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:45:45', '2017-08-16 13:45:45'),
(25, 'suhail', NULL, NULL, '32', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '959558', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:49:51', '2017-08-16 13:49:51'),
(26, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '959595', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:51:04', '2017-08-16 13:51:04'),
(27, 'suhail', NULL, NULL, '22', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '84565', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:52:00', '2017-08-16 13:52:00'),
(28, 'asijji', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '9588656', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:52:58', '2017-08-16 13:52:58'),
(29, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7854488', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 13:58:40', '2017-08-16 13:58:40'),
(30, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7855451521', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 14:04:35', '2017-08-16 14:04:35'),
(31, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '785299652', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 14:05:42', '2017-08-16 14:05:42'),
(32, 'cjnjk', NULL, NULL, '15', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '952445553', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 14:06:44', '2017-08-16 14:06:44'),
(33, 'v', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '725525', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 14:08:20', '2017-08-16 14:08:20'),
(34, 'suhail', NULL, NULL, '26', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '5656552', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 14:10:05', '2017-08-16 14:10:05'),
(35, 'vikky', NULL, NULL, '55', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '785165', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 14:11:16', '2017-08-16 14:11:16'),
(36, 'vikky', NULL, NULL, '55', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '785165', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 14:11:44', '2017-08-16 14:11:44'),
(37, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7459562652', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:12:46', '2017-08-16 15:12:46'),
(38, 'vikky', NULL, NULL, '23', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '874949656', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:14:55', '2017-08-16 15:14:55'),
(39, 'njknkj', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '875965626', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:19:12', '2017-08-16 15:19:12'),
(40, 'ss', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '5151656', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:20:31', '2017-08-16 15:20:31'),
(41, 'sjbjhbjn', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '85595965', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:24:43', '2017-08-16 15:24:43'),
(42, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '84596526', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:26:40', '2017-08-16 15:26:40'),
(43, 'dffd', NULL, NULL, '40', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '78596596', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:29:23', '2017-08-16 15:29:23'),
(44, 'suha', NULL, NULL, '40', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '78455965', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:31:58', '2017-08-16 15:31:58'),
(45, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '778454645', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:32:53', '2017-08-16 15:32:53'),
(46, 'bjn', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '5451651', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:35:52', '2017-08-16 15:35:52'),
(47, 'suhail', NULL, NULL, '546', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '66626', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:36:50', '2017-08-16 15:36:50'),
(48, '95995', NULL, NULL, '35', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '786262', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:38:13', '2017-08-16 15:38:13'),
(49, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '8515155', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-16 15:45:07', '2017-08-16 15:45:07'),
(50, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '8454515', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:46:04', '2017-08-17 10:46:04'),
(51, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7295965', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:47:38', '2017-08-17 10:47:38'),
(52, 'ss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '59895965', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:47:57', '2017-08-17 10:47:57'),
(53, 'ssss', NULL, NULL, '26', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7459562655', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:48:50', '2017-08-17 10:48:50'),
(54, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '752626', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:49:54', '2017-08-17 10:49:54'),
(55, 'suhail', NULL, NULL, '25', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7785465', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:50:55', '2017-08-17 10:50:55'),
(56, 's', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '48485484', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:52:18', '2017-08-17 10:52:18'),
(57, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '98965965', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:52:47', '2017-08-17 10:52:47'),
(58, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '55665', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:56:08', '2017-08-17 10:56:08'),
(59, 'ssdd', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '85656', NULL, NULL, 'su@gmail.coms', NULL, NULL, NULL, NULL, '2017-08-17 10:57:09', '2017-08-17 10:57:09'),
(60, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '878448', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 10:59:11', '2017-08-17 10:59:11'),
(61, 'ss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '88959', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:00:25', '2017-08-17 11:00:25'),
(62, 'sss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '989595', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:01:08', '2017-08-17 11:01:08'),
(63, 'sss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '95965965', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:01:41', '2017-08-17 11:01:41'),
(64, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '8484848', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:02:45', '2017-08-17 11:02:45'),
(65, 'ss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '6554', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:04:29', '2017-08-17 11:04:29'),
(66, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '45959', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:05:31', '2017-08-17 11:05:31'),
(67, 'ss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '5585495', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:06:24', '2017-08-17 11:06:24'),
(68, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '84484', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:07:16', '2017-08-17 11:07:16'),
(69, 'sjbjhbj', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '54848', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:08:05', '2017-08-17 11:08:05'),
(70, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '84584', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:08:36', '2017-08-17 11:08:36'),
(71, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '5515151', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:10:01', '2017-08-17 11:10:01'),
(72, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '8494848', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:12:01', '2017-08-17 11:12:01'),
(73, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '48515848', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:13:27', '2017-08-17 11:13:27'),
(74, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '65848', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:14:15', '2017-08-17 11:14:15'),
(75, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '484848', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:14:48', '2017-08-17 11:14:48'),
(76, 'ss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '99595', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:15:23', '2017-08-17 11:15:23'),
(77, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '995959', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:16:55', '2017-08-17 11:16:55'),
(78, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '99569', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:17:29', '2017-08-17 11:17:29'),
(79, 'ssddd', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '9555', NULL, NULL, 'c@mai', NULL, NULL, NULL, NULL, '2017-08-17 11:20:33', '2017-08-17 11:20:33'),
(80, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '95554', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:21:13', '2017-08-17 11:21:13'),
(81, 'sddd', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '484888', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:21:57', '2017-08-17 11:21:57'),
(82, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '9524455555', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:23:35', '2017-08-17 11:23:35'),
(83, 'sdd', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '94596595', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:26:19', '2017-08-17 11:26:19'),
(84, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '844848484', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:30:27', '2017-08-17 11:30:27'),
(85, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '515484', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:40:07', '2017-08-17 11:40:07'),
(86, 'ss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '9591444784', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:41:26', '2017-08-17 11:41:26'),
(87, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '952445556', NULL, NULL, 'ss@bhhbj.com', NULL, NULL, NULL, NULL, '2017-08-17 11:42:01', '2017-08-17 11:42:01'),
(88, 'ygygyg', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '96545154', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:43:42', '2017-08-17 11:43:42'),
(89, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '895959', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:53:14', '2017-08-17 11:53:14'),
(90, 'ssssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '84885', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:58:09', '2017-08-17 11:58:09'),
(91, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '96848', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:59:00', '2017-08-17 11:59:00'),
(92, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '48494', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 11:59:41', '2017-08-17 11:59:41'),
(93, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '95914447855', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:01:02', '2017-08-17 12:01:02'),
(94, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '848887', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:01:40', '2017-08-17 12:01:40'),
(95, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '958878', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:02:02', '2017-08-17 12:02:02'),
(96, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '8488', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:02:56', '2017-08-17 12:02:56'),
(97, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '6565959', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:03:47', '2017-08-17 12:03:47'),
(98, 'sss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '8488888', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:05:27', '2017-08-17 12:05:27'),
(99, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '5848484', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:05:51', '2017-08-17 12:05:51'),
(100, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '955654', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:06:35', '2017-08-17 12:06:35'),
(101, 'malli', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '59595', NULL, NULL, 'malli@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:08:56', '2017-08-17 12:08:56'),
(102, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '88878', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:17:11', '2017-08-17 12:17:11'),
(103, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '59595985', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:21:49', '2017-08-17 12:21:49'),
(104, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '58878', NULL, NULL, 'shb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:22:18', '2017-08-17 12:22:18'),
(105, 'anandh', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '5484848', NULL, NULL, 'a@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:23:35', '2017-08-17 12:23:35'),
(106, 'sjuh', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '844555', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-17 12:25:14', '2017-08-17 12:25:14'),
(107, 'suhail', NULL, NULL, '25', NULL, '', '', 'A+', '', '', '', NULL, NULL, NULL, NULL, '959595959', NULL, NULL, 'a@gmail.com', NULL, NULL, NULL, NULL, '2017-08-22 12:58:19', '2017-08-22 12:58:19'),
(108, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '8426555', NULL, NULL, 'v@gmail.com', NULL, NULL, NULL, NULL, '2017-08-22 13:03:45', '2017-08-22 13:03:45'),
(109, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '87845152121', NULL, NULL, 'su@fmail.com', NULL, NULL, NULL, NULL, '2017-08-22 13:04:13', '2017-08-22 13:04:13'),
(110, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '87845152121', NULL, NULL, 'su@fmail.com', NULL, NULL, NULL, NULL, '2017-08-22 13:04:17', '2017-08-22 13:04:17'),
(111, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '87845152121', NULL, NULL, 'su@fmail.com', NULL, NULL, NULL, NULL, '2017-08-22 13:04:21', '2017-08-22 13:04:21'),
(112, 'ssss', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '9858485545', NULL, NULL, 'su@ccmail.com', NULL, NULL, NULL, NULL, '2017-08-22 13:06:30', '2017-08-22 13:06:30'),
(113, 'vikas', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '7482555', NULL, NULL, 'sssshb@gmail.com', NULL, NULL, NULL, NULL, '2017-08-22 13:12:03', '2017-08-22 13:12:03'),
(114, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '884854848', NULL, NULL, 'sus@gmail.com', NULL, NULL, NULL, NULL, '2017-08-22 13:16:45', '2017-08-22 13:16:45'),
(115, 'suhail', NULL, NULL, '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '99455484854', NULL, NULL, 'su@gmail.com', NULL, NULL, NULL, NULL, '2017-08-22 15:54:10', '2017-08-22 15:54:10'),
(116, 'pooja', NULL, '1993-10-04', '', 'female', '', '', NULL, '', '', '', NULL, 'jaipur', NULL, NULL, '3423423', NULL, NULL, 'pooja@gmail.com', NULL, NULL, NULL, NULL, '2018-04-04 17:50:36', '2018-04-04 17:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `payment_ref_type` varchar(50) NOT NULL,
  `purpose` varchar(50) NOT NULL,
  `txnid` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `transaction_time` varchar(50) DEFAULT NULL,
  `amount` decimal(11,2) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `pg_ref_num` varchar(50) DEFAULT NULL,
  `pg_datetime` timestamp NULL DEFAULT NULL,
  `pg_message` varchar(100) DEFAULT NULL,
  `org_txnid` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `dentist_id` int(11) NOT NULL,
  `medicine` varchar(50) DEFAULT NULL,
  `medicine_Name` varchar(50) DEFAULT NULL,
  `medicine_dosage` varchar(50) DEFAULT NULL,
  `amount` varchar(20) NOT NULL,
  `medicine_course` varchar(50) DEFAULT NULL,
  `medicine_intake` varchar(50) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `appointment_id`, `dentist_id`, `medicine`, `medicine_Name`, `medicine_dosage`, `amount`, `medicine_course`, `medicine_intake`, `remarks`, `timestamp`) VALUES
(1, 2, 2, NULL, 'dolo', '500', 'mg', '5', '1-0-1-', NULL, '2017-10-09 11:16:18'),
(2, 2, 2, NULL, 'dolo', '500', 'mg', '4', '1-0-1-', NULL, '2017-10-09 12:20:52'),
(3, 3, 2, NULL, 'ciplox', '400', 'mg', '10', '1-0-1-', NULL, '2017-10-16 18:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE `product_brand` (
  `brand_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_brand`
--

INSERT INTO `product_brand` (`brand_id`, `product_id`, `brand_name`) VALUES
(1, 0, 'Dentacam'),
(2, 0, 'Medicam');

-- --------------------------------------------------------

--
-- Table structure for table `provider_billing`
--

CREATE TABLE `provider_billing` (
  `provider_billing_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `invoice_path` varchar(100) DEFAULT NULL,
  `currency` varchar(20) NOT NULL,
  `den_name` varchar(50) DEFAULT NULL,
  `billnum` varchar(100) NOT NULL,
  `bill_date` varchar(25) NOT NULL,
  `appointment_id` int(11) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(50) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `bill_rate` varchar(10) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `net_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `login_id` varchar(50) DEFAULT NULL,
  `rec_date_time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider_billing`
--

INSERT INTO `provider_billing` (`provider_billing_id`, `provider_id`, `document_id`, `invoice_path`, `currency`, `den_name`, `billnum`, `bill_date`, `appointment_id`, `patient_id`, `description`, `quantity`, `bill_rate`, `total_amount`, `net_amount`, `discount_amount`, `deleted`, `login_id`, `rec_date_time`) VALUES
(16, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-15', 1, 2, 'injection', 0, '', '10007.00', '0.00', '1000.70', 0, '', '2017-08-15 21:16:19'),
(17, 0, 0, 'invoice/1.pdf', '', 'mahendi', '1', '2017-08-15', 1, 2, 'injection', 6, '1000', '6000.00', '0.00', '600.00', 0, '', '2017-08-15 21:22:27'),
(18, 0, 0, 'invoice/1.pdf', '', 'Dr Ramesh Chowdary', '1', '2017-08-15', 1, 2, 'injection', 6, '1000', '6000.00', '0.00', '600.00', 0, '', '2017-08-15 21:23:05'),
(19, 0, 0, 'invoice/1.pdf', '', 'Dr Ramesh Chowdary', '1', '2017-08-15', 1, 2, 'injection', 6, '1000', '6000.00', '0.00', '600.00', 0, '', '2017-08-15 21:35:40'),
(20, 0, 0, 'invoice/1.pdf', '', 'Dr Ramesh Chowdary', '1', '2017-08-15', 1, 2, 'injection', 6, '1000', '6000.00', '0.00', '600.00', 0, '', '2017-08-15 21:38:41'),
(21, 0, 0, 'invoice/1.pdf', '', 'Dr Ramesh Chowdary', '1', '2017-08-15', 1, 2, 'injection', 6, '1000', '6000.00', '0.00', '600.00', 0, '', '2017-08-15 21:38:48'),
(22, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-15', 1, 2, 'ffff', 4, '10000', '40000.00', '0.00', '4000.00', 0, '', '2017-08-15 21:39:06'),
(23, 0, 0, 'invoice/1.pdf', '', 'Pandu Ranga Reddy', '1', '2017-08-15', 1, 2, 'ddd', 6, '3000', '3000.00', '0.00', '300.00', 0, '', '2017-08-15 21:47:19'),
(24, 0, 0, 'invoice/1.pdf', '', 'Pandu Ranga Reddy', '1', '2017-08-15', 1, 2, 'ss', 8, '1000', '8000.00', '0.00', '800.00', 0, '', '2017-08-15 21:50:55'),
(25, 0, 0, 'invoice/1.pdf', '', 'Pandu Ranga Reddy', '1', '2017-08-15', 1, 2, 'injection', 4, '1000', '4000.00', '0.00', '400.00', 0, '', '2017-08-15 21:53:53'),
(26, 0, 0, 'invoice/1.pdf', '', 'Dr Ramesh Chowdary', '1', '2017-08-15', 1, 2, 'injection', 7, '1000', '7000.00', '0.00', '700.00', 0, '', '2017-08-15 22:21:01'),
(90, 0, 0, 'invoice/1.pdf', '', 'Pandu Ranga Reddy', '1', '2017-08-16', 1, 2, 'gggg', 4, '100', '400.00', '0.00', '8.00', 0, '', '2017-08-16 17:38:03'),
(91, 0, 0, 'invoice/1.pdf', '', 'Pandu Ranga Reddy', '1', '2017-08-16', 1, 2, 'gggggggg', 6, '100', '600.00', '0.00', '12.00', 0, '', '2017-08-16 17:51:40'),
(92, 0, 0, 'invoice/1.pdf', '', 'Pandu Ranga Reddy', '1', '2017-08-16', 1, 2, 'ddd', 4, '100', '400.00', '0.00', '8.00', 0, '', '2017-08-16 18:06:15'),
(94, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'hh', 6, '100', '600.00', '0.00', '12.00', 0, '', '2017-08-17 01:36:56'),
(95, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'fff', 4, '100', '400.00', '0.00', '8.00', 0, '', '2017-08-17 01:49:34'),
(96, 0, 0, 'invoice/1.pdf', '', 'mahend', '1', '2017-08-17', 1, 2, 'hdhd', 2, '100', '200.00', '0.00', '6.00', 0, '', '2017-08-17 10:33:25'),
(97, 0, 0, 'invoice/1.pdf', '', 'Vikas', '1', '2017-08-17', 1, 2, 'scs', 2, '100', '200.00', '0.00', '6.00', 0, '', '2017-08-17 10:51:20'),
(98, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'xddsd', 2, '5560', '11120.00', '0.00', '222.40', 0, '', '2017-08-17 11:43:14'),
(99, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'ddd', 2, '100', '200.00', '0.00', '4.00', 0, '', '2017-08-17 12:17:01'),
(100, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'dfds', 3, '112', '336.00', '0.00', '6.72', 0, '', '2017-08-17 12:20:02'),
(101, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'xx', 2, '100', '200.00', '0.00', '4.00', 0, '', '2017-08-17 12:35:07'),
(102, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'dd', 2, '100', '200.00', '0.00', '2.00', 0, '', '2017-08-17 12:38:51'),
(103, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'dd', 2, '100', '200.00', '0.00', '4.00', 0, '', '2017-08-17 12:48:26'),
(104, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'ss', 2, '100', '200.00', '0.00', '4.00', 0, '', '2017-08-17 13:06:44'),
(105, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'ss', 2, '100', '200.00', '0.00', '4.00', 0, '', '2017-08-17 13:16:31'),
(106, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'sss', 1, '100', '100.00', '0.00', '2.00', 0, '', '2017-08-17 13:52:15'),
(107, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'ss', 2, '122', '244.00', '0.00', '4.88', 0, '', '2017-08-17 14:00:59'),
(108, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-17', 1, 2, 'sss', 2, '100', '200.00', '0.00', '2.00', 0, '', '2017-08-17 14:10:03'),
(109, 0, 0, 'invoice/1.pdf', '', 'mahendr', '1', '2017-08-17', 1, 2, 'fff', 3, '100', '300.00', '0.00', '9.00', 0, '', '2017-08-17 23:49:34'),
(110, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-18', 1, 2, 'hhhh', 2, '100', '200.00', '0.00', '2.00', 0, '', '2017-08-18 11:16:49'),
(111, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-22', 1, 2, 'vcvcx', 4, '1000', '4000.00', '0.00', '80.00', 0, '', '2017-08-22 18:27:48'),
(112, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-22', 1, 2, 'vcvcx', 4, '1000', '4000.00', '0.00', '80.00', 0, '', '2017-08-22 18:27:48'),
(113, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-22', 1, 1, 'ddd', 5, '100', '500.00', '0.00', '10.00', 0, '', '2017-08-22 19:24:56'),
(114, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-22', 1, 1, 'sss', 3, '200', '600.00', '0.00', '12.00', 0, '', '2017-08-22 19:32:22'),
(115, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-22', 1, 1, 'dd', 4, '200', '800.00', '0.00', '24.00', 0, '', '2017-08-22 19:36:22'),
(116, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-22', 1, 1, 'ddd', 2, '100', '200.00', '0.00', '4.00', 0, '', '2017-08-22 19:37:45'),
(117, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-22', 1, 1, 'fff', 3, '100', '300.00', '0.00', '12.00', 0, '', '2017-08-22 19:47:18'),
(118, 0, 0, 'invoice/1.pdf', '', '', '1', '2017-08-22', 1, 1, 'ffff', 2, '300', '600.00', '0.00', '12.00', 0, '', '2017-08-22 19:50:14'),
(119, 0, 0, 'invoice/1.pdf', '', 'Pandu Ranga Reddy', '1', '2017-08-24', 1, 2, 'sddd', 2, '200', '400.00', '0.00', '8.00', 0, '', '2017-08-24 18:07:15'),
(125, 0, 0, 'invoice/1.pdf', '', 'Vikas', '1', '2017-08-24', 1, 2, '10', 2, '2', '4.00', '0.00', '0.08', 0, '', '2017-08-24 19:14:43'),
(126, 0, 0, 'invoice/1.pdf', '', 'Vikas', '1', '2017-08-24', 1, 2, 'ssss', 10, '2', '20.00', '0.00', '2.00', 0, '', '2017-08-24 19:15:15'),
(127, 9, 0, 'invoice/1.pdf', '', 'Vikas', '1', '2017-08-24', 1, 2, 'ssss', 20, '2', '40.00', '0.00', '1.60', 0, '', '2017-08-24 20:03:34'),
(155, 9, 0, 'invoice/1.pdf', '', 'Vikas', '1', '2017-08-25', 1, 1, 'pills', 40, '40', '1600.00', '0.00', '80.00', 0, NULL, '2017-08-25 15:06:23'),
(181, 9, 0, 'invoice/1.pdf', '', 'Vikas', '1', '2017-08-25', 1, 2, 'pills2', 4, '25', '100.00', '0.00', '25.00', 0, NULL, '2017-08-25 17:17:42'),
(182, 9, 0, 'invoice/1.pdf', '', 'Vikas', '1', '2017-08-26', 1, 2, 'pills', 22, '100', '2200.00', '0.00', '440.00', 0, NULL, '2017-08-26 18:27:30'),
(183, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '2', '2017-09-12', 0, 2, NULL, NULL, NULL, '0.00', '0.00', '0.00', 0, NULL, NULL),
(184, 10, 0, 'invoice/VS-17-0000001.pdf', '', '', '3', '2017-09-12', 0, 2, NULL, NULL, NULL, '0.00', '0.00', '0.00', 0, NULL, NULL),
(185, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '4', '2017-09-12', 0, 2, NULL, NULL, NULL, '0.00', '0.00', '0.00', 0, NULL, NULL),
(186, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '5', '2017-09-12', 0, 2, NULL, NULL, NULL, '0.00', '0.00', '0.00', 0, NULL, NULL),
(187, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '6', '2017-09-12', 0, 2, NULL, NULL, NULL, '0.00', '0.00', '0.00', 0, NULL, NULL),
(188, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '7', '2017-09-12', 0, 2, NULL, NULL, NULL, '32892.00', '31013.40', '0.00', 0, NULL, NULL),
(189, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '8', '2017-09-12', 0, 2, NULL, NULL, NULL, '28860.00', '25677.00', '3183.60', 0, NULL, NULL),
(190, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '9', '2017-09-12', 0, 2, NULL, NULL, NULL, '41200.00', '24950.00', '16250.00', 0, NULL, NULL),
(191, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '10', '2017-09-12', 0, 2, NULL, NULL, NULL, '800.00', '540.00', '260.00', 0, NULL, NULL),
(192, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '11', '2017-09-12', 0, 2, NULL, NULL, NULL, '800.00', '630.00', '170.00', 0, NULL, NULL),
(193, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '12', '2017-09-12', 0, 2, NULL, NULL, NULL, '120.00', '108.00', '0.00', 0, NULL, NULL),
(194, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '13', '2017-09-12', 0, 2, NULL, NULL, NULL, '1400.00', '1120.00', '0.00', 0, NULL, NULL),
(195, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '14', '2017-09-12', 0, 2, NULL, NULL, NULL, '820.00', '472.00', '348.00', 0, NULL, NULL),
(196, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '15', '2017-09-12', 0, 2, NULL, NULL, NULL, '800.00', '680.00', '140.00', 0, NULL, NULL),
(197, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '16', '2017-09-12', 0, 2, NULL, NULL, NULL, '100.00', '90.00', '30.00', 0, NULL, NULL),
(198, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '17', '2017-09-12', 0, 2, NULL, NULL, NULL, '800.00', '630.00', '170.00', 0, NULL, NULL),
(199, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '18', '2017-09-12', 0, 2, NULL, NULL, NULL, '80.00', '72.00', '8.00', 0, NULL, NULL),
(200, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '19', '2017-09-12', 0, 2, NULL, NULL, NULL, '4200.00', '4116.00', '84.00', 0, NULL, NULL),
(201, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '20', '2017-09-12', 0, 2, NULL, NULL, NULL, '400.00', '318.00', '82.00', 0, NULL, NULL),
(202, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '10', '2017-09-12', 0, 2, NULL, NULL, NULL, '4400.00', '3960.00', '0.00', 0, NULL, NULL),
(203, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '10', '2017-09-12', 0, 2, NULL, NULL, NULL, '800.00', '720.00', '0.00', 0, NULL, NULL),
(204, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '10', '2017-09-12', 0, 2, NULL, NULL, NULL, '200.00', '140.00', '0.00', 0, NULL, NULL),
(205, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '10', '2017-09-12', 0, 2, NULL, NULL, NULL, '8000.00', '7190.00', '810.00', 0, NULL, NULL),
(206, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '10', '2017-09-12', 0, 4, NULL, NULL, NULL, '400.00', '310.00', '90.00', 0, NULL, NULL),
(207, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '1', '2017-09-12', 0, 2, NULL, NULL, NULL, '8004.00', '7683.84', '0.00', 0, NULL, NULL),
(208, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '1', '2017-09-12', 0, 2, NULL, NULL, NULL, '80.00', '72.00', '0.00', 0, NULL, NULL),
(209, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '1', '2017-09-12', 0, 2, NULL, NULL, NULL, '20.00', '18.00', '0.00', 0, NULL, NULL),
(210, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '1260.00', '1008.00', '0.00', 0, NULL, NULL),
(211, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '840.00', '756.00', '0.00', 0, NULL, NULL),
(212, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '400.00', '360.00', '0.00', 0, NULL, NULL),
(213, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '80.00', '72.00', '0.00', 0, NULL, NULL),
(214, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '2000.00', '2000.00', '0.00', 0, NULL, NULL),
(215, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '120.00', '57.60', '0.00', 0, NULL, NULL),
(216, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '800.00', '792.00', '0.00', 0, NULL, NULL),
(217, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '120.00', '114.00', '0.00', 0, NULL, NULL),
(218, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '25.00', '24.75', '0.00', 0, NULL, NULL),
(219, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '80.00', '72.00', '0.00', 0, NULL, NULL),
(220, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '100.00', '90.00', '0.00', 0, NULL, NULL),
(221, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '208.00', '208.00', '0.00', 0, NULL, NULL),
(222, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '444.00', '399.60', '0.00', 0, NULL, NULL),
(223, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 4, NULL, NULL, NULL, '800.00', '800.00', '0.00', 0, NULL, NULL),
(224, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Rupraj', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '880.00', '862.40', '0.00', 0, NULL, NULL),
(225, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', '0', '2017-09-12', 0, 2, NULL, NULL, NULL, '200.00', '160.00', '0.00', 0, NULL, NULL),
(226, 10, 0, 'invoice/VS-17-0000001.pdf', '', 'Vikas', 'VS-17-0000001', '2017-09-13', 0, 2, NULL, NULL, NULL, '200.00', '176.00', '24.00', 0, NULL, NULL),
(227, 10, 0, 'invoice/VS-17-0000002.pdf', '', 'Rupraj', 'VS-17-0000002', '2017-09-14', 0, 2, NULL, NULL, NULL, '400.00', '400.00', '0.00', 0, NULL, NULL),
(228, 10, 0, NULL, '', 'Rupraj', 'VS-17-0000003', '2017-09-16', 0, 2, NULL, NULL, NULL, '800.00', '800.00', '0.00', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider_details`
--

CREATE TABLE `provider_details` (
  `provider_details_id` int(11) NOT NULL,
  `pvd_name` varchar(100) NOT NULL,
  `username` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `pvd_shrt` varchar(4) NOT NULL,
  `holiday` varchar(20) NOT NULL,
  `hcc_locality` varchar(100) NOT NULL,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(100) NOT NULL,
  `pvd_state` varchar(100) NOT NULL,
  `pvd_country` varchar(100) NOT NULL,
  `pvd_email_1` varchar(100) NOT NULL,
  `pvd_email_2` varchar(100) NOT NULL,
  `pvd_contact_no_1` varchar(20) NOT NULL,
  `pvd_contact_no_2` varchar(20) NOT NULL,
  `pvd_parent_id` int(11) NOT NULL DEFAULT '0',
  `pvd_description` varchar(3000) DEFAULT NULL,
  `pvd_services` varchar(1000) DEFAULT NULL,
  `pvd_images` varchar(1000) NOT NULL,
  `pvd_type` varchar(100) NOT NULL,
  `pvd_started_year` varchar(4) NOT NULL,
  `rec_cre_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pvd_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `provider_details`
--

INSERT INTO `provider_details` (`provider_details_id`, `pvd_name`, `username`, `password`, `logo`, `pvd_shrt`, `holiday`, `hcc_locality`, `address_line_1`, `address_line_2`, `pvd_state`, `pvd_country`, `pvd_email_1`, `pvd_email_2`, `pvd_contact_no_1`, `pvd_contact_no_2`, `pvd_parent_id`, `pvd_description`, `pvd_services`, `pvd_images`, `pvd_type`, `pvd_started_year`, `rec_cre_time`, `pvd_status`) VALUES
(8, 'vip dental lab ', '', '', 'vip_logo.jpg', 'vip', '0', 'NR Colony', 'NR Colony, Banashankari 3rd Stage', 'Bangalore-560081', 'karnataka', 'india', 'info@vip.com', '', '9738006878', '', 0, 'This is a test lab created for showing data', 'Implants^Artificial Tooth', '/labs/vip/img-1.png^/labs/vip/img-2.png', 'lab', '2000', '2017-07-24 15:00:00', 'active'),
(10, 'vikas dental health care', 'vikas', 'clinics', '', 'vs', '', '', 'rajarajeshwari', 'pp layout', 'karnataka', 'india', '', '', '9738425458', '', 0, NULL, NULL, '', 'clinic', '', '0000-00-00 00:00:00', 'active'),
(11, 'labs', 'labs', 'labs', '', '', '', '', 'banglore', '', 'karnataka', 'india', 'labs@gmail.com', '', '', '', 0, NULL, NULL, '', 'lab', '', '2017-08-02 15:30:06', 'active'),
(12, 'suhail', 'dealer', 'dealer', '', '', '', '', '', '', '', '', '', '', '', '', 0, NULL, NULL, '', 'dealer', '', '2017-08-16 17:17:49', 'active'),
(13, 'vikas labs', 'vikslab', '1234', '', '', '', '', 'Banglore', '', 'karnataka', 'india', 'vikslab@gmail.com', '', '9591444785', '', 0, NULL, 'tooth implant^massage', '', 'lab', '', '0000-00-00 00:00:00', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `provider_receipts`
--

CREATE TABLE `provider_receipts` (
  `provider_receipts_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `currency` varchar(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `received_amount` int(11) NOT NULL,
  `transaction_id` varchar(60) DEFAULT NULL,
  `payment_mode` varchar(20) NOT NULL,
  `cheque_no` varchar(60) DEFAULT NULL,
  `cheque_date` varchar(20) DEFAULT NULL,
  `card_type` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `rec_date_time` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider_receipts`
--

INSERT INTO `provider_receipts` (`provider_receipts_id`, `provider_id`, `bill_id`, `patient_id`, `date`, `currency`, `amount`, `received_amount`, `transaction_id`, `payment_mode`, `cheque_no`, `cheque_date`, `card_type`, `bank_name`, `remarks`, `rec_date_time`) VALUES
(1, 10, 227, 2, '2017-09-14', 'INR', '200.00', 0, 'cash', 'cash', '', '', '', '', '', ''),
(2, 10, 183, 2, '2017-09-14', 'INR', '0.00', 0, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(3, 10, 227, 2, '2017-09-14', 'INR', '100.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(4, 10, 226, 2, '2017-09-14', 'INR', '76.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(5, 10, 224, 2, '2017-09-14', 'INR', '808.00', 200, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(6, 10, 226, 2, '2017-09-15', 'INR', '6.00', 70, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(7, 10, 226, 2, '2017-09-15', 'INR', '53.00', 23, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(8, 10, 191, 2, '2017-09-15', 'INR', '440.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(9, 10, 189, 2, '2017-09-15', 'INR', '24677.00', 1000, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(10, 10, 194, 2, '2017-09-15', 'INR', '1020.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(11, 10, 195, 2, '2017-09-15', 'INR', '372.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(12, 10, 223, 2, '2017-09-15', 'INR', '908.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(13, 10, 227, 2, '2017-09-15', 'INR', '50.00', 50, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(14, 10, 227, 2, '2017-09-15', 'INR', '40.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(15, 10, 227, 2, '2017-09-15', 'INR', '0.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(16, 10, 227, 2, '2017-09-15', 'INR', '30.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(17, 10, 226, 2, '2017-09-15', 'INR', '43.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(18, 10, 226, 2, '2017-09-15', 'INR', '43.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(19, 10, 226, 2, '2017-09-15', 'INR', '33.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(20, 10, 226, 2, '2017-09-15', 'INR', '23.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(21, 10, 227, 2, '2017-09-16', 'INR', '20.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(22, 10, 227, 2, '2017-09-16', 'INR', '10.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(23, 10, 228, 2, '2017-09-16', 'INR', '700.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(24, 10, 228, 2, '2017-09-16', 'INR', '600.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(25, 10, 228, 2, '2017-09-16', 'INR', '550.00', 50, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(26, 10, 228, 2, '2017-09-16', 'INR', '530.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(27, 10, 228, 2, '2017-09-16', 'INR', '510.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(28, 10, 228, 2, '2017-09-16', 'INR', '500.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(29, 10, 228, 2, '2017-09-16', 'INR', '490.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(30, 10, 228, 2, '2017-09-16', 'INR', '480.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(31, 10, 228, 2, '2017-09-16', 'INR', '470.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(32, 10, 228, 2, '2017-09-16', 'INR', '460.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(33, 10, 228, 2, '2017-09-16', 'INR', '450.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(34, 10, 228, 2, '2017-09-16', 'INR', '410.00', 40, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(35, 10, 183, 2, '2017-09-16', 'INR', '0.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(36, 10, 183, 2, '2017-09-16', 'INR', '0.00', 0, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(37, 10, 183, 2, '2017-09-16', 'INR', '0.00', 1, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(38, 10, 228, 2, '2017-09-16', 'INR', '400.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(39, 10, 228, 2, '2017-09-16', 'INR', '390.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(40, 10, 228, 2, '2017-09-16', 'INR', '370.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(41, 10, 228, 2, '2017-09-16', 'INR', '370.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(42, 10, 228, 2, '2017-09-16', 'INR', '350.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(43, 10, 228, 2, '2017-09-16', 'INR', '340.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(44, 10, 228, 2, '2017-09-16', 'INR', '330.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(45, 10, 228, 2, '2017-09-16', 'INR', '320.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(46, 10, 228, 2, '2017-09-16', 'INR', '310.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(47, 10, 228, 2, '2017-09-16', 'INR', '290.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(48, 10, 228, 2, '2017-09-16', 'INR', '270.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(49, 10, 228, 2, '2017-09-16', 'INR', '260.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(50, 10, 228, 2, '2017-09-16', 'INR', '260.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(51, 10, 228, 2, '2017-09-16', 'INR', '250.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(52, 10, 228, 2, '2017-09-16', 'INR', '240.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(53, 10, 228, 2, '2017-09-16', 'INR', '220.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(54, 10, 228, 2, '2017-09-16', 'INR', '200.00', 20, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(55, 10, 228, 2, '2017-09-16', 'INR', '190.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(56, 10, 228, 2, '2017-09-16', 'INR', '180.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(57, 10, 228, 2, '2017-09-16', 'INR', '170.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(58, 10, 228, 2, '2017-09-16', 'INR', '70.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(59, 10, 228, 2, '2017-09-16', 'INR', '70.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(60, 10, 228, 2, '2017-09-16', 'INR', '70.00', 100, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(61, 10, 228, 2, '2017-09-16', 'INR', '60.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(62, 10, 228, 2, '2017-09-16', 'INR', '50.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(63, 10, 228, 2, '2017-09-16', 'INR', '45.00', 5, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(64, 10, 228, 2, '2017-09-16', 'INR', '40.00', 5, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(65, 10, 228, 2, '2017-09-16', 'INR', '35.00', 5, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(66, 10, 228, 2, '2017-09-16', 'INR', '30.00', 5, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(67, 10, 228, 2, '2017-09-16', 'INR', '25.00', 5, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(68, 10, 228, 2, '2017-09-16', 'INR', '20.00', 5, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(69, 10, 228, 2, '2017-09-16', 'INR', '18.00', 2, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(70, 10, 228, 2, '2017-09-16', 'INR', '18.00', 1, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(71, 10, 228, 2, '2017-09-16', 'INR', '8.00', 10, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, ''),
(72, 10, 228, 2, '2017-09-16', 'INR', '6.00', 2, 'cash', 'cash', NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `shade_guide`
--

CREATE TABLE `shade_guide` (
  `shade_guide_id` int(11) NOT NULL,
  `shade_name` varchar(100) NOT NULL,
  `provider_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shade_guide`
--

INSERT INTO `shade_guide` (`shade_guide_id`, `shade_name`, `provider_id`) VALUES
(1, 'VITA Classical (value order)', NULL),
(2, 'VITA Classical (sequential order)', NULL),
(3, 'VITA 3D-Master', NULL),
(4, 'VITA Bleachedguide 3D-Master', NULL),
(5, 'Ivoclar Vivadent: Chromascop', NULL),
(6, 'Ivoclar Vivadent: Bleach', NULL),
(7, 'Pending Completion of Bleaching', NULL),
(8, 'Dentsply Bioform IPN', NULL),
(9, 'Dentsply Portrait IPN', NULL),
(10, 'No Shade', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

CREATE TABLE `specialization` (
  `specialization_id` int(11) NOT NULL,
  `specialization_t` varchar(100) NOT NULL,
  `icon` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `treatment_id` int(11) NOT NULL,
  `treatment_name` varchar(100) NOT NULL,
  `treatment_description` varchar(500) NOT NULL,
  `other_details` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`treatment_id`, `treatment_name`, `treatment_description`, `other_details`) VALUES
(1, 'Dental_Crowns', '', ''),
(2, 'Dental_Bridges', '', ''),
(3, 'Dental_Coping', '', ''),
(4, 'Dental_implants', '', ''),
(5, 'Dental_Appliance', '', ''),
(6, 'Dental_Removables', '', ''),
(7, 'Dental_Implant_Restoration_Arch_type', '', ''),
(8, 'Miscellaneous ', '', ''),
(9, 'Adtional', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_items`
--

CREATE TABLE `treatment_items` (
  `treatment_items_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `item_header` varchar(25) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_description` varchar(500) NOT NULL,
  `item_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_items`
--

INSERT INTO `treatment_items` (`treatment_items_id`, `treatment_id`, `item_header`, `item_name`, `item_description`, `item_status`) VALUES
(1, 1, 'All Ceramic E-Max Restora', 'E-Max Veneer (Press-Layering)', '', 'active'),
(2, 1, 'All Ceramic E-Max Restora', 'E-Max Crown (Press-Layering)\r\n', '', 'active'),
(3, 1, 'All Ceramic E-Max Restora', 'E-Max Inlay (Press-Stain)', '', 'active'),
(4, 1, 'All Ceramic E-Max Restora', 'E- Max Thin Veneer (Stain)', '', 'active'),
(5, 1, 'All Ceramic E-Max Restora', 'E-Max Table Top Crown (Stain)', '', 'active'),
(6, 1, 'All Ceramic E-Max Restora', 'E-Max Cad-Cam inlay (Stain)', '', 'active'),
(7, 1, 'All Ceramic E-Max Restora', 'Vita Suprinity (Cad-Cam)', '', 'active'),
(8, 1, 'All Ceramic E-Max Restora', 'E-Max Onlay (Press-Stain)', '', 'active'),
(9, 1, 'All Ceramic E-Max Restora', 'E-Max Cad-Cam Onlay (Stain)', '', 'active'),
(10, 1, 'All Ceramic E-Max Restora', 'E-Max Cad-Cam Veneer (Stain)', '', 'active'),
(11, 1, 'All Ceramic E-Max Restora', 'E-max monolithic Crown (Press -Stain)', '', 'active'),
(12, 1, 'All Ceramic E-Max Restora', 'E-Max Veneer (Press- Stain)', '', 'active'),
(13, 1, 'All Ceramic E-Max Restora', 'E-Max Cad-Cam Crown', '', 'active'),
(14, 1, 'Composit Restorations', 'Composit implant Crown', '', 'active'),
(15, 1, 'Composit Restorations', 'Composite Crown', '', 'active'),
(16, 1, 'Composit Restorations', 'Composite Crown layering on Metal', '', 'active'),
(17, 1, 'Composit Restorations', 'Composite Inlay Onlay', '', 'active'),
(18, 1, 'Composit Restorations', 'Maryland Bridge Composit (1 Pontic, 2 wings)', '', 'active'),
(19, 1, 'Zirconia Restorations', 'Monolithic Zirconia Crown (Stain)', '', 'active'),
(20, 1, 'Zirconia Restorations', 'Zirconia Crown (layering)', '', 'active'),
(21, 1, 'Zirconia Restorations', 'Zolid Fx Zirconia Crown (Stain)', '', 'active'),
(22, 1, 'Zirconia Restorations', 'Zirconia Inlay (stain)', '', 'active'),
(23, 1, 'Zirconia Restorations', 'Zirconia Onlay (Stain)', '', 'active'),
(24, 1, 'Zirconia Restorations', 'Nobel Procera Crown (Layering)', '', 'active'),
(25, 1, 'Zirconia Restorations', 'Nobel Procera FCZ Crown', '', 'active'),
(26, 1, 'Metal Restorations', 'Ceramill Sintron Inlay & onlay (Cad-Cam)', '', 'active'),
(27, 1, 'Metal Restorations', 'Ceramill sintron Full Metal Crown(Cad-Cam)', '', 'active'),
(28, 1, 'Metal Restorations', 'Titanium Full Crown', '', 'active'),
(29, 1, 'Metal Restorations', 'Titanium Crown Composite Layering', '', 'active'),
(30, 1, 'Metal Restorations', 'Full Metal Crown', '', 'active'),
(31, 1, 'Metal Restorations', 'Inlay & Onlay (Casting Metal)', '', 'active'),
(32, 1, 'Metal Restorations', 'Gold Cast Crown', '', 'active'),
(33, 1, 'Metal Restorations', 'Post Core', '', 'active'),
(34, 1, 'Metal Restorations', 'Metal Coping ( for over denture)', '', 'active'),
(35, 1, 'P.F.M. Restorations', 'Ceramill Sintron PFM. Crown (Cad-Cam)', '', 'active'),
(36, 1, 'P.F.M. Restorations', 'PFM Crown', '', 'active'),
(37, 1, 'P.F.M. Restorations', 'Post Core with Crown', '', 'active'),
(38, 1, 'Peek Restoration', 'Peek Crown', '', 'active'),
(39, 1, 'Peek Restoration', 'Peek Telescop Crown', '', 'active'),
(40, 1, 'Peek Restoration', 'Peek Crown With Layering', '', 'active'),
(41, 1, 'Peek Restoration', 'Peek Framework 1 To 3 Unit', '', 'active'),
(42, 1, 'Wax Restoration', 'Diagnostic Wax-Up', '', 'active'),
(43, 1, 'Wax Restoration', 'Diagnostic Wax-Up (Cad-Cam)', '', 'active'),
(44, 1, 'Temprorary Restorations', 'Cad-Cam Temp Crown', '', 'active'),
(45, 1, 'Temprorary Restorations', 'Regular Temp Crown', '', 'active'),
(46, 2, 'Zirconia Restorations', 'Zirconia Crown (layering)', '', 'active'),
(47, 2, 'Zirconia Restorations', 'Nobel Procera Crown (Layering)', '', 'active'),
(48, 2, 'Zirconia Restorations', 'Nobel Procera FCZ Crown', '', 'active'),
(49, 2, 'Zirconia Restorations', 'Zirconia Inlay (stain)', '', 'active'),
(50, 2, 'Zirconia Restorations', 'Zirconia Onlay (Stain)', '', 'active'),
(51, 2, 'Zirconia Restorations', 'Zolid Fx Zirconia Crown (Stain)', '', 'active'),
(52, 2, 'Zirconia Restorations', 'Monolithic Zirconia Crown (Stain)', '', 'active'),
(53, 2, 'P.F.M. Restorations', 'PFM Crown', '', 'active'),
(54, 2, 'P.F.M. Restorations', 'Post Core with Crown', '', 'active'),
(55, 2, 'P.F.M. Restorations', 'Ceramill Sintron PFM. Crown (Cad-Cam)', '', 'active'),
(56, 2, 'Metal Restorations', 'Full Metal Crown', '', 'active'),
(57, 2, 'Metal Restorations', 'Inlay & Onlay (Casting Metal)', '', 'active'),
(58, 2, 'Metal Restorations', 'Gold Cast Crown', '', 'active'),
(59, 2, 'Metal Restorations', 'Post Core', '', 'active'),
(60, 2, 'Metal Restorations', 'Metal Coping ( for over denture)', '', 'active'),
(61, 2, 'Metal Restorations', 'Titanium Full Crown', '', 'active'),
(62, 2, 'Metal Restorations', 'Titanium Crown Composite Layering', '', 'active'),
(63, 2, 'Metal Restorations', 'Ceramill sintron Full Metal Crown(Cad-Cam)', '', 'active'),
(64, 2, 'Metal Restorations', 'Ceramill Sintron Inlay & onlay (Cad-Cam)', '', 'active'),
(65, 2, 'Composit Restorations', 'Composite Crown', '', 'active'),
(66, 2, 'Composit Restorations', 'Composite Crown layering on Metal', '', 'active'),
(67, 2, 'Composit Restorations', 'Composite Inlay Onlay', '', 'active'),
(68, 2, 'Composit Restorations', 'Maryland Bridge Composit (1 Pontic, 2 wings)', '', 'active'),
(69, 2, 'Composit Restorations', 'Composit implant Crown', '', 'active'),
(70, 2, 'Peek Restoration', 'Peek Crown', '', 'active'),
(71, 2, 'Peek Restoration', 'Peek Telescop Crown', '', 'active'),
(72, 2, 'Peek Restoration', 'Peek Crown With Layering', '', 'active'),
(73, 2, 'Peek Restoration', 'Peek Framework 1 To 3 Unit', '', 'active'),
(74, 2, 'Wax Restoration', 'Diagnostic Wax-Up', '', 'active'),
(75, 2, 'Wax Restoration', 'Diagnostic Wax-Up (Cad-Cam)', '', 'active'),
(76, 2, 'Temprorary Restorations', 'Cad-Cam Temp Crown', '', 'active'),
(77, 2, 'Temprorary Restorations', 'Regular Temp Crown', '', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_mst`
--

CREATE TABLE `user_mst` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `login_id` varchar(100) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `password_reset` int(11) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL,
  `rec_cre_time` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_mst`
--

INSERT INTO `user_mst` (`user_id`, `full_name`, `login_id`, `vendor_id`, `password`, `password_reset`, `role`, `rec_cre_time`, `status`, `valid_from`, `valid_to`) VALUES
(9, 'ramesh kumar', 'ramesh321', 1, '770c3cbf77615a1d94f88d0f9ed148823de46e4518a3f290fec2859e85b501ef', 1, 1, '0000-00-00 00:00:00', 'active', '2017-03-13', '2019-03-29'),
(10, 'manaager', 'ramesh123', 2, '770c3cbf77615a1d94f88d0f9ed148823de46e4518a3f290fec2859e85b501ef', 1, 2, '0000-00-00 00:00:00', 'active', '2017-03-14', '2019-03-29'),
(11, 'admin', 'admin1', 1, '770c3cbf77615a1d94f88d0f9ed148823de46e4518a3f290fec2859e85b501ef', 1, 3, '0000-00-00 00:00:00', 'active', '2017-03-15', '2019-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `provider_type_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `menu` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role_id`, `provider_type_id`, `role_name`, `role`, `menu`) VALUES
(1, 0, 'Front Office', 'Assitant', ',search,patient,viewapp,billing,bp,receipt,leave,daily_collection,periodwise_collection'),
(2, 0, 'Medical Director', 'Manager', ',search,services,roster,holiday,bp,receipt,daily_collection,periodwise_collection'),
(3, 0, 'Super User', 'Super', ',search,patient,viewapp,billing,bp,receipt,services,roster,leave,holiday,daily_collection,periodwise_collection');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointments_id`);

--
-- Indexes for table `appointment_comments`
--
ALTER TABLE `appointment_comments`
  ADD PRIMARY KEY (`appointment_comments_id`);

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `case_summary`
--
ALTER TABLE `case_summary`
  ADD PRIMARY KEY (`case_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `clinic_patients_link`
--
ALTER TABLE `clinic_patients_link`
  ADD PRIMARY KEY (`clinic_patient_id`);

--
-- Indexes for table `conferences`
--
ALTER TABLE `conferences`
  ADD PRIMARY KEY (`conference_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `dental_products`
--
ALTER TABLE `dental_products`
  ADD PRIMARY KEY (`dental_product_id`);

--
-- Indexes for table `dentist_schedule`
--
ALTER TABLE `dentist_schedule`
  ADD PRIMARY KEY (`id_dentist_schedule`),
  ADD KEY `detists_dentist_id` (`dentists_dentist_id`);

--
-- Indexes for table `enclosures`
--
ALTER TABLE `enclosures`
  ADD PRIMARY KEY (`enclosures_id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`holiday_id`);

--
-- Indexes for table `isoi_delegates`
--
ALTER TABLE `isoi_delegates`
  ADD PRIMARY KEY (`delegate_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`leaves_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `provider_billing`
--
ALTER TABLE `provider_billing`
  ADD PRIMARY KEY (`provider_billing_id`);

--
-- Indexes for table `provider_details`
--
ALTER TABLE `provider_details`
  ADD PRIMARY KEY (`provider_details_id`);

--
-- Indexes for table `provider_receipts`
--
ALTER TABLE `provider_receipts`
  ADD PRIMARY KEY (`provider_receipts_id`);

--
-- Indexes for table `specialization`
--
ALTER TABLE `specialization`
  ADD PRIMARY KEY (`specialization_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`treatment_id`);

--
-- Indexes for table `treatment_items`
--
ALTER TABLE `treatment_items`
  ADD PRIMARY KEY (`treatment_items_id`);

--
-- Indexes for table `user_mst`
--
ALTER TABLE `user_mst`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointments_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `appointment_comments`
--
ALTER TABLE `appointment_comments`
  MODIFY `appointment_comments_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_items`
--
ALTER TABLE `bill_items`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `case_summary`
--
ALTER TABLE `case_summary`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clinic_patients_link`
--
ALTER TABLE `clinic_patients_link`
  MODIFY `clinic_patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `conferences`
--
ALTER TABLE `conferences`
  MODIFY `conference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `dental_products`
--
ALTER TABLE `dental_products`
  MODIFY `dental_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dentist_schedule`
--
ALTER TABLE `dentist_schedule`
  MODIFY `id_dentist_schedule` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `enclosures`
--
ALTER TABLE `enclosures`
  MODIFY `enclosures_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `isoi_delegates`
--
ALTER TABLE `isoi_delegates`
  MODIFY `delegate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1293;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `leaves_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provider_billing`
--
ALTER TABLE `provider_billing`
  MODIFY `provider_billing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `provider_details`
--
ALTER TABLE `provider_details`
  MODIFY `provider_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `provider_receipts`
--
ALTER TABLE `provider_receipts`
  MODIFY `provider_receipts_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `specialization`
--
ALTER TABLE `specialization`
  MODIFY `specialization_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `treatment_items`
--
ALTER TABLE `treatment_items`
  MODIFY `treatment_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `user_mst`
--
ALTER TABLE `user_mst`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2018 at 08:12 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydentisttree`
--

-- --------------------------------------------------------

--
-- Table structure for table `dentists`
--

CREATE TABLE `dentists` (
  `dentist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `dental_reg_no` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `aadhar_no` int(15) DEFAULT NULL,
  `pan_no` varchar(100) NOT NULL,
  `dental_licence_no_1` varchar(100) NOT NULL,
  `dental_licence_no_2` varchar(100) NOT NULL,
  `dental_specialization` varchar(100) NOT NULL,
  `qualificatoin` varchar(50) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `pincode` int(50) NOT NULL,
  `university_details` varchar(100) NOT NULL,
  `practicing_since` varchar(100) NOT NULL,
  `reg_date` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `dentists`
--

INSERT INTO `dentists` (`dentist_id`, `user_id`, `clinic_id`, `dental_reg_no`, `name`, `email`, `mobile`, `gender`, `dob`, `aadhar_no`, `pan_no`, `dental_licence_no_1`, `dental_licence_no_2`, `dental_specialization`, `qualificatoin`, `vendor_id`, `address`, `city`, `state`, `country`, `pincode`, `university_details`, `practicing_since`, `reg_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 0, '', 'pooja', 'pooja@gmail.com', '83900000', 'female', '1994-03-04', 0, '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '2018-04-13 18:46:50', '2018-04-13 18:46:50'),
(2, 0, 0, '', 'pooja', 'poojakhatri888@gmail.com', '83900000', 'female', '1994-03-04', 0, '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '2018-04-13 18:50:51', '2018-04-13 18:50:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dentists`
--
ALTER TABLE `dentists`
  ADD PRIMARY KEY (`dentist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dentists`
--
ALTER TABLE `dentists`
  MODIFY `dentist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
