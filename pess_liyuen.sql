-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2019 at 09:59 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pess_liyuen`
--

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incidentid` int(11) NOT NULL,
  `patrolcarld` varchar(10) NOT NULL,
  `timeDispatched` datetime NOT NULL,
  `timeArrived` datetime NOT NULL,
  `timeCompleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incidentid` int(11) NOT NULL,
  `callerName` varchar(30) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `incidentTypeid` varchar(3) NOT NULL,
  `incidentLocation` varchar(50) NOT NULL,
  `incidentDesc` varchar(100) NOT NULL,
  `incidentStatusid` varchar(1) NOT NULL,
  `timecalled` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incidentid`, `callerName`, `phoneNumber`, `incidentTypeid`, `incidentLocation`, `incidentDesc`, `incidentStatusid`, `timecalled`) VALUES
(1, 'shumei', '94894894', '010', 'yio chu kang', 'asdfghj', '1', '2019-02-27 07:29:45'),
(2, 'shumei', '94894894', '010', 'yio chu kang', 'asdfghj', '1', '2019-02-27 07:36:36'),
(3, 'shumei', '94894894', '010', 'yio chu kang', 'asdfgh', '1', '2019-02-27 07:37:29'),
(4, 'shumei', '94894894', '010', 'yio chu kang', 'asdfghjk', '1', '2019-03-05 02:12:50'),
(5, 'fgfc', 'sdfdghh', '010', 'dfghj', 'gfhjj', '1', '2019-03-05 02:15:27'),
(6, 'shumei', '94894894', '030', 'yio chu kang', 'wertyuip', '1', '2019-03-06 05:58:01'),
(7, 'shumei', '94894894', '010', 'yio chu kang', 'asdfghj', '1', '2019-03-06 06:00:35'),
(8, 'shumei', '94894894', '010', 'yio chu kang', 'xcghjkl', '1', '2019-03-06 06:04:36'),
(9, 'shumei', '94894894', '010', 'yio chu kang', 'wdyu', '1', '2019-03-11 08:16:57'),
(10, 'shumei', '94894894', '010', 'yio chu kang', 'wdyu', '1', '2019-03-11 08:18:38'),
(11, 'shumei', '94894894', '010', 'yio chu kang', 'qasdfghj', '1', '2019-03-11 08:23:57'),
(12, 'dfghjkl', 'fchj', '010', 'cvbn', 'fch', '1', '2019-03-11 08:33:05'),
(13, 'fdgchj', 'fghj', '010', 'ghhjkl', 'fgvhbjnk', '1', '2019-03-11 08:33:23'),
(14, 'shumei', '94894894', '010', 'yio chu kang', 'asdfgh', '1', '2019-03-11 08:48:58');

-- --------------------------------------------------------

--
-- Table structure for table `incidenttype`
--

CREATE TABLE `incidenttype` (
  `incidentTypeId` varchar(3) NOT NULL,
  `incidentTypeDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incidenttype`
--

INSERT INTO `incidenttype` (`incidentTypeId`, `incidentTypeDesc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Dosmetic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Loan Shark'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `statusId` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`statusId`, `statusDesc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcarId` varchar(10) NOT NULL,
  `patrolcarStatusId` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcarId`, `patrolcarStatusId`) VALUES
('QX1234A', '1'),
('QX3456B', '2'),
('QX1111J', '3'),
('QX2222K', '4'),
('QX5555D', '2'),
('QX2288D', '3'),
('QX8769P', '4'),
('QX1342G', '1'),
('QX8723W', '2'),
('QX8923T', '3');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `statusId` varchar(1) NOT NULL,
  `statusDesc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`statusId`, `statusDesc`) VALUES
('1', 'Dispatched'),
('2', 'Patrol'),
('3', 'Free'),
('4', 'Arrived');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incidentid`,`patrolcarld`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incidentid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incidentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
