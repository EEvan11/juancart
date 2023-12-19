-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2023 at 09:06 PM
-- Server version: 10.6.16-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kbndatabase`
--

DELIMITER $$
--
-- Procedures
--
$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `audittrailmarketing`
--

CREATE TABLE `audittrailmarketing` (
  `ID` int(11) NOT NULL,
  `DateAction` datetime NOT NULL,
  `UserID` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audittrailmarketing`
--

INSERT INTO `audittrailmarketing` (`ID`, `DateAction`, `UserID`, `Description`) VALUES
(1, '2023-10-30 19:09:39', '1', 'Confirm Stock - TrackingID: 1'),
(2, '2023-10-31 11:27:02', '1', 'KBN Manual Create Account - Bryan Ken S Altes'),
(3, '2023-10-31 13:13:10', '1', 'Approved Order - Reference #: ref1'),
(4, '2023-10-31 13:13:28', '1', 'Approved Order - Reference #: ref2'),
(5, '2023-10-31 13:13:48', '1', 'Approved Order - Reference #: ref3'),
(6, '2023-10-31 13:41:53', '1', 'KBN Manual Create Account - Miguel Antonio  A Besa'),
(7, '2023-10-31 13:47:43', '1', 'Approved Order - Reference #: ref4'),
(8, '2023-10-31 14:05:58', '1', 'KBN Product Archive - Age Eraser Soap(135g)'),
(9, '2023-11-01 22:18:14', '1', 'Approved Order - Reference #: ref6'),
(10, '2023-11-01 23:16:43', '1', 'Approved Order - Reference #: ref7'),
(11, '2023-11-03 12:12:39', '1', 'KBN Manual Create Account - Nola D Schmidt'),
(12, '2023-11-03 12:33:01', '1', 'Confirm Stock - TrackingID: 2'),
(13, '2023-11-05 23:14:37', '1', 'Rebranding Add Product to admin#253 - Anti-Aging Serum (30ml)'),
(14, '2023-11-05 23:24:40', '1', 'Rebranding Add Product to admin#253 - Moisturizing Cream (50ml)'),
(15, '2023-11-05 23:33:04', '1', 'Rebranding Add Product to admin#253 - Hydrating Toner (200ml)'),
(16, '2023-11-07 20:47:59', '1', 'KBN Manual Create Account - Amanda Mag Mason'),
(17, '2023-11-07 22:42:24', '1', 'KBN Manual Create Account - Rizal P Jose'),
(18, '2023-11-08 01:30:08', '1', 'Rebranding Product Archive - Anti-Aging Serum (30ml)'),
(19, '2023-11-08 01:31:05', '1', 'Rebranding Product Restore - Anti-Aging Serum (30ml)'),
(20, '2023-11-08 01:40:03', '1', 'Rebranding Product Archive - Anti-Aging Serum (30ml)'),
(21, '2023-11-08 01:40:08', '1', 'Rebranding Product Restore - Anti-Aging Serum (30ml)'),
(22, '2023-11-08 19:56:55', '1', 'KBN Manual Create Account - raven a berenguila'),
(23, '2023-11-09 22:38:12', '1', 'Rebranding Product Archive - Anti-Aging Serum (30ml)'),
(24, '2023-11-09 22:38:17', '1', 'Rebranding Product Restore - Anti-Aging Serum (30ml)'),
(25, '2023-11-11 02:08:32', '1', 'KBN Manual Create Account - test test test'),
(26, '2023-11-11 02:18:10', '1', 'KBN Manual Create Account - Bryan Ken S Altes'),
(27, '2023-11-11 02:21:44', '1', 'KBN Manual Create Account - TestF TestM TestL'),
(28, '2023-11-11 05:53:34', '1', 'Approved Order - Reference #: ref8'),
(29, '2023-11-12 10:08:15', '1', 'Approved Order - Reference #: ref9'),
(30, '2023-11-12 16:15:17', '1', 'Approved Order - Reference #: ref10'),
(31, '2023-11-14 14:13:30', '1', 'Confirm Stock - TrackingID: 6'),
(32, '2023-11-15 09:54:49', '1', 'Approved Order - Reference #: ref11'),
(33, '2023-11-15 11:09:03', '1', 'KBN Manual Create Account - asd as asda'),
(34, '2023-11-18 02:25:25', '1', 'KBN Product Archive - Toner(60ml)'),
(35, '2023-11-18 02:25:34', '1', 'KBN Product Restore - Toner(60ml)'),
(36, '2023-11-18 02:25:37', '1', 'KBN Product Restore - Age Eraser Soap(135g)'),
(37, '2023-11-18 02:35:27', '1', 'Approved Order - Reference #: ref15'),
(38, '2023-11-19 00:52:55', '1', 'Approved Order - Reference #: ref14'),
(39, '2023-11-19 13:32:02', '1', 'Add Item: Packaging - Clear Plastic'),
(40, '2023-11-20 01:08:35', '1', 'Approved Order - Reference #: ref16'),
(41, '2023-11-20 01:08:39', '1', 'Approved Order - Reference #: ref17'),
(42, '2023-11-20 01:08:44', '1', 'Approved Order - Reference #: ref18'),
(43, '2023-11-20 01:08:49', '1', 'Approved Order - Reference #: ref19'),
(44, '2023-11-20 01:08:53', '1', 'Approved Order - Reference #: ref20'),
(45, '2023-11-20 01:09:00', '1', 'Approved Order - Reference #: ref21'),
(46, '2023-11-20 01:09:06', '1', 'Approved Order - Reference #: ref22'),
(47, '2023-11-20 01:09:11', '1', 'Approved Order - Reference #: ref23'),
(48, '2023-11-20 01:09:14', '1', 'Approved Order - Reference #: ref24'),
(49, '2023-11-20 01:09:17', '1', 'Approved Order - Reference #: ref25'),
(50, '2023-11-20 01:09:22', '1', 'Approved Order - Reference #: ref26'),
(51, '2023-11-20 01:09:25', '1', 'Approved Order - Reference #: ref27'),
(52, '2023-11-20 01:09:30', '1', 'Approved Order - Reference #: ref28'),
(53, '2023-11-20 01:09:33', '1', 'Approved Order - Reference #: ref29'),
(54, '2023-11-20 01:20:07', '1', 'Approved Order - Reference #: ref30'),
(55, '2023-11-20 01:26:12', '1', 'Approved Order - Reference #: ref31'),
(56, '2023-11-20 20:56:31', '1', 'Approved Order - Reference #: ref39'),
(57, '2023-11-20 20:56:34', '1', 'Approved Order - Reference #: ref38'),
(58, '2023-11-20 20:56:38', '1', 'Approved Order - Reference #: ref37'),
(59, '2023-11-20 20:56:41', '1', 'Approved Order - Reference #: ref36'),
(60, '2023-11-20 20:56:45', '1', 'Approved Order - Reference #: ref35'),
(61, '2023-11-20 20:56:49', '1', 'Approved Order - Reference #: ref34'),
(62, '2023-11-20 20:56:52', '1', 'Approved Order - Reference #: ref33'),
(63, '2023-11-20 20:56:55', '1', 'Approved Order - Reference #: ref32'),
(64, '2023-11-20 22:51:46', '1', 'Approved Order - Reference #: ref40'),
(65, '2023-11-20 22:51:50', '1', 'Approved Order - Reference #: ref41'),
(66, '2023-11-20 22:51:57', '1', 'Approved Order - Reference #: ref42'),
(67, '2023-11-20 22:52:02', '1', 'Approved Order - Reference #: ref43'),
(68, '2023-11-20 22:52:06', '1', 'Approved Order - Reference #: ref44'),
(69, '2023-11-20 22:52:10', '1', 'Approved Order - Reference #: ref45'),
(70, '2023-11-20 22:52:13', '1', 'Approved Order - Reference #: ref46'),
(71, '2023-11-20 22:52:17', '1', 'Approved Order - Reference #: ref47'),
(72, '2023-11-20 22:52:20', '1', 'Approved Order - Reference #: ref48'),
(73, '2023-11-20 22:52:24', '1', 'Approved Order - Reference #: ref49'),
(74, '2023-11-20 22:52:27', '1', 'Approved Order - Reference #: ref50'),
(75, '2023-11-20 22:52:32', '1', 'Approved Order - Reference #: ref51'),
(76, '2023-11-20 22:52:43', '1', 'Approved Order - Reference #: ref52'),
(77, '2023-11-20 22:53:24', '1', 'Approved Order - Reference #: ref53'),
(78, '2023-11-20 22:53:28', '1', 'Approved Order - Reference #: ref54'),
(79, '2023-11-20 22:53:31', '1', 'Approved Order - Reference #: ref55'),
(80, '2023-11-20 22:53:34', '1', 'Approved Order - Reference #: ref56'),
(81, '2023-11-20 22:53:38', '1', 'Approved Order - Reference #: ref57'),
(82, '2023-11-20 22:53:42', '1', 'Approved Order - Reference #: ref58'),
(83, '2023-11-20 22:53:46', '1', 'Approved Order - Reference #: ref59'),
(84, '2023-11-20 22:53:50', '1', 'Approved Order - Reference #: ref60'),
(85, '2023-11-22 17:27:20', '1', 'Approved Order - Reference #: ref63'),
(86, '2023-11-22 17:28:58', '1', 'Approved Order - Reference #: ref64'),
(87, '2023-11-22 20:51:16', '1', 'Approved Order - Reference #: ref68'),
(88, '2023-11-22 23:28:30', '1', 'Approved Order - Reference #: ref65'),
(89, '2023-11-22 23:28:44', '1', 'Approved Order - Reference #: ref70'),
(90, '2023-11-22 23:28:49', '1', 'Approved Order - Reference #: ref69'),
(91, '2023-11-22 23:28:55', '1', 'Approved Order - Reference #: ref67'),
(92, '2023-11-22 23:29:00', '1', 'Approved Order - Reference #: ref66'),
(93, '2023-11-23 03:50:52', '1', 'Approved Order - Reference #: ref71'),
(94, '2023-11-27 00:01:35', '1', 'KBN Product Added - Test(Testtt)'),
(95, '2023-11-27 00:08:37', '1', 'KBN Product - Update Test(Testtt)'),
(96, '2023-11-27 00:44:05', '1', 'KBN Manual Create Account - Armand Er French'),
(97, '2023-11-27 00:52:01', '1', 'KBN Manual Create Account - Armand Er French'),
(98, '2023-11-27 18:18:57', '1', 'KBN Manual Create Account - Bryan Ken S Altes'),
(99, '2023-11-27 18:21:30', '1', 'KBN Manual Create Account - Carson It Waller');

-- --------------------------------------------------------

--
-- Table structure for table `audittrailproduction`
--

