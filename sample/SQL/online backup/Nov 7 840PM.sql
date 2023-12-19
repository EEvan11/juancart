-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 07, 2023 at 08:40 PM
-- Server version: 10.6.15-MariaDB
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
(15, '2023-11-05 23:33:04', '1', 'Rebranding Add Product to admin#253 - Hydrating Toner (200ml)');

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
(3, '2023-11-07 15:20:16', '1', 'Delete KBN Product - TrackingID = 4, ID = 23');

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
(1, 'admin', 'admin', 'Admin', '', '');

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
(1, 'Bryan Ken', 'Altes', 'Sayson', 'Angon Rizal', '2000-09-25', 23, 'Male', 'bryanken01230@gmail.com', '09123456789');

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
(10, 'ref7', '2023-11-06 22:21:54', 'Expired');

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
(13, 'admin#253', 'Facial Wash', 1, '80ml'),
(14, '', 'Kojic Rejuvinating Soap', 1, '110g');

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
(2, 1, 'Glutamansi Soap', '50g', 100, '19:04:04'),
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
(22, 2, 'Isopropyl Alcohol', '1 litter', 100, '14:05:31');

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
(23, 4, 'Isopropyl Alcohol', '1 litter', 100, '15:19:52');

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
(1, 'admin#253', 3, 'Moisturizing Cream', '50ml', 100, '15:11:43');

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
(1, 'admin#253', 3, 'Moisturizing Cream', '50ml', 100, '15:11:43');

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
(2, '2023-10-31', 'COMPLETED', 'admin', 'KBN');

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
(4, '2023-11-07', 'PENDING', 'admin', 'KBN');

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
('CourierID2', 'admin1', 'admin'),
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
(1, 'ref3', 'CourierID2'),
(2, 'ref4', 'CourierID2'),
(3, 'ref6', 'CourierID2'),
(4, 'ref2', 'CourierID2'),
(5, 'ref1', 'CourierID2'),
(6, 'ref7', 'CourierID2');

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
(1, 1, '2023-10-31 13:20:54'),
(2, 2, '2023-10-31 13:49:44'),
(3, 3, '2023-11-01 22:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierdeliverydate`
--

CREATE TABLE `tblcourierdeliverydate` (
  `ID` int(11) NOT NULL,
  `deliveryID` int(11) NOT NULL,
  `DeliveryDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcourierdeliverydate`
--

INSERT INTO `tblcourierdeliverydate` (`ID`, `deliveryID`, `DeliveryDate`) VALUES
(1, 1, '2023-10-31 13:20:18'),
(2, 2, '2023-10-31 13:48:38'),
(3, 3, '2023-11-01 22:25:14'),
(4, 4, '2023-11-01 22:26:04'),
(5, 1, '2023-11-01 23:12:19'),
(6, 1, '2023-11-01 23:17:10');

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
(2, '1000', 0, 'test', 0, 0, 0, 0, '2023-11-04 11:07:54', 'test', 'test', 'test', 'test');

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
  `UserID` varchar(25) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcustomeraccount`
--

INSERT INTO `tblcustomeraccount` (`UserID`, `Username`, `Password`) VALUES
('admin#253', 'admin', 'admin'),
('bryanken01230#508', 'bryanken01230', 'admin'),
('miguelbesa249#321', 'miguelbesa249', 'miguelbesa');

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
('admin#253', 'Schmidt', 'Nola', 'D', 'Alias dignissimos il Pao San Pablo, Zamboanga Del Sur', '09158350780', 'testProduct', 0, 'xyzy@mailinator.com', 'Rebranding'),
('bryanken01230#508', 'Altes', 'Bryan Ken', 'S', 'Del Rosario st. Brgy Kalayaan Kalayaan Angono, Rizal', '09158350780', 'Brand X', 0, 'bryanken01230@gmail.com', ''),
('miguelbesa249#321', 'Besa', 'Miguel Antonio ', 'A', 'purok 1, Abnai, Lupang Arenda Santa Ana Taytay, Rizal', '09297879863', 'Brand x', 0, 'miguelbesa249@gmail.com', '');

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
(6, 'ref7', '1');

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
(7, 'ref7', '2023-11-01 22:21:45', 'bryanken01230#508', 'Del Rosario st. Brgy Kalayaan Kalayaan Angono, Rizal', 2147483647, 'bryanken01230@gmail.com', NULL);

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
(9, 'ref7', 'Gluta White Lotion', '250ml', 5, 100, 'Added');

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
('ref1', 'Expired'),
('ref2', 'Expired'),
('ref3', 'Expired'),
('ref4', 'Expired'),
('ref5', 'Cancelled'),
('ref6', 'Expired'),
('ref7', 'Expired');

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
(1, 'Bryan Ken', 'S', 'Altes', '09158350780', 'bryanken01230@gmail.com', 'CALABARZON', 'Rizal', 'Angono', 'Kalayaan', 'Del Rosario st. Brgy Kalayaan', '1930', 'Brand X', 'Completed'),
(2, 'Miguel Antonio ', 'A', 'Besa', '09297879863', 'miguelbesa249@gmail.com', 'CALABARZON', 'Rizal', 'Taytay', 'Santa Ana', 'purok 1, Abnai, Lupang Arenda', '1920', 'Brand x', 'Completed'),
(3, 'Mason', 'Et soluta eaque cupi', 'Craig', 'Sed molestiae odio d', 'bivuqox@mailinator.com', 'MIMAROPA Region', 'Romblon', 'Cajidiocan', 'Cambijang', 'Quo sit dolores qui', '85746', 'Dolor dolor qui et s', 'pending'),
(4, 'Jared', 'Consequatur ut cum e', 'Gonzales', 'Temporibus quis veli', 'yajayol722@qianhost.com', 'CAR', 'Ifugao', 'Kiangan', 'Duit', 'Neque sapiente conse', '59197', 'Nisi tempora suscipi', 'pending'),
(5, 'Edward', 'Iure assumenda magni', 'James', 'Quas repellendus Qu', 'hakiq@mailinator.com', 'CAR', 'Abra', 'Manabo', 'Ayyeng (Pob.)', 'Quia duis sunt nisi', '72964', 'None', 'pending'),
(6, 'Charles', 'Quia dolore aut libe', 'Gardner', 'Quo incididunt culpa', 'dijy@mailinator.com', 'SOCCSKSARGEN', 'South Cotabato', 'Surallah', 'Dajay', 'Ut elit quibusdam i', '68450', 'None', 'pending'),
(7, 'Quon', 'Odio officia commodi', 'Adams', 'Laborum sint expedit', 'bicotuxatu@mailinator.com', 'Cagayan Valley', 'Isabela', 'Aurora', 'Bagong Tanza', 'Ad Nam est cum odit', '40703', 'None', 'pending'),
(8, 'Mira', 'Quia adipisicing est', 'Jacobs', 'Alias ad fugit cum ', 'vemil@mailinator.com', 'Davao Region', 'Davao Del Norte', 'New Corella', 'Poblacion', 'Mollit id aut ipsum', '84773', 'None', 'pending'),
(9, 'Stella', 'Irure voluptate quos', 'Riggs', 'Occaecat voluptates ', 'rujaze@mailinator.com', 'BARMM', 'Basilan', 'Maluso', 'Guanan South', 'Labore animi archit', '29079', 'None', 'pending'),
(10, 'Nola', 'Ducimus est ut fugi', 'Schmidt', 'Vero rerum recusanda', 'xyzy@mailinator.com', 'Zamboanga Peninsula', 'Zamboanga Del Sur', 'San Pablo', 'Pao', 'Alias dignissimos il', '26083', 'testProduct', 'Completed'),
(11, 'Aladdin', 'Cup', 'Mccarty', '09123456789', 'vehob38715@jucatyo.com', 'Central Luzon', 'Nueva Ecija', 'Bongabon', 'Calaanan', 'Ab fugiat alias volu', '5993', '', 'pending'),
(12, 'Damian', 'Asp', 'Hurley', '09123456789', 'bryanjamie0824@gmail.com', 'Central Luzon', 'Bulacan', 'San Ildefonso', 'Gabihan', 'Non enim labore dolo', '6769', 'test', 'pending'),
(13, 'Ray', 'Occ', 'Cotton', '09123456789', 'vegu@mailinSator.com', 'Zamboanga Peninsula', 'Zamboanga Del Sur', 'Bayog', 'Balumbunan', 'Quidem sed inventore', '7578', 'testttt', 'pending'),
(14, 'Wayne', 'Ut ', 'Kaufman', '09123456789', 'bitiz@mailsinator.com', 'Central Luzon', 'Bulacan', 'Balagtas', 'Dalig', 'Ut minus amet recus', '7647', '', 'pending'),
(15, 'Odysseus', 'Tem', 'Cole', '09123456789', 'dawofo@mailinsator.com', 'Caraga', 'Agusan Del Sur', 'La Paz', 'Langasian', 'Enim est quis qui t', '8371', '', 'pending'),
(16, 'Ezra', 'Fac', 'Blankenship', '09123456789', 'binaha9380@eazenity.com', 'Central Luzon', 'Bulacan', 'Plaridel', 'Rueda', 'Sed adipisicing comm', '2686', '', 'pending'),
(17, 'Nell', 'Rem', 'Guerra', '09123456789', 'risomob925@jucatyo.com', 'SOCCSKSARGEN', 'Cotabato', 'Aleosan', 'Tomado', 'Harum quod ex expedi', '8289', '', 'pending'),
(18, 'Melyssa', 'Nat', 'Harvey', '09123456789', 'xemoyew299@mainmile.com', 'Central Luzon', 'Bulacan', 'Baliuag', 'Catulinan', 'Dolores quis est qu', '5704', '', 'pending'),
(19, 'Abraham', 'Ape', 'Huff', '09123456789', 'keviyo6716@eazenity.com', 'Western Visayas', 'Antique', 'Belison', 'Ipil', 'Ea impedit eum offi', '6967', '', 'pending'),
(20, 'Amanda', 'Mag', 'Mason', '09123456789', 'kepirik438@eazenity.com', 'SOCCSKSARGEN', 'Cotabato', 'Kabacan', 'Bangilan', 'Rerum eveniet non p', '7739', '', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `tblprocedurestorage`
--

CREATE TABLE `tblprocedurestorage` (
  `procedureID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `Description` text DEFAULT NULL,
  `Ingredients` text DEFAULT NULL,
  `Howtouse` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`prodID`, `prodImg`, `prodName`, `prodPrice`, `prodVolume`, `Quantity`, `Sold`, `prodCategory`, `Description`, `Ingredients`, `Howtouse`) VALUES
(2, '', 'Glutamansi Soap', 50, '50g', 100, 0, 'Soap', 'Whitening, Moisturizing, Skin Clarifying, Exfoliating, Micro-peeling, Deodorizing', 'Aqua, Coconut Oil, Palm Oil, Sodium Hydroxide, Virgin Coconut Oil, Calamansi Extract, Calamansi Rind, Sodium Bicarbonate, Titanium Dioxide, Phenoxyethanol, Propylene Glycol, Fragrance Oil, Glycerin, Glutathione', 'Aqua, Coconut Oil, Palm Oil, Sodium Hydroxide, Virgin Coconut Oil, Calamansi Extract, Calamansi Rind, Sodium Bicarbonate, Titanium Dioxide, Phenoxyethanol, Propylene Glycol, Fragrance Oil, Glycerin, Glutathione'),
(3, 'alcohol.png', 'Kojic Rejuvinating Soap', 70, '135g', 100, 0, 'Soap', NULL, NULL, NULL),
(4, 'frejuv.png', 'Bleaching Soap', 25, '70g', 100, 0, 'Soap', NULL, NULL, NULL),
(5, 'glow-set.png', 'Revitalize Whitening Beauty Bar', 90, '135g', 100, 0, 'Soap', NULL, NULL, NULL),
(6, '', 'Snail Max White Lotion', 50, '250ml', 100, 0, 'Lotion', '', '', ''),
(7, 'glutamansi-lotion.png', 'Glutamansi Lotion', 70, '250ml', 100, 0, 'Lotion', 'Achieve that rosy skin and radiant glow with this non-sticky premium lotion. Made with effective natural ingredients such as glutathione, calamansi extract, baking soda, shea butter, kojic acid,  glycolic, moisturize and hydrate your skin fast while keeping it soft, smooth, form and young-looking.', 'Aqua, Stearic Acid, Glycol Monostearate, Isopropyl Yristate, Cetyl Alcohol, Glycerin, Glycol Distearate, Glycine Soja (Soybean) Oil, Mineral Oil, Sodium Bicarbonate, Propylene Glycol, Citric Acid, Zinc Oxide, Titanium Dioxide, Kojic Acid Dipalmitate, Glycolic Acod, Citrofortunella Microcarpa (Calamansi) Extract, Green Carica Papaya Extract, Octyl Methoxycinnamate, Glutathione, Phenoxyethanol, Butyrospermum Parkii (Shea) Oil, Fragrance ang BHT, CI 42053', 'Pour desire amount on skin and spread evenly on hands, legs and body. Use twice daily.+For external use only. Of irratation occurs, discontinue use+Store in a cool, dry place not exceeding 30°.'),
(8, 'alcohol.png', 'Bleaching Lotion', 40, '250ml', 100, 0, 'Lotion', NULL, NULL, NULL),
(9, 'frejuv.png', 'Gluta White Lotion', 100, '250ml', 100, 0, 'Lotion', NULL, NULL, NULL),
(10, 'age-eraser-soap.png', 'Kojic Rejuvinating Soap', 40, '110g', 100, 0, 'Rejuvenating', NULL, NULL, NULL),
(11, 'sunblock-rejuv.png', 'Sunblock', 90, '10g', 100, 0, 'Rejuvenating', NULL, NULL, NULL),
(12, 'cream-rejuv.png', 'Bright Cream', 150, '10g', 100, 0, 'Rejuvenating', NULL, NULL, NULL),
(13, 'frejuv.png', 'Toner', 125, '60ml', 100, 0, 'Rejuvenating', NULL, NULL, NULL),
(14, 'rejuv-set.png', 'Rejuvenating Set', 250, 'Kojic Soap, Sunblock, Night Cream, Toner', 100, 0, 'Rejuvenating', 'Improves skin texture+Removes dead skin cell+Improves skin barriers+Reduce fine lines and wrinkles+Increase skin moisture results to healthy glowing skin', NULL, NULL),
(15, 'gel-toner-radiantGlow.png', 'Gel Toner', 100, '60ml', 100, 0, 'Glass Skin', NULL, NULL, NULL),
(16, 'facialwash-radiantGlow.png', 'Facial Wash', 50, '80ml', 100, 0, 'Glass Skin', NULL, NULL, NULL),
(17, 'alcohol.png', 'Serum', 40, '5g', 100, 0, 'Glass Skin', NULL, NULL, NULL),
(18, 'sunblock-radiantGlow.png', 'Sun Block', 90, '10g', 100, 0, 'Glass Skin', NULL, NULL, NULL),
(19, 'glow-set.png', 'Radiant Glow Facial Set', 350, 'Gel Toner, Facial Wash, Serum, Sunblock', 100, 0, 'Glass Skin', 'Young looking, fair smooth, firm and perfect glass skin is finally within your reach.', NULL, NULL),
(20, 'alcohol.png', 'Isopropyl Alcohol', 50, '1 litter', 200, 0, 'Alcohol', NULL, NULL, NULL),
(21, 'alcohol.png', 'Isopropyl Alcohol', 40, '60ml', 100, 0, 'Alcohol', NULL, NULL, NULL);

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

--
-- Dumping data for table `tblproductsarchive`
--

INSERT INTO `tblproductsarchive` (`prodID`, `prodImg`, `prodName`, `prodPrice`, `prodVolume`, `Quantity`, `Sold`, `prodCategory`, `Description`, `Ingredients`, `Howtouse`) VALUES
(1, 'age-eraser-soap.png', 'Age Eraser Soap', 100, '135g', 100, 0, 'Soap', 'The best ingredients in nature are blended in this unique anti-ageing black beauty soap. You now have the power to renew your skin and make younger, whiter and fresher. With micro beads that gently exfoliate and remove dead skin cells.', 'Saponified oils of palm, coconut, soybean and castor, aqua, sodium lactate, activated charcoal, bearberry extract (w/ allantoin & alpha arbutin), glycerin, moringga extract, fragrance oil, colorant and cocomonoethanolamide.', 'For Face: Lather on hands until foamy and massage onto face. Rinse well.+ForBody: Lather on skin directly and rinse well.+Use daily. If irratation occurs, discontinue use.');

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
(1, 'admin#253', 'Serum.png', 'Anti-Aging Serum', '30ml', 100, 'Serum', 0),
(2, 'admin#253', 'Moisturizing Cream.png', 'Moisturizing Cream', '50ml', 20, 'Face Cream', 0),
(3, 'admin#253', 'Hydrating Toner.png', 'Hydrating Toner', '200ml', 60, 'Toner', 0);

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

-- --------------------------------------------------------

--
-- Table structure for table `tblreturnstatus`
--

CREATE TABLE `tblreturnstatus` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD PRIMARY KEY (`procedureID`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `audittrailproduction`
--
ALTER TABLE `audittrailproduction`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audittrailwarehouse`
--
ALTER TABLE `audittrailwarehouse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblaccount`
--
ALTER TABLE `tblaccount`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcancelledorder`
--
ALTER TABLE `tblcancelledorder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblcartdata`
--
ALTER TABLE `tblcartdata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblconfirmationproduct`
--
ALTER TABLE `tblconfirmationproduct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblconfirmationproductRebranding`
--
ALTER TABLE `tblconfirmationproductRebranding`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblconfirmationtracking`
--
ALTER TABLE `tblconfirmationtracking`
  MODIFY `TrackingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblcourierdelivery`
--
ALTER TABLE `tblcourierdelivery`
  MODIFY `deliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcourierdeliverycompleted`
--
ALTER TABLE `tblcourierdeliverycompleted`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcourierdeliverydate`
--
ALTER TABLE `tblcourierdeliverydate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcourierinformation`
--
ALTER TABLE `tblcourierinformation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcurrentmonth`
--
ALTER TABLE `tblcurrentmonth`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblmonthlysummary`
--
ALTER TABLE `tblmonthlysummary`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorderapproved`
--
ALTER TABLE `tblorderapproved`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblordercheckout`
--
ALTER TABLE `tblordercheckout`
  MODIFY `OrderNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblordercheckoutdataarchive`
--
ALTER TABLE `tblordercheckoutdataarchive`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblorderexpirationtime`
--
ALTER TABLE `tblorderexpirationtime`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblpreregistration`
--
ALTER TABLE `tblpreregistration`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblprocedurestorage`
--
ALTER TABLE `tblprocedurestorage`
  MODIFY `procedureID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `prodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblrebrandingproducts`
--
ALTER TABLE `tblrebrandingproducts`
  MODIFY `prodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblreturndetails`
--
ALTER TABLE `tblreturndetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblreturnproduct`
--
ALTER TABLE `tblreturnproduct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblreturnstatus`
--
ALTER TABLE `tblreturnstatus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblverificationcode`
--
ALTER TABLE `tblverificationcode`
  MODIFY `verificationID` int(11) NOT NULL AUTO_INCREMENT;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `CheckAndMoveExpiredOrders` ON SCHEDULE EVERY 10 SECOND STARTS '2023-10-31 12:00:24' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

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
  DELETE FROM tblorderexpirationtime
  WHERE Expiration <= NOW();

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

DELIMITER //

CREATE EVENT CheckAndDropProcedures
ON SCHEDULE EVERY 10 SECOND
DO
BEGIN
    DECLARE emailToDrop VARCHAR(255);
    DECLARE done INT DEFAULT FALSE;

    -- Declare a cursor to fetch the email
    DECLARE cur CURSOR FOR
        SELECT email FROM tblprocedurestorage WHERE NOW() > expiration;

    -- Open the cursor
    OPEN cur;

    loop_label: LOOP
        -- Fetch the email from the query result
        FETCH cur INTO emailToDrop;

        -- Exit the loop if there are no more records
        IF done THEN
            LEAVE loop_label;
        END IF;

        -- Drop the procedure if it exists
        IF emailToDrop IS NOT NULL THEN
            SET @sql = CONCAT('DROP PROCEDURE IF EXISTS ', emailToDrop);
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;
    END LOOP loop_label;

    -- Close the cursor
    CLOSE cur;

    -- Additional deletions
    DELETE FROM tblverificationcode WHERE NOW() > Expiration;
    DELETE FROM tblprocedurestorage WHERE NOW() > expiration;
END;
//
DELIMITER ;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
