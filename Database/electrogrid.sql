-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 13, 2022 at 10:46 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogrid`
--

-- --------------------------------------------------------

--
-- Table structure for table `ebill`
--

CREATE TABLE `ebill` (
  `billID` int(11) NOT NULL,
  `eaNumber` int(11) NOT NULL,
  `cusName` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `billingDate` varchar(100) NOT NULL,
  `tType` varchar(100) NOT NULL DEFAULT 'Domestic',
  `dDates` varchar(100) NOT NULL DEFAULT '30 days',
  `conn` varchar(100) NOT NULL DEFAULT '30A',
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ebill`
--

INSERT INTO `ebill` (`billID`, `eaNumber`, `cusName`, `address`, `billingDate`, `tType`, `dDates`, `conn`, `amount`) VALUES
(2, 34567, 'K. Ranaweera', 'No:138/A, Lotus road, Gampaha.', '30/03/2022', 'Domestic', '30 days', '30A', 1578.49),
(3, 25436, 'C.Alwis', 'No:10, Galle road, Weligama.', '30/03/2022', 'Domestic', '30 days', '30A', 12435.87),
(4, 46057, 'L.Dissanayake', 'No:138/A, Awissawella road, Kosgama.', '30/03/2022', 'Domestic', '30 days', '30A', 3457.98);

--
-- Triggers `ebill`
--
DELIMITER $$
CREATE TRIGGER `tgr_deleteEBill` BEFORE DELETE ON `ebill` FOR EACH ROW INSERT INTO previous_ebill VALUES(OLD.billID, OLD.eaNumber, OLD.cusName, OLD.address, OLD.billingDate, OLD.tType, OLD.dDates, OLD.conn, OLD.amount, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `previous_ebill`
--

CREATE TABLE `previous_ebill` (
  `billID` int(11) NOT NULL,
  `eaNumber` int(11) NOT NULL,
  `cusName` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `billingDate` varchar(100) NOT NULL,
  `tType` varchar(100) NOT NULL,
  `dDates` varchar(100) NOT NULL,
  `conn` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `delTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `previous_ebill`
--

INSERT INTO `previous_ebill` (`billID`, `eaNumber`, `cusName`, `address`, `billingDate`, `tType`, `dDates`, `conn`, `amount`, `delTime`) VALUES
(4, 25436, 'C.Alwis', 'No:10, Galle road, Weligama.', '30/03/2022', 'Domestic', '30 days', '30A', 12435.87, '2022-04-11 18:58:29'),
(1, 27949, 'R.Perera', 'No:12/B, Temple road, Maharagama.', '30/03/2022', 'Domestic', '30 days', '30A', 1443.79, '2022-04-11 23:13:31'),
(5, 46057, 'L.Dissanayake', 'No:138/A, Awissawella road, Kosgama.', '30/03/2022', 'Domestic', '30 days', '30A', 2543.21, '2022-04-16 16:49:18'),
(5, 12345, 'N.Kalanaka', 'No:14/B, School Lane, Kadawatha', '30/03/2022', 'Domestic', '30 days', '30A', 2500, '2022-04-22 21:31:25'),
(5, 12345, 'R. sadun', 'No:14/B, Shool Lane, Kadawatha.', '30/03/2022', 'Domestic', '30 days', '30A', 2500, '2022-05-04 01:33:07'),
(6, 27278, 'S. Bandara', 'No:27/C, Lotus Junction, Kelaniya.', '30/03/2022', 'Domestic', '30 days', '30A', 1578, '2022-05-05 00:20:24'),
(5, 12345, 'N.Kalanaka', 'No:138/B, School Lane, Kadawatha.', '30/03/2022', 'Domestic', '30 days', '30A', 1575.12, '2022-05-10 20:07:19'),
(5, 12345, 'N.Kalanaka', 'No:138/B, School Lane, Kadawatha.', '30/03/2022', 'Domestic', '30 days', '30A', 1575.12, '2022-05-11 22:59:52'),
(7, 12345, 'N.Kalanaka', 'No:138/B, School Lane, Kadawatha.', '30/03/2022', 'Domestic', '30 days', '30A', 1500, '2022-05-11 23:00:54'),
(6, 12345, 'N.Kalanaka', 'No%3A138%2FB%2C+School+Lane%2C+Kadawatha.', '30%2F03%2F2022', 'Domestic', '30 days', '30A', 1500, '2022-05-11 23:28:53'),
(8, 12345, 'N.Kalanaka', 'No:138/B, School Lane, Kadawatha.', '30/03/2022', 'Domestic', '30 days', '30A', 1575.12, '2022-05-11 23:30:47'),
(9, 12345, 'N.Kalanaka', 'No%3A138%2FB%2C+School+Lane%2C+Kadawatha.', '30%2F03%2F2022', 'Domestic', '30 days', '30A', 1500, '2022-05-11 23:34:02'),
(11, 12345, 'N.Kalanaka', 'No:138/B, School Lane, Kadawatha.', '30/03/2022', 'Domestic', '30 days', '30A', 1500, '2022-05-11 23:35:18'),
(10, 12345, 'N.Kalanaka', 'No:138/B, School Lane, Kadawatha.', '30/03/2022', 'Domestic', '30 days', '30A', 1575.12, '2022-05-11 23:47:43'),
(12, 12345, 'L.Dissanayaka', 'No%3A138%2FB%2C+School+Lane%2C+Kadawatha.', '30%2F03%2F2022', 'Domestic', '30 days', '30A', 1500, '2022-05-11 23:48:21'),
(13, 12345, 'N.Kalanaka', 'No%3A138%2FB%2C+School+Lane%2C+Kadawatha.', '30%2F03%2F2022', 'Domestic', '30 days', '30A', 1500, '2022-05-11 23:57:13'),
(14, 12345, 'N.Kalanaka', 'No%3A138%2FB%2CSchool+Lane%2CKadawatha.', '30%2F03%2F2022', 'Domestic', '30 days', '30A', 1500, '2022-05-13 00:50:32'),
(5, 54321, 'Ranjith Perera', 'No: 17/D, Rose Garden, Battaramulla.', '30/03/2022', 'Domestic', '30 days', '30A', 5126.89, '2022-05-13 07:36:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ebill`
--
ALTER TABLE `ebill`
  ADD PRIMARY KEY (`billID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ebill`
--
ALTER TABLE `ebill`
  MODIFY `billID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