CREATE TABLE `audittrailproduction` (
  `ID` int(11) NOT NULL,
  `DateAction` datetime NOT NULL,
  `UserID` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audittrailproduction`
--

INSERT INTO `audittrailproduction` (`ID`, `DateAction`, `UserID`, `Description`) VALUES
(1, '2023-11-07 15:11:44', '1', 'Added Rebranding Product - Moisturizing Cream (50ml)'),
(2, '2023-11-07 15:19:53', '1', 'Added KBN Product - 100pcs, Isopropyl Alcohol (1 litter)'),
(3, '2023-11-07 15:20:16', '1', 'Delete KBN Product - TrackingID = 4, ID = 23'),
(4, '2023-11-14 14:08:05', '1', 'Added KBN Product - 1000pcs, Glutamansi Soap (50g)'),
(5, '2023-11-14 14:08:17', '1', 'Delete KBN Product - TrackingID = 5, ID = 24'),
(6, '2023-11-14 14:08:43', '1', 'Added KBN Product - 10000pcs, Glutamansi Soap (50g)'),
(7, '2023-11-14 14:08:56', '1', 'Added KBN Product - 10000pcs, Kojic Rejuvinating Soap (135g)'),
(8, '2023-11-14 14:09:06', '1', 'Added KBN Product - 10000pcs, Kojic Rejuvinating Soap (110g)'),
(9, '2023-11-14 14:09:29', '1', 'Added KBN Product - 10000pcs, Bleaching Soap (70g)'),
(10, '2023-11-14 14:09:41', '1', 'Added KBN Product - 10000pcs, Revitalize Whitening Beauty Bar (135g)'),
(11, '2023-11-14 14:09:54', '1', 'Added KBN Product - 10000pcs, Snail Max White Lotion (250ml)'),
(12, '2023-11-14 14:10:04', '1', 'Added KBN Product - 10000pcs, Glutamansi Lotion (250ml)'),
(13, '2023-11-14 14:10:14', '1', 'Added KBN Product - 10000pcs, Bleaching Lotion (250ml)'),
(14, '2023-11-14 14:10:23', '1', 'Added KBN Product - 10000pcs, Gluta White Lotion (250ml)'),
(15, '2023-11-14 14:10:47', '1', 'Added KBN Product - 10000pcs, Sunblock (10g)'),
(16, '2023-11-14 14:11:26', '1', 'Added KBN Product - 10000pcs, Bright Cream (10g)'),
(17, '2023-11-14 14:11:39', '1', 'Added KBN Product - 10000pcs, Toner (60ml)'),
(18, '2023-11-14 14:11:50', '1', 'Added KBN Product - 10000pcs, Rejuvenating Set (Kojic Soap, Sunblock, Night Cream, Toner)'),
(19, '2023-11-14 14:12:03', '1', 'Added KBN Product - 10000pcs, Gel Toner (60ml)'),
(20, '2023-11-14 14:12:11', '1', 'Added KBN Product - 10000pcs, Facial Wash (80ml)'),
(21, '2023-11-14 14:12:24', '1', 'Added KBN Product - 10000pcs, Serum (5g)'),
(22, '2023-11-14 14:12:32', '1', 'Added KBN Product - 10000pcs, Sun Block (10g)'),
(23, '2023-11-14 14:12:43', '1', 'Added KBN Product - 10000pcs, Radiant Glow Facial Set (Gel Toner, Facial Wash, Serum, Sunblock)'),
(24, '2023-11-14 14:12:53', '1', 'Added KBN Product - 10000pcs, Isopropyl Alcohol (1 litter)'),
(25, '2023-11-14 14:13:01', '1', 'Added KBN Product - 10000pcs, Isopropyl Alcohol (60ml)'),
(26, '2023-11-18 10:18:28', '1', 'Added KBN Product - 0pcs, Bleaching Soap (70g)'),
(27, '2023-11-18 10:18:36', '1', 'Delete KBN Product - TrackingID = 7, ID = 45'),
(28, '2023-11-18 10:22:46', '1', 'Added KBN Product - 100pcs, Moisturizing Cream (50ml)'),
(29, '2023-11-18 10:28:49', '1', 'Delete Rebranding Product - TrackingID = 8, ID = 2'),
(30, '2023-11-23 01:00:07', '1', 'Add Stock Packaging Materials - Clear Plastic'),
(31, '2023-11-23 01:01:23', '1', 'Add Stock Packaging Materials - Clear Plastic'),
(32, '2023-11-23 01:03:28', '1', 'Add Stock Packaging Materials - Clear Plastic'),
(33, '2023-11-23 03:51:17', '1', 'Process Order - ref71');

-- --------------------------------------------------------

--
-- Table structure for table `audittrailwarehouse`
--

CREATE TABLE `audittrailwarehouse` (
  `ID` int(11) NOT NULL,
  `DateAction` datetime NOT NULL,
  `UserID` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audittrailwarehouse`
--

INSERT INTO `audittrailwarehouse` (`ID`, `DateAction`, `UserID`, `Description`) VALUES
(1, '2023-11-19 13:32:02', '1', 'Add Item: Packaging - Clear Plastic'),
(2, '2023-11-19 13:53:38', '1', 'Add Item: Packaging - Clear Plastic'),
(3, '2023-11-19 13:54:15', '1', 'Add Item: Packaging - Shrink Wrap Lip Tin');

-- --------------------------------------------------------

--
-- Table structure for table `tblaccount`
--

CREATE TABLE `tblaccount` (
  `AccountID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `accType` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblaccount`
--

INSERT INTO `tblaccount` (`AccountID`, `Username`, `Password`, `accType`, `Department`, `Position`) VALUES
(1, 'admin', 'admin', 'Admin', '', ''),
(2, 'managerM', 'password', 'Manager', 'Marketing', 'All'),
(3, 'managerP', 'password', 'Manager', 'Production', 'All'),
(4, 'managerW', 'password', 'Manager', 'Warehouse', 'All'),
(5, 'staffM', 'password', 'Staff', 'Marketing', 'Inventory and Ordering'),
(6, 'staffW', 'password', 'Staff', 'Warehouse', 'Materials Inventory'),
(7, 'superadmin', 'admin', 'superadmin', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblaccountinfo`
--

CREATE TABLE `tblaccountinfo` (
  `AccountID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `Address` varchar(100) NOT NULL,
  `Birthdate` date NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `EmailAdd` varchar(100) NOT NULL,
  `Contact` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblaccountinfo`
--

INSERT INTO `tblaccountinfo` (`AccountID`, `FirstName`, `LastName`, `MiddleName`, `Address`, `Birthdate`, `Age`, `Gender`, `EmailAdd`, `Contact`) VALUES
(1, 'Bryan Ken', 'Altes', 'Sayson', 'Angon Rizal', '2000-09-25', 23, 'Male', 'bryanken01230@gmail.com', '09123456789'),
(2, 'Angelo', 'Geronimo', 'A', 'Angono Rizal', '2000-11-16', 23, 'Male', 'angelogeronimo@gmail.com', '09123456789'),
(3, 'Miguel', 'Besa', 'A', 'Taytay Rizal', '2002-11-10', 21, 'Male', 'miguelbesa@gmail.com', '09123456789'),
(4, 'Raven', 'Berenguila', 'A', 'Binangonan Rizal', '2002-11-13', 21, 'Male', 'ravenberenguila', '09123456789'),
(5, 'Ivan', 'Castillo', 'M', 'Angono Rizal', '2000-11-16', 23, 'Male', 'ivancastillo@gmail.com', '09123456789'),
(6, 'Vincent', 'Santiago', 'S', 'Angono Rizal', '2000-11-16', 23, 'Male', 'vicentsantigago@gmail.com', '09123456789');

-- --------------------------------------------------------

--
-- Table structure for table `tblarchiveuser`
--

CREATE TABLE `tblarchiveuser` (
  `itemID` int(11) NOT NULL,
  `userAccount` varchar(20) NOT NULL,
  `ArchiveDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblarchiveuser`
--

INSERT INTO `tblarchiveuser` (`itemID`, `userAccount`, `ArchiveDate`) VALUES
(1, 'admin', '2023-11-04 01:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblcancelledorder`
--

CREATE TABLE `tblcancelledorder` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `CancelDate` datetime NOT NULL,
  `Reason` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcancelledorder`
--

INSERT INTO `tblcancelledorder` (`ID`, `OrderRefNumber`, `CancelDate`, `Reason`) VALUES
(1, 'ref5', '2023-10-31 13:58:00', 'hgjjhg'),
(5, 'ref1', '2023-11-05 11:47:14', 'Expired'),
(6, 'ref2', '2023-11-05 11:54:34', 'Expired'),
(7, 'ref3', '2023-11-05 12:01:24', 'Expired'),
(8, 'ref4', '2023-11-05 13:45:54', 'Expired'),
(9, 'ref6', '2023-11-06 22:15:44', 'Expired'),
(10, 'ref7', '2023-11-06 22:21:54', 'Expired'),
(11, 'ref12', '2023-11-17 08:29:44', 'Expired'),
(12, 'ref13', '2023-11-17 09:12:54', 'Expired'),
(13, 'ref62', '2023-11-22 11:48:07', ''),
(17, 'ref61', '2023-11-22 11:48:45', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcartdata`
--

CREATE TABLE `tblcartdata` (
  `ID` int(11) NOT NULL,
  `uID` varchar(100) NOT NULL,
  `prodName` varchar(100) NOT NULL,
  `prodQuantity` int(11) NOT NULL,
  `prodVariant` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcartdata`
--

INSERT INTO `tblcartdata` (`ID`, `uID`, `prodName`, `prodQuantity`, `prodVariant`) VALUES
(12, 'bryanken01230#508', 'Bleaching Lotion', 1, '250ml'),
(17, '', 'Glutamansi Soap', 1, '50g'),
(29, '', 'Radiant Glow Facial Set', 1, 'Gel Toner, Facial Wash, Serum, Sunblock'),
(128, 'admin#253', 'Snail Max White Lotion', 1, '250ml'),
(129, 'admin#253', 'Isopropyl Alcohol', 1, '60ml'),
(130, 'admin#253', 'Moisturizing Cream', 1, '50ml');

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationproduct`
--

CREATE TABLE `tblconfirmationproduct` (
  `ID` int(11) NOT NULL,
  `TrackingID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductVariant` varchar(100) NOT NULL,
  `ProductQuantity` int(11) NOT NULL,
  `TimeAdded` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblconfirmationproduct`
--

INSERT INTO `tblconfirmationproduct` (`ID`, `TrackingID`, `ProductName`, `ProductVariant`, `ProductQuantity`, `TimeAdded`) VALUES
(3, 1, 'Kojic Rejuvinating Soap', '135g', 100, '19:04:16'),
(4, 1, 'Kojic Rejuvinating Soap', '110g', 100, '19:04:24'),
(5, 1, 'Bleaching Soap', '70g', 100, '19:04:34'),
(6, 1, 'Revitalize Whitening Beauty Bar', '135g', 100, '19:04:43'),
(7, 1, 'Snail Max White Lotion', '250ml', 100, '19:04:53'),
(8, 1, 'Glutamansi Lotion', '250ml', 100, '19:05:03'),
(9, 1, 'Bleaching Lotion', '250ml', 100, '19:05:13'),
(10, 1, 'Gluta White Lotion', '250ml', 100, '19:05:25'),
(11, 1, 'Sunblock', '10g', 100, '19:05:40'),
(12, 1, 'Bright Cream', '10g', 100, '19:05:49'),
(13, 1, 'Toner', '60ml', 100, '19:05:59'),
(14, 1, 'Rejuvenating Set', 'Kojic Soap, Sunblock, Night Cream, Toner', 100, '19:06:08'),
(15, 1, 'Gel Toner', '60ml', 100, '19:06:18'),
(16, 1, 'Facial Wash', '80ml', 100, '19:06:29'),
(17, 1, 'Serum', '5g', 100, '19:06:38'),
(18, 1, 'Sun Block', '10g', 100, '19:06:48'),
(19, 1, 'Radiant Glow Facial Set', 'Gel Toner, Facial Wash, Serum, Sunblock', 100, '19:06:57'),
(20, 1, 'Isopropyl Alcohol', '1 litter', 100, '19:07:06'),
(21, 1, 'Isopropyl Alcohol', '60ml', 100, '19:07:13'),
(22, 2, 'Isopropyl Alcohol', '1 litter', 100, '14:05:31'),
(25, 6, 'Glutamansi Soap', '50g', 10000, '14:08:43'),
(26, 6, 'Kojic Rejuvinating Soap', '135g', 10000, '14:08:56'),
(27, 6, 'Kojic Rejuvinating Soap', '110g', 10000, '14:09:06'),
(28, 6, 'Bleaching Soap', '70g', 10000, '14:09:29'),
(29, 6, 'Revitalize Whitening Beauty Bar', '135g', 10000, '14:09:41'),
(30, 6, 'Snail Max White Lotion', '250ml', 10000, '14:09:54'),
(31, 6, 'Glutamansi Lotion', '250ml', 10000, '14:10:04'),
(32, 6, 'Bleaching Lotion', '250ml', 10000, '14:10:13'),
(33, 6, 'Gluta White Lotion', '250ml', 10000, '14:10:23'),
(34, 6, 'Sunblock', '10g', 10000, '14:10:47'),
(35, 6, 'Bright Cream', '10g', 10000, '14:11:26'),
(36, 6, 'Toner', '60ml', 10000, '14:11:39'),
(37, 6, 'Rejuvenating Set', 'Kojic Soap, Sunblock, Night Cream, Toner', 10000, '14:11:50'),
(38, 6, 'Gel Toner', '60ml', 10000, '14:12:03'),
(39, 6, 'Facial Wash', '80ml', 10000, '14:12:11'),
(40, 6, 'Serum', '5g', 10000, '14:12:23'),
(41, 6, 'Sun Block', '10g', 10000, '14:12:32'),
(42, 6, 'Radiant Glow Facial Set', 'Gel Toner, Facial Wash, Serum, Sunblock', 10000, '14:12:43'),
(43, 6, 'Isopropyl Alcohol', '1 litter', 10000, '14:12:53'),
(44, 6, 'Isopropyl Alcohol', '60ml', 10000, '14:13:01');

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationproductarchive`
--

CREATE TABLE `tblconfirmationproductarchive` (
  `ID` int(11) NOT NULL,
  `TrackingID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductVariant` varchar(100) NOT NULL,
  `ProductQuantity` int(11) NOT NULL,
  `TimeAdded` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblconfirmationproductarchive`
--

INSERT INTO `tblconfirmationproductarchive` (`ID`, `TrackingID`, `ProductName`, `ProductVariant`, `ProductQuantity`, `TimeAdded`) VALUES
(23, 4, 'Isopropyl Alcohol', '1 litter', 100, '15:19:52'),
(24, 5, 'Glutamansi Soap', '50g', 1000, '14:08:05'),
(45, 7, 'Bleaching Soap', '70g', 0, '10:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationproductRebranding`
--

CREATE TABLE `tblconfirmationproductRebranding` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(100) NOT NULL,
  `TrackingID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductVariant` varchar(100) NOT NULL,
  `ProductQuantity` int(11) NOT NULL,
  `TimeAdded` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblconfirmationproductRebranding`
--

INSERT INTO `tblconfirmationproductRebranding` (`ID`, `UserID`, `TrackingID`, `ProductName`, `ProductVariant`, `ProductQuantity`, `TimeAdded`) VALUES
(1, 'admin#253', 3, 'Moisturizing Cream', '50ml', 100, '15:11:43'),
(2, 'admin#253', 8, 'Moisturizing Cream', '50ml', 100, '10:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationproductRebrandingarchive`
--

CREATE TABLE `tblconfirmationproductRebrandingarchive` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(100) NOT NULL,
  `TrackingID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductVariant` varchar(100) NOT NULL,
  `ProductQuantity` int(11) NOT NULL,
  `TimeAdded` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblconfirmationproductRebrandingarchive`
--

INSERT INTO `tblconfirmationproductRebrandingarchive` (`ID`, `UserID`, `TrackingID`, `ProductName`, `ProductVariant`, `ProductQuantity`, `TimeAdded`) VALUES
(1, 'admin#253', 3, 'Moisturizing Cream', '50ml', 100, '15:11:43'),
(2, 'admin#253', 8, 'Moisturizing Cream', '50ml', 100, '10:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationtracking`
--

CREATE TABLE `tblconfirmationtracking` (
  `TrackingID` int(11) NOT NULL,
  `DateAdded` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  `AddedBy` varchar(100) NOT NULL,
  `ProductType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblconfirmationtracking`
--

INSERT INTO `tblconfirmationtracking` (`TrackingID`, `DateAdded`, `Status`, `AddedBy`, `ProductType`) VALUES
(1, '2023-10-30', 'COMPLETED', 'admin', 'KBN'),
(2, '2023-10-31', 'COMPLETED', 'admin', 'KBN'),
(6, '2023-11-14', 'COMPLETED', 'admin', 'KBN');

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationtrackingarchive`
--

CREATE TABLE `tblconfirmationtrackingarchive` (
  `TrackingID` int(11) NOT NULL,
  `DateAdded` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  `AddedBy` varchar(100) NOT NULL,
  `ProductType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblconfirmationtrackingarchive`
--

INSERT INTO `tblconfirmationtrackingarchive` (`TrackingID`, `DateAdded`, `Status`, `AddedBy`, `ProductType`) VALUES
(3, '2023-11-07', 'PENDING', 'admin', 'REBRANDING'),
(4, '2023-11-07', 'PENDING', 'admin', 'KBN'),
(5, '2023-11-14', 'PENDING', 'admin', 'KBN'),
(7, '2023-11-18', 'PENDING', 'admin', 'KBN'),
(8, '2023-11-18', 'PENDING', 'admin', 'REBRANDING');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourieraccount`
--

CREATE TABLE `tblcourieraccount` (
  `courierID` varchar(25) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourieraccount`
--

INSERT INTO `tblcourieraccount` (`courierID`, `Username`, `Password`) VALUES
('CourierID0', 'bryanken00', 'password'),
('CourierID2', 'delivery', 'password'),
('CourierID3', 'testemail', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierdelivery`
--

CREATE TABLE `tblcourierdelivery` (
  `deliveryID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `courierID` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourierdelivery`
--

INSERT INTO `tblcourierdelivery` (`deliveryID`, `OrderRefNumber`, `courierID`) VALUES
(7, 'ref9', 'CourierID2'),
(8, 'ref8', 'CourierID2'),
(9, 'ref10', 'CourierID2'),
(10, 'ref11', 'CourierID2'),
(11, 'ref15', 'CourierID2'),
(12, 'ref14', 'CourierID2'),
(13, 'ref16', 'CourierID2'),
(14, 'ref17', 'CourierID2'),
(15, 'ref18', 'CourierID2'),
(16, 'ref19', 'CourierID2'),
(17, 'ref20', 'CourierID2'),
(18, 'ref21', 'CourierID2'),
(19, 'ref22', 'CourierID2'),
(20, 'ref23', 'CourierID2'),
(21, 'ref24', 'CourierID2'),
(22, 'ref25', 'CourierID2'),
(23, 'ref26', 'CourierID2'),
(24, 'ref27', 'CourierID2'),
(25, 'ref28', 'CourierID2'),
(26, 'ref29', 'CourierID2'),
(27, 'ref30', 'CourierID2'),
(28, 'ref31', 'CourierID2'),
(29, 'ref32', 'CourierID2'),
(30, 'ref33', 'CourierID2'),
(31, 'ref34', 'CourierID2'),
(32, 'ref35', 'CourierID2'),
(33, 'ref36', 'CourierID2'),
(34, 'ref37', 'CourierID2'),
(35, 'ref38', 'CourierID2'),
(36, 'ref39', 'CourierID2'),
(37, 'ref60', 'CourierID2'),
(38, 'ref59', 'CourierID2'),
(39, 'ref58', 'CourierID2'),
(40, 'ref57', 'CourierID2'),
(41, 'ref56', 'CourierID2'),
(42, 'ref55', 'CourierID2'),
(43, 'ref54', 'CourierID2'),
(44, 'ref53', 'CourierID2'),
(45, 'ref51', 'CourierID2'),
(46, 'ref50', 'CourierID2'),
(47, 'ref49', 'CourierID2'),
(48, 'ref48', 'CourierID2'),
(49, 'ref47', 'CourierID2'),
(50, 'ref46', 'CourierID2'),
(51, 'ref45', 'CourierID2'),
(52, 'ref44', 'CourierID2'),
(53, 'ref43', 'CourierID2'),
(54, 'ref42', 'CourierID2'),
(55, 'ref41', 'CourierID2'),
(56, 'ref40', 'CourierID2'),
(57, 'ref63', 'CourierID2'),
(58, 'ref64', 'CourierID2'),
(59, 'ref68', 'CourierID0'),
(60, 'ref65', 'CourierID2'),
(61, 'ref66', 'CourierID2'),
(62, 'ref67', 'CourierID2'),
(63, 'ref70', 'CourierID2'),
(64, 'ref69', 'CourierID2'),
(65, 'ref71', 'CourierID2');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierdeliverycompleted`
--

CREATE TABLE `tblcourierdeliverycompleted` (
  `ID` int(11) NOT NULL,
  `deliveryID` int(11) NOT NULL,
  `DeliveryDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourierdeliverycompleted`
--

INSERT INTO `tblcourierdeliverycompleted` (`ID`, `deliveryID`, `DeliveryDate`) VALUES
(5, 7, '2023-11-12 11:14:45'),
(6, 8, '2023-11-12 11:14:53'),
(7, 9, '2023-11-15 09:14:41'),
(8, 10, '2023-11-15 10:00:15'),
(9, 11, '2023-11-20 01:12:26'),
(10, 12, '2023-11-20 01:12:33'),
(11, 13, '2023-11-20 01:12:47'),
(12, 14, '2023-11-20 01:12:55'),
(13, 15, '2023-11-20 01:13:03'),
(14, 16, '2023-11-20 01:13:10'),
(15, 17, '2023-11-20 01:13:17'),
(16, 18, '2023-11-20 01:13:25'),
(17, 19, '2023-11-20 01:13:32'),
(18, 20, '2023-11-20 01:13:40'),
(19, 21, '2023-11-20 01:13:50'),
(20, 22, '2023-11-20 01:13:58'),
(21, 23, '2023-11-20 01:14:06'),
(22, 24, '2023-11-20 01:14:12'),
(23, 25, '2023-11-20 01:14:20'),
(24, 26, '2023-11-20 01:14:28'),
(25, 27, '2023-11-20 01:20:30'),
(26, 28, '2023-11-20 01:26:33'),
(27, 29, '2023-11-20 21:10:13'),
(28, 30, '2023-11-20 21:10:21'),
(29, 31, '2023-11-20 21:10:29'),
(30, 32, '2023-11-20 21:10:42'),
(31, 33, '2023-11-20 21:10:56'),
(32, 34, '2023-11-20 21:11:02'),
(33, 35, '2023-11-20 21:11:09'),
(34, 36, '2023-11-20 21:11:16'),
(35, 56, '2023-11-20 23:34:43'),
(36, 55, '2023-11-20 23:35:12'),
(37, 54, '2023-11-20 23:35:21'),
(38, 53, '2023-11-20 23:35:29'),
(39, 52, '2023-11-20 23:35:37'),
(40, 51, '2023-11-20 23:35:44'),
(41, 50, '2023-11-20 23:36:24'),
(42, 49, '2023-11-20 23:36:50'),
(43, 48, '2023-11-20 23:37:02'),
(44, 47, '2023-11-20 23:41:34'),
(45, 46, '2023-11-20 23:41:45'),
(46, 45, '2023-11-20 23:41:53'),
(47, 44, '2023-11-20 23:42:02'),
(48, 43, '2023-11-20 23:42:10'),
(49, 42, '2023-11-20 23:42:16'),
(50, 41, '2023-11-20 23:42:24'),
(51, 40, '2023-11-20 23:42:58'),
(52, 39, '2023-11-20 23:43:05'),
(53, 38, '2023-11-20 23:43:12'),
(54, 37, '2023-11-20 23:43:19'),
(55, 57, '2023-11-22 17:27:51'),
(56, 58, '2023-11-22 17:29:20'),
(57, 59, '2023-11-22 23:31:22'),
(58, 58, '2023-11-22 23:31:49'),
(59, 60, '2023-11-22 23:32:01'),
(60, 61, '2023-11-22 23:32:18'),
(61, 62, '2023-11-22 23:32:28'),
(62, 63, '2023-11-22 23:32:40'),
(63, 64, '2023-11-22 23:32:50'),
(64, 65, '2023-11-23 03:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierdeliverydate`
--

CREATE TABLE `tblcourierdeliverydate` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `DeliveryDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourierdeliverydate`
--

INSERT INTO `tblcourierdeliverydate` (`ID`, `OrderRefNumber`, `DeliveryDate`) VALUES
(7, 'ref8', '2023-11-12 11:14:18'),
(8, 'ref9', '2023-11-12 11:14:24'),
(9, 'ref10', '2023-11-15 09:13:48'),
(10, 'ref11', '2023-11-15 09:54:58'),
(11, 'ref15', '2023-11-18 02:35:23'),
(12, 'ref14', '2023-11-19 15:59:26'),
(13, 'ref16', '2023-11-20 01:09:26'),
(14, 'ref17', '2023-11-20 01:09:32'),
(15, 'ref18', '2023-11-20 01:09:39'),
(16, 'ref19', '2023-11-20 01:09:52'),
(17, 'ref20', '2023-11-20 01:09:59'),
(18, 'ref21', '2023-11-20 01:10:07'),
(19, 'ref22', '2023-11-20 01:10:15'),
(20, 'ref23', '2023-11-20 01:10:21'),
(21, 'ref24', '2023-11-20 01:10:27'),
(22, 'ref25', '2023-11-20 01:10:34'),
(23, 'ref26', '2023-11-20 01:10:40'),
(24, 'ref27', '2023-11-20 01:10:53'),
(25, 'ref28', '2023-11-20 01:10:59'),
(26, 'ref29', '2023-11-20 01:11:04'),
(27, 'ref30', '2023-11-20 01:19:52'),
(28, 'ref31', '2023-11-20 01:25:58'),
(29, 'ref32', '2023-11-20 21:08:32'),
(30, 'ref33', '2023-11-20 21:08:43'),
(31, 'ref34', '2023-11-20 21:08:48'),
(32, 'ref35', '2023-11-20 21:08:55'),
(33, 'ref36', '2023-11-20 21:09:01'),
(34, 'ref37', '2023-11-20 21:09:06'),
(35, 'ref38', '2023-11-20 21:09:12'),
(36, 'ref39', '2023-11-20 21:09:19'),
(37, 'ref60', '2023-11-20 23:30:20'),
(38, 'ref59', '2023-11-20 23:30:30'),
(39, 'ref58', '2023-11-20 23:30:38'),
(40, 'ref57', '2023-11-20 23:30:46'),
(41, 'ref56', '2023-11-20 23:30:53'),
(42, 'ref55', '2023-11-20 23:31:00'),
(43, 'ref54', '2023-11-20 23:31:07'),
(44, 'ref53', '2023-11-20 23:31:32'),
(45, 'ref51', '2023-11-20 23:31:39'),
(46, 'ref50', '2023-11-20 23:31:46'),
(47, 'ref49', '2023-11-20 23:31:56'),
(48, 'ref48', '2023-11-20 23:32:06'),
(49, 'ref47', '2023-11-20 23:32:14'),
(50, 'ref46', '2023-11-20 23:32:21'),
(51, 'ref45', '2023-11-20 23:32:27'),
(52, 'ref44', '2023-11-20 23:32:44'),
(53, 'ref43', '2023-11-20 23:32:50'),
(54, 'ref42', '2023-11-20 23:33:09'),
(55, 'ref41', '2023-11-20 23:33:15'),
(56, 'ref40', '2023-11-20 23:33:22'),
(57, 'ref63', '2023-11-22 17:26:59'),
(58, 'ref64', '2023-11-22 17:28:35'),
(59, 'ref68', '2023-11-22 21:04:00'),
(60, 'ref65', '2023-11-22 23:29:46'),
(61, 'ref66', '2023-11-22 23:29:56'),
(62, 'ref67', '2023-11-22 23:30:08'),
(63, 'ref70', '2023-11-22 23:30:19'),
(64, 'ref69', '2023-11-22 23:30:27'),
(65, 'ref71', '2023-11-23 03:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierinformation`
--

CREATE TABLE `tblcourierinformation` (
  `courierID` varchar(25) NOT NULL,
  `ID` int(11) NOT NULL,
  `Lastname` varchar(100) NOT NULL,
  `Firstname` varchar(100) NOT NULL,
  `MI` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ContactNo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourierinformation`
--

INSERT INTO `tblcourierinformation` (`courierID`, `ID`, `Lastname`, `Firstname`, `MI`, `Address`, `Email`, `ContactNo`) VALUES
('CourierID0', 1, 'Hamill', 'Tyrell', 'Tyrell', 'Angono Rizal', 'bryanken01230@gmail.com', '09123456789'),
('CourierID2', 2, 'Gorembalim', 'Rodney', 'James', 'Cainta Rizal', 'rodneyjames@gmail.com', '0912345678'),
('CourierID3', 3, 'Besa', 'Miguel', 'A', 'Taytay Rizal', 'testemail@gmail.com', '09123456789');

-- --------------------------------------------------------

--
-- Table structure for table `tblcurrentmonth`
--

CREATE TABLE `tblcurrentmonth` (
  `itemID` int(11) NOT NULL,
  `todayCurrentVolume` varchar(100) DEFAULT '0',
  `RECEIVED_VOLUME` int(11) DEFAULT NULL,
  `APPEARANCE` varchar(100) DEFAULT NULL,
  `RELEASED_VOLUME` int(11) DEFAULT NULL,
  `REJECT_VOLUME` int(11) DEFAULT NULL,
  `HOLD_VOLUME` int(11) DEFAULT NULL,
  `PROD_RETURN` int(11) DEFAULT NULL,
  `DATE_TODAY` datetime NOT NULL,
  `MATERIAL_NAME` varchar(100) DEFAULT NULL,
  `CODE_NAME` varchar(100) NOT NULL,
  `SUPPLIER` varchar(100) DEFAULT NULL,
  `CATEGORIES` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcurrentmonth`
--

INSERT INTO `tblcurrentmonth` (`itemID`, `todayCurrentVolume`, `RECEIVED_VOLUME`, `APPEARANCE`, `RELEASED_VOLUME`, `REJECT_VOLUME`, `HOLD_VOLUME`, `PROD_RETURN`, `DATE_TODAY`, `MATERIAL_NAME`, `CODE_NAME`, `SUPPLIER`, `CATEGORIES`) VALUES
(2, '1000', 0, 'test', 0, 0, 0, 0, '2023-11-04 11:07:54', 'test', 'test', 'test', 'test'),
(20, '0', 0, 'test', 1000, 0, 0, 0, '2023-11-18 00:00:00', 'test', 'test', 'test', 'test'),
(21, '0', 0, 'TestAppearance', 0, 0, 0, 0, '2023-11-19 15:49:28', 'TestName', 'TestCodeName', 'TestSupplier', 'TestCat');

-- --------------------------------------------------------

--
-- Table structure for table `tblcurrentmonthPackaging`
--

CREATE TABLE `tblcurrentmonthPackaging` (
  `itemID` int(11) NOT NULL,
  `todayCurrentVolume` varchar(100) DEFAULT '0',
  `RECEIVED_VOLUME` int(11) DEFAULT 0,
  `RELEASED_VOLUME` int(11) DEFAULT 0,
  `REJECT_VOLUME` int(11) DEFAULT 0,
  `HOLD_VOLUME` int(11) DEFAULT 0,
  `PROD_RETURN` int(11) DEFAULT 0,
  `DATE_TODAY` datetime NOT NULL,
  `MATERIAL_NAME` varchar(100) DEFAULT NULL,
  `VARIANT` varchar(100) NOT NULL,
  `CATEGORIES` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcurrentmonthPackaging`
--

INSERT INTO `tblcurrentmonthPackaging` (`itemID`, `todayCurrentVolume`, `RECEIVED_VOLUME`, `RELEASED_VOLUME`, `REJECT_VOLUME`, `HOLD_VOLUME`, `PROD_RETURN`, `DATE_TODAY`, `MATERIAL_NAME`, `VARIANT`, `CATEGORIES`) VALUES
(2, '0', 0, 0, 0, 0, 0, '2023-11-19 13:32:02', 'Clear Plastic', '5x7', 'Plastic'),
(3, '0', 0, 0, 0, 0, 0, '2023-11-19 13:53:38', 'Clear Plastic', '5x8', 'Plastic'),
(4, '0', 0, 0, 0, 0, 0, '2023-11-19 13:54:15', 'Shrink Wrap Lip Tint', '5 ml', 'SHRINK WRAP'),
(5, '1000', 1000, 0, 0, 0, 0, '2023-11-23 01:02:43', 'Clear Plastic', '5x7', 'Plastic'),
(6, '1000', 1000, 1000, 0, 0, 0, '2023-11-22 00:00:00', 'Clear Plastic', '5x7', 'Plastic');

-- --------------------------------------------------------

--
-- Table structure for table `tblcurrentmonth_archive`
--

CREATE TABLE `tblcurrentmonth_archive` (
  `itemID` int(11) NOT NULL,
  `todayCurrentVolume` varchar(100) DEFAULT NULL,
  `RECEIVED_VOLUME` int(11) DEFAULT NULL,
  `APPEARANCE` varchar(100) DEFAULT NULL,
  `RELEASED_VOLUME` int(11) DEFAULT NULL,
  `REJECT_VOLUME` int(11) DEFAULT NULL,
  `HOLD_VOLUME` int(11) DEFAULT NULL,
  `PROD_RETURN` int(11) DEFAULT NULL,
  `DATE_TODAY` datetime NOT NULL,
  `MATERIAL_NAME` varchar(100) DEFAULT NULL,
  `CODE_NAME` varchar(100) NOT NULL,
  `SUPPLIER` varchar(100) DEFAULT NULL,
  `CATEGORIES` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcurrentmonth_archive`
--

INSERT INTO `tblcurrentmonth_archive` (`itemID`, `todayCurrentVolume`, `RECEIVED_VOLUME`, `APPEARANCE`, `RELEASED_VOLUME`, `REJECT_VOLUME`, `HOLD_VOLUME`, `PROD_RETURN`, `DATE_TODAY`, `MATERIAL_NAME`, `CODE_NAME`, `SUPPLIER`, `CATEGORIES`) VALUES
(1, '1000', 0, 'test2', 0, 0, 0, 0, '2023-11-04 00:52:59', 'test1', 'test3', 'test4', 'test5');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomeraccount`
--

CREATE TABLE `tblcustomeraccount` (
  `UserID` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcustomeraccount`
--

INSERT INTO `tblcustomeraccount` (`UserID`, `Username`, `Password`) VALUES
('admin#253', 'admin', 'admin'),
('asd#982', 'asd', 'dglnpt1z'),
('bryanken01230#175', 'bryanken01230@gmail.com', 'f77rsf87'),
('bryanken01230#508', 'bryanken01230', 'admin'),
('bryanken012301#441', 'bryanken012301@gmail.com', 'i5x6b57q'),
('joserizal#868', 'joserizal', 'joserizal'),
('miguelbesa249#321', 'miguelbesa249', 'miguelbesa'),
('pebini#710', 'pebini', 'u2do1ab5'),
('ravenberenguila#536', 'ravenberenguila', '2dafxoeb'),
('test#497', 'test', '0276q3vi'),
('test1#667', 'test1', 'password'),
('testEmail#715', 'testEmail', 'gghjuvxd'),
('testestest#781', 'testestest', '4dlujod7'),
('yedat23115#316', 'yedat23115@marksia.com', 'cu5yixqt');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomerdiscount`
--

CREATE TABLE `tblcustomerdiscount` (
  `userID` varchar(25) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomerinformation`
--

CREATE TABLE `tblcustomerinformation` (
  `UserID` varchar(25) NOT NULL,
  `Lastname` varchar(20) NOT NULL,
  `Firstname` varchar(20) NOT NULL,
  `MI` varchar(5) DEFAULT NULL,
  `Address` text NOT NULL,
  `Number` varchar(15) NOT NULL,
  `Description` text DEFAULT NULL,
  `Discount` float DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `AccountType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcustomerinformation`
--

INSERT INTO `tblcustomerinformation` (`UserID`, `Lastname`, `Firstname`, `MI`, `Address`, `Number`, `Description`, `Discount`, `email`, `AccountType`) VALUES
('admin#253', 'Altes', 'Bryan Ken', 'D', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', '09158350780', 'testProduct', 0, 'xyzy@mailinator.com', 'Rebranding'),
('asd#982', 'asda', 'asd', 'as', 'asdasd', '00', 'asda', 0, 'asd@testmail.com', 'Rebranding'),
('bryanken01230#175', 'French', 'Armand', 'Er', 'Porro error eius con Bohetambis Tuburan, Basilan', '09123456789', 'Brand X', 0, 'bryanken01230@gmail.comRENAME1', 'Rebranding'),
('bryanken01230#508', 'Altes', 'Bryan Ken', 'S', 'Del Rosario st. Brgy Kalayaan Kalayaan Angono, Rizal', '09158350780', 'Brand X', 0, 'bryanken01230RENAME@gmail.com', ''),
('bryanken012301#441', 'French', 'Armand', 'Er', 'Porro error eius con Bohetambis Tuburan, Basilan', '09123456789', 'Brand X', 0, 'bryanken01230@gmail.com', 'Rebranding'),
('joserizal#868', 'Jose', 'Rizal', 'P', 'Kalayaan Kalayaan Angono, Rizal', '09123456789', 'Jose Rizal', 0, 'kenkenaltesRENAME@gmail.com', 'Rebranding'),
('miguelbesa249#321', 'Besa', 'Miguel Antonio ', 'A', 'purok 1, Abnai, Lupang Arenda Santa Ana Taytay, Rizal', '09297879863', 'Brand x', 0, 'miguelbesa249RENAME@gmail.com', ''),
('pebini#710', 'Mason', 'Amanda', 'Mag', 'Rerum eveniet non p Bangilan Kabacan, Cotabato', '09123456789', '', 0, 'pebini5150@rdluxe.com', 'Rebranding'),
('ravenberenguila#536', 'berenguila', 'raven', 'a', 'luklukan Bilibiran Binangonan, Rizal', '09212121211', '', 0, 'ravenberenguilaRENAME@gmail.com', 'Rebranding'),
('test#497', 'TestL', 'TestF', 'TestM', 'testAdd', '0912345', '', 0, 'testEmailll@gma.com', 'Rebranding'),
('test1#667', 'Altes', 'Bryan Ken', 'S', 'Angono Rizal', '09123456789', 'Test', 0, 'goropip520@notedns.com', 'Rebranding'),
('testEmail#715', 'Altes', 'Bryan Ken', 'S', 'Test Address', '09123456789', '', 0, 'testEmailgmail.com', 'Rebranding'),
('testestest#781', 'test', 'test', 'test', 'testtestest', '09123456789', '123123', 0, 'test@gmail.com', 'Rebranding'),
('yedat23115#316', 'Waller', 'Carson', 'It', 'Sunt iste cum ea do Talahik Surallah, South Cotabato', '09123456789', '', 0, 'yedat23115@marksia.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbldisposproduct`
--

CREATE TABLE `tbldisposproduct` (
  `ID` int(11) NOT NULL,
  `ProdName` varchar(100) NOT NULL,
  `Variant` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblmonthlysummary`
--

CREATE TABLE `tblmonthlysummary` (
  `itemID` int(11) NOT NULL,
  `MATERIAL_NAME` varchar(100) DEFAULT NULL,
  `CODE_NAME` varchar(100) NOT NULL,
  `CONTROL_NUMBER` varchar(100) DEFAULT NULL,
  `SUPPLIER` varchar(100) DEFAULT NULL,
  `CATEGORIES` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderapproved`
--

CREATE TABLE `tblorderapproved` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `ApprovedBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorderapproved`
--

INSERT INTO `tblorderapproved` (`ID`, `OrderRefNumber`, `ApprovedBy`) VALUES
(1, 'ref1', '1'),
(2, 'ref2', '1'),
(3, 'ref3', '1'),
(4, 'ref4', '1'),
(5, 'ref6', '1'),
(6, 'ref7', '1'),
(7, 'ref8', '1'),
(8, 'ref9', '1'),
(9, 'ref10', '1'),
(10, 'ref11', '1'),
(11, 'ref15', '1'),
(12, 'ref14', '1'),
(13, 'ref16', '1'),
(14, 'ref17', '1'),
(15, 'ref18', '1'),
(16, 'ref19', '1'),
(17, 'ref20', '1'),
(18, 'ref21', '1'),
(19, 'ref22', '1'),
(20, 'ref23', '1'),
(21, 'ref24', '1'),
(22, 'ref25', '1'),
(23, 'ref26', '1'),
(24, 'ref27', '1'),
(25, 'ref28', '1'),
(26, 'ref29', '1'),
(27, 'ref30', '1'),
(28, 'ref31', '1'),
(29, 'ref39', '1'),
(30, 'ref38', '1'),
(31, 'ref37', '1'),
(32, 'ref36', '1'),
(33, 'ref35', '1'),
(34, 'ref34', '1'),
(35, 'ref33', '1'),
(36, 'ref32', '1'),
(37, 'ref40', '1'),
(38, 'ref41', '1'),
(39, 'ref42', '1'),
(40, 'ref43', '1'),
(41, 'ref44', '1'),
(42, 'ref45', '1'),
(43, 'ref46', '1'),
(44, 'ref47', '1'),
(45, 'ref48', '1'),
(46, 'ref49', '1'),
(47, 'ref50', '1'),
(48, 'ref51', '1'),
(49, 'ref52', '1'),
(50, 'ref53', '1'),
(51, 'ref54', '1'),
(52, 'ref55', '1'),
(53, 'ref56', '1'),
(54, 'ref57', '1'),
(55, 'ref58', '1'),
(56, 'ref59', '1'),
(57, 'ref60', '1'),
(58, 'ref63', '1'),
(59, 'ref64', '1'),
(60, 'ref68', '1'),
(61, 'ref65', '1'),
(62, 'ref70', '1'),
(63, 'ref69', '1'),
(64, 'ref67', '1'),
(65, 'ref66', '1'),
(66, 'ref71', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblorderarchive`
--

CREATE TABLE `tblorderarchive` (
  `OrderNumber` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `UserID` varchar(25) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `shippingFee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorderarchive`
--

INSERT INTO `tblorderarchive` (`OrderNumber`, `OrderRefNumber`, `OrderDate`, `UserID`, `address`, `contact`, `email`, `shippingFee`) VALUES
(5, 'ref5', '2023-10-31 13:57:05', 'miguelbesa249#321', 'purok 1, Abnai, Lupang Arenda Santa Ana Taytay, Rizal', 2147483647, 'miguelbesa249@gmail.com', NULL),
(1, 'ref1', '2023-10-31 11:39:50', 'bryanken01230#508', 'Del Rosario st. Brgy Kalayaan Kalayaan Angono, Rizal', 2147483647, 'bryanken01230@gmail.com', NULL),
(2, 'ref2', '2023-10-31 11:48:20', 'bryanken01230#508', 'Del Rosario st. Brgy Kalayaan Kalayaan Angono, Rizal', 2147483647, 'bryanken01230@gmail.com', NULL),
(3, 'ref3', '2023-10-31 11:57:04', 'bryanken01230#508', 'Del Rosario st. Brgy Kalayaan Kalayaan Angono, Rizal', 2147483647, 'bryanken01230@gmail.com', NULL),
(4, 'ref4', '2023-10-31 13:45:46', 'miguelbesa249#321', 'purok 1, Abnai, Lupang Arenda Santa Ana Taytay, Rizal', 2147483647, 'miguelbesa249@gmail.com', NULL),
(6, 'ref6', '2023-11-01 22:15:35', 'bryanken01230#508', 'Del Rosario st. Brgy Kalayaan Kalayaan Angono, Rizal', 2147483647, 'bryanken01230@gmail.com', NULL),
(7, 'ref7', '2023-11-01 22:21:45', 'bryanken01230#508', 'Del Rosario st. Brgy Kalayaan Kalayaan Angono, Rizal', 2147483647, 'bryanken01230@gmail.com', NULL),
(12, 'ref12', '2023-11-12 16:29:36', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', NULL),
(13, 'ref13', '2023-11-12 17:12:45', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', NULL),
(62, 'ref62', '2023-11-22 11:35:53', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', NULL),
(61, 'ref61', '2023-11-22 11:33:20', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblordercheckout`
--

CREATE TABLE `tblordercheckout` (
  `OrderNumber` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `UserID` varchar(25) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `shippingFee` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblordercheckout`
--

INSERT INTO `tblordercheckout` (`OrderNumber`, `OrderRefNumber`, `OrderDate`, `UserID`, `address`, `contact`, `email`, `shippingFee`) VALUES
(8, 'ref8', '2023-11-07 21:17:17', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(9, 'ref9', '2023-11-12 10:07:21', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(10, 'ref10', '2023-11-12 15:27:56', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(11, 'ref11', '2023-11-12 16:12:49', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(14, 'ref14', '2023-11-14 14:58:33', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(15, 'ref15', '2023-11-15 21:58:45', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(16, 'ref16', '2023-11-19 18:29:52', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(17, 'ref17', '2023-11-19 23:42:21', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(18, 'ref18', '2023-11-19 23:47:38', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(19, 'ref19', '2023-11-09 00:43:02', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(20, 'ref20', '2023-11-10 00:43:47', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(21, 'ref21', '2023-11-20 00:44:35', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(22, 'ref22', '2023-11-13 00:50:23', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(23, 'ref23', '2023-11-12 00:55:05', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(24, 'ref24', '2023-11-11 00:55:40', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(25, 'ref25', '2023-11-10 00:57:14', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(26, 'ref26', '2023-11-14 00:58:48', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(27, 'ref27', '2023-11-04 01:01:22', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(28, 'ref28', '2023-11-03 01:01:46', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(29, 'ref29', '2023-11-02 01:02:16', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(30, 'ref30', '2023-11-01 01:19:41', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(31, 'ref31', '2023-11-12 01:25:59', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(32, 'ref32', '2023-11-13 20:52:47', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(33, 'ref33', '2023-11-14 20:53:15', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(34, 'ref34', '2023-11-15 20:53:54', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(35, 'ref35', '2023-11-16 20:54:24', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(36, 'ref36', '2023-11-17 20:54:41', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(37, 'ref37', '2023-11-18 20:55:19', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(38, 'ref38', '2023-11-19 20:55:41', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(39, 'ref39', '2023-11-20 20:55:58', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(40, 'ref40', '2023-10-01 22:42:59', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(41, 'ref41', '2023-10-02 22:43:16', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(42, 'ref42', '2023-10-03 22:44:08', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(43, 'ref43', '2023-10-04 22:44:28', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(44, 'ref44', '2023-10-05 22:44:45', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(45, 'ref45', '2023-10-06 22:45:02', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(46, 'ref46', '2023-10-07 22:45:19', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(47, 'ref47', '2023-10-08 22:45:48', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(48, 'ref48', '2023-10-09 22:46:26', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(49, 'ref49', '2023-10-10 22:46:42', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(50, 'ref50', '2023-10-11 22:46:58', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(51, 'ref51', '2023-10-12 22:47:15', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(53, 'ref53', '2023-10-13 22:48:18', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(54, 'ref54', '2023-10-14 22:48:34', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(55, 'ref55', '2023-10-15 22:49:08', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(56, 'ref56', '2023-10-16 22:49:31', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(57, 'ref57', '2023-10-17 22:49:51', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(58, 'ref58', '2023-10-18 22:50:06', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(59, 'ref59', '2023-10-19 22:50:20', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(60, 'ref60', '2023-10-20 22:50:36', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(63, 'ref63', '2023-11-22 14:28:03', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(64, 'ref64', '2023-11-22 17:28:29', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 0),
(65, 'ref65', '2023-11-22 18:12:41', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 100),
(66, 'ref66', '2023-11-22 18:13:18', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 100),
(67, 'ref67', '2023-11-22 18:15:18', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 100),
(68, 'ref68', '2023-11-22 18:15:59', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 100),
(69, 'ref69', '2023-11-22 22:23:31', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 100),
(70, 'ref70', '2023-11-22 22:26:43', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 100),
(71, 'ref71', '2023-11-23 03:38:43', 'admin#253', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', 2147483647, 'xyzy@mailinator.com', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tblordercheckoutdata`
--

CREATE TABLE `tblordercheckoutdata` (
  `OrderRefNumber` varchar(100) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `volume` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblordercheckoutdata`
--

INSERT INTO `tblordercheckoutdata` (`OrderRefNumber`, `ProductName`, `volume`, `Quantity`, `Price`) VALUES
('ref8', 'Facial Wash', '80ml', 1, 50),
('ref8', 'Isopropyl Alcohol', '1 Liter', 1, 50),
('ref9', 'Isopropyl Alcohol', '1 Liter', 5, 50),
('ref10', 'Radiant Glow Facial Set', 'Gel Toner, Facial Wash, Serum, Sunblock', 3, 350),
('ref11', 'Isopropyl Alcohol', '1 Liter', 1, 50),
('ref14', 'Revitalize Whitening Beauty Bar', '135g', 2, 90),
('ref14', 'Kojic Rejuvinating Soap', '110g', 1, 40),
('ref15', 'Facial Wash', '80ml', 1, 50),
('ref15', 'Serum', '5g', 1, 40),
('ref15', 'Sun Block', '10g', 1, 90),
('ref15', 'Moisturizing Cream', '50ml', 1, 20),
('ref16', 'Sunblock', '10g', 1, 90),
('ref17', 'Snail Max White Lotion', '250ml', 100, 50),
('ref18', 'Revitalize Whitening Beauty Bar', '135g', 10, 90),
('ref19', 'Isopropyl Alcohol', '1 Liter', 87, 50),
('ref20', 'Isopropyl Alcohol', '1 Liter', 94, 50),
('ref21', 'Isopropyl Alcohol', '60ml', 99, 40),
('ref22', 'Isopropyl Alcohol', '1 Liter', 85, 50),
('ref23', 'Isopropyl Alcohol', '1 Liter', 93, 50),
('ref24', 'Isopropyl Alcohol', '1 Liter', 88, 50),
('ref25', 'Isopropyl Alcohol', '1 Liter', 97, 50),
('ref26', 'Isopropyl Alcohol', '1 Liter', 89, 50),
('ref27', 'Isopropyl Alcohol', '1 Liter', 96, 50),
('ref28', 'Isopropyl Alcohol', '1 Liter', 84, 50),
('ref29', 'Isopropyl Alcohol', '1 Liter', 91, 50),
('ref30', 'Isopropyl Alcohol', '1 Liter', 99, 50),
('ref31', 'Isopropyl Alcohol', '1 Liter', 91, 50),
('ref32', 'Isopropyl Alcohol', '1 Liter', 82, 50),
('ref33', 'Isopropyl Alcohol', '1 Liter', 97, 50),
('ref34', 'Isopropyl Alcohol', '1 Liter', 88, 50),
('ref35', 'Isopropyl Alcohol', '1 Liter', 95, 50),
('ref36', 'Isopropyl Alcohol', '1 Liter', 83, 50),
('ref37', 'Isopropyl Alcohol', '1 Liter', 89, 50),
('ref38', 'Isopropyl Alcohol', '1 Liter', 94, 50),
('ref39', 'Isopropyl Alcohol', '1 Liter', 81, 50),
('ref40', 'Isopropyl Alcohol', '1 Liter', 92, 50),
('ref41', 'Isopropyl Alcohol', '1 Liter', 86, 50),
('ref42', 'Isopropyl Alcohol', '1 Liter', 98, 50),
('ref43', 'Isopropyl Alcohol', '1 Liter', 84, 50),
('ref44', 'Isopropyl Alcohol', '1 Liter', 87, 50),
('ref45', 'Isopropyl Alcohol', '1 Liter', 91, 50),
('ref46', 'Isopropyl Alcohol', '1 Liter', 89, 50),
('ref47', 'Isopropyl Alcohol', '1 Liter', 80, 50),
('ref48', 'Isopropyl Alcohol', '1 Liter', 95, 50),
('ref49', 'Isopropyl Alcohol', '1 Liter', 83, 50),
('ref50', 'Isopropyl Alcohol', '1 Liter', 96, 50),
('ref51', 'Isopropyl Alcohol', '1 Liter', 88, 50),
('ref53', 'Isopropyl Alcohol', '1 Liter', 94, 50),
('ref54', 'Isopropyl Alcohol', '1 Liter', 81, 50),
('ref55', 'Isopropyl Alcohol', '1 Liter', 99, 50),
('ref56', 'Isopropyl Alcohol', '1 Liter', 82, 50),
('ref57', 'Isopropyl Alcohol', '1 Liter', 97, 50),
('ref58', 'Isopropyl Alcohol', '1 Liter', 85, 50),
('ref59', 'Isopropyl Alcohol', '1 Liter', 90, 50),
('ref60', 'Isopropyl Alcohol', '1 Liter', 93, 50),
('ref63', 'Isopropyl Alcohol', '1 Liter', 1, 50),
('ref64', 'Snail Max White Lotion', '250ml', 100, 50),
('ref64', 'Sun Block', '10g', 5, 90),
('ref65', 'Isopropyl Alcohol', '60ml', 1, 40),
('ref66', 'Gel Toner', '60ml', 6, 100),
('ref66', 'Facial Wash', '80ml', 4, 50),
('ref66', 'Serum', '5g', 3, 40),
('ref67', 'Anti-Aging Serum', '30ml', 3, 100),
('ref67', 'Moisturizing Cream', '50ml', 5, 20),
('ref67', 'Hydrating Toner', '200ml', 3, 60),
('ref67', 'Anti-Aging Serum', '30ml', 3, 100),
('ref67', 'Moisturizing Cream', '50ml', 5, 20),
('ref67', 'Hydrating Toner', '200ml', 3, 60),
('ref68', 'Anti-Aging Serum', '30ml', 1, 100),
('ref68', 'Moisturizing Cream', '50ml', 1, 20),
('ref68', 'Hydrating Toner', '200ml', 1, 60),
('ref68', 'Gel Toner', '60ml', 1, 100),
('ref68', 'Facial Wash', '80ml', 1, 50),
('ref68', 'Serum', '5g', 1, 40),
('ref68', 'Anti-Aging Serum', '30ml', 1, 100),
('ref68', 'Moisturizing Cream', '50ml', 1, 20),
('ref68', 'Hydrating Toner', '200ml', 1, 60),
('ref69', 'Gel Toner', '60ml', 9, 100),
('ref70', 'Gel Toner', '60ml', 10, 100),
('ref71', 'Isopropyl Alcohol', '1 Liter', 100, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tblordercheckoutdataarchive`
--

CREATE TABLE `tblordercheckoutdataarchive` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `volume` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `checker` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblordercheckoutdataarchive`
--

INSERT INTO `tblordercheckoutdataarchive` (`ID`, `OrderRefNumber`, `ProductName`, `volume`, `Quantity`, `Price`, `checker`) VALUES
(1, 'ref5', 'Isopropyl Alcohol', '1 litter', 1, 50, 'Added'),
(2, 'ref5', 'Isopropyl Alcohol', '60ml', 1, 40, 'Added'),
(4, 'ref1', 'Isopropyl Alcohol', '1 litter', 5, 50, 'Added'),
(5, 'ref2', 'Gel Toner', '60ml', 4, 100, 'Added'),
(6, 'ref3', 'Isopropyl Alcohol', '1 litter', 10, 50, 'Added'),
(7, 'ref4', 'Isopropyl Alcohol', '1 litter', 2, 50, 'Added'),
(8, 'ref6', 'Kojic Rejuvinating Soap', '110g', 1, 40, 'Added'),
(9, 'ref7', 'Gluta White Lotion', '250ml', 5, 100, 'Added'),
(10, 'ref12', 'Kojic Rejuvinating Soap', '135g', 1, 70, 'Added'),
(11, 'ref12', 'Kojic Rejuvinating Soap', '110g', 1, 40, 'Added'),
(13, 'ref13', 'Gel Toner', '60ml', 1, 100, 'Added'),
(14, 'ref62', 'Facial Wash', '80ml', 1, 50, 'Added'),
(15, 'ref61', 'Revitalize Whitening Beauty Bar', '135g', 1, 90, 'Added'),
(16, 'ref61', 'Anti-Aging Serum', '30ml', 1, 100, 'Added');

-- --------------------------------------------------------

--
-- Table structure for table `tblorderexpirationtime`
--

CREATE TABLE `tblorderexpirationtime` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `Expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderstatus`
--

CREATE TABLE `tblorderstatus` (
  `OrderRefNumber` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorderstatus`
--

INSERT INTO `tblorderstatus` (`OrderRefNumber`, `Status`) VALUES
('ref1', 'Cancelled'),
('ref10', 'Completed'),
('ref11', 'Completed'),
('ref12', 'Expired'),
('ref13', 'Expired'),
('ref14', 'Completed'),
('ref15', 'Completed'),
('ref16', 'Completed'),
('ref17', 'Completed'),
('ref18', 'Completed'),
('ref19', 'Completed'),
('ref2', 'Cancelled'),
('ref20', 'Completed'),
('ref21', 'Completed'),
('ref22', 'Completed'),
('ref23', 'Completed'),
('ref24', 'Completed'),
('ref25', 'Completed'),
('ref26', 'Completed'),
('ref27', 'Completed'),
('ref28', 'Completed'),
('ref29', 'Completed'),
('ref3', 'Expired'),
('ref30', 'Completed'),
('ref31', 'Completed'),
('ref32', 'Completed'),
('ref33', 'Completed'),
('ref34', 'Completed'),
('ref35', 'Completed'),
('ref36', 'Completed'),
('ref37', 'Completed'),
('ref38', 'Completed'),
('ref39', 'Completed'),
('ref4', 'Expired'),
('ref40', 'Completed'),
('ref41', 'Completed'),
('ref42', 'Completed'),
('ref43', 'Completed'),
('ref44', 'Completed'),
('ref45', 'Completed'),
('ref46', 'Completed'),
('ref47', 'Completed'),
('ref48', 'Completed'),
('ref49', 'Completed'),
('ref5', 'Cancelled'),
('ref50', 'Completed'),
('ref51', 'Completed'),
('ref52', 'Approved'),
('ref53', 'Completed'),
('ref54', 'Completed'),
('ref55', 'Completed'),
('ref56', 'Completed'),
('ref57', 'Completed'),
('ref58', 'Completed'),
('ref59', 'Completed'),
('ref6', 'Expired'),
('ref60', 'Completed'),
('ref61', 'Cancelled'),
('ref62', 'Cancelled'),
('ref63', 'Completed'),
('ref64', 'Completed'),
('ref65', 'Completed'),
('ref66', 'Completed'),
('ref67', 'Completed'),
('ref68', 'Completed'),
('ref69', 'Completed'),
('ref7', 'Expired'),
('ref70', 'Completed'),
('ref71', 'Completed'),
('ref8', 'Completed'),
('ref9', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `tblpreregistration`
--

CREATE TABLE `tblpreregistration` (
  `ID` int(11) NOT NULL,
  `Firstname` varchar(100) NOT NULL,
  `Middlename` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) NOT NULL,
  `Contactnum` varchar(100) NOT NULL,
  `Emailadd` varchar(100) NOT NULL,
  `Region` varchar(100) NOT NULL,
  `Province` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Barangay` varchar(100) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `Zipcode` varchar(100) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpreregistration`
--

INSERT INTO `tblpreregistration` (`ID`, `Firstname`, `Middlename`, `Lastname`, `Contactnum`, `Emailadd`, `Region`, `Province`, `City`, `Barangay`, `Street`, `Zipcode`, `Brand`, `Status`) VALUES
(26, 'raven', 'a', 'berenguila', '09123456789', 'ravenberenguila@gmail.com', 'CALABARZON', 'Rizal', 'Binangonan', 'Bilibiran', 'luklukan', '1040', '', 'pending'),
(27, 'Carson', 'It', 'Waller', '09123456789', 'yedat23115@marksia.com', 'SOCCSKSARGEN', 'South Cotabato', 'Surallah', 'Talahik', 'Sunt iste cum ea do', '2000', '', 'Completed'),
(28, 'Armand', 'Er', 'French', '09123456789', 'bryanken01230@gmail.com', 'BARMM', 'Basilan', 'Tuburan', 'Bohetambis', 'Porro error eius con', '1000', 'Brand X', 'Completed'),
(29, 'Bryan Ken', 'S', 'Altes', '09123456789', 'goropip520@notedns.com', ' ', ' ', ' ', ' ', 'Angono Rizal', '1000', 'Not Set', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `tblprocedurestorage`
--

CREATE TABLE `tblprocedurestorage` (
  `procedureID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblprocedurestorage`
--

INSERT INTO `tblprocedurestorage` (`procedureID`, `email`, `expiration`) VALUES
(28, 'rberenguila', '2023-11-23 03:24:08'),
(31, 'ravenroseberenguila_12', '2023-11-23 03:25:56'),
(33, 'ravenberenguila', '2023-11-23 03:34:29'),
(34, 'yedat23115', '2023-11-23 09:34:41'),
(35, 'videhi9548', '2023-11-23 09:35:33'),
(40, 'bryanken01230', '2023-11-23 09:37:21'),
(41, 'goropip520', '2023-11-27 13:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `tblproductcategories`
--

CREATE TABLE `tblproductcategories` (
  `prodCategory` varchar(100) NOT NULL,
  `CategoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblproductcategories`
--

INSERT INTO `tblproductcategories` (`prodCategory`, `CategoryName`) VALUES
('Alcohol', 'Alcohol'),
('Glass Skin', 'Glass Skin Set'),
('Lotion', 'Lotion'),
('Rejuvenating', 'Rejuvenating Set'),
('Soap', 'Soap');

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `prodID` int(11) NOT NULL,
  `prodImg` varchar(100) NOT NULL,
  `prodName` varchar(100) NOT NULL,
  `prodPrice` int(11) NOT NULL,
  `prodVolume` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Sold` int(11) DEFAULT NULL,
  `prodCategory` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`prodID`, `prodImg`, `prodName`, `prodPrice`, `prodVolume`, `Quantity`, `Sold`, `prodCategory`, `Description`) VALUES
(1, 'age-eraser-soap.png', 'Age Eraser Soap', 100, '135g', 100, 0, 'Soap', 'The best ingredients in nature are blended in this unique anti-ageing black beauty soap. You now have the power to renew your skin and make younger, whiter and fresher. With micro beads that gently exfoliate and remove dead skin cells.'),
(2, '', 'Glutamansi Soap', 50, '50g', 10100, 0, 'Soap', 'Whitening, Moisturizing, Skin Clarifying, Exfoliating, Micro-peeling, Deodorizing'),
(3, 'alcohol.png', 'Kojic Rejuvinating Soap', 70, '135g', 10100, 0, 'Soap', NULL),
(4, 'frejuv.png', 'Bleaching Soap', 25, '70g', 10100, 0, 'Soap', NULL),
(5, 'glow-set.png', 'Revitalize Whitening Beauty Bar', 90, '135g', 10088, 12, 'Soap', NULL),
(6, '', 'Snail Max White Lotion', 50, '250ml', 9900, 200, 'Lotion', ''),
(7, 'glutamansi-lotion.png', 'Glutamansi Lotion', 70, '250ml', 10100, 0, 'Lotion', 'Achieve that rosy skin and radiant glow with this non-sticky premium lotion. Made with effective natural ingredients such as glutathione, calamansi extract, baking soda, shea butter, kojic acid,  glycolic, moisturize and hydrate your skin fast while keeping it soft, smooth, form and young-looking.'),
(8, 'alcohol.png', 'Bleaching Lotion', 40, '250ml', 10100, 0, 'Lotion', NULL),
(9, 'frejuv.png', 'Gluta White Lotion', 100, '250ml', 10100, 0, 'Lotion', NULL),
(10, 'age-eraser-soap.png', 'Kojic Rejuvinating Soap', 40, '110g', 10099, 1, 'Rejuvenating', NULL),
(11, 'sunblock-rejuv.png', 'Sunblock', 90, '10g', 10099, 1, 'Rejuvenating', NULL),
(12, 'cream-rejuv.png', 'Bright Cream', 150, '10g', 10100, 0, 'Rejuvenating', NULL),
(13, 'frejuv.png', 'Toner', 125, '60ml', 10100, 0, 'Rejuvenating', NULL),
(14, 'rejuv-set.png', 'Rejuvenating Set', 250, 'Kojic Soap, Sunblock, Night Cream, Toner', 10100, 0, 'Rejuvenating', 'Improves skin texture+Removes dead skin cell+Improves skin barriers+Reduce fine lines and wrinkles+Increase skin moisture results to healthy glowing skin'),
(15, 'gel-toner-radiantGlow.png', 'Gel Toner', 100, '60ml', 10074, 26, 'Glass Skin', NULL),
(16, 'facialwash-radiantGlow.png', 'Facial Wash', 50, '80ml', 10093, 7, 'Glass Skin', NULL),
(17, 'alcohol.png', 'Serum', 40, '5g', 10095, 5, 'Glass Skin', NULL),
(18, 'sunblock-radiantGlow.png', 'Sun Block', 90, '10g', 10094, 6, 'Glass Skin', NULL),
(19, 'glow-set.png', 'Radiant Glow Facial Set', 350, 'Gel Toner, Facial Wash, Serum, Sunblock', 10097, 3, 'Glass Skin', 'Young looking, fair smooth, firm and perfect glass skin is finally within your reach.'),
(20, 'alcohol.png', 'Isopropyl Alcohol', 50, '1 Liter', 6499, 3701, 'Alcohol', NULL),
(21, 'alcohol.png', 'Isopropyl Alcohol', 40, '60ml', 10000, 100, 'Alcohol', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblproductsarchive`
--

CREATE TABLE `tblproductsarchive` (
  `prodID` int(11) NOT NULL,
  `prodImg` varchar(100) NOT NULL,
  `prodName` varchar(100) NOT NULL,
  `prodPrice` int(11) NOT NULL,
  `prodVolume` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Sold` int(11) DEFAULT NULL,
  `prodCategory` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Ingredients` text DEFAULT NULL,
  `Howtouse` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrebrandingfinishproduct`
--

CREATE TABLE `tblrebrandingfinishproduct` (
  `ID` int(11) NOT NULL,
  `FinishProduct` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrebrandingproducts`
--

CREATE TABLE `tblrebrandingproducts` (
  `prodID` int(11) NOT NULL,
  `userID` varchar(25) NOT NULL,
  `prodImg` varchar(100) DEFAULT NULL,
  `prodName` varchar(100) NOT NULL,
  `prodVolume` varchar(100) NOT NULL,
  `prodPrice` int(11) NOT NULL,
  `prodCategory` varchar(100) NOT NULL,
  `Sold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblrebrandingproducts`
--

INSERT INTO `tblrebrandingproducts` (`prodID`, `userID`, `prodImg`, `prodName`, `prodVolume`, `prodPrice`, `prodCategory`, `Sold`) VALUES
(1, 'admin#253', 'Serum.png', 'Anti-Aging Serum', '30ml', 100, 'Serum', 4),
(2, 'admin#253', 'Moisturizing Cream.png', 'Moisturizing Cream', '50ml', 20, 'Face Cream', 7),
(3, 'admin#253', 'Hydrating Toner.png', 'Hydrating Toner', '200ml', 60, 'Toner', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tblrebrandingproductsarchive`
--

CREATE TABLE `tblrebrandingproductsarchive` (
  `prodID` int(11) NOT NULL,
  `userID` varchar(25) NOT NULL,
  `prodImg` varchar(100) DEFAULT NULL,
  `prodName` varchar(100) NOT NULL,
  `prodVolume` varchar(100) NOT NULL,
  `prodPrice` int(11) NOT NULL,
  `prodCategory` varchar(100) NOT NULL,
  `Sold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblreturndetails`
--

CREATE TABLE `tblreturndetails` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `DateAdded` datetime NOT NULL,
  `Reason` varchar(1000) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `imgPath1` varchar(100) DEFAULT NULL,
  `imgPath2` varchar(100) DEFAULT NULL,
  `imgPath3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblreturndetails`
--

INSERT INTO `tblreturndetails` (`ID`, `OrderRefNumber`, `DateAdded`, `Reason`, `Category`, `imgPath1`, `imgPath2`, `imgPath3`) VALUES
(1, 'ref64', '2023-11-22 21:32:02', 'test', 'null', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblreturnproduct`
--

CREATE TABLE `tblreturnproduct` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `prodName` varchar(100) NOT NULL,
  `prodVariant` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblreturnproduct`
--

INSERT INTO `tblreturnproduct` (`ID`, `OrderRefNumber`, `prodName`, `prodVariant`, `Quantity`) VALUES
(1, 'ref64', 'Snail Max White Lotion', '250ml', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tblreturnstatus`
--

CREATE TABLE `tblreturnstatus` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblreturnstatus`
--

INSERT INTO `tblreturnstatus` (`ID`, `OrderRefNumber`, `Status`) VALUES
(1, 'ref64', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tblverificationcode`
--

CREATE TABLE `tblverificationcode` (
  `verificationID` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `verificationcode` varchar(4) NOT NULL,
  `Expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblvolumemonth`
--

CREATE TABLE `tblvolumemonth` (
  `MATERIAL_NAME` varchar(100) NOT NULL,
  `SUPPLIER` varchar(100) NOT NULL,
  `CODE_NAME` varchar(100) NOT NULL,
  `CURRENT_VOLUME` int(11) NOT NULL,
  `CURRENT_MONTH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audittrailmarketing`
--
ALTER TABLE `audittrailmarketing`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `audittrailproduction`
--
ALTER TABLE `audittrailproduction`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `audittrailwarehouse`
--
ALTER TABLE `audittrailwarehouse`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblaccount`
--
ALTER TABLE `tblaccount`
  ADD PRIMARY KEY (`AccountID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `tblaccountinfo`
--
ALTER TABLE `tblaccountinfo`
  ADD PRIMARY KEY (`AccountID`);

--
-- Indexes for table `tblarchiveuser`
--
ALTER TABLE `tblarchiveuser`
  ADD UNIQUE KEY `itemID` (`itemID`);

--
-- Indexes for table `tblcancelledorder`
--
ALTER TABLE `tblcancelledorder`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `uc_OrderRefNumber` (`OrderRefNumber`);

--
-- Indexes for table `tblcartdata`
--
ALTER TABLE `tblcartdata`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblconfirmationproduct`
--
ALTER TABLE `tblconfirmationproduct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblconfirmationproductarchive`
--
ALTER TABLE `tblconfirmationproductarchive`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblconfirmationproductRebranding`
--
ALTER TABLE `tblconfirmationproductRebranding`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblconfirmationproductRebrandingarchive`
--
ALTER TABLE `tblconfirmationproductRebrandingarchive`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblconfirmationtracking`
--
ALTER TABLE `tblconfirmationtracking`
  ADD PRIMARY KEY (`TrackingID`);

--
-- Indexes for table `tblcourieraccount`
--
ALTER TABLE `tblcourieraccount`
  ADD PRIMARY KEY (`courierID`);

--
-- Indexes for table `tblcourierdelivery`
--
ALTER TABLE `tblcourierdelivery`
  ADD PRIMARY KEY (`deliveryID`);

--
-- Indexes for table `tblcourierdeliverycompleted`
--
ALTER TABLE `tblcourierdeliverycompleted`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcourierdeliverydate`
--
ALTER TABLE `tblcourierdeliverydate`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcourierinformation`
--
ALTER TABLE `tblcourierinformation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcurrentmonth`
--
ALTER TABLE `tblcurrentmonth`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `tblcurrentmonthPackaging`
--
ALTER TABLE `tblcurrentmonthPackaging`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `tblcustomeraccount`
--
ALTER TABLE `tblcustomeraccount`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `tblcustomerinformation`
--
ALTER TABLE `tblcustomerinformation`
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- Indexes for table `tbldisposproduct`
--
ALTER TABLE `tbldisposproduct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblmonthlysummary`
--
ALTER TABLE `tblmonthlysummary`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `tblorderapproved`
--
ALTER TABLE `tblorderapproved`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblordercheckout`
--
ALTER TABLE `tblordercheckout`
  ADD PRIMARY KEY (`OrderNumber`),
  ADD UNIQUE KEY `OrderRefNumber` (`OrderRefNumber`);

--
-- Indexes for table `tblordercheckoutdataarchive`
--
ALTER TABLE `tblordercheckoutdataarchive`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblorderexpirationtime`
--
ALTER TABLE `tblorderexpirationtime`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblorderstatus`
--
ALTER TABLE `tblorderstatus`
  ADD UNIQUE KEY `OrderRefNumber` (`OrderRefNumber`);

--
-- Indexes for table `tblpreregistration`
--
ALTER TABLE `tblpreregistration`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblprocedurestorage`
--
ALTER TABLE `tblprocedurestorage`
  ADD PRIMARY KEY (`procedureID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tblproductcategories`
--
ALTER TABLE `tblproductcategories`
  ADD PRIMARY KEY (`prodCategory`);

--
-- Indexes for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD PRIMARY KEY (`prodID`);

--
-- Indexes for table `tblrebrandingproducts`
--
ALTER TABLE `tblrebrandingproducts`
  ADD PRIMARY KEY (`prodID`);

--
-- Indexes for table `tblrebrandingproductsarchive`
--
ALTER TABLE `tblrebrandingproductsarchive`
  ADD PRIMARY KEY (`prodID`);

--
-- Indexes for table `tblreturndetails`
--
ALTER TABLE `tblreturndetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblreturnproduct`
--
ALTER TABLE `tblreturnproduct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblreturnstatus`
--
ALTER TABLE `tblreturnstatus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblverificationcode`
--
ALTER TABLE `tblverificationcode`
  ADD PRIMARY KEY (`verificationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audittrailmarketing`
--
ALTER TABLE `audittrailmarketing`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `audittrailproduction`
--
ALTER TABLE `audittrailproduction`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `audittrailwarehouse`
--
ALTER TABLE `audittrailwarehouse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblaccount`
--
ALTER TABLE `tblaccount`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcancelledorder`
--
ALTER TABLE `tblcancelledorder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblcartdata`
--
ALTER TABLE `tblcartdata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `tblconfirmationproduct`
--
ALTER TABLE `tblconfirmationproduct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tblconfirmationproductRebranding`
--
ALTER TABLE `tblconfirmationproductRebranding`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblconfirmationtracking`
--
ALTER TABLE `tblconfirmationtracking`
  MODIFY `TrackingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcourierdelivery`
--
ALTER TABLE `tblcourierdelivery`
  MODIFY `deliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tblcourierdeliverycompleted`
--
ALTER TABLE `tblcourierdeliverycompleted`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `tblcourierdeliverydate`
--
ALTER TABLE `tblcourierdeliverydate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tblcourierinformation`
--
ALTER TABLE `tblcourierinformation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcurrentmonth`
--
ALTER TABLE `tblcurrentmonth`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblcurrentmonthPackaging`
--
ALTER TABLE `tblcurrentmonthPackaging`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblmonthlysummary`
--
ALTER TABLE `tblmonthlysummary`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorderapproved`
--
ALTER TABLE `tblorderapproved`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `tblordercheckout`
--
ALTER TABLE `tblordercheckout`
  MODIFY `OrderNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tblordercheckoutdataarchive`
--
ALTER TABLE `tblordercheckoutdataarchive`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblorderexpirationtime`
--
ALTER TABLE `tblorderexpirationtime`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `tblpreregistration`
--
ALTER TABLE `tblpreregistration`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblprocedurestorage`
--
ALTER TABLE `tblprocedurestorage`
  MODIFY `procedureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `prodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblrebrandingproducts`
--
ALTER TABLE `tblrebrandingproducts`
  MODIFY `prodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblreturndetails`
--
ALTER TABLE `tblreturndetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblreturnproduct`
--
ALTER TABLE `tblreturnproduct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblreturnstatus`
--
ALTER TABLE `tblreturnstatus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblverificationcode`
--
ALTER TABLE `tblverificationcode`
  MODIFY `verificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `deleteVerificationCode` ON SCHEDULE EVERY 10 SECOND STARTS '2023-10-31 12:00:24' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DELETE FROM tblverificationcode WHERE NOW() > Expiration;
END$$

CREATE DEFINER=`root`@`localhost` EVENT `verification` ON SCHEDULE EVERY 10 SECOND STARTS '2023-10-31 12:00:24' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    -- DELETE Expired CODE
    DECLARE emailVar VARCHAR(255);
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR
        SELECT email FROM tblprocedurestorage WHERE NOW() > expiration;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    
    event_loop: LOOP
        FETCH cur INTO emailVar;
        IF done = 1 THEN
            LEAVE event_loop;
        END IF;
        
        -- Store the email in a user-defined variable, e.g., @email_list
        SET @email_list = CONCAT_WS(',', @email_list, emailVar);
    END LOOP;
    
    CLOSE cur;
    
    -- Execute the DROP PROCEDURE statement for each email in the list
    SET @sql = CONCAT('DROP PROCEDURE IF EXISTS ', @email_list);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    -- Clear the email list variable
    SET @email_list = NULL;

    DELETE FROM tblprocedurestorage WHERE NOW() > expiration;
    
END$$

CREATE DEFINER=`root`@`localhost` EVENT `CheckAndMoveExpiredOrders` ON SCHEDULE EVERY 10 SECOND STARTS '2023-10-31 12:00:24' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
#auto add ExpirationTime

  INSERT INTO tblorderexpirationtime (OrderRefNumber, Expiration)
  SELECT o.OrderRefNumber, DATE_ADD(NOW(), INTERVAL 5 DAY) AS ExpirationTime
  FROM tblorderstatus o
  LEFT JOIN tblorderexpirationtime e ON o.OrderRefNumber = e.OrderRefNumber
  WHERE o.Status = 'toPay'
  AND e.OrderRefNumber IS NULL;

  -- checker

  -- insert to archive
  INSERT INTO tblorderarchive (OrderNumber, OrderRefNumber, OrderDate, UserID, address, contact, email)
  SELECT b.OrderNumber, b.OrderRefNumber, b.OrderDate , b.UserID, b.address, b.contact, b.email
  FROM tblorderexpirationtime AS a
  JOIN tblordercheckout AS b ON b.OrderRefNumber = a.OrderRefNumber
  WHERE a.Expiration <= NOW() AND b.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblorderarchive);

  INSERT INTO tblorderarchive (OrderNumber, OrderRefNumber, OrderDate, UserID, address, contact, email)
  SELECT b.OrderNumber, b.OrderRefNumber, b.OrderDate , b.UserID, b.address, b.contact, b.email
  FROM tblcancelledorder AS a
  JOIN tblordercheckout AS b ON b.OrderRefNumber = a.OrderRefNumber
  WHERE b.OrderRefNumber NOT IN(SELECT OrderRefNumber FROM tblorderarchive);

  -- for keep tracking data
  INSERT INTO tblordercheckoutdataarchive (OrderRefNumber, ProductName, volume, Quantity, Price)
  SELECT b.OrderRefNumber, b.ProductName, b.volume, b.Quantity, b.Price
  FROM tblorderarchive AS a
  JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
  WHERE b.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblordercheckoutdataarchive);
  

  -- bring back the Quantity of Expired order
  UPDATE tblproducts AS a
  JOIN tblordercheckoutdataarchive AS b ON a.prodName = b.ProductName AND a.prodVolume = b.volume
  SET a.Quantity = a.Quantity + b.Quantity,
  a.Sold = a.Sold - b.Quantity,
  b.checker = 'Added'
  WHERE b.checker IS NULL;

  UPDATE tblrebrandingproducts AS a
  JOIN tblordercheckoutdataarchive AS b ON a.prodName = b.ProductName AND a.prodVolume = b.volume
  JOIN tblorderarchive AS c ON c.UserID = a.userID
  SET a.Sold = a.Sold - b.Quantity,
  b.checker = 'Added'
  WHERE b.checker IS NULL;

  -- delete

  -- Delete if already archive
    DELETE a
    FROM tblorderexpirationtime AS a
    JOIN tblorderstatus AS b ON a.OrderRefNumber = b.OrderRefNumber
    WHERE a.Expiration < NOW() || b.Status != 'toPay';

  -- Delete from toPay order
  DELETE a FROM tblordercheckout AS a
  JOIN tblorderarchive AS b
  WHERE a.OrderRefNumber = b.OrderRefNumber;

  -- Delete data
  DELETE a FROM tblordercheckoutdata AS a
  JOIN tblorderarchive AS b
  WHERE a.OrderRefNumber = b.OrderRefNumber;

  -- Update status

  UPDATE tblorderstatus AS a
  JOIN tblcancelledorder AS b ON a.OrderRefNumber = b.OrderRefNumber
  SET a.status = 'Cancelled'
  WHERE a.status != 'Expired' AND a.status != 'Cancelled';

  -- Expired
  UPDATE tblorderstatus AS a
  JOIN tblorderarchive AS b ON a.OrderRefNumber = b.OrderRefNumber
  SET a.status = 'Expired'
  WHERE b.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblcancelledorder);
  
    -- Expired add to Cancel Table
    INSERT INTO tblcancelledorder (OrderRefNumber, CancelDate, Reason)
  SELECT a.OrderRefNumber, NOW(), 'Expired'
  FROM tblorderstatus AS a
  WHERE a.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblcancelledorder)
  AND (a.Status = 'Cancelled' OR a.Status = 'Expired');
  
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
