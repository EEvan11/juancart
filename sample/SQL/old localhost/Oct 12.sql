-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2023 at 08:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAndDeleteWithRollback` ()   BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  INSERT INTO tblproducts
  (prodID, prodImg, prodName, prodPrice, prodVolume, Quantity, Sold, prodCategory, Description, Ingredients, Howtouse)
  SELECT
    prodID,
    prodImg,
    prodName,
    prodPrice,
    prodVolume,
    Quantity,
    Sold,
    prodCategory,
    Description,
    Ingredients,
    Howtouse
  FROM tblproductsarchive
  WHERE prodID = 1;

  DELETE FROM tblproductsarchive WHERE prodID IN (SELECT prodID FROM tblproducts);

  COMMIT;
END$$

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
(1, '2023-10-12 14:34:57', 'admin', 'KBN Product -  Snail Max White Lotion(250ml)'),
(2, '2023-10-12 14:42:09', 'admin', 'KBN Product Archive - 4'),
(3, '2023-10-12 14:42:13', 'admin', 'KBN Product Restore - 4'),
(4, '2023-10-12 14:42:38', 'admin', 'KBN Product Archive - Age Eraser Soap(135g)'),
(5, '2023-10-12 14:42:43', 'admin', 'KBN Product Restore - Age Eraser Soap(135g)');

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
(2, 'admin1', 'admin', 'Admin', 'Marketing', 'All'),
(3, 'admin2', 'admin', 'Admin', 'Warehouse', 'All'),
(4, 'admin3', 'admin', 'Admin', 'Production', 'All'),
(5, 'Cashier', 'admin', 'Cashier', 'Cashier', 'Cashier'),
(6, 'admin4', 'admin', 'Staff', 'Marketing', 'Inventory-Ordering'),
(7, 'admin5', 'admin', 'Staff', 'Warehouse', 'GenerateQR-Inventory'),
(8, 'admin6', 'admin', 'Staff', 'Warehouse', 'First-inFirst-out'),
(9, 'admin7', 'admin', 'Staff', 'Warehouse', ''),
(10, 'testing', '12345678', 'Admin', 'Warehouse', 'All'),
(11, 'bryanken00', 'bryanken00', 'Admin', 'Marketing', 'All'),
(12, 'test888', 'test123456', 'Admin', 'Marketing', 'All'),
(13, '23131231', '12345678', 'Admin', 'Marketing', 'All'),
(14, 'bryanken', '12345678', 'Admin', 'Marketing', 'All'),
(15, 'tasdasd', 'testtest', 'Admin', 'Marketing', 'All'),
(16, '123121', 'testtest', 'Admin', 'Marketing', 'All'),
(17, 'testadmin', 'testtest', 'Staff', 'Marketing', 'Inventory-Ordering');

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
(1, 'Bryan Ken', 'Altes', 'Sayson', 'Altes', '2000-09-01', 23, 'Male', 'Bryanken01230@gmail.com', '09158350780'),
(2, 'Raven', 'Berenguila', 'DiKoAlam', 'Binangonan, Rizal', '2001-09-02', 22, 'Female', 'dikoalam@gmail.com', '09123456789'),
(3, 'Miguel', 'Besa', 'DiKoAlam', 'Taytay, Rizal', '2001-10-14', 22, 'Female', 'dikoalam@gmail.com', '09123456789'),
(10, 'Account', 'Testing', 'One', '123', '2000-09-25', 22, 'Male', 'bryanken01230@gmail.con', '09123456789'),
(11, 'Bryan Ken', 'Altes', 'Sayson', 'Angono Rizal', '2000-09-25', 22, 'Male', 'bryanken01230@gmail.com', '09158350780'),
(12, 'test2', 'test1', 'test3', 'test4', '2008-09-05', 12, 'Male', 'test5@gmail.com', '77777'),
(13, 'sda', 'tasea', 'asda', 'asd', '2000-09-15', 2, 'Male', '23123@g', '1231'),
(14, '12312', '21312', '21312', '12312', '2008-07-04', 111, 'Male', 'test@g', '123'),
(15, 'test', 'test11', 'test', 'test', '2000-09-08', 11, 'Male', '12@g', '123'),
(16, 't', 'test', 't', 't', '2000-09-15', 19, 'Male', 't@g', '2'),
(17, 'Bry', 'Test', 'test', 'Angono', '2000-09-13', 23, 'Male', 'test1@gmail.com', '09123456789');

-- --------------------------------------------------------

--
-- Table structure for table `tblarchiveuser`
--

CREATE TABLE `tblarchiveuser` (
  `itemID` int(11) NOT NULL,
  `userAccount` varchar(20) NOT NULL,
  `ArchiveDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'ref43', '2023-09-27 00:27:39', 'Cancel'),
(2, 'ref34', '2023-10-08 20:25:26', 'Expired'),
(3, 'ref35', '2023-10-08 20:25:26', 'Expired'),
(4, 'ref36', '2023-10-08 20:25:26', 'Expired'),
(5, 'ref37', '2023-10-08 20:25:26', 'Expired'),
(6, 'ref38', '2023-10-08 20:25:26', 'Expired'),
(7, 'ref39', '2023-10-08 20:25:26', 'Expired'),
(8, 'ref40', '2023-10-08 20:25:26', 'Expired'),
(9, 'ref41', '2023-10-08 20:25:26', 'Expired'),
(10, 'ref42', '2023-10-08 20:25:26', 'Expired'),
(17, 'ref47', '2023-10-08 20:29:26', 'Expired'),
(18, 'ref48', '2023-10-08 20:51:01', ''),
(19, 'ref49', '2023-10-08 20:51:58', 'test');

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
(1, 1, 'Age Eraser Soap', '135g', 0, '14:45:47'),
(2, 1, 'Isopropyl Alcohol', '1 litter', 100, '14:49:28'),
(3, 1, 'Isopropyl Alcohol', '60ml', 100, '14:50:00'),
(4, 2, 'Isopropyl Alcohol', '60ml', 10, '14:55:21'),
(5, 3, 'Isopropyl Alcohol', '60ml', 100, '14:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationtracking`
--

CREATE TABLE `tblconfirmationtracking` (
  `TrackingID` int(11) NOT NULL,
  `DateAdded` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  `AddedBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblconfirmationtracking`
--

INSERT INTO `tblconfirmationtracking` (`TrackingID`, `DateAdded`, `Status`, `AddedBy`) VALUES
(1, '2023-10-08', 'PENDING', 'admin'),
(2, '2023-10-09', 'PENDING', 'admin'),
(3, '2023-10-10', 'PENDING', 'admin');

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
('admin', 'adminmain', 'admin'),
('admin1', 'admin1', 'admin'),
('admin10', 'admin10', 'admin'),
('admin11', 'admin11', 'admin'),
('admin12', 'admin12', 'admin'),
('admin13', 'admin13', 'admin'),
('admin14', 'admin14', 'admin'),
('admin15', 'admin15', 'admin'),
('admin16', 'admin16', 'admin'),
('admin17', 'admin17', 'admin'),
('admin18', 'admin18', 'admin'),
('admin19', 'admin19', 'admin'),
('admin2', 'admin2', 'admin'),
('admin3', 'admin3', 'admin'),
('admin4', 'admin4', 'admin'),
('admin5', 'admin5', 'admin'),
('admin6', 'admin6', 'admin'),
('admin7', 'admin7', 'admin'),
('admin8', 'admin8', 'admin'),
('admin9', 'admin9', 'admin');

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
(1, 'ref2', 'admin11'),
(2, 'ref4', 'admin11'),
(3, 'ref5', 'admin'),
(16, 'ref18', 'admin11'),
(17, 'ref17', 'admin11'),
(18, 'ref16', 'admin11'),
(19, 'ref15', 'admin11'),
(20, 'ref1', 'admin11'),
(21, 'ref3', 'admin11'),
(22, 'ref7', 'admin11'),
(23, 'ref9', 'admin11'),
(24, 'ref10', 'admin1'),
(25, 'ref11', 'admin12'),
(26, 'ref12', 'admin14'),
(27, 'ref13', 'admin11'),
(28, 'ref14', 'admin16'),
(29, 'ref21', 'admin12'),
(30, 'ref26', 'admin13'),
(31, 'ref6', 'admin10'),
(32, 'ref8', 'admin10'),
(33, 'ref22', 'admin11'),
(34, 'ref23', 'admin11'),
(35, 'ref19', 'admin11'),
(36, 'ref20', 'admin11'),
(37, 'ref45', 'admin11'),
(38, 'ref44', 'admin11'),
(39, 'ref46', 'admin1');

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
(1, 1, '2023-08-26 00:00:00'),
(3, 2, '2023-08-27 00:00:00'),
(4, 3, '2023-08-27 00:00:00'),
(5, 16, '2023-08-27 00:00:00'),
(6, 17, '2023-08-27 00:00:00'),
(7, 18, '2023-08-27 00:00:00'),
(8, 20, '2023-08-30 09:50:00'),
(9, 19, '2023-08-30 09:50:00'),
(10, 19, '2023-08-31 03:43:00'),
(11, 21, '2023-08-31 04:11:00'),
(12, 22, '2023-09-10 05:17:00'),
(13, 31, '2023-09-11 05:32:00'),
(14, 32, '2023-09-11 05:32:00'),
(15, 23, '2023-09-11 05:33:00'),
(16, 27, '2023-09-11 05:33:00'),
(17, 25, '2023-09-11 05:33:00'),
(18, 29, '2023-09-11 05:33:00'),
(19, 30, '2023-09-11 05:34:00'),
(20, 26, '2023-09-11 05:34:00'),
(21, 28, '2023-09-11 05:34:00'),
(22, 24, '2023-09-18 06:52:00'),
(23, 38, '2023-09-27 07:40:00'),
(24, 37, '2023-09-27 07:40:00');

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
(1, 1, '2023-08-24 00:00:00'),
(2, 2, '2023-08-24 00:00:00'),
(3, 3, '2023-08-24 00:00:00'),
(6, 16, '2023-08-27 00:00:00'),
(7, 17, '2023-08-27 00:00:00'),
(8, 18, '2023-08-27 00:00:00'),
(9, 19, '2023-08-28 17:37:48'),
(10, 20, '2023-08-28 17:41:06'),
(11, 21, '2023-08-31 21:56:33'),
(12, 22, '2023-08-31 21:56:41'),
(13, 23, '2023-08-31 21:56:45'),
(14, 24, '2023-09-11 11:31:26'),
(15, 25, '2023-09-11 11:31:31'),
(16, 26, '2023-09-11 11:31:41'),
(17, 27, '2023-09-11 11:31:46'),
(18, 28, '2023-09-11 11:31:53'),
(19, 29, '2023-09-11 11:32:18'),
(20, 30, '2023-09-11 11:32:25'),
(21, 31, '2023-09-11 11:32:33'),
(22, 32, '2023-09-11 11:32:37'),
(23, 33, '2023-09-21 23:38:59'),
(24, 34, '2023-09-21 23:39:04'),
(25, 35, '2023-09-28 01:29:05'),
(26, 36, '2023-09-28 01:29:12'),
(27, 37, '2023-09-28 01:40:26'),
(28, 38, '2023-09-28 01:40:30'),
(29, 39, '2023-10-04 22:31:17');

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
('admin', 1, 'testing', 'admin', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin1', 2, 'testing', 'admin1', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin2', 3, 'testing', 'admin2', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin3', 4, 'testing', 'admin3', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin4', 5, 'testing', 'admin4', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin5', 6, 'testing', 'admin5', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin6', 7, 'testing', 'admin6', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin7', 8, 'testing', 'admin7', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin8', 9, 'testing', 'admin8', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin9', 10, 'testing', 'admin9', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin10', 11, 'testing', 'admin10', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin11', 12, 'testing', 'admin11', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin12', 13, 'testing', 'admin12', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin13', 14, 'testing', 'admin13', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin14', 15, 'testing', 'admin14', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin15', 16, 'testing', 'admin15', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin16', 17, 'testing', 'admin16', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin17', 18, 'testing', 'admin17', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin18', 19, 'testing', 'admin18', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789'),
('admin19', 20, 'testing', 'admin19', 'KBN', 'Angono Rizal', 'test@gmail.com', '09123456789');

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
(15, '4266', 0, 'POWDER', 1234, 0, 0, 0, '2022-05-03 00:00:00', 'Bentonite', 'B-NITE', 'Fw Spa', 'RAW MATERIALS'),
(16, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Bust Up', '', 'SOGOMI', 'RAW MATERIALS'),
(19, '5500', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CALCIUM CHLORIDE', 'CAL-CHLO', 'TRUE MAN DESICANTS', 'RAW MATERIALS'),
(21, '3100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CAMPHOR', 'C-PR', 'Fw Spa', 'RAW MATERIALS'),
(22, '3200', 0, 'POWDER', 4000, 0, 0, 0, '2022-05-03 00:00:00', 'CARBOMER 940', 'POLYMER', 'Sogomi', 'RAW MATERIALS'),
(24, '30000', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CAUSTIC SODA', 'CSP', 'CHEMI-SOURCE', 'RAW MATERIALS'),
(25, '38000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CDEA', 'F-BOOSTER1', 'SOGOMI', 'RAW MATERIALS'),
(28, '6000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CHEMCCINATE DSLSK', 'C-DSLSK', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(29, '3000', 0, 'WHITE CRYSTALLINE SOLID', 1600, 0, 0, 0, '2022-05-03 00:00:00', 'CITRIC ACID', 'PH ADJ', 'Fw Spa', 'RAW MATERIALS'),
(30, '-2000', 0, 'SOLID', 3000, 0, 0, 0, '2022-05-03 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Sogomi', 'RAW MATERIALS'),
(31, '1000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Fw Spa', 'RAW MATERIALS'),
(32, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CMEA', 'F. BOOSTER 2', 'Fw Spa', 'RAW MATERIALS'),
(33, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'COCOAMODO BETAINE', 'CA-BT', 'Fw Spa', 'RAW MATERIALS'),
(34, '306', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'COFFEE SCRUB', 'ACTIVE-COF', 'MOM CARES', 'RAW MATERIALS'),
(35, '30', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CYCLOMETHICONE', 'CYCLO-M', 'Fw Spa', 'RAW MATERIALS'),
(36, '2100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CYCLOPENTASILOXANE', 'CYCLO-S', 'Fw Spa', 'RAW MATERIALS'),
(37, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'DECYL GLUCOSIDE', 'DEC-G', 'Fw Spa', 'RAW MATERIALS'),
(38, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'DERMA-CB', '', '', 'RAW MATERIALS'),
(39, '1900', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'DIMETHICONE', 'SILICONE-D', 'FW SPA', 'RAW MATERIALS'),
(40, '1975', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'DIMETHICONE TRIMETHYL', 'SILICONE-TRI', 'FW SPA', 'RAW MATERIALS'),
(41, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'DIMETHYLSILOXANE', 'D-SILOX', 'FW SPA', 'RAW MATERIALS'),
(42, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'DIPROPELENE GLYCOL', 'DPG', 'FW SPA', 'RAW MATERIALS'),
(43, '2700', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'EARTH-D', 'E-D', 'DALKEN', 'RAW MATERIALS'),
(44, '1500', 0, 'BEADS', 0, 0, 0, 1500, '2022-05-03 00:00:00', 'EMMULIUM DELTA', 'E-DELTA', 'KALIO-REXI', 'RAW MATERIALS'),
(45, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ETHYLENEDIAMINE TETRAACETIC ACID', 'EDTA', 'SOGOMI', 'RAW MATERIALS'),
(46, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'FDP-C WHITE 3', 'FDP-CW3', 'EUNICE inc.', 'RAW MATERIALS'),
(47, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GAL SOFT SCI 85', 'GS-S85', '', 'RAW MATERIALS'),
(48, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GALSIK/ MIGOQUAT C30/ POLYQUATERNIUM 7/ PQ7', 'G-SILK', 'FW SPA', 'RAW MATERIALS'),
(49, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GINGER POWDER', 'GIN-P', '', 'RAW MATERIALS'),
(50, '1700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GLUCAM P-20', 'G-P20', 'CHEMCO', 'RAW MATERIALS'),
(51, '3000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GLYCERIN SOAP BASE', 'G-SB', 'FW SPA', 'RAW MATERIALS'),
(52, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GLYCERINE-MIGOSIL GLY/ LIQUID CERINE', 'MOISTURIZER', 'SOGOMI', 'RAW MATERIALS'),
(53, '0', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GLYCOLIC ACID', 'EXFOL-GAHA', 'FW SPA', 'RAW MATERIALS'),
(54, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GREEN CENTELLA', 'G-CEN', 'CHEMCO', 'RAW MATERIALS'),
(55, '930', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GUAR GUM', 'G-GUM', 'SOGOMI', 'RAW MATERIALS'),
(56, '300', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'HMC POLYMER', 'HMC-P', 'FW SPA', 'RAW MATERIALS'),
(57, '1100', 0, 'GEL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'HYAURONIC ACID GEL', 'HA-GEL', 'FW SPA', 'RAW MATERIALS'),
(58, '20', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'HYDROLIZED KERATIN', 'HYDRO-K', 'SOGOMI', 'RAW MATERIALS'),
(59, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'HYDROXY ETHYL CELLULOSE', 'HYDRO-EC', 'FW SPA', 'RAW MATERIALS'),
(60, '2500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ISODODICANE', 'SOLVENT-ISODO', 'FW SPA', 'RAW MATERIALS'),
(61, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ISOPROPYL MYRISTATE/ MIGOSIL IPM', 'E-IPM', 'SOGOMI', 'RAW MATERIALS'),
(62, '1790', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'KAOLIN CLAY', 'K-CLAY', 'FW SPA', 'RAW MATERIALS'),
(63, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'KOJIC ACID', 'ACTIVE-K', 'SOGOMI', 'RAW MATERIALS'),
(64, '1000', 0, 'LIQUID', 400, 0, 0, 0, '2022-05-03 00:00:00', 'LACTIC ACID', 'PH-ACID', 'SOGOMI', 'RAW MATERIALS'),
(65, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LACTIC ACID', 'PH-ACID', 'FW SPA', 'RAW MATERIALS'),
(66, '23000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LACTOMOIST', 'BUFFERING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(67, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LAURIC ACID', 'L-ACID', 'FW SPA', 'RAW MATERIALS'),
(68, '850', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LAVENDER MASK PACK', 'LAV-MASK', '', 'RAW MATERIALS'),
(69, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LUZINCI WHITE', 'TRANEXAMMIC ACID', 'SOGOMI', 'RAW MATERIALS'),
(70, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MAGNESIUM OXIDE', 'MAG-OX', 'DALKEM', 'RAW MATERIALS'),
(71, '20', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MANDELIC ACID', 'M-ACID', 'SOGOMI', 'RAW MATERIALS'),
(72, '9300', 0, 'CRYSTAL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MENTHOL CRYSTAL', 'M-CRYSTAL', 'FW SPA', 'RAW MATERIALS'),
(73, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MERQUAT 3330', 'M-3330', 'CHEMCO', 'RAW MATERIALS'),
(74, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'METHYL SALICYLATE', 'M-SALICYLATE', 'FW SPA', 'RAW MATERIALS'),
(75, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MICA W7103- B. WHITE', 'MICA WHITE', 'SOGOMI', 'RAW MATERIALS'),
(76, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MICELLAR ACID', 'MC-ACID', 'FW SPA', 'RAW MATERIALS'),
(77, '1600', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MICELLAR WATER', 'MC-H2O', 'FW SPA', 'RAW MATERIALS'),
(78, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MIGOQUAT C30/CETRIMONIUM CHLORIDE', 'MQ-C30', 'SOGOMI', 'RAW MATERIALS'),
(79, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MINERAL WATER', 'AQUA', 'ANGELOUS', 'RAW MATERIALS'),
(80, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MYRISTIC ACID', 'MR-ACID', 'FW SPA', 'RAW MATERIALS'),
(81, '4000', 0, 'POWDER', 1600, 0, 0, 1000, '2022-05-03 00:00:00', 'NIACINAMIDE', 'VITAMIN B3', 'FW SPA', 'RAW MATERIALS'),
(82, '1400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'OCTYL METHOXY CINNAMATE', 'SUNSHIELD OMC', 'SOGOMI', 'RAW MATERIALS'),
(83, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PANTHENOL', 'P-TH', 'FW SPA', 'RAW MATERIALS'),
(84, '100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PAPAIN CRYSTAL/PAPAIN ENZYME/ PAPAIN', 'ACTIVE-P', 'FW SPA', 'RAW MATERIALS'),
(85, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PEARL WHITE', 'P-WHITE', '', 'RAW MATERIALS'),
(86, '6500', 0, 'GEL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'FW SPA', 'RAW MATERIALS'),
(87, '8000', 0, 'GEL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'MEGAWISE', 'RAW MATERIALS'),
(88, '2085', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PHENOX ETHYL GLYCERINE', 'PR-EG', 'FW SPA', 'RAW MATERIALS'),
(89, '1985', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PHENOXYETHANOL', 'PR-P', 'FW SPA', 'RAW MATERIALS'),
(90, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PHM-BIGUANITE', 'PHM-B', 'MOM CARES', 'RAW MATERIALS'),
(91, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PHYTPEEL 500-APRICOT', 'PAS-500', 'FW SPA', 'RAW MATERIALS'),
(92, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'POLYVINYL ALCOHOL BP24', 'PVA-BP24', 'DALKEM', 'RAW MATERIALS'),
(93, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'POLYVINYL PYRROLYDONE K-30', 'PV-P-K30', 'DALKEM', 'RAW MATERIALS'),
(94, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'POTASIUM ALLUM POWDER', 'P-ALP', 'DALKEM', 'RAW MATERIALS'),
(95, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'POTASIUM HYDROXIDE', 'PS-HYDRO', 'FW SPA', 'RAW MATERIALS'),
(96, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'POTASIUM SORBATE', 'FG.PR-PS', '', 'RAW MATERIALS'),
(97, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PROPYLENE GLYCOL/ MIGOSIL PPG/ PROCOL', 'E/PPG', 'FW SPA', 'RAW MATERIALS'),
(98, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PUROLAN TEC', 'P-TEC', 'CHEMCO', 'RAW MATERIALS'),
(99, '4000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PUROLAN-IDD', 'P-IDD', 'CHEMCO', 'RAW MATERIALS'),
(100, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'QUICK PEARL PK3', 'QP- PK3', 'CHEMCO', 'RAW MATERIALS'),
(101, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'REJUDERM VA', 'VITAMIN A', '', 'RAW MATERIALS'),
(102, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ROSE MARY WATER', 'ROSE-AQUA', '', 'RAW MATERIALS'),
(103, '1300', 0, 'POWDER', 0, 0, 0, 98, '2022-05-03 00:00:00', 'SALICYLIC ACID', 'EXFOLSBHA', 'SOGOMI', 'RAW MATERIALS'),
(104, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SCI NEEDLE', 'SCI-N', 'FW SPA', 'RAW MATERIALS'),
(105, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SCI POWDER', 'SCI-P', 'FW SPA', 'RAW MATERIALS'),
(106, '12208', 0, 'BUTTER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SHEA BUTTER', 'A-SB', 'FW SPA', 'RAW MATERIALS'),
(107, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SKIM MILK', 'S-MILK', 'FW SPA', 'RAW MATERIALS'),
(108, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'FW SPA', 'RAW MATERIALS'),
(109, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'SOGOMI', 'RAW MATERIALS'),
(110, '22000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SODIUM CHLORIDE', 'S-CHLO', 'FW SPA', 'RAW MATERIALS'),
(111, '14000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SODIUM LACTATE', 'HARDENING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(112, '0', 0, 'GEL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Sodium Laureth Sulfate', 'SLES', 'FW SPA', 'RAW MATERIALS'),
(113, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Sodium Laureth Sulfate', 'SLS', 'MOM CARES', 'RAW MATERIALS'),
(114, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'MOM CARES', 'RAW MATERIALS'),
(115, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'FW SPA', 'RAW MATERIALS'),
(116, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SORBITOL', 'S-BL', 'FW SPA', 'RAW MATERIALS'),
(117, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SUGARCANE DISTILLATE', 'ETHYL ALCOHOL', '', 'RAW MATERIALS'),
(118, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SUNSHIELD BP4', 'S-BP4', 'SOGOMI', 'RAW MATERIALS'),
(119, '1500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TALCUM PREMIUM POWDER', 'TALC-PRM', 'SOGOMI', 'RAW MATERIALS'),
(120, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TERGITOL', 'T-GL', 'FW SPA', 'RAW MATERIALS'),
(121, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TETRASODIUM PYROPHOS', 'TS-PR', 'DALKEM', 'RAW MATERIALS'),
(122, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TONALID', 'TONALID', 'FW SPA', 'RAW MATERIALS'),
(123, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TRIETHANOLAMINE', 'E-TE', 'SOGOMI', 'RAW MATERIALS'),
(124, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TWEEN POLYSORBATE 20/ POLYSORBATE 20', 'POLY-20', 'FW SPA', 'RAW MATERIALS'),
(125, '2200', 0, 'LIQUID', 80, 0, 0, 0, '2022-05-03 00:00:00', 'TWEEN POLYSORBATE 80/ POLYSORBATE 80', 'POLY-80', 'FW SPA', 'RAW MATERIALS'),
(126, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'VITAMIN C', 'VIT-C', 'FW SPA', 'RAW MATERIALS'),
(127, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'VITAMIN E ACETATE', 'VIT.E-ACT', '', 'RAW MATERIALS'),
(128, '585', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'VITAMIN E ADDITIVE', 'VIT. E-ADD', 'FW SPA', 'RAW MATERIALS'),
(129, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'XANTHAN GUM', 'X-GUM', 'FW SPA', 'RAW MATERIALS'),
(130, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ZINC OXIDE', 'Z-OX', 'FW SPA', 'RAW MATERIALS'),
(131, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Ac Care 1000', 'AC-1K', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(132, '21200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Acnibio Mxr', 'PR-A', 'Sogomi', 'RAW MATERIALS'),
(133, '1100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Activated Charcoal Fine', 'AC-FINE', 'Sogomi', 'RAW MATERIALS'),
(134, '65', 0, 'BEADS', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Alcogel Beads', 'AL-B', 'Fw Spa', 'RAW MATERIALS'),
(135, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Alginate', 'AL-G', 'Fw Spa', 'RAW MATERIALS'),
(136, '11920', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Allantoin', 'D-ALT', 'Sogomi', 'RAW MATERIALS'),
(137, '10000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Alluminum Choride', 'A-CHLO', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(138, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Antibac- BKC', 'AB-BKC', 'Sogomi', 'RAW MATERIALS'),
(139, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Arrow Root', 'A-ROOT', 'Green dahan', 'RAW MATERIALS'),
(140, '1800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Azeglyjic optima', '3 IN 1 WHITE', 'SOGOMI', 'RAW MATERIALS'),
(141, '275000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Baking Soda', 'A-BS', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(142, '5000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Bamboo Wood Charcoal', 'AC-CHARCOAL', 'Fw Spa', 'RAW MATERIALS'),
(143, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Beetox H', 'B-H', 'Fw Spa', 'RAW MATERIALS'),
(144, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Behentrimonium', 'B-TRI', 'Fw Spa', 'RAW MATERIALS'),
(145, '7372', 0, 'POWDER', 1234, 0, 0, 0, '2022-05-04 00:00:00', 'Bentonite', 'B-NITE', 'Fw Spa', 'RAW MATERIALS'),
(146, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Bust Up', '', 'SOGOMI', 'RAW MATERIALS'),
(147, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BUTYLENE GLYCOL 1,3', 'BC-1,3', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(148, '5800', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Butyl-Hydroxytotulene', 'BHT', 'Fw Spa', 'RAW MATERIALS'),
(149, '5500', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CALCIUM CHLORIDE', 'CAL-CHLO', 'TRUE MAN DESICANTS', 'RAW MATERIALS'),
(150, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CALCIUM SULFATE DEHYDRATE', 'CAL-SD', 'DALKEN', 'RAW MATERIALS'),
(151, '3100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CAMPHOR', 'C-PR', 'Fw Spa', 'RAW MATERIALS'),
(152, '3200', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CARBOMER 940', 'POLYMER', 'Sogomi', 'RAW MATERIALS'),
(153, '27100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CARBOPOL ULTREZ 30', 'CU-30', 'Sogomi', 'RAW MATERIALS'),
(154, '30000', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CAUSTIC SODA', 'CSP', 'CHEMI-SOURCE', 'RAW MATERIALS'),
(155, '38000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CDEA', 'F-BOOSTER1', 'SOGOMI', 'RAW MATERIALS'),
(156, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CETEARETH-20', 'CT-20', 'Fw Spa', 'RAW MATERIALS'),
(157, '17700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CHEM BETAINE APC', 'CB-APC', 'Sogomi', 'RAW MATERIALS'),
(158, '6000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CHEMCCINATE DSLSK', 'C-DSLSK', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(159, '1400', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CITRIC ACID', 'PH ADJ', 'Fw Spa', 'RAW MATERIALS'),
(160, '-2000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Sogomi', 'RAW MATERIALS'),
(161, '1000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Fw Spa', 'RAW MATERIALS'),
(162, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CMEA', 'F. BOOSTER 2', 'Fw Spa', 'RAW MATERIALS'),
(163, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'COCOAMODO BETAINE', 'CA-BT', 'Fw Spa', 'RAW MATERIALS'),
(164, '306', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'COFFEE SCRUB', 'ACTIVE-COF', 'MOM CARES', 'RAW MATERIALS'),
(165, '30', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CYCLOMETHICONE', 'CYCLO-M', 'Fw Spa', 'RAW MATERIALS'),
(166, '2100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CYCLOPENTASILOXANE', 'CYCLO-S', 'Fw Spa', 'RAW MATERIALS'),
(167, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'DECYL GLUCOSIDE', 'DEC-G', 'Fw Spa', 'RAW MATERIALS'),
(168, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'DERMA-CB', '', '', 'RAW MATERIALS'),
(169, '1900', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'DIMETHICONE', 'SILICONE-D', 'FW SPA', 'RAW MATERIALS'),
(170, '1975', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'DIMETHICONE TRIMETHYL', 'SILICONE-TRI', 'FW SPA', 'RAW MATERIALS'),
(171, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'DIMETHYLSILOXANE', 'D-SILOX', 'FW SPA', 'RAW MATERIALS'),
(172, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'DIPROPELENE GLYCOL', 'DPG', 'FW SPA', 'RAW MATERIALS'),
(173, '2700', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'EARTH-D', 'E-D', 'DALKEN', 'RAW MATERIALS'),
(174, '3000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-04 00:00:00', 'EMMULIUM DELTA', 'E-DELTA', 'KALIO-REXI', 'RAW MATERIALS'),
(175, '0', 1000, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ETHYLENEDIAMINE TETRAACETIC ACID', 'EDTA', 'SOGOMI', 'RAW MATERIALS'),
(176, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'FDP-C WHITE 3', 'FDP-CW3', 'EUNICE inc.', 'RAW MATERIALS'),
(177, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GAL SOFT SCI 85', 'GS-S85', '', 'RAW MATERIALS'),
(178, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GALSIK/ MIGOQUAT C30/ POLYQUATERNIUM 7/ PQ7', 'G-SILK', 'FW SPA', 'RAW MATERIALS'),
(179, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GINGER POWDER', 'GIN-P', '', 'RAW MATERIALS'),
(180, '1700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GLUCAM P-20', 'G-P20', 'CHEMCO', 'RAW MATERIALS'),
(181, '3000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GLYCERIN SOAP BASE', 'G-SB', 'FW SPA', 'RAW MATERIALS'),
(182, '0', 3000, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GLYCERINE-MIGOSIL GLY/ LIQUID CERINE', 'MOISTURIZER', 'SOGOMI', 'RAW MATERIALS'),
(183, '0', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GLYCOLIC ACID', 'EXFOL-GAHA', 'FW SPA', 'RAW MATERIALS'),
(184, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GREEN CENTELLA', 'G-CEN', 'CHEMCO', 'RAW MATERIALS'),
(185, '930', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GUAR GUM', 'G-GUM', 'SOGOMI', 'RAW MATERIALS'),
(186, '300', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'HMC POLYMER', 'HMC-P', 'FW SPA', 'RAW MATERIALS'),
(187, '1100', 0, 'GEL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'HYAURONIC ACID GEL', 'HA-GEL', 'FW SPA', 'RAW MATERIALS'),
(188, '20', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'HYDROLIZED KERATIN', 'HYDRO-K', 'SOGOMI', 'RAW MATERIALS'),
(189, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'HYDROXY ETHYL CELLULOSE', 'HYDRO-EC', 'FW SPA', 'RAW MATERIALS'),
(190, '2500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ISODODICANE', 'SOLVENT-ISODO', 'FW SPA', 'RAW MATERIALS'),
(191, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ISOPROPYL MYRISTATE/ MIGOSIL IPM', 'E-IPM', 'SOGOMI', 'RAW MATERIALS'),
(192, '1790', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'KAOLIN CLAY', 'K-CLAY', 'FW SPA', 'RAW MATERIALS'),
(193, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'KOJIC ACID', 'ACTIVE-K', 'SOGOMI', 'RAW MATERIALS'),
(194, '600', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LACTIC ACID', 'PH-ACID', 'SOGOMI', 'RAW MATERIALS'),
(195, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LACTIC ACID', 'PH-ACID', 'FW SPA', 'RAW MATERIALS'),
(196, '23000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LACTOMOIST', 'BUFFERING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(197, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LAURIC ACID', 'L-ACID', 'FW SPA', 'RAW MATERIALS'),
(198, '850', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LAVENDER MASK PACK', 'LAV-MASK', '', 'RAW MATERIALS'),
(199, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LUZINCI WHITE', 'TRANEXAMMIC ACID', 'SOGOMI', 'RAW MATERIALS'),
(200, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MAGNESIUM OXIDE', 'MAG-OX', 'DALKEM', 'RAW MATERIALS'),
(201, '20', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MANDELIC ACID', 'M-ACID', 'SOGOMI', 'RAW MATERIALS'),
(202, '9300', 0, 'CRYSTAL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MENTHOL CRYSTAL', 'M-CRYSTAL', 'FW SPA', 'RAW MATERIALS'),
(203, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MERQUAT 3330', 'M-3330', 'CHEMCO', 'RAW MATERIALS'),
(204, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'METHYL SALICYLATE', 'M-SALICYLATE', 'FW SPA', 'RAW MATERIALS'),
(205, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MICA W7103- B. WHITE', 'MICA WHITE', 'SOGOMI', 'RAW MATERIALS'),
(206, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MICELLAR ACID', 'MC-ACID', 'FW SPA', 'RAW MATERIALS'),
(207, '1600', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MICELLAR WATER', 'MC-H2O', 'FW SPA', 'RAW MATERIALS'),
(208, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MIGOQUAT C30/CETRIMONIUM CHLORIDE', 'MQ-C30', 'SOGOMI', 'RAW MATERIALS'),
(209, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MINERAL WATER', 'AQUA', 'ANGELOUS', 'RAW MATERIALS'),
(210, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MYRISTIC ACID', 'MR-ACID', 'FW SPA', 'RAW MATERIALS'),
(211, '3400', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'NIACINAMIDE', 'VITAMIN B3', 'FW SPA', 'RAW MATERIALS'),
(212, '1400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'OCTYL METHOXY CINNAMATE', 'SUNSHIELD OMC', 'SOGOMI', 'RAW MATERIALS'),
(213, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PANTHENOL', 'P-TH', 'FW SPA', 'RAW MATERIALS'),
(214, '100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PAPAIN CRYSTAL/PAPAIN ENZYME/ PAPAIN', 'ACTIVE-P', 'FW SPA', 'RAW MATERIALS'),
(215, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PEARL WHITE', 'P-WHITE', '', 'RAW MATERIALS'),
(216, '6500', 0, 'GEL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'FW SPA', 'RAW MATERIALS'),
(217, '8000', 0, 'GEL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'MEGAWISE', 'RAW MATERIALS'),
(218, '2085', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PHENOX ETHYL GLYCERINE', 'PR-EG', 'FW SPA', 'RAW MATERIALS'),
(219, '1985', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PHENOXYETHANOL', 'PR-P', 'FW SPA', 'RAW MATERIALS'),
(220, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PHM-BIGUANITE', 'PHM-B', 'MOM CARES', 'RAW MATERIALS'),
(221, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PHYTPEEL 500-APRICOT', 'PAS-500', 'FW SPA', 'RAW MATERIALS'),
(222, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'POLYVINYL ALCOHOL BP24', 'PVA-BP24', 'DALKEM', 'RAW MATERIALS'),
(223, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'POLYVINYL PYRROLYDONE K-30', 'PV-P-K30', 'DALKEM', 'RAW MATERIALS'),
(224, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'POTASIUM ALLUM POWDER', 'P-ALP', 'DALKEM', 'RAW MATERIALS'),
(225, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'POTASIUM HYDROXIDE', 'PS-HYDRO', 'FW SPA', 'RAW MATERIALS'),
(226, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'POTASIUM SORBATE', 'FG.PR-PS', '', 'RAW MATERIALS'),
(227, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PROPYLENE GLYCOL/ MIGOSIL PPG/ PROCOL', 'E/PPG', 'FW SPA', 'RAW MATERIALS'),
(228, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PUROLAN TEC', 'P-TEC', 'CHEMCO', 'RAW MATERIALS'),
(229, '4000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PUROLAN-IDD', 'P-IDD', 'CHEMCO', 'RAW MATERIALS'),
(230, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'QUICK PEARL PK3', 'QP- PK3', 'CHEMCO', 'RAW MATERIALS'),
(231, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'REJUDERM VA', 'VITAMIN A', '', 'RAW MATERIALS'),
(232, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ROSE MARY WATER', 'ROSE-AQUA', '', 'RAW MATERIALS'),
(233, '1398', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SALICYLIC ACID', 'EXFOLSBHA', 'SOGOMI', 'RAW MATERIALS'),
(234, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SCI NEEDLE', 'SCI-N', 'FW SPA', 'RAW MATERIALS'),
(235, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SCI POWDER', 'SCI-P', 'FW SPA', 'RAW MATERIALS'),
(236, '12208', 0, 'BUTTER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SHEA BUTTER', 'A-SB', 'FW SPA', 'RAW MATERIALS'),
(237, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SKIM MILK', 'S-MILK', 'FW SPA', 'RAW MATERIALS'),
(238, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'FW SPA', 'RAW MATERIALS'),
(239, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'SOGOMI', 'RAW MATERIALS'),
(240, '22000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SODIUM CHLORIDE', 'S-CHLO', 'FW SPA', 'RAW MATERIALS'),
(241, '14000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SODIUM LACTATE', 'HARDENING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(242, '0', 0, 'GEL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Sodium Laureth Sulfate', 'SLES', 'FW SPA', 'RAW MATERIALS'),
(243, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Sodium Laureth Sulfate', 'SLS', 'MOM CARES', 'RAW MATERIALS'),
(244, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'MOM CARES', 'RAW MATERIALS'),
(245, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'FW SPA', 'RAW MATERIALS'),
(246, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SORBITOL', 'S-BL', 'FW SPA', 'RAW MATERIALS'),
(247, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SUGARCANE DISTILLATE', 'ETHYL ALCOHOL', '', 'RAW MATERIALS'),
(248, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SUNSHIELD BP4', 'S-BP4', 'SOGOMI', 'RAW MATERIALS'),
(249, '1500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TALCUM PREMIUM POWDER', 'TALC-PRM', 'SOGOMI', 'RAW MATERIALS'),
(250, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TERGITOL', 'T-GL', 'FW SPA', 'RAW MATERIALS'),
(251, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TETRASODIUM PYROPHOS', 'TS-PR', 'DALKEM', 'RAW MATERIALS'),
(252, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TONALID', 'TONALID', 'FW SPA', 'RAW MATERIALS'),
(253, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TRIETHANOLAMINE', 'E-TE', 'SOGOMI', 'RAW MATERIALS'),
(254, '0', 1000, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TWEEN POLYSORBATE 20/ POLYSORBATE 20', 'POLY-20', 'FW SPA', 'RAW MATERIALS'),
(255, '2200', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TWEEN POLYSORBATE 80/ POLYSORBATE 80', 'POLY-80', 'FW SPA', 'RAW MATERIALS'),
(256, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'VITAMIN C', 'VIT-C', 'FW SPA', 'RAW MATERIALS'),
(257, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'VITAMIN E ACETATE', 'VIT.E-ACT', '', 'RAW MATERIALS'),
(258, '585', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'VITAMIN E ADDITIVE', 'VIT. E-ADD', 'FW SPA', 'RAW MATERIALS'),
(259, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'XANTHAN GUM', 'X-GUM', 'FW SPA', 'RAW MATERIALS'),
(260, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ZINC OXIDE', 'Z-OX', 'FW SPA', 'RAW MATERIALS'),
(261, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Ac Care 1000', 'AC-1K', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(262, '21200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Acnibio Mxr', 'PR-A', 'Sogomi', 'RAW MATERIALS'),
(263, '1100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Activated Charcoal Fine', 'AC-FINE', 'Sogomi', 'RAW MATERIALS'),
(264, '65', 0, 'BEADS', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Alcogel Beads', 'AL-B', 'Fw Spa', 'RAW MATERIALS'),
(265, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Alginate', 'AL-G', 'Fw Spa', 'RAW MATERIALS'),
(266, '11920', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Allantoin', 'D-ALT', 'Sogomi', 'RAW MATERIALS'),
(267, '10000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Alluminum Choride', 'A-CHLO', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(268, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Antibac- BKC', 'AB-BKC', 'Sogomi', 'RAW MATERIALS'),
(269, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Arrow Root', 'A-ROOT', 'Green dahan', 'RAW MATERIALS'),
(270, '1800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Azeglyjic optima', '3 IN 1 WHITE', 'SOGOMI', 'RAW MATERIALS'),
(271, '275000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Baking Soda', 'A-BS', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(272, '5000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Bamboo Wood Charcoal', 'AC-CHARCOAL', 'Fw Spa', 'RAW MATERIALS'),
(273, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Beetox H', 'B-H', 'Fw Spa', 'RAW MATERIALS'),
(274, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Behentrimonium', 'B-TRI', 'Fw Spa', 'RAW MATERIALS'),
(275, '1870', 0, 'POWDER', 1534, 0, 0, 0, '2022-05-05 00:00:00', 'Bentonite', 'B-NITE', 'Fw Spa', 'RAW MATERIALS'),
(276, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Bust Up', '', 'SOGOMI', 'RAW MATERIALS'),
(277, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BUTYLENE GLYCOL 1,3', 'BC-1,3', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(278, '5800', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Butyl-Hydroxytotulene', 'BHT', 'Fw Spa', 'RAW MATERIALS'),
(279, '5500', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CALCIUM CHLORIDE', 'CAL-CHLO', 'TRUE MAN DESICANTS', 'RAW MATERIALS'),
(280, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CALCIUM SULFATE DEHYDRATE', 'CAL-SD', 'DALKEN', 'RAW MATERIALS'),
(281, '3100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CAMPHOR', 'C-PR', 'Fw Spa', 'RAW MATERIALS'),
(282, '3200', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CARBOMER 940', 'POLYMER', 'Sogomi', 'RAW MATERIALS'),
(283, '27100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CARBOPOL ULTREZ 30', 'CU-30', 'Sogomi', 'RAW MATERIALS'),
(284, '30000', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CAUSTIC SODA', 'CSP', 'CHEMI-SOURCE', 'RAW MATERIALS'),
(285, '38000', 0, 'LIQUID', 1875, 0, 0, 0, '2022-05-05 00:00:00', 'CDEA', 'F-BOOSTER1', 'SOGOMI', 'RAW MATERIALS'),
(286, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CETEARETH-20', 'CT-20', 'Fw Spa', 'RAW MATERIALS'),
(287, '17700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CHEM BETAINE APC', 'CB-APC', 'Sogomi', 'RAW MATERIALS'),
(288, '6000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CHEMCCINATE DSLSK', 'C-DSLSK', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(289, '1400', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CITRIC ACID', 'PH ADJ', 'Fw Spa', 'RAW MATERIALS'),
(290, '-2000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Sogomi', 'RAW MATERIALS'),
(291, '1000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Fw Spa', 'RAW MATERIALS'),
(292, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CMEA', 'F. BOOSTER 2', 'Fw Spa', 'RAW MATERIALS'),
(293, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'COCOAMODO BETAINE', 'CA-BT', 'Fw Spa', 'RAW MATERIALS'),
(294, '306', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'COFFEE SCRUB', 'ACTIVE-COF', 'MOM CARES', 'RAW MATERIALS'),
(295, '30', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CYCLOMETHICONE', 'CYCLO-M', 'Fw Spa', 'RAW MATERIALS'),
(296, '2100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CYCLOPENTASILOXANE', 'CYCLO-S', 'Fw Spa', 'RAW MATERIALS'),
(297, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'DECYL GLUCOSIDE', 'DEC-G', 'Fw Spa', 'RAW MATERIALS'),
(298, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'DERMA-CB', '', '', 'RAW MATERIALS'),
(299, '1900', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'DIMETHICONE', 'SILICONE-D', 'FW SPA', 'RAW MATERIALS'),
(300, '1975', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'DIMETHICONE TRIMETHYL', 'SILICONE-TRI', 'FW SPA', 'RAW MATERIALS'),
(301, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'DIMETHYLSILOXANE', 'D-SILOX', 'FW SPA', 'RAW MATERIALS'),
(302, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'DIPROPELENE GLYCOL', 'DPG', 'FW SPA', 'RAW MATERIALS'),
(303, '2700', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'EARTH-D', 'E-D', 'DALKEN', 'RAW MATERIALS'),
(304, '3000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-05 00:00:00', 'EMMULIUM DELTA', 'E-DELTA', 'KALIO-REXI', 'RAW MATERIALS'),
(305, '1000', 0, 'POWDER', 25, 0, 0, 0, '2022-05-05 00:00:00', 'ETHYLENEDIAMINE TETRAACETIC ACID', 'EDTA', 'SOGOMI', 'RAW MATERIALS'),
(306, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'FDP-C WHITE 3', 'FDP-CW3', 'EUNICE inc.', 'RAW MATERIALS'),
(307, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GAL SOFT SCI 85', 'GS-S85', '', 'RAW MATERIALS'),
(308, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GALSIK/ MIGOQUAT C30/ POLYQUATERNIUM 7/ PQ7', 'G-SILK', 'FW SPA', 'RAW MATERIALS'),
(309, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GINGER POWDER', 'GIN-P', '', 'RAW MATERIALS'),
(310, '1700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GLUCAM P-20', 'G-P20', 'CHEMCO', 'RAW MATERIALS'),
(311, '3000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GLYCERIN SOAP BASE', 'G-SB', 'FW SPA', 'RAW MATERIALS'),
(312, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GLYCERINE-MIGOSIL GLY/ LIQUID CERINE', 'MOISTURIZER', 'SOGOMI', 'RAW MATERIALS'),
(313, '0', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GLYCOLIC ACID', 'EXFOL-GAHA', 'FW SPA', 'RAW MATERIALS'),
(314, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GREEN CENTELLA', 'G-CEN', 'CHEMCO', 'RAW MATERIALS'),
(315, '930', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GUAR GUM', 'G-GUM', 'SOGOMI', 'RAW MATERIALS'),
(316, '300', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'HMC POLYMER', 'HMC-P', 'FW SPA', 'RAW MATERIALS'),
(317, '1100', 0, 'GEL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'HYAURONIC ACID GEL', 'HA-GEL', 'FW SPA', 'RAW MATERIALS'),
(318, '20', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'HYDROLIZED KERATIN', 'HYDRO-K', 'SOGOMI', 'RAW MATERIALS'),
(319, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'HYDROXY ETHYL CELLULOSE', 'HYDRO-EC', 'FW SPA', 'RAW MATERIALS'),
(320, '2500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'ISODODICANE', 'SOLVENT-ISODO', 'FW SPA', 'RAW MATERIALS'),
(321, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'ISOPROPYL MYRISTATE/ MIGOSIL IPM', 'E-IPM', 'SOGOMI', 'RAW MATERIALS'),
(322, '1790', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'KAOLIN CLAY', 'K-CLAY', 'FW SPA', 'RAW MATERIALS'),
(323, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'KOJIC ACID', 'ACTIVE-K', 'SOGOMI', 'RAW MATERIALS'),
(324, '1000', 0, 'LIQUID', 125, 0, 0, 0, '2022-05-05 00:00:00', 'LACTIC ACID', 'PH-ACID', 'SOGOMI', 'RAW MATERIALS'),
(325, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LACTIC ACID', 'PH-ACID', 'FW SPA', 'RAW MATERIALS'),
(326, '23000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LACTOMOIST', 'BUFFERING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(327, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LAURIC ACID', 'L-ACID', 'FW SPA', 'RAW MATERIALS'),
(328, '850', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LAVENDER MASK PACK', 'LAV-MASK', '', 'RAW MATERIALS'),
(329, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LUZINCI WHITE', 'TRANEXAMMIC ACID', 'SOGOMI', 'RAW MATERIALS'),
(330, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MAGNESIUM OXIDE', 'MAG-OX', 'DALKEM', 'RAW MATERIALS'),
(331, '20', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MANDELIC ACID', 'M-ACID', 'SOGOMI', 'RAW MATERIALS'),
(332, '9300', 0, 'CRYSTAL', 50, 0, 0, 0, '2022-05-05 00:00:00', 'MENTHOL CRYSTAL', 'M-CRYSTAL', 'FW SPA', 'RAW MATERIALS'),
(333, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MERQUAT 3330', 'M-3330', 'CHEMCO', 'RAW MATERIALS'),
(334, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'METHYL SALICYLATE', 'M-SALICYLATE', 'FW SPA', 'RAW MATERIALS'),
(335, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MICA W7103- B. WHITE', 'MICA WHITE', 'SOGOMI', 'RAW MATERIALS'),
(336, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MICELLAR ACID', 'MC-ACID', 'FW SPA', 'RAW MATERIALS'),
(337, '1600', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MICELLAR WATER', 'MC-H2O', 'FW SPA', 'RAW MATERIALS'),
(338, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MIGOQUAT C30/CETRIMONIUM CHLORIDE', 'MQ-C30', 'SOGOMI', 'RAW MATERIALS'),
(339, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MINERAL WATER', 'AQUA', 'ANGELOUS', 'RAW MATERIALS'),
(340, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MYRISTIC ACID', 'MR-ACID', 'FW SPA', 'RAW MATERIALS'),
(341, '3400', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'NIACINAMIDE', 'VITAMIN B3', 'FW SPA', 'RAW MATERIALS'),
(342, '1400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'OCTYL METHOXY CINNAMATE', 'SUNSHIELD OMC', 'SOGOMI', 'RAW MATERIALS'),
(343, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PANTHENOL', 'P-TH', 'FW SPA', 'RAW MATERIALS'),
(344, '100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PAPAIN CRYSTAL/PAPAIN ENZYME/ PAPAIN', 'ACTIVE-P', 'FW SPA', 'RAW MATERIALS'),
(345, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PEARL WHITE', 'P-WHITE', '', 'RAW MATERIALS'),
(346, '6500', 0, 'GEL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'FW SPA', 'RAW MATERIALS'),
(347, '8000', 0, 'GEL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'MEGAWISE', 'RAW MATERIALS'),
(348, '2085', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PHENOX ETHYL GLYCERINE', 'PR-EG', 'FW SPA', 'RAW MATERIALS'),
(349, '1985', 0, 'LIQUID', 250, 0, 0, 0, '2022-05-05 00:00:00', 'PHENOXYETHANOL', 'PR-P', 'FW SPA', 'RAW MATERIALS'),
(350, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PHM-BIGUANITE', 'PHM-B', 'MOM CARES', 'RAW MATERIALS'),
(351, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PHYTPEEL 500-APRICOT', 'PAS-500', 'FW SPA', 'RAW MATERIALS'),
(352, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'POLYVINYL ALCOHOL BP24', 'PVA-BP24', 'DALKEM', 'RAW MATERIALS'),
(353, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'POLYVINYL PYRROLYDONE K-30', 'PV-P-K30', 'DALKEM', 'RAW MATERIALS'),
(354, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'POTASIUM ALLUM POWDER', 'P-ALP', 'DALKEM', 'RAW MATERIALS'),
(355, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'POTASIUM HYDROXIDE', 'PS-HYDRO', 'FW SPA', 'RAW MATERIALS'),
(356, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'POTASIUM SORBATE', 'FG.PR-PS', '', 'RAW MATERIALS'),
(357, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PROPYLENE GLYCOL/ MIGOSIL PPG/ PROCOL', 'E/PPG', 'FW SPA', 'RAW MATERIALS'),
(358, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PUROLAN TEC', 'P-TEC', 'CHEMCO', 'RAW MATERIALS'),
(359, '4000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PUROLAN-IDD', 'P-IDD', 'CHEMCO', 'RAW MATERIALS'),
(360, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'QUICK PEARL PK3', 'QP- PK3', 'CHEMCO', 'RAW MATERIALS'),
(361, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'REJUDERM VA', 'VITAMIN A', '', 'RAW MATERIALS'),
(362, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'ROSE MARY WATER', 'ROSE-AQUA', '', 'RAW MATERIALS'),
(363, '1398', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SALICYLIC ACID', 'EXFOLSBHA', 'SOGOMI', 'RAW MATERIALS'),
(364, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SCI NEEDLE', 'SCI-N', 'FW SPA', 'RAW MATERIALS'),
(365, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SCI POWDER', 'SCI-P', 'FW SPA', 'RAW MATERIALS'),
(366, '12208', 0, 'BUTTER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SHEA BUTTER', 'A-SB', 'FW SPA', 'RAW MATERIALS'),
(367, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SKIM MILK', 'S-MILK', 'FW SPA', 'RAW MATERIALS'),
(368, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'FW SPA', 'RAW MATERIALS'),
(369, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'SOGOMI', 'RAW MATERIALS'),
(370, '22000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SODIUM CHLORIDE', 'S-CHLO', 'FW SPA', 'RAW MATERIALS'),
(371, '14000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SODIUM LACTATE', 'HARDENING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(372, '0', 0, 'GEL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Sodium Laureth Sulfate', 'SLES', 'FW SPA', 'RAW MATERIALS'),
(373, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Sodium Laureth Sulfate', 'SLS', 'MOM CARES', 'RAW MATERIALS'),
(374, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'MOM CARES', 'RAW MATERIALS'),
(375, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'FW SPA', 'RAW MATERIALS'),
(376, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SORBITOL', 'S-BL', 'FW SPA', 'RAW MATERIALS'),
(377, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SUGARCANE DISTILLATE', 'ETHYL ALCOHOL', '', 'RAW MATERIALS'),
(378, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SUNSHIELD BP4', 'S-BP4', 'SOGOMI', 'RAW MATERIALS'),
(379, '1500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TALCUM PREMIUM POWDER', 'TALC-PRM', 'SOGOMI', 'RAW MATERIALS'),
(380, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TERGITOL', 'T-GL', 'FW SPA', 'RAW MATERIALS'),
(381, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TETRASODIUM PYROPHOS', 'TS-PR', 'DALKEM', 'RAW MATERIALS'),
(382, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TONALID', 'TONALID', 'FW SPA', 'RAW MATERIALS'),
(383, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TRIETHANOLAMINE', 'E-TE', 'SOGOMI', 'RAW MATERIALS'),
(384, '1000', 0, '', 50, 0, 0, 0, '2022-05-05 00:00:00', 'TWEEN POLYSORBATE 20/ POLYSORBATE 20', 'POLY-20', 'FW SPA', 'RAW MATERIALS'),
(385, '2120', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TWEEN POLYSORBATE 80/ POLYSORBATE 80', 'POLY-80', 'FW SPA', 'RAW MATERIALS'),
(386, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'VITAMIN C', 'VIT-C', 'FW SPA', 'RAW MATERIALS'),
(387, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'VITAMIN E ACETATE', 'VIT.E-ACT', '', 'RAW MATERIALS'),
(388, '585', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'VITAMIN E ADDITIVE', 'VIT. E-ADD', 'FW SPA', 'RAW MATERIALS'),
(389, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'XANTHAN GUM', 'X-GUM', 'FW SPA', 'RAW MATERIALS'),
(390, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'ZINC OXIDE', 'Z-OX', 'FW SPA', 'RAW MATERIALS'),
(391, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Ac Care 1000', 'AC-1K', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(392, '21200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Acnibio Mxr', 'PR-A', 'Sogomi', 'RAW MATERIALS'),
(393, '1100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Activated Charcoal Fine', 'AC-FINE', 'Sogomi', 'RAW MATERIALS'),
(394, '65', 0, 'BEADS', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Alcogel Beads', 'AL-B', 'Fw Spa', 'RAW MATERIALS'),
(395, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Alginate', 'AL-G', 'Fw Spa', 'RAW MATERIALS'),
(396, '11920', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Allantoin', 'D-ALT', 'Sogomi', 'RAW MATERIALS'),
(397, '10000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Alluminum Choride', 'A-CHLO', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(398, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Antibac- BKC', 'AB-BKC', 'Sogomi', 'RAW MATERIALS'),
(399, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Arrow Root', 'A-ROOT', 'Green dahan', 'RAW MATERIALS'),
(400, '1800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Azeglyjic optima', '3 IN 1 WHITE', 'SOGOMI', 'RAW MATERIALS'),
(401, '275000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Baking Soda', 'A-BS', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(402, '5000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Bamboo Wood Charcoal', 'AC-CHARCOAL', 'Fw Spa', 'RAW MATERIALS'),
(403, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Beetox H', 'B-H', 'Fw Spa', 'RAW MATERIALS'),
(404, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Behentrimonium', 'B-TRI', 'Fw Spa', 'RAW MATERIALS'),
(405, '1870', 0, 'POWDER', 1234, 0, 0, 0, '2022-05-06 00:00:00', 'Bentonite', 'B-NITE', 'Fw Spa', 'RAW MATERIALS'),
(406, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Bust Up', '', 'SOGOMI', 'RAW MATERIALS'),
(407, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BUTYLENE GLYCOL 1,3', 'BC-1,3', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(408, '5800', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Butyl-Hydroxytotulene', 'BHT', 'Fw Spa', 'RAW MATERIALS'),
(409, '5500', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CALCIUM CHLORIDE', 'CAL-CHLO', 'TRUE MAN DESICANTS', 'RAW MATERIALS'),
(410, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CALCIUM SULFATE DEHYDRATE', 'CAL-SD', 'DALKEN', 'RAW MATERIALS'),
(411, '3100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CAMPHOR', 'C-PR', 'Fw Spa', 'RAW MATERIALS'),
(412, '3200', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CARBOMER 940', 'POLYMER', 'Sogomi', 'RAW MATERIALS'),
(413, '27100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CARBOPOL ULTREZ 30', 'CU-30', 'Sogomi', 'RAW MATERIALS'),
(414, '30000', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CAUSTIC SODA', 'CSP', 'CHEMI-SOURCE', 'RAW MATERIALS'),
(415, '36125', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CDEA', 'F-BOOSTER1', 'SOGOMI', 'RAW MATERIALS'),
(416, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CETEARETH-20', 'CT-20', 'Fw Spa', 'RAW MATERIALS'),
(417, '17700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CHEM BETAINE APC', 'CB-APC', 'Sogomi', 'RAW MATERIALS'),
(418, '6000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CHEMCCINATE DSLSK', 'C-DSLSK', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(419, '1400', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CITRIC ACID', 'PH ADJ', 'Fw Spa', 'RAW MATERIALS'),
(420, '-2000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Sogomi', 'RAW MATERIALS'),
(421, '1000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Fw Spa', 'RAW MATERIALS'),
(422, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CMEA', 'F. BOOSTER 2', 'Fw Spa', 'RAW MATERIALS'),
(423, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'COCOAMODO BETAINE', 'CA-BT', 'Fw Spa', 'RAW MATERIALS'),
(424, '306', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'COFFEE SCRUB', 'ACTIVE-COF', 'MOM CARES', 'RAW MATERIALS'),
(425, '30', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CYCLOMETHICONE', 'CYCLO-M', 'Fw Spa', 'RAW MATERIALS'),
(426, '2100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CYCLOPENTASILOXANE', 'CYCLO-S', 'Fw Spa', 'RAW MATERIALS'),
(427, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'DECYL GLUCOSIDE', 'DEC-G', 'Fw Spa', 'RAW MATERIALS'),
(428, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'DERMA-CB', '', '', 'RAW MATERIALS'),
(429, '1900', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'DIMETHICONE', 'SILICONE-D', 'FW SPA', 'RAW MATERIALS'),
(430, '1975', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'DIMETHICONE TRIMETHYL', 'SILICONE-TRI', 'FW SPA', 'RAW MATERIALS'),
(431, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'DIMETHYLSILOXANE', 'D-SILOX', 'FW SPA', 'RAW MATERIALS'),
(432, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'DIPROPELENE GLYCOL', 'DPG', 'FW SPA', 'RAW MATERIALS'),
(433, '2700', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'EARTH-D', 'E-D', 'DALKEN', 'RAW MATERIALS'),
(434, '3000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-06 00:00:00', 'EMMULIUM DELTA', 'E-DELTA', 'KALIO-REXI', 'RAW MATERIALS'),
(435, '975', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ETHYLENEDIAMINE TETRAACETIC ACID', 'EDTA', 'SOGOMI', 'RAW MATERIALS'),
(436, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'FDP-C WHITE 3', 'FDP-CW3', 'EUNICE inc.', 'RAW MATERIALS'),
(437, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GAL SOFT SCI 85', 'GS-S85', '', 'RAW MATERIALS'),
(438, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GALSIK/ MIGOQUAT C30/ POLYQUATERNIUM 7/ PQ7', 'G-SILK', 'FW SPA', 'RAW MATERIALS'),
(439, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GINGER POWDER', 'GIN-P', '', 'RAW MATERIALS'),
(440, '1700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GLUCAM P-20', 'G-P20', 'CHEMCO', 'RAW MATERIALS'),
(441, '3000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GLYCERIN SOAP BASE', 'G-SB', 'FW SPA', 'RAW MATERIALS'),
(442, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GLYCERINE-MIGOSIL GLY/ LIQUID CERINE', 'MOISTURIZER', 'SOGOMI', 'RAW MATERIALS');
INSERT INTO `tblcurrentmonth` (`itemID`, `todayCurrentVolume`, `RECEIVED_VOLUME`, `APPEARANCE`, `RELEASED_VOLUME`, `REJECT_VOLUME`, `HOLD_VOLUME`, `PROD_RETURN`, `DATE_TODAY`, `MATERIAL_NAME`, `CODE_NAME`, `SUPPLIER`, `CATEGORIES`) VALUES
(443, '0', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GLYCOLIC ACID', 'EXFOL-GAHA', 'FW SPA', 'RAW MATERIALS'),
(444, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GREEN CENTELLA', 'G-CEN', 'CHEMCO', 'RAW MATERIALS'),
(445, '930', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GUAR GUM', 'G-GUM', 'SOGOMI', 'RAW MATERIALS'),
(446, '300', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'HMC POLYMER', 'HMC-P', 'FW SPA', 'RAW MATERIALS'),
(447, '1100', 0, 'GEL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'HYAURONIC ACID GEL', 'HA-GEL', 'FW SPA', 'RAW MATERIALS'),
(448, '20', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'HYDROLIZED KERATIN', 'HYDRO-K', 'SOGOMI', 'RAW MATERIALS'),
(449, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'HYDROXY ETHYL CELLULOSE', 'HYDRO-EC', 'FW SPA', 'RAW MATERIALS'),
(450, '2500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ISODODICANE', 'SOLVENT-ISODO', 'FW SPA', 'RAW MATERIALS'),
(451, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ISOPROPYL MYRISTATE/ MIGOSIL IPM', 'E-IPM', 'SOGOMI', 'RAW MATERIALS'),
(452, '1790', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'KAOLIN CLAY', 'K-CLAY', 'FW SPA', 'RAW MATERIALS'),
(453, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'KOJIC ACID', 'ACTIVE-K', 'SOGOMI', 'RAW MATERIALS'),
(454, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LACTIC ACID', 'PH-ACID', 'SOGOMI', 'RAW MATERIALS'),
(455, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LACTIC ACID', 'PH-ACID', 'FW SPA', 'RAW MATERIALS'),
(456, '23000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LACTOMOIST', 'BUFFERING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(457, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LAURIC ACID', 'L-ACID', 'FW SPA', 'RAW MATERIALS'),
(458, '850', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LAVENDER MASK PACK', 'LAV-MASK', '', 'RAW MATERIALS'),
(459, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LUZINCI WHITE', 'TRANEXAMMIC ACID', 'SOGOMI', 'RAW MATERIALS'),
(460, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MAGNESIUM OXIDE', 'MAG-OX', 'DALKEM', 'RAW MATERIALS'),
(461, '20', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MANDELIC ACID', 'M-ACID', 'SOGOMI', 'RAW MATERIALS'),
(462, '9300', 0, 'CRYSTAL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MENTHOL CRYSTAL', 'M-CRYSTAL', 'FW SPA', 'RAW MATERIALS'),
(463, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MERQUAT 3330', 'M-3330', 'CHEMCO', 'RAW MATERIALS'),
(464, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'METHYL SALICYLATE', 'M-SALICYLATE', 'FW SPA', 'RAW MATERIALS'),
(465, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MICA W7103- B. WHITE', 'MICA WHITE', 'SOGOMI', 'RAW MATERIALS'),
(466, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MICELLAR ACID', 'MC-ACID', 'FW SPA', 'RAW MATERIALS'),
(467, '1600', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MICELLAR WATER', 'MC-H2O', 'FW SPA', 'RAW MATERIALS'),
(468, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MIGOQUAT C30/CETRIMONIUM CHLORIDE', 'MQ-C30', 'SOGOMI', 'RAW MATERIALS'),
(469, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MINERAL WATER', 'AQUA', 'ANGELOUS', 'RAW MATERIALS'),
(470, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MYRISTIC ACID', 'MR-ACID', 'FW SPA', 'RAW MATERIALS'),
(471, '3400', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'NIACINAMIDE', 'VITAMIN B3', 'FW SPA', 'RAW MATERIALS'),
(472, '1400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'OCTYL METHOXY CINNAMATE', 'SUNSHIELD OMC', 'SOGOMI', 'RAW MATERIALS'),
(473, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PANTHENOL', 'P-TH', 'FW SPA', 'RAW MATERIALS'),
(474, '100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PAPAIN CRYSTAL/PAPAIN ENZYME/ PAPAIN', 'ACTIVE-P', 'FW SPA', 'RAW MATERIALS'),
(475, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PEARL WHITE', 'P-WHITE', '', 'RAW MATERIALS'),
(476, '6500', 0, 'GEL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'FW SPA', 'RAW MATERIALS'),
(477, '8000', 0, 'GEL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'MEGAWISE', 'RAW MATERIALS'),
(478, '2085', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PHENOX ETHYL GLYCERINE', 'PR-EG', 'FW SPA', 'RAW MATERIALS'),
(479, '1735', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PHENOXYETHANOL', 'PR-P', 'FW SPA', 'RAW MATERIALS'),
(480, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PHM-BIGUANITE', 'PHM-B', 'MOM CARES', 'RAW MATERIALS'),
(481, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PHYTPEEL 500-APRICOT', 'PAS-500', 'FW SPA', 'RAW MATERIALS'),
(482, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'POLYVINYL ALCOHOL BP24', 'PVA-BP24', 'DALKEM', 'RAW MATERIALS'),
(483, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'POLYVINYL PYRROLYDONE K-30', 'PV-P-K30', 'DALKEM', 'RAW MATERIALS'),
(484, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'POTASIUM ALLUM POWDER', 'P-ALP', 'DALKEM', 'RAW MATERIALS'),
(485, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'POTASIUM HYDROXIDE', 'PS-HYDRO', 'FW SPA', 'RAW MATERIALS'),
(486, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'POTASIUM SORBATE', 'FG.PR-PS', '', 'RAW MATERIALS'),
(487, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PROPYLENE GLYCOL/ MIGOSIL PPG/ PROCOL', 'E/PPG', 'FW SPA', 'RAW MATERIALS'),
(488, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PUROLAN TEC', 'P-TEC', 'CHEMCO', 'RAW MATERIALS'),
(489, '4000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PUROLAN-IDD', 'P-IDD', 'CHEMCO', 'RAW MATERIALS'),
(490, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'QUICK PEARL PK3', 'QP- PK3', 'CHEMCO', 'RAW MATERIALS'),
(491, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'REJUDERM VA', 'VITAMIN A', '', 'RAW MATERIALS'),
(492, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ROSE MARY WATER', 'ROSE-AQUA', '', 'RAW MATERIALS'),
(493, '1398', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SALICYLIC ACID', 'EXFOLSBHA', 'SOGOMI', 'RAW MATERIALS'),
(494, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SCI NEEDLE', 'SCI-N', 'FW SPA', 'RAW MATERIALS'),
(495, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SCI POWDER', 'SCI-P', 'FW SPA', 'RAW MATERIALS'),
(496, '12208', 0, 'BUTTER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SHEA BUTTER', 'A-SB', 'FW SPA', 'RAW MATERIALS'),
(497, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SKIM MILK', 'S-MILK', 'FW SPA', 'RAW MATERIALS'),
(498, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'FW SPA', 'RAW MATERIALS'),
(499, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'SOGOMI', 'RAW MATERIALS'),
(500, '22000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SODIUM CHLORIDE', 'S-CHLO', 'FW SPA', 'RAW MATERIALS'),
(501, '14000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SODIUM LACTATE', 'HARDENING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(502, '0', 0, 'GEL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Sodium Laureth Sulfate', 'SLES', 'FW SPA', 'RAW MATERIALS'),
(503, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Sodium Laureth Sulfate', 'SLS', 'MOM CARES', 'RAW MATERIALS'),
(504, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'MOM CARES', 'RAW MATERIALS'),
(505, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'FW SPA', 'RAW MATERIALS'),
(506, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SORBITOL', 'S-BL', 'FW SPA', 'RAW MATERIALS'),
(507, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SUGARCANE DISTILLATE', 'ETHYL ALCOHOL', '', 'RAW MATERIALS'),
(508, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SUNSHIELD BP4', 'S-BP4', 'SOGOMI', 'RAW MATERIALS'),
(509, '1500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TALCUM PREMIUM POWDER', 'TALC-PRM', 'SOGOMI', 'RAW MATERIALS'),
(510, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TERGITOL', 'T-GL', 'FW SPA', 'RAW MATERIALS'),
(511, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TETRASODIUM PYROPHOS', 'TS-PR', 'DALKEM', 'RAW MATERIALS'),
(512, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TONALID', 'TONALID', 'FW SPA', 'RAW MATERIALS'),
(513, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TRIETHANOLAMINE', 'E-TE', 'SOGOMI', 'RAW MATERIALS'),
(514, '950', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TWEEN POLYSORBATE 20/ POLYSORBATE 20', 'POLY-20', 'FW SPA', 'RAW MATERIALS'),
(515, '2120', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TWEEN POLYSORBATE 80/ POLYSORBATE 80', 'POLY-80', 'FW SPA', 'RAW MATERIALS'),
(516, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'VITAMIN C', 'VIT-C', 'FW SPA', 'RAW MATERIALS'),
(517, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'VITAMIN E ACETATE', 'VIT.E-ACT', '', 'RAW MATERIALS'),
(518, '585', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'VITAMIN E ADDITIVE', 'VIT. E-ADD', 'FW SPA', 'RAW MATERIALS'),
(519, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'XANTHAN GUM', 'X-GUM', 'FW SPA', 'RAW MATERIALS'),
(520, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ZINC OXIDE', 'Z-OX', 'FW SPA', 'RAW MATERIALS'),
(521, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Ac Care 1000', 'AC-1K', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(522, '21200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Acnibio Mxr', 'PR-A', 'Sogomi', 'RAW MATERIALS'),
(523, '1100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Activated Charcoal Fine', 'AC-FINE', 'Sogomi', 'RAW MATERIALS'),
(524, '65', 0, 'BEADS', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Alcogel Beads', 'AL-B', 'Fw Spa', 'RAW MATERIALS'),
(525, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Alginate', 'AL-G', 'Fw Spa', 'RAW MATERIALS'),
(526, '11920', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Allantoin', 'D-ALT', 'Sogomi', 'RAW MATERIALS'),
(527, '10000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Alluminum Choride', 'A-CHLO', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(528, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Antibac- BKC', 'AB-BKC', 'Sogomi', 'RAW MATERIALS'),
(529, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Arrow Root', 'A-ROOT', 'Green dahan', 'RAW MATERIALS'),
(530, '1800', 0, 'LIQUID', 1800, 0, 0, 0, '2022-05-10 00:00:00', 'Azeglyjic optima', '3 IN 1 WHITE', 'SOGOMI', 'RAW MATERIALS'),
(531, '275000', 0, 'POWDER', 3000, 0, 0, 0, '2022-05-10 00:00:00', 'Baking Soda', 'A-BS', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(532, '5000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Bamboo Wood Charcoal', 'AC-CHARCOAL', 'Fw Spa', 'RAW MATERIALS'),
(533, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Beetox H', 'B-H', 'Fw Spa', 'RAW MATERIALS'),
(534, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Behentrimonium', 'B-TRI', 'Fw Spa', 'RAW MATERIALS'),
(535, '4604', 0, 'POWDER', 1234, 0, 0, 0, '2022-05-10 00:00:00', 'Bentonite', 'B-NITE', 'Fw Spa', 'RAW MATERIALS'),
(536, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Bust Up', '', 'SOGOMI', 'RAW MATERIALS'),
(537, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BUTYLENE GLYCOL 1,3', 'BC-1,3', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(538, '5800', 0, 'WHITE CRYSTALLINE SOLID', 900, 0, 0, 0, '2022-05-10 00:00:00', 'Butyl-Hydroxytotulene', 'BHT', 'Fw Spa', 'RAW MATERIALS'),
(539, '5500', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CALCIUM CHLORIDE', 'CAL-CHLO', 'TRUE MAN DESICANTS', 'RAW MATERIALS'),
(540, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CALCIUM SULFATE DEHYDRATE', 'CAL-SD', 'DALKEN', 'RAW MATERIALS'),
(541, '3100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CAMPHOR', 'C-PR', 'Fw Spa', 'RAW MATERIALS'),
(542, '3200', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CARBOMER 940', 'POLYMER', 'Sogomi', 'RAW MATERIALS'),
(543, '27100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CARBOPOL ULTREZ 30', 'CU-30', 'Sogomi', 'RAW MATERIALS'),
(544, '30000', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CAUSTIC SODA', 'CSP', 'CHEMI-SOURCE', 'RAW MATERIALS'),
(545, '36125', 0, 'LIQUID', 1875, 0, 0, 0, '2022-05-10 00:00:00', 'CDEA', 'F-BOOSTER1', 'SOGOMI', 'RAW MATERIALS'),
(546, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CETEARETH-20', 'CT-20', 'Fw Spa', 'RAW MATERIALS'),
(547, '17700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CHEM BETAINE APC', 'CB-APC', 'Sogomi', 'RAW MATERIALS'),
(548, '6000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CHEMCCINATE DSLSK', 'C-DSLSK', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(549, '1400', 0, 'WHITE CRYSTALLINE SOLID', 2450, 0, 0, 0, '2022-05-10 00:00:00', 'CITRIC ACID', 'PH ADJ', 'Fw Spa', 'RAW MATERIALS'),
(550, '-2000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Sogomi', 'RAW MATERIALS'),
(551, '1000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Fw Spa', 'RAW MATERIALS'),
(552, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CMEA', 'F. BOOSTER 2', 'Fw Spa', 'RAW MATERIALS'),
(553, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'COCOAMODO BETAINE', 'CA-BT', 'Fw Spa', 'RAW MATERIALS'),
(554, '306', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'COFFEE SCRUB', 'ACTIVE-COF', 'MOM CARES', 'RAW MATERIALS'),
(555, '30', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CYCLOMETHICONE', 'CYCLO-M', 'Fw Spa', 'RAW MATERIALS'),
(556, '2100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CYCLOPENTASILOXANE', 'CYCLO-S', 'Fw Spa', 'RAW MATERIALS'),
(557, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'DECYL GLUCOSIDE', 'DEC-G', 'Fw Spa', 'RAW MATERIALS'),
(558, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'DERMA-CB', '', '', 'RAW MATERIALS'),
(559, '1900', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'DIMETHICONE', 'SILICONE-D', 'FW SPA', 'RAW MATERIALS'),
(560, '1975', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'DIMETHICONE TRIMETHYL', 'SILICONE-TRI', 'FW SPA', 'RAW MATERIALS'),
(561, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'DIMETHYLSILOXANE', 'D-SILOX', 'FW SPA', 'RAW MATERIALS'),
(562, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'DIPROPELENE GLYCOL', 'DPG', 'FW SPA', 'RAW MATERIALS'),
(563, '2700', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'EARTH-D', 'E-D', 'DALKEN', 'RAW MATERIALS'),
(564, '3000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-10 00:00:00', 'EMMULIUM DELTA', 'E-DELTA', 'KALIO-REXI', 'RAW MATERIALS'),
(565, '975', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ETHYLENEDIAMINE TETRAACETIC ACID', 'EDTA', 'SOGOMI', 'RAW MATERIALS'),
(566, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'FDP-C WHITE 3', 'FDP-CW3', 'EUNICE inc.', 'RAW MATERIALS'),
(567, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GAL SOFT SCI 85', 'GS-S85', '', 'RAW MATERIALS'),
(568, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GALSIK/ MIGOQUAT C30/ POLYQUATERNIUM 7/ PQ7', 'G-SILK', 'FW SPA', 'RAW MATERIALS'),
(569, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GINGER POWDER', 'GIN-P', '', 'RAW MATERIALS'),
(570, '1700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GLUCAM P-20', 'G-P20', 'CHEMCO', 'RAW MATERIALS'),
(571, '3000', 0, 'SOLID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GLYCERIN SOAP BASE', 'G-SB', 'FW SPA', 'RAW MATERIALS'),
(572, '3000', 0, 'LIQUID', 3000, 0, 0, 0, '2022-05-10 00:00:00', 'GLYCERINE-MIGOSIL GLY/ LIQUID CERINE', 'MOISTURIZER', 'SOGOMI', 'RAW MATERIALS'),
(573, '0', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GLYCOLIC ACID', 'EXFOL-GAHA', 'FW SPA', 'RAW MATERIALS'),
(574, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GREEN CENTELLA', 'G-CEN', 'CHEMCO', 'RAW MATERIALS'),
(575, '930', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GUAR GUM', 'G-GUM', 'SOGOMI', 'RAW MATERIALS'),
(576, '300', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'HMC POLYMER', 'HMC-P', 'FW SPA', 'RAW MATERIALS'),
(577, '1100', 0, 'GEL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'HYAURONIC ACID GEL', 'HA-GEL', 'FW SPA', 'RAW MATERIALS'),
(578, '20', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'HYDROLIZED KERATIN', 'HYDRO-K', 'SOGOMI', 'RAW MATERIALS'),
(579, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'HYDROXY ETHYL CELLULOSE', 'HYDRO-EC', 'FW SPA', 'RAW MATERIALS'),
(580, '2500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ISODODICANE', 'SOLVENT-ISODO', 'FW SPA', 'RAW MATERIALS'),
(581, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ISOPROPYL MYRISTATE/ MIGOSIL IPM', 'E-IPM', 'SOGOMI', 'RAW MATERIALS'),
(582, '1790', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'KAOLIN CLAY', 'K-CLAY', 'FW SPA', 'RAW MATERIALS'),
(583, '500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'KOJIC ACID', 'ACTIVE-K', 'SOGOMI', 'RAW MATERIALS'),
(584, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LACTIC ACID', 'PH-ACID', 'SOGOMI', 'RAW MATERIALS'),
(585, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LACTIC ACID', 'PH-ACID', 'FW SPA', 'RAW MATERIALS'),
(586, '23000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LACTOMOIST', 'BUFFERING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(587, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LAURIC ACID', 'L-ACID', 'FW SPA', 'RAW MATERIALS'),
(588, '850', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LAVENDER MASK PACK', 'LAV-MASK', '', 'RAW MATERIALS'),
(589, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LUZINCI WHITE', 'TRANEXAMMIC ACID', 'SOGOMI', 'RAW MATERIALS'),
(590, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MAGNESIUM OXIDE', 'MAG-OX', 'DALKEM', 'RAW MATERIALS'),
(591, '20', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MANDELIC ACID', 'M-ACID', 'SOGOMI', 'RAW MATERIALS'),
(592, '9300', 0, 'CRYSTAL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MENTHOL CRYSTAL', 'M-CRYSTAL', 'FW SPA', 'RAW MATERIALS'),
(593, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MERQUAT 3330', 'M-3330', 'CHEMCO', 'RAW MATERIALS'),
(594, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'METHYL SALICYLATE', 'M-SALICYLATE', 'FW SPA', 'RAW MATERIALS'),
(595, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MICA W7103- B. WHITE', 'MICA WHITE', 'SOGOMI', 'RAW MATERIALS'),
(596, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MICELLAR ACID', 'MC-ACID', 'FW SPA', 'RAW MATERIALS'),
(597, '1600', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MICELLAR WATER', 'MC-H2O', 'FW SPA', 'RAW MATERIALS'),
(598, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MIGOQUAT C30/CETRIMONIUM CHLORIDE', 'MQ-C30', 'SOGOMI', 'RAW MATERIALS'),
(599, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MINERAL WATER', 'AQUA', 'ANGELOUS', 'RAW MATERIALS'),
(600, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MYRISTIC ACID', 'MR-ACID', 'FW SPA', 'RAW MATERIALS'),
(601, '3400', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'NIACINAMIDE', 'VITAMIN B3', 'FW SPA', 'RAW MATERIALS'),
(602, '1400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'OCTYL METHOXY CINNAMATE', 'SUNSHIELD OMC', 'SOGOMI', 'RAW MATERIALS'),
(603, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PANTHENOL', 'P-TH', 'FW SPA', 'RAW MATERIALS'),
(604, '100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PAPAIN CRYSTAL/PAPAIN ENZYME/ PAPAIN', 'ACTIVE-P', 'FW SPA', 'RAW MATERIALS'),
(605, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PEARL WHITE', 'P-WHITE', '', 'RAW MATERIALS'),
(606, '6500', 0, 'GEL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'FW SPA', 'RAW MATERIALS'),
(607, '8000', 0, 'GEL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PETROLEUM JELLY', 'LUBRICANT', 'MEGAWISE', 'RAW MATERIALS'),
(608, '2085', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PHENOX ETHYL GLYCERINE', 'PR-EG', 'FW SPA', 'RAW MATERIALS'),
(609, '1735', 0, 'LIQUID', 1735, 0, 0, 0, '2022-05-10 00:00:00', 'PHENOXYETHANOL', 'PR-P', 'FW SPA', 'RAW MATERIALS'),
(610, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PHM-BIGUANITE', 'PHM-B', 'MOM CARES', 'RAW MATERIALS'),
(611, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PHYTPEEL 500-APRICOT', 'PAS-500', 'FW SPA', 'RAW MATERIALS'),
(612, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'POLYVINYL ALCOHOL BP24', 'PVA-BP24', 'DALKEM', 'RAW MATERIALS'),
(613, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'POLYVINYL PYRROLYDONE K-30', 'PV-P-K30', 'DALKEM', 'RAW MATERIALS'),
(614, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'POTASIUM ALLUM POWDER', 'P-ALP', 'DALKEM', 'RAW MATERIALS'),
(615, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'POTASIUM HYDROXIDE', 'PS-HYDRO', 'FW SPA', 'RAW MATERIALS'),
(616, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'POTASIUM SORBATE', 'FG.PR-PS', '', 'RAW MATERIALS'),
(617, '1100', 0, 'LIQUID', 1100, 0, 0, 0, '2022-05-10 00:00:00', 'PROPYLENE GLYCOL/ MIGOSIL PPG/ PROCOL', 'E/PPG', 'FW SPA', 'RAW MATERIALS'),
(618, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PUROLAN TEC', 'P-TEC', 'CHEMCO', 'RAW MATERIALS'),
(619, '4000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PUROLAN-IDD', 'P-IDD', 'CHEMCO', 'RAW MATERIALS'),
(620, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'QUICK PEARL PK3', 'QP- PK3', 'CHEMCO', 'RAW MATERIALS'),
(621, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'REJUDERM VA', 'VITAMIN A', '', 'RAW MATERIALS'),
(622, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ROSE MARY WATER', 'ROSE-AQUA', '', 'RAW MATERIALS'),
(623, '1398', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SALICYLIC ACID', 'EXFOLSBHA', 'SOGOMI', 'RAW MATERIALS'),
(624, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SCI NEEDLE', 'SCI-N', 'FW SPA', 'RAW MATERIALS'),
(625, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SCI POWDER', 'SCI-P', 'FW SPA', 'RAW MATERIALS'),
(626, '12208', 0, 'BUTTER', 600, 0, 0, 0, '2022-05-10 00:00:00', 'SHEA BUTTER', 'A-SB', 'FW SPA', 'RAW MATERIALS'),
(627, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SKIM MILK', 'S-MILK', 'FW SPA', 'RAW MATERIALS'),
(628, '1000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'FW SPA', 'RAW MATERIALS'),
(629, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SODIUM BENZOATE', 'FG.PR-SB', 'SOGOMI', 'RAW MATERIALS'),
(630, '22000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SODIUM CHLORIDE', 'S-CHLO', 'FW SPA', 'RAW MATERIALS'),
(631, '14000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SODIUM LACTATE', 'HARDENING AGENT', 'SOGOMI', 'RAW MATERIALS'),
(632, '0', 0, 'GEL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Sodium Laureth Sulfate', 'SLES', 'FW SPA', 'RAW MATERIALS'),
(633, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Sodium Laureth Sulfate', 'SLS', 'MOM CARES', 'RAW MATERIALS'),
(634, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'MOM CARES', 'RAW MATERIALS'),
(635, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SODIUM LAUROY SARCO', 'SLSA', 'FW SPA', 'RAW MATERIALS'),
(636, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SORBITOL', 'S-BL', 'FW SPA', 'RAW MATERIALS'),
(637, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SUGARCANE DISTILLATE', 'ETHYL ALCOHOL', '', 'RAW MATERIALS'),
(638, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SUNSHIELD BP4', 'S-BP4', 'SOGOMI', 'RAW MATERIALS'),
(639, '1500', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TALCUM PREMIUM POWDER', 'TALC-PRM', 'SOGOMI', 'RAW MATERIALS'),
(640, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TERGITOL', 'T-GL', 'FW SPA', 'RAW MATERIALS'),
(641, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TETRASODIUM PYROPHOS', 'TS-PR', 'DALKEM', 'RAW MATERIALS'),
(642, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TONALID', 'TONALID', 'FW SPA', 'RAW MATERIALS'),
(643, '8500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TRIETHANOLAMINE', 'E-TE', 'SOGOMI', 'RAW MATERIALS'),
(644, '950', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TWEEN POLYSORBATE 20/ POLYSORBATE 20', 'POLY-20', 'FW SPA', 'RAW MATERIALS'),
(645, '2120', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TWEEN POLYSORBATE 80/ POLYSORBATE 80', 'POLY-80', 'FW SPA', 'RAW MATERIALS'),
(646, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'VITAMIN C', 'VIT-C', 'FW SPA', 'RAW MATERIALS'),
(647, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'VITAMIN E ACETATE', 'VIT.E-ACT', '', 'RAW MATERIALS'),
(648, '585', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'VITAMIN E ADDITIVE', 'VIT. E-ADD', 'FW SPA', 'RAW MATERIALS'),
(649, '2000', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'XANTHAN GUM', 'X-GUM', 'FW SPA', 'RAW MATERIALS'),
(650, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ZINC OXIDE', 'Z-OX', 'FW SPA', 'RAW MATERIALS'),
(651, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CARNAUVA WAX', 'WAX-CAR', '', 'WAXES'),
(652, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CETO STEARYL ALCOHOL', 'WAX-CSA', 'Sogomi', 'WAXES'),
(653, '84000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CETYL ALCOHOL-BEADS', 'WAX-CA', 'Sogomi', 'WAXES'),
(654, '655', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CETYL ALCOHOL FLAKES', 'WAX-CA', 'Sogomi', 'WAXES'),
(655, '0', 0, 'BEADS', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CETYL STEARYL', 'WAX-CS', 'Sogomi', 'WAXES'),
(656, '21469', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CRYSTAL WAX', 'WAX-CRYSTAL', 'FW SPA', 'WAXES'),
(657, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GLYCOL DISTEARATE', 'WAX-GDS', 'Sogomi', 'WAXES'),
(658, '21880', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GLYCOL MONOSTEARATE', 'WAX-GMS', 'Sogomi', 'WAXES'),
(659, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MIGOWAX HONEY', 'BEES-WAS', 'FW SPA', 'WAXES'),
(660, '4000', 0, 'GRANULES', 0, 0, 0, 0, '2022-05-03 00:00:00', 'STEARIC ACID', 'WAX-SA', 'FW SPA', 'WAXES'),
(661, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SOYA WAX', 'WAS-SOY', '', 'WAXES'),
(662, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CARNAUVA WAX', 'WAX-CAR', '', 'WAXES'),
(663, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CETO STEARYL ALCOHOL', 'WAX-CSA', 'Sogomi', 'WAXES'),
(664, '84000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CETYL ALCOHOL-BEADS', 'WAX-CA', 'Sogomi', 'WAXES'),
(665, '655', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CETYL ALCOHOL FLAKES', 'WAX-CA', 'Sogomi', 'WAXES'),
(666, '0', 0, 'BEADS', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CETYL STEARYL', 'WAX-CS', 'Sogomi', 'WAXES'),
(667, '21469', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CRYSTAL WAX', 'WAX-CRYSTAL', 'FW SPA', 'WAXES'),
(668, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GLYCOL DISTEARATE', 'WAX-GDS', 'Sogomi', 'WAXES'),
(669, '21880', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GLYCOL MONOSTEARATE', 'WAX-GMS', 'Sogomi', 'WAXES'),
(670, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MIGOWAX HONEY', 'BEES-WAS', 'FW SPA', 'WAXES'),
(671, '4000', 0, 'GRANULES', 0, 0, 0, 0, '2022-05-04 00:00:00', 'STEARIC ACID', 'WAX-SA', 'FW SPA', 'WAXES'),
(672, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SOYA WAX', 'WAS-SOY', '', 'WAXES'),
(673, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CARNAUVA WAX', 'WAX-CAR', '', 'WAXES'),
(674, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CETO STEARYL ALCOHOL', 'WAX-CSA', 'Sogomi', 'WAXES'),
(675, '84000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CETYL ALCOHOL-BEADS', 'WAX-CA', 'Sogomi', 'WAXES'),
(676, '655', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CETYL ALCOHOL FLAKES', 'WAX-CA', 'Sogomi', 'WAXES'),
(677, '0', 0, 'BEADS', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CETYL STEARYL', 'WAX-CS', 'Sogomi', 'WAXES'),
(678, '21469', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CRYSTAL WAX', 'WAX-CRYSTAL', 'FW SPA', 'WAXES'),
(679, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GLYCOL DISTEARATE', 'WAX-GDS', 'Sogomi', 'WAXES'),
(680, '21880', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GLYCOL MONOSTEARATE', 'WAX-GMS', 'Sogomi', 'WAXES'),
(681, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MIGOWAX HONEY', 'BEES-WAS', 'FW SPA', 'WAXES'),
(682, '4000', 0, 'GRANULES', 0, 0, 0, 0, '2022-05-05 00:00:00', 'STEARIC ACID', 'WAX-SA', 'FW SPA', 'WAXES'),
(683, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SOYA WAX', 'WAS-SOY', '', 'WAXES'),
(684, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CARNAUVA WAX', 'WAX-CAR', '', 'WAXES'),
(685, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CETO STEARYL ALCOHOL', 'WAX-CSA', 'Sogomi', 'WAXES'),
(686, '84000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CETYL ALCOHOL-BEADS', 'WAX-CA', 'Sogomi', 'WAXES'),
(687, '655', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CETYL ALCOHOL FLAKES', 'WAX-CA', 'Sogomi', 'WAXES'),
(688, '0', 0, 'BEADS', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CETYL STEARYL', 'WAX-CS', 'Sogomi', 'WAXES'),
(689, '21469', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CRYSTAL WAX', 'WAX-CRYSTAL', 'FW SPA', 'WAXES'),
(690, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GLYCOL DISTEARATE', 'WAX-GDS', 'Sogomi', 'WAXES'),
(691, '21880', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GLYCOL MONOSTEARATE', 'WAX-GMS', 'Sogomi', 'WAXES'),
(692, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MIGOWAX HONEY', 'BEES-WAS', 'FW SPA', 'WAXES'),
(693, '4000', 0, 'GRANULES', 0, 0, 0, 0, '2022-05-06 00:00:00', 'STEARIC ACID', 'WAX-SA', 'FW SPA', 'WAXES'),
(694, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SOYA WAX', 'WAS-SOY', '', 'WAXES'),
(695, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CARNAUVA WAX', 'WAX-CAR', '', 'WAXES'),
(696, '1000', 0, 'BEADS', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CETO STEARYL ALCOHOL', 'WAX-CSA', 'Sogomi', 'WAXES'),
(697, '84000', 0, 'BEADS', 4500, 0, 0, 0, '2022-05-10 00:00:00', 'CETYL ALCOHOL-BEADS', 'WAX-CA', 'Sogomi', 'WAXES'),
(698, '655', 0, 'FLAKES', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CETYL ALCOHOL FLAKES', 'WAX-CA', 'Sogomi', 'WAXES'),
(699, '0', 0, 'BEADS', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CETYL STEARYL', 'WAX-CS', 'Sogomi', 'WAXES'),
(700, '21469', 0, 'WHITE CRYSTALLINE SOLID', 18000, 0, 0, 0, '2022-05-10 00:00:00', 'CRYSTAL WAX', 'WAX-CRYSTAL', 'FW SPA', 'WAXES'),
(701, '1000', 0, 'BEADS', 1000, 0, 0, 0, '2022-05-10 00:00:00', 'GLYCOL DISTEARATE', 'WAX-GDS', 'Sogomi', 'WAXES'),
(702, '21880', 0, 'POWDER', 21880, 0, 0, 0, '2022-05-10 00:00:00', 'GLYCOL MONOSTEARATE', 'WAX-GMS', 'Sogomi', 'WAXES'),
(703, '800', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MIGOWAX HONEY', 'BEES-WAS', 'FW SPA', 'WAXES'),
(704, '4000', 0, 'GRANULES', 0, 0, 0, 0, '2022-05-10 00:00:00', 'STEARIC ACID', 'WAX-SA', 'FW SPA', 'WAXES'),
(705, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SOYA WAX', 'WAS-SOY', '', 'WAXES'),
(706, '700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ALOE VERA EXTRACT', 'EXTRACT AV', 'SOGOMI', 'EXTRACT'),
(707, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BEARBERRY EXTRACT', 'EXTRACT BB', 'SOAP CENTRAL', 'EXTRACT'),
(708, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CALAMANSI EXTRACT', 'EXTRACT CM', 'SOAP CENTRAL', 'EXTRACT'),
(709, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CARROT EXTRACT', 'EXTRACT CR', 'SOGOMI', 'EXTRACT'),
(710, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CENTELLA ASIATICA EXTRACT', 'EXTRACT C.A', 'SOGOMI', 'EXTRACT'),
(711, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CHAMOMILE EXTRACT', 'EXTRACT CH', 'FW SPA', 'EXTRACT'),
(712, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CUCUMBER EXTRACT', 'EXTRACT C', '', 'EXTRACT'),
(713, '8000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GREEN TEA EXTRACT', 'EXTRACT GT', 'SOGOMI', 'EXTRACT'),
(714, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GUAVA LEAF EXTRACT', 'EXTRACT LF', 'SOGOMI', 'EXTRACT'),
(715, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LAVENDER EXTRACT', 'EXTRACT LE', 'FW SPA', 'EXTRACT'),
(716, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LICORICE EXTRACT', 'EXTRACT LC', '', 'EXTRACT'),
(717, '1500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MORINGA EXTRACT', 'EXTRACT M', 'SOAP CENTRAL', 'EXTRACT'),
(718, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PAPYA EXTRACT', 'EXTRACT PP', '', 'EXTRACT'),
(719, '800', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ROSE MARY EXTRACT', 'EXTRACT RM', 'FW SPA', 'EXTRACT'),
(720, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SNAIL FILTRATE EXTRACT', 'EXTRACT SF', 'SOGOMI', 'EXTRACT'),
(721, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SNAIL MUCIN EXTRACT', 'EXTRACT SM', 'FW SPA', 'EXTRACT'),
(722, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TEA TREE EXTRACT', 'EXTRACT TT', 'FW SPA', 'EXTRACT'),
(723, '150', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TOMATO EXTRACT', 'EXTRACT TT', 'SOGOMI', 'EXTRACT'),
(724, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'WITCH HAZEL EXTRACT', 'EXTRACT WH', 'SOGOMI', 'EXTRACT'),
(725, '700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ALOE VERA EXTRACT', 'EXTRACT AV', 'SOGOMI', 'EXTRACT'),
(726, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BEARBERRY EXTRACT', 'EXTRACT BB', 'SOAP CENTRAL', 'EXTRACT'),
(727, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CALAMANSI EXTRACT', 'EXTRACT CM', 'SOAP CENTRAL', 'EXTRACT'),
(728, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CARROT EXTRACT', 'EXTRACT CR', 'SOGOMI', 'EXTRACT'),
(729, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CENTELLA ASIATICA EXTRACT', 'EXTRACT C.A', 'SOGOMI', 'EXTRACT'),
(730, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CHAMOMILE EXTRACT', 'EXTRACT CH', 'FW SPA', 'EXTRACT'),
(731, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CUCUMBER EXTRACT', 'EXTRACT C', '', 'EXTRACT'),
(732, '8000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GREEN TEA EXTRACT', 'EXTRACT GT', 'SOGOMI', 'EXTRACT'),
(733, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GUAVA LEAF EXTRACT', 'EXTRACT LF', 'SOGOMI', 'EXTRACT'),
(734, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LAVENDER EXTRACT', 'EXTRACT LE', 'FW SPA', 'EXTRACT'),
(735, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LICORICE EXTRACT', 'EXTRACT LC', '', 'EXTRACT'),
(736, '1500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MORINGA EXTRACT', 'EXTRACT M', 'SOAP CENTRAL', 'EXTRACT'),
(737, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PAPYA EXTRACT', 'EXTRACT PP', '', 'EXTRACT'),
(738, '800', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ROSE MARY EXTRACT', 'EXTRACT RM', 'FW SPA', 'EXTRACT'),
(739, '0', 1000, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SNAIL FILTRATE EXTRACT', 'EXTRACT SF', 'SOGOMI', 'EXTRACT'),
(740, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SNAIL MUCIN EXTRACT', 'EXTRACT SM', 'FW SPA', 'EXTRACT'),
(741, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TEA TREE EXTRACT', 'EXTRACT TT', 'FW SPA', 'EXTRACT'),
(742, '150', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TOMATO EXTRACT', 'EXTRACT TT', 'SOGOMI', 'EXTRACT'),
(743, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'WITCH HAZEL EXTRACT', 'EXTRACT WH', 'SOGOMI', 'EXTRACT'),
(744, '700', 0, 'LIQUID', 100, 0, 0, 0, '2022-05-05 00:00:00', 'ALOE VERA EXTRACT', 'EXTRACT AV', 'SOGOMI', 'EXTRACT'),
(745, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BEARBERRY EXTRACT', 'EXTRACT BB', 'SOAP CENTRAL', 'EXTRACT'),
(746, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CALAMANSI EXTRACT', 'EXTRACT CM', 'SOAP CENTRAL', 'EXTRACT'),
(747, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CARROT EXTRACT', 'EXTRACT CR', 'SOGOMI', 'EXTRACT'),
(748, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CENTELLA ASIATICA EXTRACT', 'EXTRACT C.A', 'SOGOMI', 'EXTRACT'),
(749, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CHAMOMILE EXTRACT', 'EXTRACT CH', 'FW SPA', 'EXTRACT'),
(750, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CUCUMBER EXTRACT', 'EXTRACT C', '', 'EXTRACT'),
(751, '8000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GREEN TEA EXTRACT', 'EXTRACT GT', 'SOGOMI', 'EXTRACT'),
(752, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GUAVA LEAF EXTRACT', 'EXTRACT LF', 'SOGOMI', 'EXTRACT'),
(753, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LAVENDER EXTRACT', 'EXTRACT LE', 'FW SPA', 'EXTRACT'),
(754, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LICORICE EXTRACT', 'EXTRACT LC', '', 'EXTRACT'),
(755, '1500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MORINGA EXTRACT', 'EXTRACT M', 'SOAP CENTRAL', 'EXTRACT'),
(756, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PAPYA EXTRACT', 'EXTRACT PP', '', 'EXTRACT'),
(757, '800', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'ROSE MARY EXTRACT', 'EXTRACT RM', 'FW SPA', 'EXTRACT'),
(758, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SNAIL FILTRATE EXTRACT', 'EXTRACT SF', 'SOGOMI', 'EXTRACT'),
(759, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SNAIL MUCIN EXTRACT', 'EXTRACT SM', 'FW SPA', 'EXTRACT'),
(760, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TEA TREE EXTRACT', 'EXTRACT TT', 'FW SPA', 'EXTRACT'),
(761, '150', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TOMATO EXTRACT', 'EXTRACT TT', 'SOGOMI', 'EXTRACT'),
(762, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'WITCH HAZEL EXTRACT', 'EXTRACT WH', 'SOGOMI', 'EXTRACT'),
(763, '700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ALOE VERA EXTRACT', 'EXTRACT AV', 'SOGOMI', 'EXTRACT'),
(764, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BEARBERRY EXTRACT', 'EXTRACT BB', 'SOAP CENTRAL', 'EXTRACT'),
(765, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CALAMANSI EXTRACT', 'EXTRACT CM', 'SOAP CENTRAL', 'EXTRACT'),
(766, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CARROT EXTRACT', 'EXTRACT CR', 'SOGOMI', 'EXTRACT'),
(767, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CENTELLA ASIATICA EXTRACT', 'EXTRACT C.A', 'SOGOMI', 'EXTRACT'),
(768, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CHAMOMILE EXTRACT', 'EXTRACT CH', 'FW SPA', 'EXTRACT'),
(769, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CUCUMBER EXTRACT', 'EXTRACT C', '', 'EXTRACT'),
(770, '8000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GREEN TEA EXTRACT', 'EXTRACT GT', 'SOGOMI', 'EXTRACT'),
(771, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GUAVA LEAF EXTRACT', 'EXTRACT LF', 'SOGOMI', 'EXTRACT'),
(772, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LAVENDER EXTRACT', 'EXTRACT LE', 'FW SPA', 'EXTRACT'),
(773, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LICORICE EXTRACT', 'EXTRACT LC', '', 'EXTRACT'),
(774, '1500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MORINGA EXTRACT', 'EXTRACT M', 'SOAP CENTRAL', 'EXTRACT'),
(775, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PAPYA EXTRACT', 'EXTRACT PP', '', 'EXTRACT'),
(776, '800', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ROSE MARY EXTRACT', 'EXTRACT RM', 'FW SPA', 'EXTRACT'),
(777, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SNAIL FILTRATE EXTRACT', 'EXTRACT SF', 'SOGOMI', 'EXTRACT'),
(778, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SNAIL MUCIN EXTRACT', 'EXTRACT SM', 'FW SPA', 'EXTRACT'),
(779, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TEA TREE EXTRACT', 'EXTRACT TT', 'FW SPA', 'EXTRACT'),
(780, '150', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TOMATO EXTRACT', 'EXTRACT TT', 'SOGOMI', 'EXTRACT'),
(781, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'WITCH HAZEL EXTRACT', 'EXTRACT WH', 'SOGOMI', 'EXTRACT'),
(782, '600', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ALOE VERA EXTRACT', 'EXTRACT AV', 'SOGOMI', 'EXTRACT'),
(783, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BEARBERRY EXTRACT', 'EXTRACT BB', 'SOAP CENTRAL', 'EXTRACT'),
(784, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CALAMANSI EXTRACT', 'EXTRACT CM', 'SOAP CENTRAL', 'EXTRACT'),
(785, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CARROT EXTRACT', 'EXTRACT CR', 'SOGOMI', 'EXTRACT'),
(786, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CENTELLA ASIATICA EXTRACT', 'EXTRACT C.A', 'SOGOMI', 'EXTRACT'),
(787, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CHAMOMILE EXTRACT', 'EXTRACT CH', 'FW SPA', 'EXTRACT'),
(788, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CUCUMBER EXTRACT', 'EXTRACT C', '', 'EXTRACT'),
(789, '8000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GREEN TEA EXTRACT', 'EXTRACT GT', 'SOGOMI', 'EXTRACT'),
(790, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GUAVA LEAF EXTRACT', 'EXTRACT LF', 'SOGOMI', 'EXTRACT'),
(791, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LAVENDER EXTRACT', 'EXTRACT LE', 'FW SPA', 'EXTRACT'),
(792, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LICORICE EXTRACT', 'EXTRACT LC', '', 'EXTRACT'),
(793, '1500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MORINGA EXTRACT', 'EXTRACT M', 'SOAP CENTRAL', 'EXTRACT'),
(794, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PAPYA EXTRACT', 'EXTRACT PP', '', 'EXTRACT'),
(795, '800', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ROSE MARY EXTRACT', 'EXTRACT RM', 'FW SPA', 'EXTRACT'),
(796, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SNAIL FILTRATE EXTRACT', 'EXTRACT SF', 'SOGOMI', 'EXTRACT'),
(797, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SNAIL MUCIN EXTRACT', 'EXTRACT SM', 'FW SPA', 'EXTRACT'),
(798, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TEA TREE EXTRACT', 'EXTRACT TT', 'FW SPA', 'EXTRACT'),
(799, '150', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TOMATO EXTRACT', 'EXTRACT TT', 'SOGOMI', 'EXTRACT'),
(800, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'WITCH HAZEL EXTRACT', 'EXTRACT WH', 'SOGOMI', 'EXTRACT'),
(801, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BLACK COLORANT- FERNA', '', '', 'FOOD COLORANT'),
(802, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Black F. Colorant – Ferna', 'FC-BF', '', 'FOOD COLORANT'),
(803, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Black F. Colorant – G.L', 'FC-BGL', '', 'FOOD COLORANT'),
(804, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BLUE Colorant', '', '', 'FOOD COLORANT'),
(805, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Blue F. Colorant - Ferna', 'FC-BLF', '', 'FOOD COLORANT'),
(806, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Blue F. Colorant – G.L', 'FC-BLGL', '', 'FOOD COLORANT'),
(807, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Brown F. Colorant – Ferna', 'FC-BRF', '', 'FOOD COLORANT'),
(808, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Brown F. Colorant – G.L', 'FC-BRGL', '', 'FOOD COLORANT'),
(809, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Cotton Candy – G. Leaves', 'FLV-O', '', 'FOOD COLORANT'),
(810, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Green F. Colorant – Ferna', 'FC-GF', '', 'FOOD COLORANT'),
(811, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Green F. Colorant – G.L', 'FC-GGL', '', 'FOOD COLORANT'),
(812, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Green Food Color', '', '', 'FOOD COLORANT'),
(813, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Orange F. Colorant – Ferna', 'FC-OGL', '', 'FOOD COLORANT'),
(814, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Orange F. Colorant – G.L', 'FC-OGL', '', 'FOOD COLORANT'),
(815, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Pink F. Colorant – Ferna', 'FC-PF', '', 'FOOD COLORANT'),
(816, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Pink F. Colorant – G.L', 'FC-PGL', '', 'FOOD COLORANT'),
(817, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Red F. Colorant – Ferna', 'FC-RF', '', 'FOOD COLORANT'),
(818, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Red F. Colorant – G.L', 'FC-RGL', '', 'FOOD COLORANT'),
(819, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Violet F. Colorant – Ferna', 'FC-VF', '', 'FOOD COLORANT'),
(820, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Violet F. Colorant – G.L', 'FC-VGL', '', 'FOOD COLORANT'),
(821, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Yellow F. Colorant – Ferna', 'FC-YF', '', 'FOOD COLORANT'),
(822, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Yellow F. Colorant – G.L', 'FC-YGL', '', 'FOOD COLORANT'),
(823, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BLACK COLORANT- FERNA', '', '', 'FOOD COLORANT'),
(824, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Black F. Colorant – Ferna', 'FC-BF', '', 'FOOD COLORANT'),
(825, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Black F. Colorant – G.L', 'FC-BGL', '', 'FOOD COLORANT'),
(826, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BLUE Colorant', '', '', 'FOOD COLORANT'),
(827, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Blue F. Colorant - Ferna', 'FC-BLF', '', 'FOOD COLORANT'),
(828, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Blue F. Colorant – G.L', 'FC-BLGL', '', 'FOOD COLORANT'),
(829, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Brown F. Colorant – Ferna', 'FC-BRF', '', 'FOOD COLORANT'),
(830, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Brown F. Colorant – G.L', 'FC-BRGL', '', 'FOOD COLORANT'),
(831, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Cotton Candy – G. Leaves', 'FLV-O', '', 'FOOD COLORANT'),
(832, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Green F. Colorant – Ferna', 'FC-GF', '', 'FOOD COLORANT'),
(833, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Green F. Colorant – G.L', 'FC-GGL', '', 'FOOD COLORANT'),
(834, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Green Food Color', '', '', 'FOOD COLORANT'),
(835, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Orange F. Colorant – Ferna', 'FC-OGL', '', 'FOOD COLORANT'),
(836, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Orange F. Colorant – G.L', 'FC-OGL', '', 'FOOD COLORANT'),
(837, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Pink F. Colorant – Ferna', 'FC-PF', '', 'FOOD COLORANT'),
(838, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Pink F. Colorant – G.L', 'FC-PGL', '', 'FOOD COLORANT'),
(839, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Red F. Colorant – Ferna', 'FC-RF', '', 'FOOD COLORANT'),
(840, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Red F. Colorant – G.L', 'FC-RGL', '', 'FOOD COLORANT'),
(841, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Violet F. Colorant – Ferna', 'FC-VF', '', 'FOOD COLORANT'),
(842, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Violet F. Colorant – G.L', 'FC-VGL', '', 'FOOD COLORANT'),
(843, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Yellow F. Colorant – Ferna', 'FC-YF', '', 'FOOD COLORANT'),
(844, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Yellow F. Colorant – G.L', 'FC-YGL', '', 'FOOD COLORANT'),
(845, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BLACK COLORANT- FERNA', '', '', 'FOOD COLORANT'),
(846, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Black F. Colorant – Ferna', 'FC-BF', '', 'FOOD COLORANT'),
(847, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Black F. Colorant – G.L', 'FC-BGL', '', 'FOOD COLORANT'),
(848, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BLUE Colorant', '', '', 'FOOD COLORANT'),
(849, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Blue F. Colorant - Ferna', 'FC-BLF', '', 'FOOD COLORANT'),
(850, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Blue F. Colorant – G.L', 'FC-BLGL', '', 'FOOD COLORANT'),
(851, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Brown F. Colorant – Ferna', 'FC-BRF', '', 'FOOD COLORANT'),
(852, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Brown F. Colorant – G.L', 'FC-BRGL', '', 'FOOD COLORANT'),
(853, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Cotton Candy – G. Leaves', 'FLV-O', '', 'FOOD COLORANT'),
(854, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Green F. Colorant – Ferna', 'FC-GF', '', 'FOOD COLORANT'),
(855, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Green F. Colorant – G.L', 'FC-GGL', '', 'FOOD COLORANT'),
(856, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Green Food Color', '', '', 'FOOD COLORANT'),
(857, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Orange F. Colorant – Ferna', 'FC-OGL', '', 'FOOD COLORANT'),
(858, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Orange F. Colorant – G.L', 'FC-OGL', '', 'FOOD COLORANT'),
(859, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Pink F. Colorant – Ferna', 'FC-PF', '', 'FOOD COLORANT'),
(860, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Pink F. Colorant – G.L', 'FC-PGL', '', 'FOOD COLORANT'),
(861, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Red F. Colorant – Ferna', 'FC-RF', '', 'FOOD COLORANT'),
(862, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Red F. Colorant – G.L', 'FC-RGL', '', 'FOOD COLORANT'),
(863, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Violet F. Colorant – Ferna', 'FC-VF', '', 'FOOD COLORANT'),
(864, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Violet F. Colorant – G.L', 'FC-VGL', '', 'FOOD COLORANT'),
(865, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Yellow F. Colorant – Ferna', 'FC-YF', '', 'FOOD COLORANT'),
(866, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Yellow F. Colorant – G.L', 'FC-YGL', '', 'FOOD COLORANT'),
(867, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BLACK COLORANT- FERNA', '', '', 'FOOD COLORANT'),
(868, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Black F. Colorant – Ferna', 'FC-BF', '', 'FOOD COLORANT'),
(869, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Black F. Colorant – G.L', 'FC-BGL', '', 'FOOD COLORANT'),
(870, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BLUE Colorant', '', '', 'FOOD COLORANT'),
(871, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Blue F. Colorant - Ferna', 'FC-BLF', '', 'FOOD COLORANT'),
(872, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Blue F. Colorant – G.L', 'FC-BLGL', '', 'FOOD COLORANT');
INSERT INTO `tblcurrentmonth` (`itemID`, `todayCurrentVolume`, `RECEIVED_VOLUME`, `APPEARANCE`, `RELEASED_VOLUME`, `REJECT_VOLUME`, `HOLD_VOLUME`, `PROD_RETURN`, `DATE_TODAY`, `MATERIAL_NAME`, `CODE_NAME`, `SUPPLIER`, `CATEGORIES`) VALUES
(873, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Brown F. Colorant – Ferna', 'FC-BRF', '', 'FOOD COLORANT'),
(874, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Brown F. Colorant – G.L', 'FC-BRGL', '', 'FOOD COLORANT'),
(875, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Cotton Candy – G. Leaves', 'FLV-O', '', 'FOOD COLORANT'),
(876, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Green F. Colorant – Ferna', 'FC-GF', '', 'FOOD COLORANT'),
(877, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Green F. Colorant – G.L', 'FC-GGL', '', 'FOOD COLORANT'),
(878, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Green Food Color', '', '', 'FOOD COLORANT'),
(879, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Orange F. Colorant – Ferna', 'FC-OGL', '', 'FOOD COLORANT'),
(880, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Orange F. Colorant – G.L', 'FC-OGL', '', 'FOOD COLORANT'),
(881, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Pink F. Colorant – Ferna', 'FC-PF', '', 'FOOD COLORANT'),
(882, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Pink F. Colorant – G.L', 'FC-PGL', '', 'FOOD COLORANT'),
(883, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Red F. Colorant – Ferna', 'FC-RF', '', 'FOOD COLORANT'),
(884, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Red F. Colorant – G.L', 'FC-RGL', '', 'FOOD COLORANT'),
(885, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Violet F. Colorant – Ferna', 'FC-VF', '', 'FOOD COLORANT'),
(886, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Violet F. Colorant – G.L', 'FC-VGL', '', 'FOOD COLORANT'),
(887, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Yellow F. Colorant – Ferna', 'FC-YF', '', 'FOOD COLORANT'),
(888, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Yellow F. Colorant – G.L', 'FC-YGL', '', 'FOOD COLORANT'),
(889, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BLACK COLORANT- FERNA', '', '', 'FOOD COLORANT'),
(890, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Black F. Colorant – Ferna', 'FC-BF', '', 'FOOD COLORANT'),
(891, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Black F. Colorant – G.L', 'FC-BGL', '', 'FOOD COLORANT'),
(892, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BLUE Colorant', '', '', 'FOOD COLORANT'),
(893, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Blue F. Colorant - Ferna', 'FC-BLF', '', 'FOOD COLORANT'),
(894, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Blue F. Colorant – G.L', 'FC-BLGL', '', 'FOOD COLORANT'),
(895, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Brown F. Colorant – Ferna', 'FC-BRF', '', 'FOOD COLORANT'),
(896, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Brown F. Colorant – G.L', 'FC-BRGL', '', 'FOOD COLORANT'),
(897, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Cotton Candy – G. Leaves', 'FLV-O', '', 'FOOD COLORANT'),
(898, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Green F. Colorant – Ferna', 'FC-GF', '', 'FOOD COLORANT'),
(899, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Green F. Colorant – G.L', 'FC-GGL', '', 'FOOD COLORANT'),
(900, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Green Food Color', '', '', 'FOOD COLORANT'),
(901, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Orange F. Colorant – Ferna', 'FC-OGL', '', 'FOOD COLORANT'),
(902, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Orange F. Colorant – G.L', 'FC-OGL', '', 'FOOD COLORANT'),
(903, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Pink F. Colorant – Ferna', 'FC-PF', '', 'FOOD COLORANT'),
(904, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Pink F. Colorant – G.L', 'FC-PGL', '', 'FOOD COLORANT'),
(905, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Red F. Colorant – Ferna', 'FC-RF', '', 'FOOD COLORANT'),
(906, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Red F. Colorant – G.L', 'FC-RGL', '', 'FOOD COLORANT'),
(907, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Violet F. Colorant – Ferna', 'FC-VF', '', 'FOOD COLORANT'),
(908, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Violet F. Colorant – G.L', 'FC-VGL', '', 'FOOD COLORANT'),
(909, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Yellow F. Colorant – Ferna', 'FC-YF', '', 'FOOD COLORANT'),
(910, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Yellow F. Colorant – G.L', 'FC-YGL', '', 'FOOD COLORANT'),
(911, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BLACK IRON OXIDE', 'SC-BIO', 'FW SPA', 'POWDER COLORANT'),
(912, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BLACSK COLORANT- COSMETIC', 'SC-BC', '', 'POWDER COLORANT'),
(913, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BLUE COLORANT POWDER', 'SC-BP', '', 'POWDER COLORANT'),
(914, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BROWN COLORANT POWDER', 'SC-BRN', '', 'POWDER COLORANT'),
(915, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'D&C ORANGE 4', 'SC-DCO4', 'CEDAR ALLEY', 'POWDER COLORANT'),
(916, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'D&C RED 17', 'SC-DCL 17', 'CEDAR ALLEY', 'POWDER COLORANT'),
(917, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'D&C RED 7', 'SC-DCL 7', 'SOGOMI', 'POWDER COLORANT'),
(918, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GREEN CHROME OXIDE', 'SC-GCO', '', 'POWDER COLORANT'),
(919, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GREEN COLORANT', 'SC-GP', '', 'POWDER COLORANT'),
(920, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE BLUE', 'SC-IOBL', 'SOGOMI', 'POWDER COLORANT'),
(921, '900', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE BROWN', 'SC-IOB', 'SOGOMI', 'POWDER COLORANT'),
(922, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE CEDAR', 'SC-IOC', 'SOGOMI', 'POWDER COLORANT'),
(923, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE CHESTNUT', 'SC-IOCH', 'SOGOMI', 'POWDER COLORANT'),
(924, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE FOX GLOVE', 'SC-IOFG', 'SOGOMI', 'POWDER COLORANT'),
(925, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE GEUM', 'SC-IOG', 'SOGOMI', 'POWDER COLORANT'),
(926, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE PEONY', 'SC-IOP', 'SOGOMI', 'POWDER COLORANT'),
(927, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE RED', 'SC-IOR', 'SOGOMI', 'POWDER COLORANT'),
(928, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE UNIPURE RED', 'SC-IOUR', 'SOGOMI', 'POWDER COLORANT'),
(929, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE YELLOW', 'SC-IOY', 'SOGOMI', 'POWDER COLORANT'),
(930, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'IRON OXIDE YELLOW ORANGE', 'SC-IOYO', 'SOGOMI', 'POWDER COLORANT'),
(931, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LAKE ALLURE RED', 'SC-LAR', 'FW SPA', 'POWDER COLORANT'),
(932, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ORANGE COLORANT', 'SC-O', 'SOAP CENTRAL', 'POWDER COLORANT'),
(933, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PINK CLAY', 'P.C', '', 'POWDER COLORANT'),
(934, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PINK ERYTHROSINE', 'SC-PE', 'SOGOMI', 'POWDER COLORANT'),
(935, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PONCEAU RED', 'SC-P', 'SOGOMI', 'POWDER COLORANT'),
(936, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TITANIUM DIOXIDE', 'SC-W', 'CHEMICO PHIL', 'POWDER COLORANT'),
(937, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'YELLOW COLORANT', 'SC-Y', 'SOGOMI', 'POWDER COLORANT'),
(938, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BLACK COLORANT', 'SC-BL', 'SOAP CENTRAL', 'POWDER COLORANT'),
(939, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BLACK IRON OXIDE', 'SC-BIO', 'FW SPA', 'POWDER COLORANT'),
(940, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BLACSK COLORANT- COSMETIC', 'SC-BC', '', 'POWDER COLORANT'),
(941, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BLUE COLORANT POWDER', 'SC-BP', '', 'POWDER COLORANT'),
(942, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BROWN COLORANT POWDER', 'SC-BRN', '', 'POWDER COLORANT'),
(943, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'D&C ORANGE 4', 'SC-DCO4', 'CEDAR ALLEY', 'POWDER COLORANT'),
(944, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'D&C RED 17', 'SC-DCL 17', 'CEDAR ALLEY', 'POWDER COLORANT'),
(945, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'D&C RED 7', 'SC-DCL 7', 'SOGOMI', 'POWDER COLORANT'),
(946, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GREEN CHROME OXIDE', 'SC-GCO', '', 'POWDER COLORANT'),
(947, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GREEN COLORANT', 'SC-GP', '', 'POWDER COLORANT'),
(948, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE BLUE', 'SC-IOBL', 'SOGOMI', 'POWDER COLORANT'),
(949, '900', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE BROWN', 'SC-IOB', 'SOGOMI', 'POWDER COLORANT'),
(950, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE CEDAR', 'SC-IOC', 'SOGOMI', 'POWDER COLORANT'),
(951, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE CHESTNUT', 'SC-IOCH', 'SOGOMI', 'POWDER COLORANT'),
(952, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE FOX GLOVE', 'SC-IOFG', 'SOGOMI', 'POWDER COLORANT'),
(953, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE GEUM', 'SC-IOG', 'SOGOMI', 'POWDER COLORANT'),
(954, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE PEONY', 'SC-IOP', 'SOGOMI', 'POWDER COLORANT'),
(955, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE RED', 'SC-IOR', 'SOGOMI', 'POWDER COLORANT'),
(956, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE UNIPURE RED', 'SC-IOUR', 'SOGOMI', 'POWDER COLORANT'),
(957, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE YELLOW', 'SC-IOY', 'SOGOMI', 'POWDER COLORANT'),
(958, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'IRON OXIDE YELLOW ORANGE', 'SC-IOYO', 'SOGOMI', 'POWDER COLORANT'),
(959, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LAKE ALLURE RED', 'SC-LAR', 'FW SPA', 'POWDER COLORANT'),
(960, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ORANGE COLORANT', 'SC-O', 'SOAP CENTRAL', 'POWDER COLORANT'),
(961, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PINK CLAY', 'P.C', '', 'POWDER COLORANT'),
(962, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PINK ERYTHROSINE', 'SC-PE', 'SOGOMI', 'POWDER COLORANT'),
(963, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PONCEAU RED', 'SC-P', 'SOGOMI', 'POWDER COLORANT'),
(964, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TITANIUM DIOXIDE', 'SC-W', 'CHEMICO PHIL', 'POWDER COLORANT'),
(965, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'YELLOW COLORANT', 'SC-Y', 'SOGOMI', 'POWDER COLORANT'),
(966, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BLACK COLORANT', 'SC-BL', 'SOAP CENTRAL', 'POWDER COLORANT'),
(967, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BLACK IRON OXIDE', 'SC-BIO', 'FW SPA', 'POWDER COLORANT'),
(968, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BLACSK COLORANT- COSMETIC', 'SC-BC', '', 'POWDER COLORANT'),
(969, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BLUE COLORANT POWDER', 'SC-BP', '', 'POWDER COLORANT'),
(970, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BROWN COLORANT POWDER', 'SC-BRN', '', 'POWDER COLORANT'),
(971, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'D&C ORANGE 4', 'SC-DCO4', 'CEDAR ALLEY', 'POWDER COLORANT'),
(972, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'D&C RED 17', 'SC-DCL 17', 'CEDAR ALLEY', 'POWDER COLORANT'),
(973, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'D&C RED 7', 'SC-DCL 7', 'SOGOMI', 'POWDER COLORANT'),
(974, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GREEN CHROME OXIDE', 'SC-GCO', '', 'POWDER COLORANT'),
(975, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GREEN COLORANT', 'SC-GP', '', 'POWDER COLORANT'),
(976, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE BLUE', 'SC-IOBL', 'SOGOMI', 'POWDER COLORANT'),
(977, '900', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE BROWN', 'SC-IOB', 'SOGOMI', 'POWDER COLORANT'),
(978, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE CEDAR', 'SC-IOC', 'SOGOMI', 'POWDER COLORANT'),
(979, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE CHESTNUT', 'SC-IOCH', 'SOGOMI', 'POWDER COLORANT'),
(980, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE FOX GLOVE', 'SC-IOFG', 'SOGOMI', 'POWDER COLORANT'),
(981, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE GEUM', 'SC-IOG', 'SOGOMI', 'POWDER COLORANT'),
(982, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE PEONY', 'SC-IOP', 'SOGOMI', 'POWDER COLORANT'),
(983, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE RED', 'SC-IOR', 'SOGOMI', 'POWDER COLORANT'),
(984, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE UNIPURE RED', 'SC-IOUR', 'SOGOMI', 'POWDER COLORANT'),
(985, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE YELLOW', 'SC-IOY', 'SOGOMI', 'POWDER COLORANT'),
(986, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'IRON OXIDE YELLOW ORANGE', 'SC-IOYO', 'SOGOMI', 'POWDER COLORANT'),
(987, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LAKE ALLURE RED', 'SC-LAR', 'FW SPA', 'POWDER COLORANT'),
(988, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'ORANGE COLORANT', 'SC-O', 'SOAP CENTRAL', 'POWDER COLORANT'),
(989, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PINK CLAY', 'P.C', '', 'POWDER COLORANT'),
(990, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PINK ERYTHROSINE', 'SC-PE', 'SOGOMI', 'POWDER COLORANT'),
(991, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PONCEAU RED', 'SC-P', 'SOGOMI', 'POWDER COLORANT'),
(992, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TITANIUM DIOXIDE', 'SC-W', 'CHEMICO PHIL', 'POWDER COLORANT'),
(993, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'YELLOW COLORANT', 'SC-Y', 'SOGOMI', 'POWDER COLORANT'),
(994, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BLACK COLORANT', 'SC-BL', 'SOAP CENTRAL', 'POWDER COLORANT'),
(995, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BLACK IRON OXIDE', 'SC-BIO', 'FW SPA', 'POWDER COLORANT'),
(996, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BLACSK COLORANT- COSMETIC', 'SC-BC', '', 'POWDER COLORANT'),
(997, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BLUE COLORANT POWDER', 'SC-BP', '', 'POWDER COLORANT'),
(998, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BROWN COLORANT POWDER', 'SC-BRN', '', 'POWDER COLORANT'),
(999, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'D&C ORANGE 4', 'SC-DCO4', 'CEDAR ALLEY', 'POWDER COLORANT'),
(1000, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'D&C RED 17', 'SC-DCL 17', 'CEDAR ALLEY', 'POWDER COLORANT'),
(1001, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'D&C RED 7', 'SC-DCL 7', 'SOGOMI', 'POWDER COLORANT'),
(1002, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GREEN CHROME OXIDE', 'SC-GCO', '', 'POWDER COLORANT'),
(1003, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GREEN COLORANT', 'SC-GP', '', 'POWDER COLORANT'),
(1004, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE BLUE', 'SC-IOBL', 'SOGOMI', 'POWDER COLORANT'),
(1005, '900', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE BROWN', 'SC-IOB', 'SOGOMI', 'POWDER COLORANT'),
(1006, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE CEDAR', 'SC-IOC', 'SOGOMI', 'POWDER COLORANT'),
(1007, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE CHESTNUT', 'SC-IOCH', 'SOGOMI', 'POWDER COLORANT'),
(1008, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE FOX GLOVE', 'SC-IOFG', 'SOGOMI', 'POWDER COLORANT'),
(1009, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE GEUM', 'SC-IOG', 'SOGOMI', 'POWDER COLORANT'),
(1010, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE PEONY', 'SC-IOP', 'SOGOMI', 'POWDER COLORANT'),
(1011, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE RED', 'SC-IOR', 'SOGOMI', 'POWDER COLORANT'),
(1012, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE UNIPURE RED', 'SC-IOUR', 'SOGOMI', 'POWDER COLORANT'),
(1013, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE YELLOW', 'SC-IOY', 'SOGOMI', 'POWDER COLORANT'),
(1014, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'IRON OXIDE YELLOW ORANGE', 'SC-IOYO', 'SOGOMI', 'POWDER COLORANT'),
(1015, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LAKE ALLURE RED', 'SC-LAR', 'FW SPA', 'POWDER COLORANT'),
(1016, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ORANGE COLORANT', 'SC-O', 'SOAP CENTRAL', 'POWDER COLORANT'),
(1017, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PINK CLAY', 'P.C', '', 'POWDER COLORANT'),
(1018, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PINK ERYTHROSINE', 'SC-PE', 'SOGOMI', 'POWDER COLORANT'),
(1019, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PONCEAU RED', 'SC-P', 'SOGOMI', 'POWDER COLORANT'),
(1020, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TITANIUM DIOXIDE', 'SC-W', 'CHEMICO PHIL', 'POWDER COLORANT'),
(1021, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'YELLOW COLORANT', 'SC-Y', 'SOGOMI', 'POWDER COLORANT'),
(1022, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BLACK COLORANT', 'SC-BL', 'SOAP CENTRAL', 'POWDER COLORANT'),
(1023, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BLACK IRON OXIDE', 'SC-BIO', 'FW SPA', 'POWDER COLORANT'),
(1024, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BLACSK COLORANT- COSMETIC', 'SC-BC', '', 'POWDER COLORANT'),
(1025, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BLUE COLORANT POWDER', 'SC-BP', '', 'POWDER COLORANT'),
(1026, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BROWN COLORANT POWDER', 'SC-BRN', '', 'POWDER COLORANT'),
(1027, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'D&C ORANGE 4', 'SC-DCO4', 'CEDAR ALLEY', 'POWDER COLORANT'),
(1028, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'D&C RED 17', 'SC-DCL 17', 'CEDAR ALLEY', 'POWDER COLORANT'),
(1029, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'D&C RED 7', 'SC-DCL 7', 'SOGOMI', 'POWDER COLORANT'),
(1030, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GREEN CHROME OXIDE', 'SC-GCO', '', 'POWDER COLORANT'),
(1031, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GREEN COLORANT', 'SC-GP', '', 'POWDER COLORANT'),
(1032, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE BLUE', 'SC-IOBL', 'SOGOMI', 'POWDER COLORANT'),
(1033, '900', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE BROWN', 'SC-IOB', 'SOGOMI', 'POWDER COLORANT'),
(1034, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE CEDAR', 'SC-IOC', 'SOGOMI', 'POWDER COLORANT'),
(1035, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE CHESTNUT', 'SC-IOCH', 'SOGOMI', 'POWDER COLORANT'),
(1036, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE FOX GLOVE', 'SC-IOFG', 'SOGOMI', 'POWDER COLORANT'),
(1037, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE GEUM', 'SC-IOG', 'SOGOMI', 'POWDER COLORANT'),
(1038, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE PEONY', 'SC-IOP', 'SOGOMI', 'POWDER COLORANT'),
(1039, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE RED', 'SC-IOR', 'SOGOMI', 'POWDER COLORANT'),
(1040, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE UNIPURE RED', 'SC-IOUR', 'SOGOMI', 'POWDER COLORANT'),
(1041, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE YELLOW', 'SC-IOY', 'SOGOMI', 'POWDER COLORANT'),
(1042, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'IRON OXIDE YELLOW ORANGE', 'SC-IOYO', 'SOGOMI', 'POWDER COLORANT'),
(1043, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LAKE ALLURE RED', 'SC-LAR', 'FW SPA', 'POWDER COLORANT'),
(1044, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ORANGE COLORANT', 'SC-O', 'SOAP CENTRAL', 'POWDER COLORANT'),
(1045, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PINK CLAY', 'P.C', '', 'POWDER COLORANT'),
(1046, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PINK ERYTHROSINE', 'SC-PE', 'SOGOMI', 'POWDER COLORANT'),
(1047, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PONCEAU RED', 'SC-P', 'SOGOMI', 'POWDER COLORANT'),
(1048, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TITANIUM DIOXIDE', 'SC-W', 'CHEMICO PHIL', 'POWDER COLORANT'),
(1049, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'YELLOW COLORANT', 'SC-Y', 'SOGOMI', 'POWDER COLORANT'),
(1050, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BLACK COLORANT', 'SC-BL', 'SOAP CENTRAL', 'POWDER COLORANT'),
(1051, '200', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CASTOR OIL', 'FA-R', 'FW SPA', 'OIL'),
(1052, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'COCONUT OIL', 'FA-C', 'LAVENDER MARK.', 'OIL'),
(1053, '1,905', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'FRACTIONATED COCONUT OIL', 'FA-FC', 'FW SPA', 'OIL'),
(1054, '1,500', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GRAPESEED OIL', 'FA-G', 'SOGOMI', 'OIL'),
(1055, '978', 0, 'LIQUID/OIL', 400, 0, 0, 0, '2022-05-03 00:00:00', 'HYDROGENATED CASTOR OIL/ PEG 40', 'FA-HCO-40', 'FW SPA', 'OIL'),
(1056, '250', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'JOJOVA OIL', 'FA-J', 'SOGOMI', 'OIL'),
(1057, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MINERAL OIL LIGHT', 'FA-MO', 'FW SPA', 'OIL'),
(1058, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MINERAL OIL UNSCENTED', 'FA-MOU', 'FW SPA', 'OIL'),
(1059, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PALM OIL', 'FA-P', 'LAVENDER MARK.', 'OIL'),
(1060, '3,000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SOYBEAN OIL/ SOYA OIL', 'FA-S', 'SM ANGONO', 'OIL'),
(1061, '82,000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SUNFLOWER OIL', 'FA-SF', 'JAPAN', 'OIL'),
(1062, '200', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CASTOR OIL', 'FA-R', 'FW SPA', 'OIL'),
(1063, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'COCONUT OIL', 'FA-C', 'LAVENDER MARK.', 'OIL'),
(1064, '1905', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'FRACTIONATED COCONUT OIL', 'FA-FC', 'FW SPA', 'OIL'),
(1065, '1500', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GRAPESEED OIL', 'FA-G', 'SOGOMI', 'OIL'),
(1066, '578', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'HYDROGENATED CASTOR OIL/ PEG 40', 'FA-HCO-40', 'FW SPA', 'OIL'),
(1067, '250', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'JOJOVA OIL', 'FA-J', 'SOGOMI', 'OIL'),
(1068, '0', 2000, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MINERAL OIL LIGHT', 'FA-MO', 'FW SPA', 'OIL'),
(1069, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MINERAL OIL UNSCENTED', 'FA-MOU', 'FW SPA', 'OIL'),
(1070, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PALM OIL', 'FA-P', 'LAVENDER MARK.', 'OIL'),
(1071, '3000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SOYBEAN OIL/ SOYA OIL', 'FA-S', 'SM ANGONO', 'OIL'),
(1072, '82000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SUNFLOWER OIL', 'FA-SF', 'JAPAN', 'OIL'),
(1073, '200', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CASTOR OIL', 'FA-R', 'FW SPA', 'OIL'),
(1074, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'COCONUT OIL', 'FA-C', 'LAVENDER MARK.', 'OIL'),
(1075, '1905', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'FRACTIONATED COCONUT OIL', 'FA-FC', 'FW SPA', 'OIL'),
(1076, '1500', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GRAPESEED OIL', 'FA-G', 'SOGOMI', 'OIL'),
(1077, '578', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'HYDROGENATED CASTOR OIL/ PEG 40', 'FA-HCO-40', 'FW SPA', 'OIL'),
(1078, '250', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'JOJOVA OIL', 'FA-J', 'SOGOMI', 'OIL'),
(1079, '2000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MINERAL OIL LIGHT', 'FA-MO', 'FW SPA', 'OIL'),
(1080, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MINERAL OIL UNSCENTED', 'FA-MOU', 'FW SPA', 'OIL'),
(1081, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PALM OIL', 'FA-P', 'LAVENDER MARK.', 'OIL'),
(1082, '3000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SOYBEAN OIL/ SOYA OIL', 'FA-S', 'SM ANGONO', 'OIL'),
(1083, '82000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SUNFLOWER OIL', 'FA-SF', 'JAPAN', 'OIL'),
(1084, '200', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CASTOR OIL', 'FA-R', 'FW SPA', 'OIL'),
(1085, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'COCONUT OIL', 'FA-C', 'LAVENDER MARK.', 'OIL'),
(1086, '1905', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'FRACTIONATED COCONUT OIL', 'FA-FC', 'FW SPA', 'OIL'),
(1087, '1500', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GRAPESEED OIL', 'FA-G', 'SOGOMI', 'OIL'),
(1088, '578', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'HYDROGENATED CASTOR OIL/ PEG 40', 'FA-HCO-40', 'FW SPA', 'OIL'),
(1089, '250', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'JOJOVA OIL', 'FA-J', 'SOGOMI', 'OIL'),
(1090, '2000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MINERAL OIL LIGHT', 'FA-MO', 'FW SPA', 'OIL'),
(1091, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MINERAL OIL UNSCENTED', 'FA-MOU', 'FW SPA', 'OIL'),
(1092, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PALM OIL', 'FA-P', 'LAVENDER MARK.', 'OIL'),
(1093, '3000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SOYBEAN OIL/ SOYA OIL', 'FA-S', 'SM ANGONO', 'OIL'),
(1094, '82000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SUNFLOWER OIL', 'FA-SF', 'JAPAN', 'OIL'),
(1095, '200', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CASTOR OIL', 'FA-R', 'FW SPA', 'OIL'),
(1096, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'COCONUT OIL', 'FA-C', 'LAVENDER MARK.', 'OIL'),
(1097, '1905', 0, 'LIQUID/OIL', 1905, 0, 0, 0, '2022-05-10 00:00:00', 'FRACTIONATED COCONUT OIL', 'FA-FC', 'FW SPA', 'OIL'),
(1098, '1500', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GRAPESEED OIL', 'FA-G', 'SOGOMI', 'OIL'),
(1099, '578', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'HYDROGENATED CASTOR OIL/ PEG 40', 'FA-HCO-40', 'FW SPA', 'OIL'),
(1100, '250', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'JOJOVA OIL', 'FA-J', 'SOGOMI', 'OIL'),
(1101, '2000', 0, 'LIQUID/OIL', 2000, 0, 0, 0, '2022-05-10 00:00:00', 'MINERAL OIL LIGHT', 'FA-MO', 'FW SPA', 'OIL'),
(1102, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MINERAL OIL UNSCENTED', 'FA-MOU', 'FW SPA', 'OIL'),
(1103, '0', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PALM OIL', 'FA-P', 'LAVENDER MARK.', 'OIL'),
(1104, '3000', 0, 'LIQUID/OIL', 3000, 0, 0, 0, '2022-05-10 00:00:00', 'SOYBEAN OIL/ SOYA OIL', 'FA-S', 'SM ANGONO', 'OIL'),
(1105, '82000', 0, 'LIQUID/OIL', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SUNFLOWER OIL', 'FA-SF', 'JAPAN', 'OIL'),
(1106, '2000', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'EPSON SALT', 'E-SALT', 'FW SPA', 'SALT'),
(1107, '7000', 0, 'PINK CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'HIMALAYAN SALT', 'H-SALT', '', 'SALT'),
(1108, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MAGNESIUM STEARATE', 'M-STR', 'TRANS WORLD TRADING', 'SALT'),
(1109, '1500', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SALT', 'SALT', '', 'SALT'),
(1110, '2000', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'EPSON SALT', 'E-SALT', 'FW SPA', 'SALT'),
(1111, '7000', 0, 'PINK CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'HIMALAYAN SALT', 'H-SALT', '', 'SALT'),
(1112, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MAGNESIUM STEARATE', 'M-STR', 'TRANS WORLD TRADING', 'SALT'),
(1113, '1500', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SALT', 'SALT', '', 'SALT'),
(1114, '2000', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'EPSON SALT', 'E-SALT', 'FW SPA', 'SALT'),
(1115, '7000', 0, 'PINK CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'HIMALAYAN SALT', 'H-SALT', '', 'SALT'),
(1116, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MAGNESIUM STEARATE', 'M-STR', 'TRANS WORLD TRADING', 'SALT'),
(1117, '1500', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SALT', 'SALT', '', 'SALT'),
(1118, '2000', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'EPSON SALT', 'E-SALT', 'FW SPA', 'SALT'),
(1119, '7000', 0, 'PINK CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'HIMALAYAN SALT', 'H-SALT', '', 'SALT'),
(1120, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MAGNESIUM STEARATE', 'M-STR', 'TRANS WORLD TRADING', 'SALT'),
(1121, '1500', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SALT', 'SALT', '', 'SALT'),
(1122, '2000', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'EPSON SALT', 'E-SALT', 'FW SPA', 'SALT'),
(1123, '7000', 0, 'PINK CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'HIMALAYAN SALT', 'H-SALT', '', 'SALT'),
(1124, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MAGNESIUM STEARATE', 'M-STR', 'TRANS WORLD TRADING', 'SALT'),
(1125, '1500', 0, 'WHITE CRYSTALLINE SOLID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SALT', 'SALT', '', 'SALT'),
(1126, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'B&BW G. Peach & S. Tea', 'F.O BBWS', 'FW Spavenue', 'PERFUME SCENT'),
(1127, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Bergamot Scent', 'F.O BS', 'FW Spavenue', 'PERFUME SCENT'),
(1128, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Bulgari Amethyst', 'F.O BA', 'FW Spavenue', 'PERFUME SCENT'),
(1129, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Bulgari Extreme Scent', 'F.O BES', 'FW Spavenue', 'PERFUME SCENT'),
(1130, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Centelia Asiatica', 'F.O CA', 'FW Spavenue', 'PERFUME SCENT'),
(1131, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Chanel No.5 Scent', 'F.O C5S', 'FW Spavenue', 'PERFUME SCENT'),
(1132, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CK One', 'F.O CK1', 'FW Spavenue', 'PERFUME SCENT'),
(1133, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Clinique Happy', 'F.O CH', 'FW Spavenue', 'PERFUME SCENT'),
(1134, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Cool Mint Scent', 'F.O CMS', 'FW Spavenue', 'PERFUME SCENT'),
(1135, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'D&G Lite Blue Women', 'F.O LBW', 'FW Spavenue', 'PERFUME SCENT'),
(1136, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Davidoff Cool Water', 'F.O DC', 'FW Spavenue', 'PERFUME SCENT'),
(1137, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Issey Miyake', 'F.O IM', 'FW Spavenue', 'PERFUME SCENT'),
(1138, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Lacoste Black', 'F.O LB', 'FW Spavenue', 'PERFUME SCENT'),
(1139, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Lacoste Pink Scent', 'F.O LPS', 'FW Spavenue', 'PERFUME SCENT'),
(1140, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Lacoste Red', 'F.O LR', 'FW Spavenue', 'PERFUME SCENT'),
(1141, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Moroccan Women', 'F.O MW', 'FW Spavenue', 'PERFUME SCENT'),
(1142, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'R.L Polo Sport Scent', 'F.O RLPS', 'FW Spavenue', 'PERFUME SCENT'),
(1143, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Satsuma Scent', 'F.O SS', 'FW Spavenue', 'PERFUME SCENT'),
(1144, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'White Tea Scent', '', 'FW Spavenue', 'PERFUME SCENT'),
(1145, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', '', '', 'FW Spavenue', 'PERFUME SCENT'),
(1146, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'B&BW G. Peach & S. Tea', 'F.O BBWS', 'FW Spavenue', 'PERFUME SCENT'),
(1147, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Bergamot Scent', 'F.O BS', 'FW Spavenue', 'PERFUME SCENT'),
(1148, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Bulgari Amethyst', 'F.O BA', 'FW Spavenue', 'PERFUME SCENT'),
(1149, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Bulgari Extreme Scent', 'F.O BES', 'FW Spavenue', 'PERFUME SCENT'),
(1150, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Centelia Asiatica', 'F.O CA', 'FW Spavenue', 'PERFUME SCENT'),
(1151, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Chanel No.5 Scent', 'F.O C5S', 'FW Spavenue', 'PERFUME SCENT'),
(1152, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CK One', 'F.O CK1', 'FW Spavenue', 'PERFUME SCENT'),
(1153, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Clinique Happy', 'F.O CH', 'FW Spavenue', 'PERFUME SCENT'),
(1154, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Cool Mint Scent', 'F.O CMS', 'FW Spavenue', 'PERFUME SCENT'),
(1155, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'D&G Lite Blue Women', 'F.O LBW', 'FW Spavenue', 'PERFUME SCENT'),
(1156, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Davidoff Cool Water', 'F.O DC', 'FW Spavenue', 'PERFUME SCENT'),
(1157, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Issey Miyake', 'F.O IM', 'FW Spavenue', 'PERFUME SCENT'),
(1158, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Lacoste Black', 'F.O LB', 'FW Spavenue', 'PERFUME SCENT'),
(1159, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Lacoste Pink Scent', 'F.O LPS', 'FW Spavenue', 'PERFUME SCENT'),
(1160, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Lacoste Red', 'F.O LR', 'FW Spavenue', 'PERFUME SCENT'),
(1161, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Moroccan Women', 'F.O MW', 'FW Spavenue', 'PERFUME SCENT'),
(1162, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'R.L Polo Sport Scent', 'F.O RLPS', 'FW Spavenue', 'PERFUME SCENT'),
(1163, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Satsuma Scent', 'F.O SS', 'FW Spavenue', 'PERFUME SCENT'),
(1164, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'White Tea Scent', '', 'FW Spavenue', 'PERFUME SCENT'),
(1165, '0', 2000, '', 0, 0, 0, 0, '2022-05-04 00:00:00', '', '', 'FW Spavenue', 'PERFUME SCENT'),
(1166, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'B&BW G. Peach & S. Tea', 'F.O BBWS', 'FW Spavenue', 'PERFUME SCENT'),
(1167, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Bergamot Scent', 'F.O BS', 'FW Spavenue', 'PERFUME SCENT'),
(1168, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Bulgari Amethyst', 'F.O BA', 'FW Spavenue', 'PERFUME SCENT'),
(1169, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Bulgari Extreme Scent', 'F.O BES', 'FW Spavenue', 'PERFUME SCENT'),
(1170, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Centelia Asiatica', 'F.O CA', 'FW Spavenue', 'PERFUME SCENT'),
(1171, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Chanel No.5 Scent', 'F.O C5S', 'FW Spavenue', 'PERFUME SCENT'),
(1172, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CK One', 'F.O CK1', 'FW Spavenue', 'PERFUME SCENT'),
(1173, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Clinique Happy', 'F.O CH', 'FW Spavenue', 'PERFUME SCENT'),
(1174, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Cool Mint Scent', 'F.O CMS', 'FW Spavenue', 'PERFUME SCENT'),
(1175, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'D&G Lite Blue Women', 'F.O LBW', 'FW Spavenue', 'PERFUME SCENT'),
(1176, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Davidoff Cool Water', 'F.O DC', 'FW Spavenue', 'PERFUME SCENT'),
(1177, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Issey Miyake', 'F.O IM', 'FW Spavenue', 'PERFUME SCENT'),
(1178, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Lacoste Black', 'F.O LB', 'FW Spavenue', 'PERFUME SCENT'),
(1179, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Lacoste Pink Scent', 'F.O LPS', 'FW Spavenue', 'PERFUME SCENT'),
(1180, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Lacoste Red', 'F.O LR', 'FW Spavenue', 'PERFUME SCENT'),
(1181, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Moroccan Women', 'F.O MW', 'FW Spavenue', 'PERFUME SCENT'),
(1182, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'R.L Polo Sport Scent', 'F.O RLPS', 'FW Spavenue', 'PERFUME SCENT'),
(1183, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Satsuma Scent', 'F.O SS', 'FW Spavenue', 'PERFUME SCENT'),
(1184, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'White Tea Scent', '', 'FW Spavenue', 'PERFUME SCENT'),
(1185, '0', 2000, '', 0, 0, 0, 0, '2022-05-05 00:00:00', '', '', 'FW Spavenue', 'PERFUME SCENT'),
(1186, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'B&BW G. Peach & S. Tea', 'F.O BBWS', 'FW Spavenue', 'PERFUME SCENT'),
(1187, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Bergamot Scent', 'F.O BS', 'FW Spavenue', 'PERFUME SCENT'),
(1188, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Bulgari Amethyst', 'F.O BA', 'FW Spavenue', 'PERFUME SCENT'),
(1189, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Bulgari Extreme Scent', 'F.O BES', 'FW Spavenue', 'PERFUME SCENT'),
(1190, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Centelia Asiatica', 'F.O CA', 'FW Spavenue', 'PERFUME SCENT'),
(1191, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Chanel No.5 Scent', 'F.O C5S', 'FW Spavenue', 'PERFUME SCENT'),
(1192, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CK One', 'F.O CK1', 'FW Spavenue', 'PERFUME SCENT'),
(1193, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Clinique Happy', 'F.O CH', 'FW Spavenue', 'PERFUME SCENT'),
(1194, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Cool Mint Scent', 'F.O CMS', 'FW Spavenue', 'PERFUME SCENT'),
(1195, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'D&G Lite Blue Women', 'F.O LBW', 'FW Spavenue', 'PERFUME SCENT'),
(1196, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Davidoff Cool Water', 'F.O DC', 'FW Spavenue', 'PERFUME SCENT'),
(1197, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Issey Miyake', 'F.O IM', 'FW Spavenue', 'PERFUME SCENT'),
(1198, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Lacoste Black', 'F.O LB', 'FW Spavenue', 'PERFUME SCENT'),
(1199, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Lacoste Pink Scent', 'F.O LPS', 'FW Spavenue', 'PERFUME SCENT'),
(1200, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Lacoste Red', 'F.O LR', 'FW Spavenue', 'PERFUME SCENT'),
(1201, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Moroccan Women', 'F.O MW', 'FW Spavenue', 'PERFUME SCENT'),
(1202, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'R.L Polo Sport Scent', 'F.O RLPS', 'FW Spavenue', 'PERFUME SCENT'),
(1203, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Satsuma Scent', 'F.O SS', 'FW Spavenue', 'PERFUME SCENT'),
(1204, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'White Tea Scent', '', 'FW Spavenue', 'PERFUME SCENT'),
(1205, '0', 2000, '', 0, 0, 0, 0, '2022-05-06 00:00:00', '', '', 'FW Spavenue', 'PERFUME SCENT'),
(1206, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'B&BW G. Peach & S. Tea', 'F.O BBWS', 'FW Spavenue', 'PERFUME SCENT'),
(1207, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Bergamot Scent', 'F.O BS', 'FW Spavenue', 'PERFUME SCENT'),
(1208, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Bulgari Amethyst', 'F.O BA', 'FW Spavenue', 'PERFUME SCENT'),
(1209, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Bulgari Extreme Scent', 'F.O BES', 'FW Spavenue', 'PERFUME SCENT'),
(1210, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Centelia Asiatica', 'F.O CA', 'FW Spavenue', 'PERFUME SCENT'),
(1211, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Chanel No.5 Scent', 'F.O C5S', 'FW Spavenue', 'PERFUME SCENT'),
(1212, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CK One', 'F.O CK1', 'FW Spavenue', 'PERFUME SCENT'),
(1213, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Clinique Happy', 'F.O CH', 'FW Spavenue', 'PERFUME SCENT'),
(1214, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Cool Mint Scent', 'F.O CMS', 'FW Spavenue', 'PERFUME SCENT'),
(1215, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'D&G Lite Blue Women', 'F.O LBW', 'FW Spavenue', 'PERFUME SCENT'),
(1216, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Davidoff Cool Water', 'F.O DC', 'FW Spavenue', 'PERFUME SCENT'),
(1217, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Issey Miyake', 'F.O IM', 'FW Spavenue', 'PERFUME SCENT'),
(1218, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Lacoste Black', 'F.O LB', 'FW Spavenue', 'PERFUME SCENT'),
(1219, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Lacoste Pink Scent', 'F.O LPS', 'FW Spavenue', 'PERFUME SCENT'),
(1220, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Lacoste Red', 'F.O LR', 'FW Spavenue', 'PERFUME SCENT'),
(1221, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Moroccan Women', 'F.O MW', 'FW Spavenue', 'PERFUME SCENT'),
(1222, '400', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'R.L Polo Sport Scent', 'F.O RLPS', 'FW Spavenue', 'PERFUME SCENT'),
(1223, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Satsuma Scent', 'F.O SS', 'FW Spavenue', 'PERFUME SCENT'),
(1224, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'White Tea Scent', '', 'FW Spavenue', 'PERFUME SCENT'),
(1225, '0', 2000, '', 0, 0, 0, 0, '2022-05-10 00:00:00', '', '', 'FW Spavenue', 'PERFUME SCENT'),
(1226, '8000', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BAMBOO FRESH/ FRESH BAMBOO', '', 'CPL', 'FRAGRANCE OIL'),
(1227, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BERRY BUBBLE', 'F.O BB', 'CPL', 'FRAGRANCE OIL'),
(1228, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BLUEBERRY F.O', 'F.O BB', 'FW Spavenue', 'FRAGRANCE OIL'),
(1230, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'BUBBLE GUM F.O – EL', 'F.O BGE', 'SOGOMI', 'FRAGRANCE OIL'),
(1231, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CALAMANSI F.O', 'F.O C', 'Newelle', 'FRAGRANCE OIL'),
(1232, '500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CANTALOUPE SCENT', 'F.O CT', 'FW Spavenue', 'FRAGRANCE OIL'),
(1233, '80000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CAPTIVATION/PURE SED.', 'F.O PS', 'FW Spavenue/CPL', 'FRAGRANCE OIL'),
(1234, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CHAMOMILE SCENT', 'F.O CHM', 'FW Spavenue', 'FRAGRANCE OIL'),
(1235, '700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CHERRY BLOSSOM SCENT', 'F.O CB', 'SoapScentral', 'FRAGRANCE OIL'),
(1236, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CHERRY F.O', 'F.O CH', 'SoapScentral', 'FRAGRANCE OIL'),
(1237, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CHERRY F.O – EVER LIGHT', 'F.O CHE', '', 'FRAGRANCE OIL'),
(1238, '5100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CHERRY STRAWBERRY F.O', 'F.O CS', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1239, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'COFFEE F.O', 'F.O-CO', 'FW Spavenue', 'FRAGRANCE OIL'),
(1240, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CRANBERRY', 'F.O CB', '-', 'FRAGRANCE OIL'),
(1241, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CUCUMBER F.O', 'F.O CC', '-', 'FRAGRANCE OIL'),
(1242, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'CUCUMBER MELON SCENT', 'F.O CCM', 'FW', 'FRAGRANCE OIL'),
(1243, '80000', 0, 'LIQUID', 240, 0, 0, 0, '2022-05-03 00:00:00', 'FLORAL OASIS', 'F.O FO', 'CPL', 'FRAGRANCE OIL'),
(1244, '3500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'FLORAL POWDERY', 'F.O FP', 'FW SPA', 'FRAGRANCE OIL'),
(1245, '10000', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GINGER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1246, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GRAPE FRUIT SCENT', 'F.O GF', '-', 'FRAGRANCE OIL'),
(1247, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'GREEN APPLE SCENT', 'F.O GA', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1248, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'HONEY DEW MELON SCENT', 'F.O HDM', 'FW', 'FRAGRANCE OIL'),
(1249, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'KALAMANSI SV F.O', 'F.O APW SG', 'Newelle', 'FRAGRANCE OIL'),
(1250, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'KIWI SCENT', 'F.O K', 'FW Spavenue', 'FRAGRANCE OIL'),
(1251, '3000', 0, '', 200, 0, 0, 0, '2022-05-03 00:00:00', 'LAVENDER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1252, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LEMON F.O', 'F.O L', 'CPL', 'FRAGRANCE OIL'),
(1253, '28000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LEMON LIME F.O', 'F.O LL', 'CPL', 'FRAGRANCE OIL'),
(1254, '2000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LEMON SCENT', 'F.O L', 'FW Spavenue', 'FRAGRANCE OIL'),
(1255, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LOST & FANTASY', '', 'FW SPA', 'FRAGRANCE OIL'),
(1256, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LOVE SPELL', '', 'FW SPA', 'FRAGRANCE OIL'),
(1257, '2200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'LUSH SHEA BUTTER', '', 'FW SPA', 'FRAGRANCE OIL'),
(1258, '9000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MARCELINA SCENT', 'F.O SG', 'CPL', 'FRAGRANCE OIL'),
(1259, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MELON F.O', 'F.O M', '-', 'FRAGRANCE OIL'),
(1260, '10', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MILK SCENT', 'MILK F.O', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1261, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'MINT SCENT', 'F.O Mint', 'FW', 'FRAGRANCE OIL'),
(1262, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'NECTARINE BLOSSOM SCENT', 'F.O NB', 'FW', 'FRAGRANCE OIL'),
(1263, '50', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'OCEAN REEDS', 'F.O OR', 'FW SPA', 'FRAGRANCE OIL'),
(1264, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'OLD CHERRY F.O', 'F.O OS', '', 'FRAGRANCE OIL'),
(1265, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'OLIVE SCENT', 'F.O OS', '', 'FRAGRANCE OIL'),
(1266, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ORANGE MANDARIN F.O', 'F.O OM', '', 'FRAGRANCE OIL'),
(1267, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PAPAYA F.O', 'F.O P', '', 'FRAGRANCE OIL'),
(1268, '1160', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'PEPPERMINT SCENT', 'F.O PEPP', 'SOGOMI', 'FRAGRANCE OIL'),
(1269, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'POOR AND FRESCA', 'F.O PF', 'FE SPA', 'FRAGRANCE OIL'),
(1270, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'RASPBERRY SCENT', 'F.O RB', 'FW', 'FRAGRANCE OIL'),
(1271, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'ROSEMARY SCENT', 'F.O RM', 'FW SPA', 'FRAGRANCE OIL'),
(1272, '8000', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SALIHA', '', 'CPL', 'FRAGRANCE OIL'),
(1273, '100000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SPARKLE/ INCANTO SHINE', '', 'CPL', 'FRAGRANCE OIL'),
(1274, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'STRAWBERRY CHAMPAGNE', 'F.O SBC', 'CPL', 'FRAGRANCE OIL'),
(1275, '24000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'STRAWBERRY CREAMY', 'F.O SBCR', 'CPL', 'FRAGRANCE OIL'),
(1276, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'STRAWBERRY MILKSHAKE', 'F.O SBM', 'FW', 'FRAGRANCE OIL'),
(1277, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'STRAWBERRY SCENT', 'F.O SB', 'FW', 'FRAGRANCE OIL'),
(1278, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SWEET BERRY', 'F.O SBS', 'FW', 'FRAGRANCE OIL'),
(1279, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SWEET LEMON F.O', 'F.O SL', 'FW', 'FRAGRANCE OIL'),
(1280, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SWEET MILK SCENT', 'F.O SM', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1281, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SWEET ORANGE (FW SPA)', 'S.V SO', 'FW SPA', 'FRAGRANCE OIL'),
(1282, '15000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SWEET ORANGE SV', 'S.V SO', 'CPL', 'FRAGRANCE OIL'),
(1283, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SWEET PEA F.O', 'F.O SP', '', 'FRAGRANCE OIL'),
(1284, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'TUTTI-FRUTTI SCENT', 'F.O TF', 'FW', 'FRAGRANCE OIL'),
(1285, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'VANILLA SCENT', 'F.O V', 'FW', 'FRAGRANCE OIL'),
(1286, '1800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'WATERMELON SCENT', 'F.O WM', 'FW', 'FRAGRANCE OIL'),
(1287, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'YLANG YLANG F.O', 'F.O YY', 'CYLEINA ORGANIC', 'FRAGRANCE OIL'),
(1288, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'DOVE GO FRESH SCENT', '', '', 'FRAGRANCE OIL'),
(1289, '8000', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BAMBOO FRESH/ FRESH BAMBOO', '', 'CPL', 'FRAGRANCE OIL'),
(1290, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BERRY BUBBLE', 'F.O BB', 'CPL', 'FRAGRANCE OIL'),
(1291, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BLUEBERRY F.O', 'F.O BB', 'FW Spavenue', 'FRAGRANCE OIL'),
(1292, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BUBBLE GUM F.O', 'F.O BG', 'FW Spavenue', 'FRAGRANCE OIL'),
(1293, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'BUBBLE GUM F.O – EL', 'F.O BGE', 'SOGOMI', 'FRAGRANCE OIL'),
(1294, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CALAMANSI F.O', 'F.O C', 'Newelle', 'FRAGRANCE OIL'),
(1295, '500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CANTALOUPE SCENT', 'F.O CT', 'FW Spavenue', 'FRAGRANCE OIL'),
(1296, '80000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CAPTIVATION/PURE SED.', 'F.O PS', 'FW Spavenue/CPL', 'FRAGRANCE OIL'),
(1297, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CHAMOMILE SCENT', 'F.O CHM', 'FW Spavenue', 'FRAGRANCE OIL'),
(1298, '700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CHERRY BLOSSOM SCENT', 'F.O CB', 'SoapScentral', 'FRAGRANCE OIL'),
(1299, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CHERRY F.O', 'F.O CH', 'SoapScentral', 'FRAGRANCE OIL');
INSERT INTO `tblcurrentmonth` (`itemID`, `todayCurrentVolume`, `RECEIVED_VOLUME`, `APPEARANCE`, `RELEASED_VOLUME`, `REJECT_VOLUME`, `HOLD_VOLUME`, `PROD_RETURN`, `DATE_TODAY`, `MATERIAL_NAME`, `CODE_NAME`, `SUPPLIER`, `CATEGORIES`) VALUES
(1300, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CHERRY F.O – EVER LIGHT', 'F.O CHE', '', 'FRAGRANCE OIL'),
(1301, '5100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CHERRY STRAWBERRY F.O', 'F.O CS', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1302, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'COFFEE F.O', 'F.O-CO', 'FW Spavenue', 'FRAGRANCE OIL'),
(1303, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CRANBERRY', 'F.O CB', '-', 'FRAGRANCE OIL'),
(1304, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CUCUMBER F.O', 'F.O CC', '-', 'FRAGRANCE OIL'),
(1305, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'CUCUMBER MELON SCENT', 'F.O CCM', 'FW', 'FRAGRANCE OIL'),
(1306, '79760', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'FLORAL OASIS', 'F.O FO', 'CPL', 'FRAGRANCE OIL'),
(1307, '3500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'FLORAL POWDERY', 'F.O FP', 'FW SPA', 'FRAGRANCE OIL'),
(1308, '10000', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GINGER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1309, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GRAPE FRUIT SCENT', 'F.O GF', '-', 'FRAGRANCE OIL'),
(1310, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'GREEN APPLE SCENT', 'F.O GA', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1311, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'HONEY DEW MELON SCENT', 'F.O HDM', 'FW', 'FRAGRANCE OIL'),
(1312, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'KALAMANSI SV F.O', 'F.O APW SG', 'Newelle', 'FRAGRANCE OIL'),
(1313, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'KIWI SCENT', 'F.O K', 'FW Spavenue', 'FRAGRANCE OIL'),
(1314, '2800', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LAVENDER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1315, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LEMON F.O', 'F.O L', 'CPL', 'FRAGRANCE OIL'),
(1316, '28000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LEMON LIME F.O', 'F.O LL', 'CPL', 'FRAGRANCE OIL'),
(1317, '2000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LEMON SCENT', 'F.O L', 'FW Spavenue', 'FRAGRANCE OIL'),
(1318, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LOST & FANTASY', '', 'FW SPA', 'FRAGRANCE OIL'),
(1319, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LOVE SPELL', '', 'FW SPA', 'FRAGRANCE OIL'),
(1320, '2200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'LUSH SHEA BUTTER', '', 'FW SPA', 'FRAGRANCE OIL'),
(1321, '9000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MARCELINA SCENT', 'F.O SG', 'CPL', 'FRAGRANCE OIL'),
(1322, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MELON F.O', 'F.O M', '-', 'FRAGRANCE OIL'),
(1323, '10', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MILK SCENT', 'MILK F.O', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1324, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'MINT SCENT', 'F.O Mint', 'FW', 'FRAGRANCE OIL'),
(1325, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'NECTARINE BLOSSOM SCENT', 'F.O NB', 'FW', 'FRAGRANCE OIL'),
(1326, '50', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'OCEAN REEDS', 'F.O OR', 'FW SPA', 'FRAGRANCE OIL'),
(1327, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'OLD CHERRY F.O', 'F.O OS', '', 'FRAGRANCE OIL'),
(1328, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'OLIVE SCENT', 'F.O OS', '', 'FRAGRANCE OIL'),
(1329, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ORANGE MANDARIN F.O', 'F.O OM', '', 'FRAGRANCE OIL'),
(1330, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PAPAYA F.O', 'F.O P', '', 'FRAGRANCE OIL'),
(1331, '1160', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'PEPPERMINT SCENT', 'F.O PEPP', 'SOGOMI', 'FRAGRANCE OIL'),
(1332, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'POOR AND FRESCA', 'F.O PF', 'FE SPA', 'FRAGRANCE OIL'),
(1333, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'RASPBERRY SCENT', 'F.O RB', 'FW', 'FRAGRANCE OIL'),
(1334, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'ROSEMARY SCENT', 'F.O RM', 'FW SPA', 'FRAGRANCE OIL'),
(1335, '8000', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SALIHA', '', 'CPL', 'FRAGRANCE OIL'),
(1336, '100000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SPARKLE/ INCANTO SHINE', '', 'CPL', 'FRAGRANCE OIL'),
(1337, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'STRAWBERRY CHAMPAGNE', 'F.O SBC', 'CPL', 'FRAGRANCE OIL'),
(1338, '24000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'STRAWBERRY CREAMY', 'F.O SBCR', 'CPL', 'FRAGRANCE OIL'),
(1339, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'STRAWBERRY MILKSHAKE', 'F.O SBM', 'FW', 'FRAGRANCE OIL'),
(1340, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'STRAWBERRY SCENT', 'F.O SB', 'FW', 'FRAGRANCE OIL'),
(1341, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SWEET BERRY', 'F.O SBS', 'FW', 'FRAGRANCE OIL'),
(1342, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SWEET LEMON F.O', 'F.O SL', 'FW', 'FRAGRANCE OIL'),
(1343, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SWEET MILK SCENT', 'F.O SM', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1344, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SWEET ORANGE (FW SPA)', 'S.V SO', 'FW SPA', 'FRAGRANCE OIL'),
(1345, '15000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SWEET ORANGE SV', 'S.V SO', 'CPL', 'FRAGRANCE OIL'),
(1346, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SWEET PEA F.O', 'F.O SP', '', 'FRAGRANCE OIL'),
(1347, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'TUTTI-FRUTTI SCENT', 'F.O TF', 'FW', 'FRAGRANCE OIL'),
(1348, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'VANILLA SCENT', 'F.O V', 'FW', 'FRAGRANCE OIL'),
(1349, '1800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'WATERMELON SCENT', 'F.O WM', 'FW', 'FRAGRANCE OIL'),
(1350, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'YLANG YLANG F.O', 'F.O YY', 'CYLEINA ORGANIC', 'FRAGRANCE OIL'),
(1351, '1000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'DOVE GO FRESH SCENT', '', '', 'FRAGRANCE OIL'),
(1352, '8000', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BAMBOO FRESH/ FRESH BAMBOO', '', 'CPL', 'FRAGRANCE OIL'),
(1353, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BERRY BUBBLE', 'F.O BB', 'CPL', 'FRAGRANCE OIL'),
(1354, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BLUEBERRY F.O', 'F.O BB', 'FW Spavenue', 'FRAGRANCE OIL'),
(1355, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BUBBLE GUM F.O', 'F.O BG', 'FW Spavenue', 'FRAGRANCE OIL'),
(1356, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'BUBBLE GUM F.O – EL', 'F.O BGE', 'SOGOMI', 'FRAGRANCE OIL'),
(1357, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CALAMANSI F.O', 'F.O C', 'Newelle', 'FRAGRANCE OIL'),
(1358, '500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CANTALOUPE SCENT', 'F.O CT', 'FW Spavenue', 'FRAGRANCE OIL'),
(1359, '80000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CAPTIVATION/PURE SED.', 'F.O PS', 'FW Spavenue/CPL', 'FRAGRANCE OIL'),
(1360, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CHAMOMILE SCENT', 'F.O CHM', 'FW Spavenue', 'FRAGRANCE OIL'),
(1361, '700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CHERRY BLOSSOM SCENT', 'F.O CB', 'SoapScentral', 'FRAGRANCE OIL'),
(1362, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CHERRY F.O', 'F.O CH', 'SoapScentral', 'FRAGRANCE OIL'),
(1363, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CHERRY F.O – EVER LIGHT', 'F.O CHE', '', 'FRAGRANCE OIL'),
(1364, '5100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CHERRY STRAWBERRY F.O', 'F.O CS', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1365, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'COFFEE F.O', 'F.O-CO', 'FW Spavenue', 'FRAGRANCE OIL'),
(1366, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CRANBERRY', 'F.O CB', '-', 'FRAGRANCE OIL'),
(1367, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CUCUMBER F.O', 'F.O CC', '-', 'FRAGRANCE OIL'),
(1368, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'CUCUMBER MELON SCENT', 'F.O CCM', 'FW', 'FRAGRANCE OIL'),
(1369, '79760', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'FLORAL OASIS', 'F.O FO', 'CPL', 'FRAGRANCE OIL'),
(1370, '3500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'FLORAL POWDERY', 'F.O FP', 'FW SPA', 'FRAGRANCE OIL'),
(1371, '10000', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GINGER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1372, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GRAPE FRUIT SCENT', 'F.O GF', '-', 'FRAGRANCE OIL'),
(1373, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'GREEN APPLE SCENT', 'F.O GA', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1374, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'HONEY DEW MELON SCENT', 'F.O HDM', 'FW', 'FRAGRANCE OIL'),
(1375, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'KALAMANSI SV F.O', 'F.O APW SG', 'Newelle', 'FRAGRANCE OIL'),
(1376, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'KIWI SCENT', 'F.O K', 'FW Spavenue', 'FRAGRANCE OIL'),
(1377, '2800', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LAVENDER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1378, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LEMON F.O', 'F.O L', 'CPL', 'FRAGRANCE OIL'),
(1379, '28000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LEMON LIME F.O', 'F.O LL', 'CPL', 'FRAGRANCE OIL'),
(1380, '2000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LEMON SCENT', 'F.O L', 'FW Spavenue', 'FRAGRANCE OIL'),
(1381, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LOST & FANTASY', '', 'FW SPA', 'FRAGRANCE OIL'),
(1382, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LOVE SPELL', '', 'FW SPA', 'FRAGRANCE OIL'),
(1383, '2200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'LUSH SHEA BUTTER', '', 'FW SPA', 'FRAGRANCE OIL'),
(1384, '9000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MARCELINA SCENT', 'F.O SG', 'CPL', 'FRAGRANCE OIL'),
(1385, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MELON F.O', 'F.O M', '-', 'FRAGRANCE OIL'),
(1386, '10', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MILK SCENT', 'MILK F.O', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1387, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'MINT SCENT', 'F.O Mint', 'FW', 'FRAGRANCE OIL'),
(1388, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'NECTARINE BLOSSOM SCENT', 'F.O NB', 'FW', 'FRAGRANCE OIL'),
(1389, '50', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'OCEAN REEDS', 'F.O OR', 'FW SPA', 'FRAGRANCE OIL'),
(1390, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'OLD CHERRY F.O', 'F.O OS', '', 'FRAGRANCE OIL'),
(1391, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'OLIVE SCENT', 'F.O OS', '', 'FRAGRANCE OIL'),
(1392, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'ORANGE MANDARIN F.O', 'F.O OM', '', 'FRAGRANCE OIL'),
(1393, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PAPAYA F.O', 'F.O P', '', 'FRAGRANCE OIL'),
(1394, '1160', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'PEPPERMINT SCENT', 'F.O PEPP', 'SOGOMI', 'FRAGRANCE OIL'),
(1395, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'POOR AND FRESCA', 'F.O PF', 'FE SPA', 'FRAGRANCE OIL'),
(1396, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'RASPBERRY SCENT', 'F.O RB', 'FW', 'FRAGRANCE OIL'),
(1397, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'ROSEMARY SCENT', 'F.O RM', 'FW SPA', 'FRAGRANCE OIL'),
(1398, '8000', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SALIHA', '', 'CPL', 'FRAGRANCE OIL'),
(1399, '100000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SPARKLE/ INCANTO SHINE', '', 'CPL', 'FRAGRANCE OIL'),
(1400, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'STRAWBERRY CHAMPAGNE', 'F.O SBC', 'CPL', 'FRAGRANCE OIL'),
(1401, '24000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'STRAWBERRY CREAMY', 'F.O SBCR', 'CPL', 'FRAGRANCE OIL'),
(1402, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'STRAWBERRY MILKSHAKE', 'F.O SBM', 'FW', 'FRAGRANCE OIL'),
(1403, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'STRAWBERRY SCENT', 'F.O SB', 'FW', 'FRAGRANCE OIL'),
(1404, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SWEET BERRY', 'F.O SBS', 'FW', 'FRAGRANCE OIL'),
(1405, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SWEET LEMON F.O', 'F.O SL', 'FW', 'FRAGRANCE OIL'),
(1406, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SWEET MILK SCENT', 'F.O SM', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1407, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SWEET ORANGE (FW SPA)', 'S.V SO', 'FW SPA', 'FRAGRANCE OIL'),
(1408, '15000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SWEET ORANGE SV', 'S.V SO', 'CPL', 'FRAGRANCE OIL'),
(1409, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SWEET PEA F.O', 'F.O SP', '', 'FRAGRANCE OIL'),
(1410, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'TUTTI-FRUTTI SCENT', 'F.O TF', 'FW', 'FRAGRANCE OIL'),
(1411, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'VANILLA SCENT', 'F.O V', 'FW', 'FRAGRANCE OIL'),
(1412, '1800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'WATERMELON SCENT', 'F.O WM', 'FW', 'FRAGRANCE OIL'),
(1413, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'YLANG YLANG F.O', 'F.O YY', 'CYLEINA ORGANIC', 'FRAGRANCE OIL'),
(1414, '1000', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'DOVE GO FRESH SCENT', '', '', 'FRAGRANCE OIL'),
(1415, '8000', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BAMBOO FRESH/ FRESH BAMBOO', '', 'CPL', 'FRAGRANCE OIL'),
(1416, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BERRY BUBBLE', 'F.O BB', 'CPL', 'FRAGRANCE OIL'),
(1417, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BLUEBERRY F.O', 'F.O BB', 'FW Spavenue', 'FRAGRANCE OIL'),
(1418, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BUBBLE GUM F.O', 'F.O BG', 'FW Spavenue', 'FRAGRANCE OIL'),
(1419, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'BUBBLE GUM F.O – EL', 'F.O BGE', 'SOGOMI', 'FRAGRANCE OIL'),
(1420, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CALAMANSI F.O', 'F.O C', 'Newelle', 'FRAGRANCE OIL'),
(1421, '500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CANTALOUPE SCENT', 'F.O CT', 'FW Spavenue', 'FRAGRANCE OIL'),
(1422, '80000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CAPTIVATION/PURE SED.', 'F.O PS', 'FW Spavenue/CPL', 'FRAGRANCE OIL'),
(1423, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CHAMOMILE SCENT', 'F.O CHM', 'FW Spavenue', 'FRAGRANCE OIL'),
(1424, '700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CHERRY BLOSSOM SCENT', 'F.O CB', 'SoapScentral', 'FRAGRANCE OIL'),
(1425, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CHERRY F.O', 'F.O CH', 'SoapScentral', 'FRAGRANCE OIL'),
(1426, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CHERRY F.O – EVER LIGHT', 'F.O CHE', '', 'FRAGRANCE OIL'),
(1427, '5100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CHERRY STRAWBERRY F.O', 'F.O CS', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1428, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'COFFEE F.O', 'F.O-CO', 'FW Spavenue', 'FRAGRANCE OIL'),
(1429, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CRANBERRY', 'F.O CB', '-', 'FRAGRANCE OIL'),
(1430, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CUCUMBER F.O', 'F.O CC', '-', 'FRAGRANCE OIL'),
(1431, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'CUCUMBER MELON SCENT', 'F.O CCM', 'FW', 'FRAGRANCE OIL'),
(1432, '80000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'FLORAL OASIS', 'F.O FO', 'CPL', 'FRAGRANCE OIL'),
(1433, '3500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'FLORAL POWDERY', 'F.O FP', 'FW SPA', 'FRAGRANCE OIL'),
(1434, '10000', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GINGER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1435, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GRAPE FRUIT SCENT', 'F.O GF', '-', 'FRAGRANCE OIL'),
(1436, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'GREEN APPLE SCENT', 'F.O GA', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1437, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'HONEY DEW MELON SCENT', 'F.O HDM', 'FW', 'FRAGRANCE OIL'),
(1438, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'KALAMANSI SV F.O', 'F.O APW SG', 'Newelle', 'FRAGRANCE OIL'),
(1439, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'KIWI SCENT', 'F.O K', 'FW Spavenue', 'FRAGRANCE OIL'),
(1440, '3000', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LAVENDER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1441, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LEMON F.O', 'F.O L', 'CPL', 'FRAGRANCE OIL'),
(1442, '28000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LEMON LIME F.O', 'F.O LL', 'CPL', 'FRAGRANCE OIL'),
(1443, '2000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LEMON SCENT', 'F.O L', 'FW Spavenue', 'FRAGRANCE OIL'),
(1444, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LOST & FANTASY', '', 'FW SPA', 'FRAGRANCE OIL'),
(1445, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LOVE SPELL', '', 'FW SPA', 'FRAGRANCE OIL'),
(1446, '2200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'LUSH SHEA BUTTER', '', 'FW SPA', 'FRAGRANCE OIL'),
(1447, '9000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MARCELINA SCENT', 'F.O SG', 'CPL', 'FRAGRANCE OIL'),
(1448, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MELON F.O', 'F.O M', '-', 'FRAGRANCE OIL'),
(1449, '10', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MILK SCENT', 'MILK F.O', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1450, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'MINT SCENT', 'F.O Mint', 'FW', 'FRAGRANCE OIL'),
(1451, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'NECTARINE BLOSSOM SCENT', 'F.O NB', 'FW', 'FRAGRANCE OIL'),
(1452, '50', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'OCEAN REEDS', 'F.O OR', 'FW SPA', 'FRAGRANCE OIL'),
(1453, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'OLD CHERRY F.O', 'F.O OS', '', 'FRAGRANCE OIL'),
(1454, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'OLIVE SCENT', 'F.O OS', '', 'FRAGRANCE OIL'),
(1455, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ORANGE MANDARIN F.O', 'F.O OM', '', 'FRAGRANCE OIL'),
(1456, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PAPAYA F.O', 'F.O P', '', 'FRAGRANCE OIL'),
(1457, '1160', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'PEPPERMINT SCENT', 'F.O PEPP', 'SOGOMI', 'FRAGRANCE OIL'),
(1458, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'POOR AND FRESCA', 'F.O PF', 'FE SPA', 'FRAGRANCE OIL'),
(1459, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'RASPBERRY SCENT', 'F.O RB', 'FW', 'FRAGRANCE OIL'),
(1460, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'ROSEMARY SCENT', 'F.O RM', 'FW SPA', 'FRAGRANCE OIL'),
(1461, '8000', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SALIHA', '', 'CPL', 'FRAGRANCE OIL'),
(1462, '100000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SPARKLE/ INCANTO SHINE', '', 'CPL', 'FRAGRANCE OIL'),
(1463, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'STRAWBERRY CHAMPAGNE', 'F.O SBC', 'CPL', 'FRAGRANCE OIL'),
(1464, '24000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'STRAWBERRY CREAMY', 'F.O SBCR', 'CPL', 'FRAGRANCE OIL'),
(1465, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'STRAWBERRY MILKSHAKE', 'F.O SBM', 'FW', 'FRAGRANCE OIL'),
(1466, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'STRAWBERRY SCENT', 'F.O SB', 'FW', 'FRAGRANCE OIL'),
(1467, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SWEET BERRY', 'F.O SBS', 'FW', 'FRAGRANCE OIL'),
(1468, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SWEET LEMON F.O', 'F.O SL', 'FW', 'FRAGRANCE OIL'),
(1469, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SWEET MILK SCENT', 'F.O SM', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1470, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SWEET ORANGE (FW SPA)', 'S.V SO', 'FW SPA', 'FRAGRANCE OIL'),
(1471, '15000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SWEET ORANGE SV', 'S.V SO', 'CPL', 'FRAGRANCE OIL'),
(1472, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SWEET PEA F.O', 'F.O SP', '', 'FRAGRANCE OIL'),
(1473, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'TUTTI-FRUTTI SCENT', 'F.O TF', 'FW', 'FRAGRANCE OIL'),
(1474, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'VANILLA SCENT', 'F.O V', 'FW', 'FRAGRANCE OIL'),
(1475, '1800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'WATERMELON SCENT', 'F.O WM', 'FW', 'FRAGRANCE OIL'),
(1476, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'YLANG YLANG F.O', 'F.O YY', 'CYLEINA ORGANIC', 'FRAGRANCE OIL'),
(1477, '1000', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'DOVE GO FRESH SCENT', '', '', 'FRAGRANCE OIL'),
(1478, '8000', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BAMBOO FRESH/ FRESH BAMBOO', '', 'CPL', 'FRAGRANCE OIL'),
(1479, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BERRY BUBBLE', 'F.O BB', 'CPL', 'FRAGRANCE OIL'),
(1480, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BLUEBERRY F.O', 'F.O BB', 'FW Spavenue', 'FRAGRANCE OIL'),
(1481, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BUBBLE GUM F.O', 'F.O BG', 'FW Spavenue', 'FRAGRANCE OIL'),
(1482, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'BUBBLE GUM F.O – EL', 'F.O BGE', 'SOGOMI', 'FRAGRANCE OIL'),
(1483, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CALAMANSI F.O', 'F.O C', 'Newelle', 'FRAGRANCE OIL'),
(1484, '500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CANTALOUPE SCENT', 'F.O CT', 'FW Spavenue', 'FRAGRANCE OIL'),
(1485, '80000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CAPTIVATION/PURE SED.', 'F.O PS', 'FW Spavenue/CPL', 'FRAGRANCE OIL'),
(1486, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CHAMOMILE SCENT', 'F.O CHM', 'FW Spavenue', 'FRAGRANCE OIL'),
(1487, '700', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CHERRY BLOSSOM SCENT', 'F.O CB', 'SoapScentral', 'FRAGRANCE OIL'),
(1488, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CHERRY F.O', 'F.O CH', 'SoapScentral', 'FRAGRANCE OIL'),
(1489, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CHERRY F.O – EVER LIGHT', 'F.O CHE', '', 'FRAGRANCE OIL'),
(1490, '5100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CHERRY STRAWBERRY F.O', 'F.O CS', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1491, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'COFFEE F.O', 'F.O-CO', 'FW Spavenue', 'FRAGRANCE OIL'),
(1492, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CRANBERRY', 'F.O CB', '-', 'FRAGRANCE OIL'),
(1493, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CUCUMBER F.O', 'F.O CC', '-', 'FRAGRANCE OIL'),
(1494, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'CUCUMBER MELON SCENT', 'F.O CCM', 'FW', 'FRAGRANCE OIL'),
(1495, '79760', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'FLORAL OASIS', 'F.O FO', 'CPL', 'FRAGRANCE OIL'),
(1496, '3500', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'FLORAL POWDERY', 'F.O FP', 'FW SPA', 'FRAGRANCE OIL'),
(1497, '10000', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GINGER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1498, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GRAPE FRUIT SCENT', 'F.O GF', '-', 'FRAGRANCE OIL'),
(1499, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'GREEN APPLE SCENT', 'F.O GA', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1500, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'HONEY DEW MELON SCENT', 'F.O HDM', 'FW', 'FRAGRANCE OIL'),
(1501, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'KALAMANSI SV F.O', 'F.O APW SG', 'Newelle', 'FRAGRANCE OIL'),
(1502, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'KIWI SCENT', 'F.O K', 'FW Spavenue', 'FRAGRANCE OIL'),
(1503, '2800', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LAVENDER SCENT', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(1504, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LEMON F.O', 'F.O L', 'CPL', 'FRAGRANCE OIL'),
(1505, '28000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LEMON LIME F.O', 'F.O LL', 'CPL', 'FRAGRANCE OIL'),
(1506, '2000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LEMON SCENT', 'F.O L', 'FW Spavenue', 'FRAGRANCE OIL'),
(1507, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LOST & FANTASY', '', 'FW SPA', 'FRAGRANCE OIL'),
(1508, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LOVE SPELL', '', 'FW SPA', 'FRAGRANCE OIL'),
(1509, '2200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'LUSH SHEA BUTTER', '', 'FW SPA', 'FRAGRANCE OIL'),
(1510, '9000', 0, 'LIQUID', 3000, 0, 0, 0, '2022-05-10 00:00:00', 'MARCELINA SCENT', 'F.O SG', 'CPL', 'FRAGRANCE OIL'),
(1511, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MELON F.O', 'F.O M', '-', 'FRAGRANCE OIL'),
(1512, '10', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MILK SCENT', 'MILK F.O', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1513, '3000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'MINT SCENT', 'F.O Mint', 'FW', 'FRAGRANCE OIL'),
(1514, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'NECTARINE BLOSSOM SCENT', 'F.O NB', 'FW', 'FRAGRANCE OIL'),
(1515, '50', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'OCEAN REEDS', 'F.O OR', 'FW SPA', 'FRAGRANCE OIL'),
(1516, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'OLD CHERRY F.O', 'F.O OS', '', 'FRAGRANCE OIL'),
(1517, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'OLIVE SCENT', 'F.O OS', '', 'FRAGRANCE OIL'),
(1518, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ORANGE MANDARIN F.O', 'F.O OM', '', 'FRAGRANCE OIL'),
(1519, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PAPAYA F.O', 'F.O P', '', 'FRAGRANCE OIL'),
(1520, '1160', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'PEPPERMINT SCENT', 'F.O PEPP', 'SOGOMI', 'FRAGRANCE OIL'),
(1521, '300', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'POOR AND FRESCA', 'F.O PF', 'FE SPA', 'FRAGRANCE OIL'),
(1522, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'RASPBERRY SCENT', 'F.O RB', 'FW', 'FRAGRANCE OIL'),
(1523, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'ROSEMARY SCENT', 'F.O RM', 'FW SPA', 'FRAGRANCE OIL'),
(1524, '8000', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SALIHA', '', 'CPL', 'FRAGRANCE OIL'),
(1525, '100000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SPARKLE/ INCANTO SHINE', '', 'CPL', 'FRAGRANCE OIL'),
(1526, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'STRAWBERRY CHAMPAGNE', 'F.O SBC', 'CPL', 'FRAGRANCE OIL'),
(1527, '24000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'STRAWBERRY CREAMY', 'F.O SBCR', 'CPL', 'FRAGRANCE OIL'),
(1528, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'STRAWBERRY MILKSHAKE', 'F.O SBM', 'FW', 'FRAGRANCE OIL'),
(1529, '800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'STRAWBERRY SCENT', 'F.O SB', 'FW', 'FRAGRANCE OIL'),
(1530, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SWEET BERRY', 'F.O SBS', 'FW', 'FRAGRANCE OIL'),
(1531, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SWEET LEMON F.O', 'F.O SL', 'FW', 'FRAGRANCE OIL'),
(1532, '100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SWEET MILK SCENT', 'F.O SM', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(1533, '1100', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SWEET ORANGE (FW SPA)', 'S.V SO', 'FW SPA', 'FRAGRANCE OIL'),
(1534, '15000', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SWEET ORANGE SV', 'S.V SO', 'CPL', 'FRAGRANCE OIL'),
(1535, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SWEET PEA F.O', 'F.O SP', '', 'FRAGRANCE OIL'),
(1536, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'TUTTI-FRUTTI SCENT', 'F.O TF', 'FW', 'FRAGRANCE OIL'),
(1537, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'VANILLA SCENT', 'F.O V', 'FW', 'FRAGRANCE OIL'),
(1538, '1800', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'WATERMELON SCENT', 'F.O WM', 'FW', 'FRAGRANCE OIL'),
(1539, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'YLANG YLANG F.O', 'F.O YY', 'CYLEINA ORGANIC', 'FRAGRANCE OIL'),
(1540, '1000', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'DOVE GO FRESH SCENT', '', '', 'FRAGRANCE OIL'),
(1541, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'WS CHRISTMAS BERRY', 'F.O WSCB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1542, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'WS PEPPERMINT', 'F.O WSPM', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1543, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'WS SNOWBERRY', 'F.O WSSB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1544, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'WS Manila Hotel Scent', 'F.O WSMH', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1545, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'WS CHRISTMAS BERRY', 'F.O WSCB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1546, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'WS PEPPERMINT', 'F.O WSPM', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1547, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'WS SNOWBERRY', 'F.O WSSB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1548, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'WS Manila Hotel Scent', 'F.O WSMH', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1549, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'WS CHRISTMAS BERRY', 'F.O WSCB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1550, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'WS PEPPERMINT', 'F.O WSPM', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1551, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'WS SNOWBERRY', 'F.O WSSB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1552, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'WS Manila Hotel Scent', 'F.O WSMH', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1553, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'WS CHRISTMAS BERRY', 'F.O WSCB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1554, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'WS PEPPERMINT', 'F.O WSPM', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1555, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'WS SNOWBERRY', 'F.O WSSB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1556, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'WS Manila Hotel Scent', 'F.O WSMH', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1557, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'WS CHRISTMAS BERRY', 'F.O WSCB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1558, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'WS PEPPERMINT', 'F.O WSPM', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1559, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'WS SNOWBERRY', 'F.O WSSB', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1560, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'WS Manila Hotel Scent', 'F.O WSMH', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(1561, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Carrageenan ci-604', '', '', 'FOOD GRADE'),
(1562, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Carrageenan for meet', '', '', 'FOOD GRADE'),
(1563, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Citrus pectin -food grade-', '', 'Dalkem', 'FOOD GRADE'),
(1564, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Gelatin (ferna)', '', '', 'FOOD GRADE'),
(1565, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Ginger', '', '', 'FOOD GRADE'),
(1566, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Ginger powder', '', '', 'FOOD GRADE'),
(1567, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Gulaman (Queen brand)', '', '', 'FOOD GRADE'),
(1568, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Gulaman (sarap pinoy brand)', '', '', 'FOOD GRADE'),
(1569, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Honey pure', '', '', 'FOOD GRADE'),
(1570, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Lemon flavor oil g.leaves', 'L.FLA', 'JNRM Corp.', 'FOOD GRADE'),
(1571, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Lemon fruit', '', '', 'FOOD GRADE'),
(1572, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'lemonade juice power', '', '', 'FOOD GRADE'),
(1573, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Orange juice powder', '', '', 'FOOD GRADE'),
(1574, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Sodium floride', '', '', 'FOOD GRADE'),
(1575, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Sugar - white -', '', 'KORACH', 'FOOD GRADE'),
(1576, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'SUGAR BROWN', '', '', 'FOOD GRADE'),
(1577, '0', 0, '', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Turmeric powder', '', '', 'FOOD GRADE'),
(1578, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Zero Cal Sweetener', 'CAL-SW', '', 'FOOD GRADE'),
(1579, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Carrageenan ci-604', '', '', 'FOOD GRADE'),
(1580, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Carrageenan for meet', '', '', 'FOOD GRADE'),
(1581, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Citrus pectin -food grade-', '', 'Dalkem', 'FOOD GRADE'),
(1582, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Gelatin (ferna)', '', '', 'FOOD GRADE'),
(1583, '0', 1200, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Ginger', '', '', 'FOOD GRADE'),
(1584, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Ginger powder', '', '', 'FOOD GRADE'),
(1585, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Gulaman (Queen brand)', '', '', 'FOOD GRADE'),
(1586, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Gulaman (sarap pinoy brand)', '', '', 'FOOD GRADE'),
(1587, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Honey pure', '', '', 'FOOD GRADE'),
(1588, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Lemon flavor oil g.leaves', 'L.FLA', 'JNRM Corp.', 'FOOD GRADE'),
(1589, '0', 3000, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Lemon fruit', '', '', 'FOOD GRADE'),
(1590, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'lemonade juice power', '', '', 'FOOD GRADE'),
(1591, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Orange juice powder', '', '', 'FOOD GRADE'),
(1592, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Sodium floride', '', '', 'FOOD GRADE'),
(1593, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Sugar - white -', '', 'KORACH', 'FOOD GRADE'),
(1594, '0', 2000, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'SUGAR BROWN', '', '', 'FOOD GRADE'),
(1595, '0', 0, '', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Turmeric powder', '', '', 'FOOD GRADE'),
(1596, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-04 00:00:00', 'Zero Cal Sweetener', 'CAL-SW', '', 'FOOD GRADE'),
(1597, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Carrageenan ci-604', '', '', 'FOOD GRADE'),
(1598, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Carrageenan for meet', '', '', 'FOOD GRADE'),
(1599, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Citrus pectin -food grade-', '', 'Dalkem', 'FOOD GRADE'),
(1600, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Gelatin (ferna)', '', '', 'FOOD GRADE'),
(1601, '1200', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Ginger', '', '', 'FOOD GRADE'),
(1602, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Ginger powder', '', '', 'FOOD GRADE'),
(1603, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Gulaman (Queen brand)', '', '', 'FOOD GRADE'),
(1604, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Gulaman (sarap pinoy brand)', '', '', 'FOOD GRADE'),
(1605, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Honey pure', '', '', 'FOOD GRADE'),
(1606, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Lemon flavor oil g.leaves', 'L.FLA', 'JNRM Corp.', 'FOOD GRADE'),
(1607, '3000', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Lemon fruit', '', '', 'FOOD GRADE'),
(1608, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'lemonade juice power', '', '', 'FOOD GRADE'),
(1609, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Orange juice powder', '', '', 'FOOD GRADE'),
(1610, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Sodium floride', '', '', 'FOOD GRADE'),
(1611, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Sugar - white -', '', 'KORACH', 'FOOD GRADE'),
(1612, '2000', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'SUGAR BROWN', '', '', 'FOOD GRADE'),
(1613, '0', 0, '', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Turmeric powder', '', '', 'FOOD GRADE'),
(1614, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-05 00:00:00', 'Zero Cal Sweetener', 'CAL-SW', '', 'FOOD GRADE'),
(1615, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Carrageenan ci-604', '', '', 'FOOD GRADE'),
(1616, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Carrageenan for meet', '', '', 'FOOD GRADE'),
(1617, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Citrus pectin -food grade-', '', 'Dalkem', 'FOOD GRADE'),
(1618, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Gelatin (ferna)', '', '', 'FOOD GRADE'),
(1619, '1200', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Ginger', '', '', 'FOOD GRADE'),
(1620, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Ginger powder', '', '', 'FOOD GRADE'),
(1621, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Gulaman (Queen brand)', '', '', 'FOOD GRADE'),
(1622, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Gulaman (sarap pinoy brand)', '', '', 'FOOD GRADE'),
(1623, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Honey pure', '', '', 'FOOD GRADE'),
(1624, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Lemon flavor oil g.leaves', 'L.FLA', 'JNRM Corp.', 'FOOD GRADE'),
(1625, '3000', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Lemon fruit', '', '', 'FOOD GRADE'),
(1626, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'lemonade juice power', '', '', 'FOOD GRADE'),
(1627, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Orange juice powder', '', '', 'FOOD GRADE'),
(1628, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Sodium floride', '', '', 'FOOD GRADE'),
(1629, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Sugar - white -', '', 'KORACH', 'FOOD GRADE'),
(1630, '2000', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'SUGAR BROWN', '', '', 'FOOD GRADE'),
(1631, '0', 0, '', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Turmeric powder', '', '', 'FOOD GRADE'),
(1632, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-06 00:00:00', 'Zero Cal Sweetener', 'CAL-SW', '', 'FOOD GRADE'),
(1633, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Carrageenan ci-604', '', '', 'FOOD GRADE'),
(1634, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Carrageenan for meet', '', '', 'FOOD GRADE'),
(1635, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Citrus pectin -food grade-', '', 'Dalkem', 'FOOD GRADE'),
(1636, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Gelatin (ferna)', '', '', 'FOOD GRADE'),
(1637, '1200', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Ginger', '', '', 'FOOD GRADE'),
(1638, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Ginger powder', '', '', 'FOOD GRADE'),
(1639, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Gulaman (Queen brand)', '', '', 'FOOD GRADE'),
(1640, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Gulaman (sarap pinoy brand)', '', '', 'FOOD GRADE'),
(1641, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Honey pure', '', '', 'FOOD GRADE'),
(1642, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Lemon flavor oil g.leaves', 'L.FLA', 'JNRM Corp.', 'FOOD GRADE'),
(1643, '3000', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Lemon fruit', '', '', 'FOOD GRADE'),
(1644, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'lemonade juice power', '', '', 'FOOD GRADE'),
(1645, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Orange juice powder', '', '', 'FOOD GRADE'),
(1646, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Sodium floride', '', '', 'FOOD GRADE'),
(1647, '0', 0, 'POWDER', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Sugar - white -', '', 'KORACH', 'FOOD GRADE'),
(1648, '2000', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'SUGAR BROWN', '', '', 'FOOD GRADE'),
(1649, '0', 0, '', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Turmeric powder', '', '', 'FOOD GRADE'),
(1650, '0', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-10 00:00:00', 'Zero Cal Sweetener', 'CAL-SW', '', 'FOOD GRADE'),
(1653, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Ac Care 1000', 'AC-1K', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(1654, '200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Ac Care 1000', 'AC-1K', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(1655, '1200', 0, 'LIQUID', 0, 0, 0, 0, '2022-05-11 00:00:00', 'DIPROPELENE GLYCOL', 'DPG', 'FW SPA', 'RAW MATERIALS'),
(1656, '1100', 0, 'POWDER', 0, 0, 0, 0, '2022-05-03 00:00:00', 'Activated Charcoal Fine', 'AC-FINE', 'Sogomi', 'RAW MATERIALS'),
(1663, '-2000', 0, 'SOLID', 0, 0, 0, 0, '2023-10-05 00:00:00', 'CLARTUR CLEAR', 'CLARTUR-C', 'Sogomi', 'RAW MATERIALS');

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
('1#117', '1', '0itkputz'),
('abc#122', 'abc', 'y94npyle'),
('abcde#423', 'abcde', 'k36r7u4u'),
('admin#578', 'admin', 'admin'),
('altes#151', 'altes', 'bryanken'),
('asdv#688', 'asdv', 'qgbm9y4q'),
('bb#661', 'bb', 'gghz7js8'),
('Besa#828', 'besa', 'password'),
('bryanken#563', 'bryanken', 'admin'),
('bryanken00#810', 'bryanken00', 'bryanken'),
('Cashier#711', 'Cashier', '3mo1nisp'),
('cc#633', 'cc', 'k1rdpe06'),
('cca#852', 'cca', '3cxfmkby'),
('dd#883', 'dd', 'h0d78b6c'),
('ddd#568', 'ddd', '08xd2s72'),
('ggu#286', 'ggu', 'fty1vtmq'),
('Ken#810', 'Ken', 'c1fc6hb7'),
('kkkk#634', 'kkkk', 'ofokh8a5'),
('raven#828', 'raven', 'password'),
('ravenrose#583', 'ravenrose', 'l4o499fk'),
('Rodney#319', 'rodney', 'password'),
('s#875', 's', 'zzwc4gh0'),
('s#949', 's', 'zzwc4gh0'),
('sdv#631', 'sdv', 'bzsi75e4'),
('ss#693', 'ss', 'vdpp9gkp'),
('testing#650', 'testing', 'password'),
('testing001#533', 'testing001', 'test');

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
('1#117', '1', '1', '1', '1', '1', '', 0, 'test@gmail.com', ''),
('abc#122', 'Altes', 'Bryan Ken', 'S', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'KBNsss', 0, 'bryanken01230@gmail.com', ''),
('abcde#423', 'berenguila', 'raven', 'a', 'luklukan Bilibiran Binangonan, Rizal', '4234324', 'secret', 0, 'ravenberenguila@gmail.com', ''),
('admin#578', 'B', 'Altes', 'A', 'Angono, Rizal', '09123456', '123', 0, 'test@gmail.com', 'rebranding'),
('altes#151', 'Altes', 'Ken', 'S', 'Angono Rizal', '09158350780', 'Kojic', 0, 'testing@gmail.com', ''),
('asdv#688', 'Altes', 'Bryan', 'S.', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'KBN', 0, 'bryanken01230@gmail.com', ''),
('bb#661', 'Altes', 'Bryan', 'S.', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'KBN', 0, 'bryanken01230@gmail.com', ''),
('Besa#828', 'Raven', 'Raven', 'R', 'Rizal', '123', '', 0, 'Raven@gmail.com', 'rebranding'),
('bryanken#563', 'Altes', 'Bryan', 'S.', 'Angono Rizal', '09123456789', 'Kojic', 0, 'bryanken01230@gmail.com', ''),
('bryanken00#810', 'Altes', 'Bryan Ken', 'S', 'Angono Rizal', '09158350780', '', 0, 'test@gmail.com', 'rebranding'),
('Cashier Walk-In', 'KBN', 'Cashier', 'K', 'Walk-IN', '00000000000', '', 0, 'Walk-In@gmail.com', ''),
('cc#633', 'besa', 'raul', 'a', 'testing Bangkal Abucay, Bataan', '4234324', 'testing', 0, 'besaraul', ''),
('cca#852', 'Altes', 'Bryan Ken', 'S', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'Kojic, Alcohol', 0, 'bryanken01230@gmail.com', ''),
('dd#883', 'test', 'testing', 'a', 'testadd Gosoon Carmen, Agusan Del Norte', '423423', 'test', 0, 'test@', ''),
('ddd#568', 'Altes', 'Bryan Ken', 'S', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'Kojic', 0, 'bryanken01230@gmail.com', ''),
('ggu#286', 'Altes', 'Bryan Ken', 'S', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'KBN', 0, 'bryanken01230@gmail.com', ''),
('kkkk#634', 'All', 'Tee', 'S', 'Angono Rizal', '09158350780', 'Kojic', 0, 'bryanken01230@gmail.com', ''),
('raven#828', 'Raven', 'Raven', 'R', 'Rizal', '123', '', 0, 'Raven@gmail.com', 'rebranding'),
('ravenrose#583', 'berenguila', 'raven', 'a', 'luklukan Bilibiran Binangonan, Rizal', '4234324', 'secret', 0, 'ravenberenguila@gmail.com', 'KBN'),
('Rodney#319', 'Altes', 'Bryan Ken', 'S', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'KBN', 0, 'bryanken01230@gmail.com', 'rebranding'),
('s#875', '2', '3', 's', 's', '1', '', 0, 'test@gmail.com', ''),
('s#949', '2', '3', 's', 's', '1', '', 0, 'test@gmail.com', ''),
('sdv#631', 'Altes', 'Bryan', 'S.', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'KBN', 0, 'bryanken01230@gmail.com', ''),
('ss#693', 'Altes', 'Bryan Ken', 'S', 'Del Rosatio st. Brgy Kalayaan Angono Rizal Kalayaan Angono, Rizal', '09158350780', 'KBN', 0, 'bryanken01230@gmail.com', ''),
('testing#650', 'Testing', 'Account', 'A', 'testing', '123', '', 0, 'testingAccount@gmail.com', ''),
('testing001#533', 'TestingLangTo', 'Test', 'T', 'Cainta Rizal', '09123456789', 'Test', 0, 'Testing@gmail.com', '');

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

--
-- Dumping data for table `tblmonthlysummary`
--

INSERT INTO `tblmonthlysummary` (`itemID`, `MATERIAL_NAME`, `CODE_NAME`, `CONTROL_NUMBER`, `SUPPLIER`, `CATEGORIES`) VALUES
(1, 'Ac Care 1000', 'AC-1K', 'R-001', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(2, 'Acnibio Mxr', 'PR-A', 'R-002', 'Sogomi', 'RAW MATERIALS'),
(3, 'Activated Charcoal Fine', 'AC-FINE', 'R-003', 'Sogomi', 'RAW MATERIALS'),
(4, 'Alcogel Beads', 'AL-B', 'R-004', 'Fw Spa', 'RAW MATERIALS'),
(5, 'Alginate', 'AL-G', 'R-005', 'Fw Spa', 'RAW MATERIALS'),
(6, 'Allantoin', 'D-ALT', 'R-006', 'Sogomi', 'RAW MATERIALS'),
(7, 'Alluminum Choride', 'A-CHLO', 'R-007', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(8, 'Antibac- BKC', 'AB-BKC', 'R-137', 'Sogomi', 'RAW MATERIALS'),
(9, 'Arrow Root', 'A-ROOT', 'R-008', 'Green dahan', 'RAW MATERIALS'),
(10, 'Azeglyjic optima', '3 IN 1 WHITE', 'R-009', 'SOGOMI', 'RAW MATERIALS'),
(11, 'Baking Soda', 'A-BS', 'R-010', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(12, 'Bamboo Wood Charcoal', 'AC-CHARCOAL', 'R-011', 'Fw Spa', 'RAW MATERIALS'),
(13, 'Beetox H', 'B-H', 'R-012', 'Fw Spa', 'RAW MATERIALS'),
(14, 'Behentrimonium', 'B-TRI', 'R-013', 'Fw Spa', 'RAW MATERIALS'),
(15, 'Bentonite', 'B-NITE', 'R-014', 'Fw Spa', 'RAW MATERIALS'),
(16, 'Bust Up', '', 'R-132', 'SOGOMI', 'RAW MATERIALS'),
(17, 'BUTYLENE GLYCOL 1,3', 'BC-1,3', 'R-016', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(18, 'Butyl-Hydroxytotulene', 'BHT', 'R-015', 'Fw Spa', 'RAW MATERIALS'),
(19, 'CALCIUM CHLORIDE', 'CAL-CHLO', '', 'TRUE MAN DESICANTS', 'RAW MATERIALS'),
(20, 'CALCIUM SULFATE DEHYDRATE', 'CAL-SD', 'R-018', 'DALKEN', 'RAW MATERIALS'),
(21, 'CAMPHOR', 'C-PR', 'R-019', 'Fw Spa', 'RAW MATERIALS'),
(22, 'CARBOMER 940', 'POLYMER', 'R-020', 'Sogomi', 'RAW MATERIALS'),
(23, 'CARBOPOL ULTREZ 30', 'CU-30', 'R-021', 'Sogomi', 'RAW MATERIALS'),
(24, 'CAUSTIC SODA', 'CSP', 'R-022', 'CHEMI-SOURCE', 'RAW MATERIALS'),
(25, 'CDEA', 'F-BOOSTER1', 'R-023', 'SOGOMI', 'RAW MATERIALS'),
(26, 'CETEARETH-20', 'CT-20', 'R-024', 'Fw Spa', 'RAW MATERIALS'),
(27, 'CHEM BETAINE APC', 'CB-APC', 'R-029', 'Sogomi', 'RAW MATERIALS'),
(28, 'CHEMCCINATE DSLSK', 'C-DSLSK', 'R-030', 'Chemco Phil. Inc', 'RAW MATERIALS'),
(29, 'CITRIC ACID', 'PH ADJ', 'R-031', 'Fw Spa', 'RAW MATERIALS'),
(30, 'CLARTUR CLEAR', 'CLARTUR-C', 'R-032', 'Sogomi', 'RAW MATERIALS'),
(31, 'CLARTUR CLEAR', 'CLARTUR-C', 'R-032', 'Fw Spa', 'RAW MATERIALS'),
(32, 'CMEA', 'F. BOOSTER 2', 'R-033', 'Fw Spa', 'RAW MATERIALS'),
(33, 'COCOAMODO BETAINE', 'CA-BT', 'R-034', 'Fw Spa', 'RAW MATERIALS'),
(34, 'COFFEE SCRUB', 'ACTIVE-COF', 'R-035', 'MOM CARES', 'RAW MATERIALS'),
(35, 'CYCLOMETHICONE', 'CYCLO-M', 'R-036', 'Fw Spa', 'RAW MATERIALS'),
(36, 'CYCLOPENTASILOXANE', 'CYCLO-S', 'R-037', 'Fw Spa', 'RAW MATERIALS'),
(37, 'DECYL GLUCOSIDE', 'DEC-G', 'R-038', 'Fw Spa', 'RAW MATERIALS'),
(38, 'DERMA-CB', '', 'R-130', '', 'RAW MATERIALS'),
(39, 'DIMETHICONE', 'SILICONE-D', 'R-039', 'FW SPA', 'RAW MATERIALS'),
(40, 'DIMETHICONE TRIMETHYL', 'SILICONE-TRI', 'R-040', 'FW SPA', 'RAW MATERIALS'),
(41, 'DIMETHYLSILOXANE', 'D-SILOX', 'R-041', 'FW SPA', 'RAW MATERIALS'),
(42, 'DIPROPELENE GLYCOL', 'DPG', 'R-042', 'FW SPA', 'RAW MATERIALS'),
(43, 'EARTH-D', 'E-D', 'R-043', 'DALKEN', 'RAW MATERIALS'),
(44, 'EMMULIUM DELTA', 'E-DELTA', 'R-129', 'KALIO-REXI', 'RAW MATERIALS'),
(45, 'ETHYLENEDIAMINE TETRAACETIC ACID', 'EDTA', 'R-044', 'SOGOMI', 'RAW MATERIALS'),
(46, 'FDP-C WHITE 3', 'FDP-CW3', 'R-045', 'EUNICE inc.', 'RAW MATERIALS'),
(47, 'GAL SOFT SCI 85', 'GS-S85', 'R-046', '', 'RAW MATERIALS'),
(48, 'GALSIK/ MIGOQUAT C30/ POLYQUATERNIUM 7/ PQ7', 'G-SILK', 'R-047', 'FW SPA', 'RAW MATERIALS'),
(49, 'GINGER POWDER', 'GIN-P', '', '', 'RAW MATERIALS'),
(50, 'GLUCAM P-20', 'G-P20', 'R-048', 'CHEMCO', 'RAW MATERIALS'),
(51, 'GLYCERIN SOAP BASE', 'G-SB', 'R-049', 'FW SPA', 'RAW MATERIALS'),
(52, 'GLYCERINE-MIGOSIL GLY/ LIQUID CERINE', 'MOISTURIZER', 'R-050', 'SOGOMI', 'RAW MATERIALS'),
(53, 'GLYCOLIC ACID', 'EXFOL-GAHA', 'R-053', 'FW SPA', 'RAW MATERIALS'),
(54, 'GREEN CENTELLA', 'G-CEN', 'R-054', 'CHEMCO', 'RAW MATERIALS'),
(55, 'GUAR GUM', 'G-GUM', 'R-055', 'SOGOMI', 'RAW MATERIALS'),
(56, 'HMC POLYMER', 'HMC-P', 'R-056', 'FW SPA', 'RAW MATERIALS'),
(57, 'HYAURONIC ACID GEL', 'HA-GEL', 'R-057', 'FW SPA', 'RAW MATERIALS'),
(58, 'HYDROLIZED KERATIN', 'HYDRO-K', 'R-058', 'SOGOMI', 'RAW MATERIALS'),
(59, 'HYDROXY ETHYL CELLULOSE', 'HYDRO-EC', 'R-059', 'FW SPA', 'RAW MATERIALS'),
(60, 'ISODODICANE', 'SOLVENT-ISODO', 'R-060', 'FW SPA', 'RAW MATERIALS'),
(61, 'ISOPROPYL MYRISTATE/ MIGOSIL IPM', 'E-IPM', 'R-077', 'SOGOMI', 'RAW MATERIALS'),
(62, 'KAOLIN CLAY', 'K-CLAY', 'R-061', 'FW SPA', 'RAW MATERIALS'),
(63, 'KOJIC ACID', 'ACTIVE-K', 'R-062', 'SOGOMI', 'RAW MATERIALS'),
(64, 'LACTIC ACID', 'PH-ACID', 'R-063', 'SOGOMI', 'RAW MATERIALS'),
(65, 'LACTIC ACID', 'PH-ACID', 'R-063', 'FW SPA', 'RAW MATERIALS'),
(66, 'LACTOMOIST', 'BUFFERING AGENT', 'R-064', 'SOGOMI', 'RAW MATERIALS'),
(67, 'LAURIC ACID', 'L-ACID', 'R-065', 'FW SPA', 'RAW MATERIALS'),
(68, 'LAVENDER MASK PACK', 'LAV-MASK', '', '', 'RAW MATERIALS'),
(69, 'LUZINCI WHITE', 'TRANEXAMMIC ACID', 'R-066', 'SOGOMI', 'RAW MATERIALS'),
(70, 'MAGNESIUM OXIDE', 'MAG-OX', 'R-067', 'DALKEM', 'RAW MATERIALS'),
(71, 'MANDELIC ACID', 'M-ACID', 'R-069', 'SOGOMI', 'RAW MATERIALS'),
(72, 'MENTHOL CRYSTAL', 'M-CRYSTAL', 'R-070', 'FW SPA', 'RAW MATERIALS'),
(73, 'MERQUAT 3330', 'M-3330', 'R-071', 'CHEMCO', 'RAW MATERIALS'),
(74, 'METHYL SALICYLATE', 'M-SALICYLATE', 'R-131', 'FW SPA', 'RAW MATERIALS'),
(75, 'MICA W7103- B. WHITE', 'MICA WHITE', 'R-072', 'SOGOMI', 'RAW MATERIALS'),
(76, 'MICELLAR ACID', 'MC-ACID', 'R-073', 'FW SPA', 'RAW MATERIALS'),
(77, 'MICELLAR WATER', 'MC-H2O', 'R-074', 'FW SPA', 'RAW MATERIALS'),
(78, 'MIGOQUAT C30/CETRIMONIUM CHLORIDE', 'MQ-C30', 'R-075', 'SOGOMI', 'RAW MATERIALS'),
(79, 'MINERAL WATER', 'AQUA', 'R-126', 'ANGELOUS', 'RAW MATERIALS'),
(80, 'MYRISTIC ACID', 'MR-ACID', 'R-080', 'FW SPA', 'RAW MATERIALS'),
(81, 'NIACINAMIDE', 'VITAMIN B3', 'R-081', 'FW SPA', 'RAW MATERIALS'),
(82, 'OCTYL METHOXY CINNAMATE', 'SUNSHIELD OMC', 'R-083', 'SOGOMI', 'RAW MATERIALS'),
(83, 'PANTHENOL', 'P-TH', 'R-084', 'FW SPA', 'RAW MATERIALS'),
(84, 'PAPAIN CRYSTAL/PAPAIN ENZYME/ PAPAIN', 'ACTIVE-P', 'R-085', 'FW SPA', 'RAW MATERIALS'),
(85, 'PEARL WHITE', 'P-WHITE', 'R-088', '', 'RAW MATERIALS'),
(86, 'PETROLEUM JELLY', 'LUBRICANT', 'R-089', 'FW SPA', 'RAW MATERIALS'),
(87, 'PETROLEUM JELLY', 'LUBRICANT', 'R-089', 'MEGAWISE', 'RAW MATERIALS'),
(88, 'PHENOX ETHYL GLYCERINE', 'PR-EG', 'R-90', 'FW SPA', 'RAW MATERIALS'),
(89, 'PHENOXYETHANOL', 'PR-P', 'R-091', 'FW SPA', 'RAW MATERIALS'),
(90, 'PHM-BIGUANITE', 'PHM-B', 'R-092', 'MOM CARES', 'RAW MATERIALS'),
(91, 'PHYTPEEL 500-APRICOT', 'PAS-500', 'R-093', 'FW SPA', 'RAW MATERIALS'),
(92, 'POLYVINYL ALCOHOL BP24', 'PVA-BP24', 'R-095', 'DALKEM', 'RAW MATERIALS'),
(93, 'POLYVINYL PYRROLYDONE K-30', 'PV-P-K30', 'R-096', 'DALKEM', 'RAW MATERIALS'),
(94, 'POTASIUM ALLUM POWDER', 'P-ALP', 'R-097', 'DALKEM', 'RAW MATERIALS'),
(95, 'POTASIUM HYDROXIDE', 'PS-HYDRO', 'R-098', 'FW SPA', 'RAW MATERIALS'),
(96, 'POTASIUM SORBATE', 'FG.PR-PS', 'R-099', '', 'RAW MATERIALS'),
(97, 'PROPYLENE GLYCOL/ MIGOSIL PPG/ PROCOL', 'E/PPG', 'R-078', 'FW SPA', 'RAW MATERIALS'),
(98, 'PUROLAN TEC', 'P-TEC', 'R-102', 'CHEMCO', 'RAW MATERIALS'),
(99, 'PUROLAN-IDD', 'P-IDD', 'R-101', 'CHEMCO', 'RAW MATERIALS'),
(100, 'QUICK PEARL PK3', 'QP- PK3', 'R-103', 'CHEMCO', 'RAW MATERIALS'),
(101, 'REJUDERM VA', 'VITAMIN A', 'R-104', '', 'RAW MATERIALS'),
(102, 'ROSE MARY WATER', 'ROSE-AQUA', '', '', 'RAW MATERIALS'),
(103, 'SALICYLIC ACID', 'EXFOLSBHA', 'R-105', 'SOGOMI', 'RAW MATERIALS'),
(104, 'SCI NEEDLE', 'SCI-N', 'R-135', 'FW SPA', 'RAW MATERIALS'),
(105, 'SCI POWDER', 'SCI-P', 'R-134', 'FW SPA', 'RAW MATERIALS'),
(106, 'SHEA BUTTER', 'A-SB', 'R-106', 'FW SPA', 'RAW MATERIALS'),
(107, 'SKIM MILK', 'S-MILK', 'R-107', 'FW SPA', 'RAW MATERIALS'),
(108, 'SODIUM BENZOATE', 'FG.PR-SB', 'R-110', 'FW SPA', 'RAW MATERIALS'),
(109, 'SODIUM BENZOATE', 'FG.PR-SB', 'R-110', 'SOGOMI', 'RAW MATERIALS'),
(110, 'SODIUM CHLORIDE', 'S-CHLO', 'R-111', 'FW SPA', 'RAW MATERIALS'),
(111, 'SODIUM LACTATE', 'HARDENING AGENT', 'R-112', 'SOGOMI', 'RAW MATERIALS'),
(112, 'Sodium Laureth Sulfate', 'SLES', 'R-108', 'FW SPA', 'RAW MATERIALS'),
(113, 'Sodium Laureth Sulfate', 'SLS', 'R-109', 'MOM CARES', 'RAW MATERIALS'),
(114, 'SODIUM LAUROY SARCO', 'SLSA', 'R-113', 'MOM CARES', 'RAW MATERIALS'),
(115, 'SODIUM LAUROY SARCO', 'SLSA', 'R-113', 'FW SPA', 'RAW MATERIALS'),
(116, 'SORBITOL', 'S-BL', 'R-114', 'FW SPA', 'RAW MATERIALS'),
(117, 'SUGARCANE DISTILLATE', 'ETHYL ALCOHOL', 'R-116', '', 'RAW MATERIALS'),
(118, 'SUNSHIELD BP4', 'S-BP4', 'R-117', 'SOGOMI', 'RAW MATERIALS'),
(119, 'TALCUM PREMIUM POWDER', 'TALC-PRM', 'R-118', 'SOGOMI', 'RAW MATERIALS'),
(120, 'TERGITOL', 'T-GL', 'R-119', 'FW SPA', 'RAW MATERIALS'),
(121, 'TETRASODIUM PYROPHOS', 'TS-PR', 'R-120', 'DALKEM', 'RAW MATERIALS'),
(122, 'TONALID', 'TONALID', 'R-121', 'FW SPA', 'RAW MATERIALS'),
(123, 'TRIETHANOLAMINE', 'E-TE', 'R-123', 'SOGOMI', 'RAW MATERIALS'),
(124, 'TWEEN POLYSORBATE 20/ POLYSORBATE 20', 'POLY-20', 'R-O-012', 'FW SPA', 'RAW MATERIALS'),
(125, 'TWEEN POLYSORBATE 80/ POLYSORBATE 80', 'POLY-80', 'R-O-013', 'FW SPA', 'RAW MATERIALS'),
(126, 'VITAMIN C', 'VIT-C', 'R-133', 'FW SPA', 'RAW MATERIALS'),
(127, 'VITAMIN E ACETATE', 'VIT.E-ACT', 'R-125', '', 'RAW MATERIALS'),
(128, 'VITAMIN E ADDITIVE', 'VIT. E-ADD', 'R-137', 'FW SPA', 'RAW MATERIALS'),
(129, 'XANTHAN GUM', 'X-GUM', 'R-127', 'FW SPA', 'RAW MATERIALS'),
(130, 'ZINC OXIDE', 'Z-OX', 'R-128', 'FW SPA', 'RAW MATERIALS'),
(131, 'CARNAUVA WAX', 'WAX-CAR', 'R-WAX-001', '', 'WAXES'),
(132, 'CETO STEARYL ALCOHOL', 'WAX-CSA', 'R-WAX-002', 'Sogomi', 'WAXES'),
(133, 'CETYL ALCOHOL-BEADS', 'WAX-CA', 'R-WAX-003', 'Sogomi', 'WAXES'),
(134, 'CETYL ALCOHOL FLAKES', 'WAX-CA', 'R-WAX-004', 'Sogomi', 'WAXES'),
(135, 'CETYL STEARYL', 'WAX-CS', 'R-WAX-005', 'Sogomi', 'WAXES'),
(136, 'CRYSTAL WAX', 'WAX-CRYSTAL', 'R-WAX-006', 'FW SPA', 'WAXES'),
(137, 'GLYCOL DISTEARATE', 'WAX-GDS', 'R-WAX-007', 'Sogomi', 'WAXES'),
(138, 'GLYCOL MONOSTEARATE', 'WAX-GMS', 'R-WAX-008', 'Sogomi', 'WAXES'),
(139, 'MIGOWAX HONEY', 'BEES-WAS', 'R-WAX-009', 'FW SPA', 'WAXES'),
(140, 'STEARIC ACID', 'WAX-SA', 'R-WAX-010', 'FW SPA', 'WAXES'),
(141, 'SOYA WAX', 'WAS-SOY', 'R-WAX-011', '', 'WAXES'),
(142, 'ALOE VERA EXTRACT', 'EXTRACT AV', 'R-E-001', 'SOGOMI', 'EXTRACT'),
(143, 'BEARBERRY EXTRACT', 'EXTRACT BB', 'R-E-002', 'SOAP CENTRAL', 'EXTRACT'),
(144, 'CALAMANSI EXTRACT', 'EXTRACT CM', 'R-E-003', 'SOAP CENTRAL', 'EXTRACT'),
(145, 'CARROT EXTRACT', 'EXTRACT CR', 'R-E-004', 'SOGOMI', 'EXTRACT'),
(146, 'CENTELLA ASIATICA EXTRACT', 'EXTRACT C.A', 'R-E-005', 'SOGOMI', 'EXTRACT'),
(147, 'CHAMOMILE EXTRACT', 'EXTRACT CH', 'R-E-006', 'FW SPA', 'EXTRACT'),
(148, 'CUCUMBER EXTRACT', 'EXTRACT C', 'R-E-007', '', 'EXTRACT'),
(149, 'GREEN TEA EXTRACT', 'EXTRACT GT', 'R-E-008', 'SOGOMI', 'EXTRACT'),
(150, 'GUAVA LEAF EXTRACT', 'EXTRACT LF', 'R-E-009', 'SOGOMI', 'EXTRACT'),
(151, 'LAVENDER EXTRACT', 'EXTRACT LE', 'R-E-010', 'FW SPA', 'EXTRACT'),
(152, 'LICORICE EXTRACT', 'EXTRACT LC', 'R-E-011', '', 'EXTRACT'),
(153, 'MORINGA EXTRACT', 'EXTRACT M', 'R-E-012', 'SOAP CENTRAL', 'EXTRACT'),
(154, 'PAPYA EXTRACT', 'EXTRACT PP', 'R-E-013', '', 'EXTRACT'),
(155, 'ROSE MARY EXTRACT', 'EXTRACT RM', 'R-E-014', 'FW SPA', 'EXTRACT'),
(156, 'SNAIL FILTRATE EXTRACT', 'EXTRACT SF', 'R-E-015', 'SOGOMI', 'EXTRACT'),
(157, 'SNAIL MUCIN EXTRACT', 'EXTRACT SM', 'R-E-016', 'FW SPA', 'EXTRACT'),
(158, 'TEA TREE EXTRACT', 'EXTRACT TT', 'R-E-017', 'FW SPA', 'EXTRACT'),
(159, 'TOMATO EXTRACT', 'EXTRACT TT', 'R-E-018', 'SOGOMI', 'EXTRACT'),
(160, 'WITCH HAZEL EXTRACT', 'EXTRACT WH', 'R-E-019', 'SOGOMI', 'EXTRACT'),
(161, 'BLACK COLORANT- FERNA', '', '', '', 'FOOD COLORANT'),
(162, 'Black F. Colorant – Ferna', 'FC-BF', 'R-FC-001', '', 'FOOD COLORANT'),
(163, 'Black F. Colorant – G.L', 'FC-BGL', 'R-FC-002', '', 'FOOD COLORANT'),
(164, 'BLUE Colorant', '', 'R-FC-001', '', 'FOOD COLORANT'),
(165, 'Blue F. Colorant - Ferna', 'FC-BLF', 'R-FC-002', '', 'FOOD COLORANT'),
(166, 'Blue F. Colorant – G.L', 'FC-BLGL', 'R-FC-003', '', 'FOOD COLORANT'),
(167, 'Brown F. Colorant – Ferna', 'FC-BRF', 'R-FC-004', '', 'FOOD COLORANT'),
(168, 'Brown F. Colorant – G.L', 'FC-BRGL', 'R-FC-005', '', 'FOOD COLORANT'),
(169, 'Cotton Candy – G. Leaves', 'FLV-O', 'R-FC-006', '', 'FOOD COLORANT'),
(170, 'Green F. Colorant – Ferna', 'FC-GF', 'R-FC-007', '', 'FOOD COLORANT'),
(171, 'Green F. Colorant – G.L', 'FC-GGL', 'R-FC-008', '', 'FOOD COLORANT'),
(172, 'Green Food Color', '', 'R-FC-009', '', 'FOOD COLORANT'),
(173, 'Orange F. Colorant – Ferna', 'FC-OGL', 'R-FC-010', '', 'FOOD COLORANT'),
(174, 'Orange F. Colorant – G.L', 'FC-OGL', 'R-FC-011', '', 'FOOD COLORANT'),
(175, 'Pink F. Colorant – Ferna', 'FC-PF', 'R-FC-012', '', 'FOOD COLORANT'),
(176, 'Pink F. Colorant – G.L', 'FC-PGL', 'R-FC-013', '', 'FOOD COLORANT'),
(177, 'Red F. Colorant – Ferna', 'FC-RF', 'R-FC-014', '', 'FOOD COLORANT'),
(178, 'Red F. Colorant – G.L', 'FC-RGL', 'R-FC-015', '', 'FOOD COLORANT'),
(179, 'Violet F. Colorant – Ferna', 'FC-VF', 'R-FC-016', '', 'FOOD COLORANT'),
(180, 'Violet F. Colorant – G.L', 'FC-VGL', 'R-FC-017', '', 'FOOD COLORANT'),
(181, 'Yellow F. Colorant – Ferna', 'FC-YF', 'R-FC-018', '', 'FOOD COLORANT'),
(182, 'Yellow F. Colorant – G.L', 'FC-YGL', 'R-FC-019', '', 'FOOD COLORANT'),
(183, 'BLACK IRON OXIDE', 'SC-BIO', 'R-C-001', 'FW SPA', 'POWDER COLORANT'),
(184, 'BLACSK COLORANT- COSMETIC', 'SC-BC', 'R-C-002', '', 'POWDER COLORANT'),
(185, 'BLUE COLORANT POWDER', 'SC-BP', 'R-C-003', '', 'POWDER COLORANT'),
(186, 'BROWN COLORANT POWDER', 'SC-BRN', 'R-C-004', '', 'POWDER COLORANT'),
(187, 'D&C ORANGE 4', 'SC-DCO4', 'R-C-005', 'CEDAR ALLEY', 'POWDER COLORANT'),
(188, 'D&C RED 17', 'SC-DCL 17', 'R-C-006', 'CEDAR ALLEY', 'POWDER COLORANT'),
(189, 'D&C RED 7', 'SC-DCL 7', 'R-C-007', 'SOGOMI', 'POWDER COLORANT'),
(190, 'GREEN CHROME OXIDE', 'SC-GCO', 'R-C-008', '', 'POWDER COLORANT'),
(191, 'GREEN COLORANT', 'SC-GP', 'R-C-009', '', 'POWDER COLORANT'),
(192, 'IRON OXIDE BLUE', 'SC-IOBL', 'R-C-010', 'SOGOMI', 'POWDER COLORANT'),
(193, 'IRON OXIDE BROWN', 'SC-IOB', 'R-C-011', 'SOGOMI', 'POWDER COLORANT'),
(194, 'IRON OXIDE CEDAR', 'SC-IOC', 'R-C-012', 'SOGOMI', 'POWDER COLORANT'),
(195, 'IRON OXIDE CHESTNUT', 'SC-IOCH', 'R-C-013', 'SOGOMI', 'POWDER COLORANT'),
(196, 'IRON OXIDE FOX GLOVE', 'SC-IOFG', 'R-C-014', 'SOGOMI', 'POWDER COLORANT'),
(197, 'IRON OXIDE GEUM', 'SC-IOG', 'R-C-015', 'SOGOMI', 'POWDER COLORANT'),
(198, 'IRON OXIDE PEONY', 'SC-IOP', 'R-C-016', 'SOGOMI', 'POWDER COLORANT'),
(199, 'IRON OXIDE RED', 'SC-IOR', 'R-C-017', 'SOGOMI', 'POWDER COLORANT'),
(200, 'IRON OXIDE UNIPURE RED', 'SC-IOUR', 'R-C-018', 'SOGOMI', 'POWDER COLORANT'),
(201, 'IRON OXIDE YELLOW', 'SC-IOY', 'R-C-019', 'SOGOMI', 'POWDER COLORANT'),
(202, 'IRON OXIDE YELLOW ORANGE', 'SC-IOYO', 'R-C-020', 'SOGOMI', 'POWDER COLORANT'),
(203, 'LAKE ALLURE RED', 'SC-LAR', 'R-C-021', 'FW SPA', 'POWDER COLORANT'),
(204, 'ORANGE COLORANT', 'SC-O', 'R-C-022', 'SOAP CENTRAL', 'POWDER COLORANT'),
(205, 'PINK CLAY', 'P.C', 'R-C-023', '', 'POWDER COLORANT'),
(206, 'PINK ERYTHROSINE', 'SC-PE', 'R-C-024', 'SOGOMI', 'POWDER COLORANT'),
(207, 'PONCEAU RED', 'SC-P', 'R-C-025', 'SOGOMI', 'POWDER COLORANT'),
(208, 'TITANIUM DIOXIDE', 'SC-W', 'R-C-026', 'CHEMICO PHIL', 'POWDER COLORANT'),
(209, 'YELLOW COLORANT', 'SC-Y', 'R-C-027', 'SOGOMI', 'POWDER COLORANT'),
(210, 'BLACK COLORANT', 'SC-BL', 'R-C-028', 'SOAP CENTRAL', 'POWDER COLORANT'),
(211, 'CASTOR OIL', 'FA-R', 'R-O-001', 'FW SPA', 'OIL'),
(212, 'COCONUT OIL', 'FA-C', 'R-O-002', 'LAVENDER MARK.', 'OIL'),
(213, 'FRACTIONATED COCONUT OIL', 'FA-FC', 'R-O-003', 'FW SPA', 'OIL'),
(214, 'GRAPESEED OIL', 'FA-G', 'R-O-004', 'SOGOMI', 'OIL'),
(215, 'HYDROGENATED CASTOR OIL/ PEG 40', 'FA-HCO-40', 'R-O-005', 'FW SPA', 'OIL'),
(216, 'JOJOVA OIL', 'FA-J', 'R-O-006', 'SOGOMI', 'OIL'),
(217, 'MINERAL OIL LIGHT', 'FA-MO', 'R-O-007', 'FW SPA', 'OIL'),
(218, 'MINERAL OIL UNSCENTED', 'FA-MOU', 'R-O-008', 'FW SPA', 'OIL'),
(219, 'PALM OIL', 'FA-P', 'R-O-009', 'LAVENDER MARK.', 'OIL'),
(220, 'SOYBEAN OIL/ SOYA OIL', 'FA-S', 'R-O-010', 'SM ANGONO', 'OIL'),
(221, 'SUNFLOWER OIL', 'FA-SF', 'R-O-011', 'JAPAN', 'OIL'),
(222, 'EPSON SALT', 'E-SALT', 'R-S-001', 'FW SPA', 'SALT'),
(223, 'HIMALAYAN SALT', 'H-SALT', 'R-S-002', '', 'SALT'),
(224, 'MAGNESIUM STEARATE', 'M-STR', 'R-S-003', 'TRANS WORLD TRADING', 'SALT'),
(225, 'SALT', 'SALT', 'R-S-004', '', 'SALT'),
(226, 'Angels Breath', 'F.O AB', 'R-PS-001', 'FW Spavenue', 'PERFUME SCENT'),
(227, 'B&BW G. Peach & S. Tea', 'F.O BBWS', 'R-PS-002', 'FW Spavenue', 'PERFUME SCENT'),
(228, 'Bergamot Scent', 'F.O BS', 'R-PS-003', 'FW Spavenue', 'PERFUME SCENT'),
(229, 'Bulgari Amethyst', 'F.O BA', 'R-PS-004', 'FW Spavenue', 'PERFUME SCENT'),
(230, 'Bulgari Extreme Scent', 'F.O BES', 'R-PS-005', 'FW Spavenue', 'PERFUME SCENT'),
(231, 'Centelia Asiatica', 'F.O CA', 'R-PS-007', 'FW Spavenue', 'PERFUME SCENT'),
(232, 'Chanel No.5 Scent', 'F.O C5S', 'R-PS-008', 'FW Spavenue', 'PERFUME SCENT'),
(233, 'CK One', 'F.O CK1', 'R-PS-009', 'FW Spavenue', 'PERFUME SCENT'),
(234, 'Clinique Happy', 'F.O CH', 'R-PS-010', 'FW Spavenue', 'PERFUME SCENT'),
(235, 'Cool Mint Scent', 'F.O CMS', 'R-PS-011', 'FW Spavenue', 'PERFUME SCENT'),
(236, 'D&G Lite Blue Women', 'F.O LBW', 'R-PS-012', 'FW Spavenue', 'PERFUME SCENT'),
(237, 'Davidoff Cool Water', 'F.O DC', 'R-PS-013', 'FW Spavenue', 'PERFUME SCENT'),
(238, 'Issey Miyake', 'F.O IM', 'R-PS-014', 'FW Spavenue', 'PERFUME SCENT'),
(239, 'Lacoste Black', 'F.O LB', 'R-PS-015', 'FW Spavenue', 'PERFUME SCENT'),
(240, 'Lacoste Pink Scent', 'F.O LPS', 'R-PS-016', 'FW Spavenue', 'PERFUME SCENT'),
(241, 'Lacoste Red', 'F.O LR', 'R-PS-017', 'FW Spavenue', 'PERFUME SCENT'),
(242, 'Moroccan Women', 'F.O MW', 'R-PS-018', 'FW Spavenue', 'PERFUME SCENT'),
(243, 'R.L Polo Sport Scent', 'F.O RLPS', 'R-PS-019', 'FW Spavenue', 'PERFUME SCENT'),
(244, 'Satsuma Scent', 'F.O SS', 'R-PS-020', 'FW Spavenue', 'PERFUME SCENT'),
(245, 'White Tea Scent', '', '', 'FW Spavenue', 'PERFUME SCENT'),
(246, 'BAMBOO FRESH/ FRESH BAMBOO', '', '', 'CPL', 'FRAGRANCE OIL'),
(247, 'BERRY BUBBLE', 'F.O BB', 'R-FS-001', 'CPL', 'FRAGRANCE OIL'),
(248, 'BLUEBERRY F.O', 'F.O BB', 'R-FS-002', 'FW Spavenue', 'FRAGRANCE OIL'),
(249, 'BUBBLE GUM F.O', 'F.O BG', 'R-FS-003', 'FW Spavenue', 'FRAGRANCE OIL'),
(250, 'BUBBLE GUM F.O – EL', 'F.O BGE', 'R-FS-004', 'SOGOMI', 'FRAGRANCE OIL'),
(251, 'CALAMANSI F.O', 'F.O C', 'R-FS-005', 'Newelle', 'FRAGRANCE OIL'),
(252, 'CANTALOUPE SCENT', 'F.O CT', 'R-FS-006', 'FW Spavenue', 'FRAGRANCE OIL'),
(253, 'CAPTIVATION/PURE SED.', 'F.O PS', 'R-FS-023', 'FW Spavenue/CPL', 'FRAGRANCE OIL'),
(254, 'CHAMOMILE SCENT', 'F.O CHM', 'R-FS-007', 'FW Spavenue', 'FRAGRANCE OIL'),
(255, 'CHERRY BLOSSOM SCENT', 'F.O CB', 'R-FS-008', 'SoapScentral', 'FRAGRANCE OIL'),
(256, 'CHERRY F.O', 'F.O CH', 'R-FS-009', 'SoapScentral', 'FRAGRANCE OIL'),
(257, 'CHERRY F.O – EVER LIGHT', 'F.O CHE', 'R-FS-010', '', 'FRAGRANCE OIL'),
(258, 'CHERRY STRAWBERRY F.O', 'F.O CS', 'R-FS-011', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(259, 'COFFEE F.O', 'F.O-CO', 'R-FS-012', 'FW Spavenue', 'FRAGRANCE OIL'),
(260, 'CRANBERRY', 'F.O CB', 'R-FS-013', '-', 'FRAGRANCE OIL'),
(261, 'CUCUMBER F.O', 'F.O CC', 'R-FS-014', '-', 'FRAGRANCE OIL'),
(262, 'CUCUMBER MELON SCENT', 'F.O CCM', 'R-FS-015', 'FW', 'FRAGRANCE OIL'),
(263, 'FLORAL OASIS', 'F.O FO', '', 'CPL', 'FRAGRANCE OIL'),
(264, 'FLORAL POWDERY', 'F.O FP', '', 'FW SPA', 'FRAGRANCE OIL'),
(265, 'GINGER SCENT', '', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(266, 'GRAPE FRUIT SCENT', 'F.O GF', 'R-FS-016', '-', 'FRAGRANCE OIL'),
(267, 'GREEN APPLE SCENT', 'F.O GA', 'R-FS-017', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(268, 'HONEY DEW MELON SCENT', 'F.O HDM', 'R-FS-018', 'FW', 'FRAGRANCE OIL'),
(269, 'KALAMANSI SV F.O', 'F.O APW SG', 'R-FS-019', 'Newelle', 'FRAGRANCE OIL'),
(270, 'KIWI SCENT', 'F.O K', 'R-FS-020', 'FW Spavenue', 'FRAGRANCE OIL'),
(271, 'LAVENDER SCENT', '', '', 'EURO FRAGRANCE', 'FRAGRANCE OIL'),
(272, 'LEMON F.O', 'F.O L', 'R-FS-021', 'CPL', 'FRAGRANCE OIL'),
(273, 'LEMON LIME F.O', 'F.O LL', 'R-FS-022', 'CPL', 'FRAGRANCE OIL'),
(274, 'LEMON SCENT', 'F.O L', 'R-FS-024', 'FW Spavenue', 'FRAGRANCE OIL'),
(275, 'LOST & FANTASY', '', '', 'FW SPA', 'FRAGRANCE OIL'),
(276, 'LOVE SPELL', '', '', 'FW SPA', 'FRAGRANCE OIL'),
(277, 'LUSH SHEA BUTTER', '', '', 'FW SPA', 'FRAGRANCE OIL'),
(278, 'MARCELINA SCENT', 'F.O SG', '', 'CPL', 'FRAGRANCE OIL'),
(279, 'MELON F.O', 'F.O M', 'R-FS-025', '-', 'FRAGRANCE OIL'),
(280, 'MILK SCENT', 'MILK F.O', '', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(281, 'MINT SCENT', 'F.O Mint', 'R-FS-026', 'FW', 'FRAGRANCE OIL'),
(282, 'NECTARINE BLOSSOM SCENT', 'F.O NB', 'R-FS-027', 'FW', 'FRAGRANCE OIL'),
(283, 'OCEAN REEDS', 'F.O OR', '', 'FW SPA', 'FRAGRANCE OIL'),
(284, 'OLD CHERRY F.O', 'F.O OS', 'R-FS-028', '', 'FRAGRANCE OIL'),
(285, 'OLIVE SCENT', 'F.O OS', 'R-FS-029', '', 'FRAGRANCE OIL'),
(286, 'ORANGE MANDARIN F.O', 'F.O OM', 'R-FS-030', '', 'FRAGRANCE OIL'),
(287, 'PAPAYA F.O', 'F.O P', 'R-FS-031', '', 'FRAGRANCE OIL'),
(288, 'PEPPERMINT SCENT', 'F.O PEPP', '', 'SOGOMI', 'FRAGRANCE OIL'),
(289, 'POOR AND FRESCA', 'F.O PF', '', 'FE SPA', 'FRAGRANCE OIL'),
(290, 'RASPBERRY SCENT', 'F.O RB', 'R-FS-032', 'FW', 'FRAGRANCE OIL'),
(291, 'ROSEMARY SCENT', 'F.O RM', 'R-FS-033', 'FW SPA', 'FRAGRANCE OIL'),
(292, 'SALIHA', '', '', 'CPL', 'FRAGRANCE OIL'),
(293, 'SPARKLE/ INCANTO SHINE', '', '', 'CPL', 'FRAGRANCE OIL'),
(294, 'STRAWBERRY CHAMPAGNE', 'F.O SBC', 'R-FS-034', 'CPL', 'FRAGRANCE OIL'),
(295, 'STRAWBERRY CREAMY', 'F.O SBCR', 'R-FS-035', 'CPL', 'FRAGRANCE OIL'),
(296, 'STRAWBERRY MILKSHAKE', 'F.O SBM', 'R-FS-036', 'FW', 'FRAGRANCE OIL'),
(297, 'STRAWBERRY SCENT', 'F.O SB', 'R-FS-037', 'FW', 'FRAGRANCE OIL'),
(298, 'SWEET BERRY', 'F.O SBS', 'R-FS-038', 'FW', 'FRAGRANCE OIL'),
(299, 'SWEET LEMON F.O', 'F.O SL', 'R-FS-039', 'FW', 'FRAGRANCE OIL'),
(300, 'SWEET MILK SCENT', 'F.O SM', 'R-FS-040', 'SOAP CENTRAL', 'FRAGRANCE OIL'),
(301, 'SWEET ORANGE (FW SPA)', 'S.V SO', 'R-FS-041', 'FW SPA', 'FRAGRANCE OIL'),
(302, 'SWEET ORANGE SV', 'S.V SO', 'R-FS-042', 'CPL', 'FRAGRANCE OIL'),
(303, 'SWEET PEA F.O', 'F.O SP', 'R-FS-043', '', 'FRAGRANCE OIL'),
(304, 'TUTTI-FRUTTI SCENT', 'F.O TF', 'R-FS-044', 'FW', 'FRAGRANCE OIL'),
(305, 'VANILLA SCENT', 'F.O V', 'R-FS-045', 'FW', 'FRAGRANCE OIL'),
(306, 'WATERMELON SCENT', 'F.O WM', 'R-FS-046', 'FW', 'FRAGRANCE OIL'),
(307, 'YLANG YLANG F.O', 'F.O YY', 'R-FS-047', 'CYLEINA ORGANIC', 'FRAGRANCE OIL'),
(308, 'DOVE GO FRESH SCENT', '', '', '', 'FRAGRANCE OIL'),
(309, 'WS CHRISTMAS BERRY', 'F.O WSCB', 'R-WS-001', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(310, 'WS PEPPERMINT', 'F.O WSPM', 'R-WS-002', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(311, 'WS SNOWBERRY', 'F.O WSSB', 'R-WS-003', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(312, 'WS Manila Hotel Scent', 'F.O WSMH', 'R-WS-004', 'FW Spavenue', 'PERFUME WATER SOLUBLE'),
(313, 'Carrageenan ci-604', '', '', '', 'FOOD GRADE'),
(314, 'Carrageenan for meet', '', '', '', 'FOOD GRADE'),
(315, 'Citrus pectin -food grade-', '', '', 'Dalkem', 'FOOD GRADE'),
(316, 'Gelatin (ferna)', '', '', '', 'FOOD GRADE'),
(317, 'Ginger', '', '', '', 'FOOD GRADE'),
(318, 'Ginger powder', '', '', '', 'FOOD GRADE'),
(319, 'Gulaman (Queen brand)', '', '', '', 'FOOD GRADE'),
(320, 'Gulaman (sarap pinoy brand)', '', '', '', 'FOOD GRADE'),
(321, 'Honey pure', '', '', '', 'FOOD GRADE'),
(322, 'Lemon flavor oil g.leaves', 'L.FLA', '', 'JNRM Corp.', 'FOOD GRADE'),
(323, 'Lemon fruit', '', '', '', 'FOOD GRADE'),
(324, 'lemonade juice power', '', '', '', 'FOOD GRADE'),
(325, 'Orange juice powder', '', '', '', 'FOOD GRADE'),
(326, 'Sodium floride', '', '', '', 'FOOD GRADE'),
(327, 'Sugar - white -', '', '', 'KORACH', 'FOOD GRADE'),
(328, 'SUGAR BROWN', '', '', '', 'FOOD GRADE'),
(329, 'Turmeric powder', '', '', '', 'FOOD GRADE'),
(330, 'Zero Cal Sweetener', 'CAL-SW', 'R-C-020', '', 'FOOD GRADE');

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
(68, 'ref34', '2023-08-30 16:46:31', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(69, 'ref35', '2023-08-30 16:49:15', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(70, 'ref36', '2023-08-31 16:50:41', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(71, 'ref37', '2023-09-01 12:29:24', 'bryanken00#810', 'Angono Rizal', 2147483647, 'test@gmail.com', NULL),
(72, 'ref38', '2023-09-01 12:56:31', 'bryanken00#810', 'Angono Rizal', 2147483647, 'test@gmail.com', NULL),
(73, 'ref39', '2023-09-18 23:49:21', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(74, 'ref40', '2023-09-21 10:21:25', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(76, 'ref42', '2023-09-21 10:32:01', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(75, 'ref41', '2023-09-21 10:31:26', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(77, 'ref43', '2023-09-27 00:09:42', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(81, 'ref47', '2023-10-08 20:28:46', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(82, 'ref48', '2023-10-08 20:43:16', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL),
(83, 'ref49', '2023-10-08 20:51:51', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', NULL);

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
(31, 'ref1', '2023-06-13 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(32, 'ref2', '2023-06-14 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(33, 'ref3', '2023-06-15 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(34, 'ref4', '2023-06-16 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(35, 'ref5', '2023-06-15 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(36, 'ref6', '2023-06-16 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(37, 'ref7', '2023-06-16 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(38, 'ref8', '2023-06-16 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(39, 'ref9', '2023-06-17 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(40, 'ref10', '2023-06-19 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(41, 'ref11', '2023-06-24 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(42, 'ref12', '2023-06-21 00:00:00', 'bryanken#563', 'Angono Rizal', 2147483647, 'bryanken01230@gmail.com', 0),
(43, 'ref13', '2023-06-24 00:00:00', 'altes#151', 'Angono Rizal', 2147483647, 'testing@gmail.com', 0),
(44, 'ref14', '2023-06-27 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(45, 'ref15', '2023-06-29 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(46, 'ref16', '2023-07-01 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(47, 'ref17', '2023-07-01 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(48, 'ref18', '2023-07-01 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(49, 'ref19', '2023-07-01 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(50, 'ref20', '2023-07-01 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(51, 'ref21', '2023-07-03 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(52, 'ref22', '2023-07-02 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(53, 'ref23', '2023-07-04 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(58, 'ref24', '2023-07-11 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(59, 'ref25', '2023-07-11 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(60, 'ref26', '2023-07-11 00:00:00', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(61, 'ref27', '2023-08-20 00:00:00', 'Cashier Walk-In', 'Walk-IN', 0, 'Walk-IN@gmail.com', 0),
(62, 'ref28', '2023-08-20 00:00:00', 'Cashier Walk-In', 'Walk-IN', 0, 'Walk-IN@gmail.com', 0),
(63, 'ref29', '2023-08-20 00:00:00', 'Cashier Walk-In', 'Walk-IN', 0, 'Walk-IN@gmail.com', 0),
(64, 'ref30', '2023-08-30 15:53:32', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(65, 'ref31', '2023-08-30 15:54:59', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(66, 'ref32', '2023-08-30 16:12:09', 'bryanken00#810', 'Angono Rizal', 2147483647, 'test@gmail.com', 0),
(67, 'ref33', '2023-08-30 16:40:48', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(78, 'ref44', '2023-09-27 01:39:22', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(79, 'ref45', '2023-09-28 01:40:05', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0),
(80, 'ref46', '2023-10-04 22:30:36', 'admin#578', 'Angono, Rizal', 9123456, 'test@gmail.com', 0);

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
('ref1', 'Facial Wash', '80ml', 1, 50),
('ref2', 'Serum', '5g', 1, 40),
('ref2', 'Facial Wash', '80ml', 1, 50),
('ref2', 'Gel Toner', '60ml', 1, 100),
('ref3', 'Isopropyl Alcohol', '60ml', 1, 40),
('ref3', 'Facial Wash', '80ml', 1, 50),
('ref4', 'Serum', '5g', 91, 40),
('ref5', 'Serum', '5g', 11, 40),
('ref6', 'Isopropyl Alcohol', '60ml', 111, 40),
('ref7', 'Isopropyl Alcohol', '60ml', 1, 40),
('ref8', 'Facial Wash', '80ml', 1, 50),
('ref9', 'Facial Wash', '80ml', 95, 50),
('ref10', 'Serum', '5g', 4, 40),
('ref11', 'Kojic Rejuvinating Soap', '110g', 100, 40),
('ref12', 'Toner', '60ml', 2, 125),
('ref12', 'Bight Cream', '10g', 3, 150),
('ref12', 'Sunblock', '10g', 4, 90),
('ref12', 'Rejuvenating Set', 'Kojic Soap, Sunblock, Night Cream, Toner', 3, 250),
('ref13', 'Sunblock', '10g', 5, 90),
('ref13', 'Bight Cream', '10g', 4, 150),
('ref13', 'Toner', '60ml', 5, 125),
('ref13', 'Rejuvenating Set', 'Kojic Soap, Sunblock, Night Cream, Toner', 6, 250),
('ref14', 'Glutamansi Lotion', '250ml', 1, 70),
('ref15', 'Sun Block', '10g', 1, 90),
('ref16', 'Isopropyl Alcohol', '1 litter', 5, 50),
('ref17', 'Isopropyl Alcohol', '1 litter', 20, 50),
('ref18', 'Snail Max White Lotion', '250ml', 4, 50),
('ref19', 'Glutamansi Lotion', '250ml', 7, 70),
('ref19', 'Bleaching Lotion', '250ml', 4, 40),
('ref20', 'Isopropyl Alcohol', '60ml', 10, 40),
('ref21', 'Serum', '5g', 10, 40),
('ref21', 'Sun Block', '10g', 50, 90),
('ref22', 'Sunblock', '10g', 50, 90),
('ref23', 'Bleaching Soap', '70g', 20, 25),
('ref24', 'Cleansing Foam', '150ml', 1, 13),
('ref24', 'Cleansing Foam', '150ml', 1, 13),
('ref24', 'Cleansing Foam', '150ml', 1, 13),
('ref24', 'Cleansing Foam', '150ml', 1, 13),
('ref24', 'Gel Cleanser', '200ml', 1, 15),
('ref25', 'Exfoliating Scrub Cleanser', '100ml', 100, 10),
('ref26', 'Exfoliating Scrub Cleanser', '100ml', 11, 10),
('ref27', 'Bleaching Lotion', '250ml', 1, 40),
('ref27', 'Glutamansi Lotion', '250ml', 1, 70),
('ref28', 'Bleaching Soap', '70g', 1, 25),
('ref29', 'Age Eraser Soap', '135g', 4, 100),
('ref29', 'Glutamansi Soap', '50g', 5, 50),
('ref29', 'Bleaching Soap', '70g', 4, 25),
('ref29', 'Bleaching Lotion', '250ml', 3, 40),
('ref29', 'Glutamansi Lotion', '250ml', 4, 70),
('ref29', 'Snail Max White Lotion', '250ml', 6, 50),
('ref29', 'Revitalize Whitening Beauty Bar', '135g', 3, 90),
('ref30', 'Isopropyl Alcohol', '1 litter', 1, 50),
('ref30', 'Cleansing Foam', '150ml', 1, 13),
('ref30', 'Cleansing Foam', '150ml', 1, 13),
('ref30', 'Cleansing Foam', '150ml', 1, 13),
('ref30', 'Cleansing Foam', '150ml', 1, 13),
('ref30', 'Gel Cleanser', '200ml', 1, 15),
('ref31', 'Cleansing Foam', '150ml', 1, 13),
('ref31', 'Cleansing Foam', '150ml', 1, 13),
('ref32', 'Anti-Aging Serum', '30ml', 1, 30),
('ref32', 'Moisturizing Cream', '50ml', 1, 20),
('ref32', 'Exfoliating Scrub', '100g', 1, 13),
('ref32', 'Hydrating Toner', '200ml', 1, 16),
('ref33', 'Cleansing Foam', '150ml', 1, 13),
('ref33', 'Cleansing Foam', '150ml', 1, 13),
('ref44', 'Cleansing Foam', '150ml', 1000, 13),
('ref45', 'Gel Cleanser', '200ml', 3000, 15),
('ref46', 'Isopropyl Alcohol', '1 litter', 1, 50);

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
(1, 'ref34', 'Cleansing Foam', '150ml', 1, 13, 'Added'),
(2, 'ref35', 'Cleansing Foam', '150ml', 1, 13, 'Added'),
(3, 'ref36', 'Cleansing Foam', '150ml', 1, 13, 'Added'),
(4, 'ref36', 'Gel Cleanser', '200ml', 1, 15, 'Added'),
(5, 'ref36', 'Creamy Cleansing Milk', '180ml', 1, 12, 'Added'),
(6, 'ref37', 'Isopropyl Alcohol', '1 litter', 1, 50, 'Added'),
(7, 'ref38', 'Anti-Aging Serum', '30ml', 5, 30, 'Added'),
(8, 'ref38', 'Moisturizing Cream', '50ml', 13, 20, 'Added'),
(9, 'ref38', 'Exfoliating Scrub', '100g', 4, 13, 'Added'),
(10, 'ref38', 'Hydrating Toner', '200ml', 1, 16, 'Added'),
(11, 'ref38', 'Acne Treatment Gel', '15ml', 5, 10, 'Added'),
(12, 'ref38', 'Hydrating Serum', '50ml', 12, 25, 'Added'),
(13, 'ref38', 'Brightening Serum', '30ml', 1, 22, 'Added'),
(14, 'ref39', 'Isopropyl Alcohol', '1 litter', 1, 50, 'Added'),
(15, 'ref40', 'Isopropyl Alcohol', '1 litter', 1, 50, 'Added'),
(16, 'ref41', 'Gel Toner', '60ml', 1, 100, 'Added'),
(17, 'ref41', 'Sun Block', '10g', 1, 90, 'Added'),
(18, 'ref41', 'Radiant Glow Facial Set', 'Gel Toner, Facial Wash, Serum, Sunblock', 1, 350, 'Added'),
(19, 'ref41', 'Gel Cleanser', '200ml', 1, 15, 'Added'),
(20, 'ref42', 'Isopropyl Alcohol', '1 litter', 1, 50, 'Added'),
(32, 'ref43', 'Gel Toner', '60ml', 5, 100, 'Added'),
(33, 'ref47', 'Gel Toner', '60ml', 1, 100, 'Added'),
(34, 'ref48', 'Gel Toner', '60ml', 1, 100, 'Added'),
(35, 'ref48', 'Sun Block', '10g', 1, 90, 'Added'),
(36, 'ref48', 'Radiant Glow Facial Set', 'Gel Toner, Facial Wash, Serum, Sunblock', 1, 350, 'Added'),
(37, 'ref49', 'Isopropyl Alcohol', '1 litter', 1, 50, 'Added');

-- --------------------------------------------------------

--
-- Table structure for table `tblorderexpirationtime`
--

CREATE TABLE `tblorderexpirationtime` (
  `ID` int(11) NOT NULL,
  `OrderRefNumber` varchar(100) NOT NULL,
  `Expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorderexpirationtime`
--

INSERT INTO `tblorderexpirationtime` (`ID`, `OrderRefNumber`, `Expiration`) VALUES
(52, 'ref48', '2023-10-13 20:51:06'),
(54, 'ref49', '2023-10-13 20:52:06');

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
('ref1', 'Completed'),
('ref10', 'Completed'),
('ref11', 'Completed'),
('ref12', 'Completed'),
('ref13', 'Completed'),
('ref14', 'Completed'),
('ref15', 'Completed'),
('ref16', 'Completed'),
('ref17', 'Completed'),
('ref18', 'Completed'),
('ref19', 'Delivery'),
('ref2', 'Completed'),
('ref20', 'Delivery'),
('ref21', 'Completed'),
('ref22', 'Delivery'),
('ref23', 'Delivery'),
('ref24', 'toShip'),
('ref25', 'toShip'),
('ref26', 'Completed'),
('ref27', 'Completed'),
('ref28', 'Completed'),
('ref29', 'Completed'),
('ref3', 'Completed'),
('ref30', 'toShip'),
('ref31', 'toShip'),
('ref32', 'toShip'),
('ref33', 'toShip'),
('ref34', 'Expired'),
('ref35', 'Expired'),
('ref36', 'Expired'),
('ref37', 'Expired'),
('ref38', 'Expired'),
('ref39', 'Expired'),
('ref4', 'Completed'),
('ref40', 'Expired'),
('ref41', 'Expired'),
('ref42', 'Expired'),
('ref43', 'Cancelled'),
('ref44', 'Completed'),
('ref45', 'Completed'),
('ref46', 'Delivery'),
('ref47', 'Expired'),
('ref48', 'Cancelled'),
('ref49', 'Cancelled'),
('ref5', 'Completed'),
('ref6', 'Completed'),
('ref7', 'Completed'),
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
(1, 'Bryan Ken', 'S', 'Altes', '09158350780', 'bryanken01230@gmail.com', 'CALABARZON', 'Rizal', 'Angono', 'Kalayaan', 'Del Rosatio st. Brgy Kalayaan Angono Rizal', '1930', 'KBN', 'pending'),
(6, 'Bryan', 'S.', 'Altes', '09158350780', 'bryanken01230@gmail.com', 'CALABARZON', 'Rizal', 'Angono', 'Kalayaan', 'Del Rosatio st. Brgy Kalayaan Angono Rizal', '1930', 'KBN', 'Completed'),
(7, 'raven', 'a', 'berenguila', '4234324', 'ravenberenguila@gmail.com', 'CALABARZON', 'Rizal', 'Binangonan', 'Bilibiran', 'luklukan', '1940', 'secret', 'Completed'),
(8, 'raul', 'a', 'besa', '4234324', 'besaraul', 'Central Luzon', 'Bataan', 'Abucay', 'Bangkal', 'testing', '1940', 'testing', 'Completed'),
(9, 'testing', 'a', 'test', '423423', 'test@', 'Caraga', 'Agusan Del Norte', 'Carmen', 'Gosoon', 'testadd', '1467', 'test', 'Completed'),
(10, 'Bryan Ken', 'S', 'Altes', '09158350780', 'bryanken01230@gmail.com', 'CALABARZON', 'Rizal', 'Angono', 'Kalayaan', 'Del Rosatio st. Brgy Kalayaan Angono Rizal', '1970', 'Kojic', 'Completed'),
(11, 'Bryan Ken', 'S', 'Altes', '09158350780', 'bryanken01230@gmail.com', 'CALABARZON', 'Rizal', 'Angono', 'Kalayaan', 'Del Rosatio st. Brgy Kalayaan Angono Rizal', '1970', 'Kojic, Alcohol', 'Completed');

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
('Rejunenating', 'Rejunenating Set'),
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
(1, 'age-eraser-soap.png', 'Age Eraser Soap', 100, '135g', 96, 4, 'Soap', 'The best ingredients in nature are blended in this unique anti-ageing black beauty soap. You now have the power to renew your skin and make younger, whiter and fresher. With micro beads that gently exfoliate and remove dead skin cells.', 'Saponified oils of palm, coconut, soybean and castor, aqua, sodium lactate, activated charcoal, bearberry extract (w/ allantoin & alpha arbutin), glycerin, moringga extract, fragrance oil, colorant and cocomonoethanolamide.', 'For Face: Lather on hands until foamy and massage onto face. Rinse well.+ForBody: Lather on skin directly and rinse well.+Use daily. If irratation occurs, discontinue use.'),
(2, 'glutamansi-lotion.png', 'Glutamansi Soap', 50, '50g', 95, 5, 'Soap', 'Whitening, Moisturizing, Skin Clarifying, Exfoliating, Micro-peeling, Deodorizing', 'Aqua, Coconut Oil, Palm Oil, Sodium Hydroxide, Virgin Coconut Oil, Calamansi Extract, Calamansi Rind, Sodium Bicarbonate, Titanium Dioxide, Phenoxyethanol, Propylene Glycol, Fragrance Oil, Glycerin, Glutathione', NULL),
(3, 'alcohol.png', 'Kojic Rejuvinating Soap', 70, '135g', 100, 0, 'Soap', NULL, NULL, NULL),
(4, 'frejuv.png', 'Bleaching Soap', 25, '70g', 75, 25, 'Soap', NULL, NULL, NULL),
(5, 'glow-set.png', 'Revitalize Whitening Beauty Bar', 90, '135g', 97, 3, 'Soap', NULL, NULL, NULL),
(6, '', 'Snail Max White Lotion', 50, '250ml', 0, 0, 'Lotion', '', '', ''),
(7, 'glutamansi-lotion.png', 'Glutamansi Lotion', 70, '250ml', 87, 13, 'Lotion', 'Achieve that rosy skin and radiant glow with this non-sticky premium lotion. Made with effective natural ingredients such as glutathione, calamansi extract, baking soda, shea butter, kojic acid,  glycolic, moisturize and hydrate your skin fast while keeping it soft, smooth, form and young-looking.', 'Aqua, Stearic Acid, Glycol Monostearate, Isopropyl Yristate, Cetyl Alcohol, Glycerin, Glycol Distearate, Glycine Soja (Soybean) Oil, Mineral Oil, Sodium Bicarbonate, Propylene Glycol, Citric Acid, Zinc Oxide, Titanium Dioxide, Kojic Acid Dipalmitate, Glycolic Acod, Citrofortunella Microcarpa (Calamansi) Extract, Green Carica Papaya Extract, Octyl Methoxycinnamate, Glutathione, Phenoxyethanol, Butyrospermum Parkii (Shea) Oil, Fragrance ang BHT, CI 42053', 'Pour desire amount on skin and spread evenly on hands, legs and body. Use twice daily.+For external use only. Of irratation occurs, discontinue use+Store in a cool, dry place not exceeding 30°.'),
(8, 'alcohol.png', 'Bleaching Lotion', 40, '250ml', 92, 8, 'Lotion', NULL, NULL, NULL),
(9, 'frejuv.png', 'Gluta White Lotion', 100, '250ml', 100, 0, 'Lotion', NULL, NULL, NULL),
(10, 'age-eraser-soap.png', 'Kojic Rejuvinating Soap', 40, '110g', 0, 100, 'Rejunenating', NULL, NULL, NULL),
(11, 'sunblock-rejuv.png', 'Sunblock', 90, '10g', 41, 59, 'Rejunenating', NULL, NULL, NULL),
(12, 'cream-rejuv.png', 'Bight Cream', 150, '10g', 93, 7, 'Rejunenating', NULL, NULL, NULL),
(13, 'frejuv.png', 'Toner', 125, '60ml', 93, 7, 'Rejunenating', NULL, NULL, NULL),
(14, 'rejuv-set.png', 'Rejuvenating Set', 250, 'Kojic Soap, Sunblock, Night Cream, Toner', 91, 9, 'Rejunenating', 'Improves skin texture+Removes dead skin cell+Improves skin barriers+Reduce fine lines and wrinkles+Increase skin moisture results to healthy glowing skin', NULL, NULL),
(15, 'gel-toner-radiantGlow.png', 'Gel Toner', 100, '60ml', 92, 8, 'Glass Skin', NULL, NULL, NULL),
(16, 'facialwash-radiantGlow.png', 'Facial Wash', 50, '80ml', 0, 97, 'Glass Skin', NULL, NULL, NULL),
(17, 'alcohol.png', 'Serum', 40, '5g', 0, 25, 'Glass Skin', NULL, NULL, NULL),
(18, 'sunblock-radiantGlow.png', 'Sun Block', 90, '10g', 49, 51, 'Glass Skin', NULL, NULL, NULL),
(19, 'glow-set.png', 'Radiant Glow Facial Set', 350, 'Gel Toner, Facial Wash, Serum, Sunblock', 100, 0, 'Glass Skin', 'Young looking, fair smooth, firm and perfect glass skin is finally within your reach.', NULL, NULL),
(20, 'alcohol.png', 'Isopropyl Alcohol', 50, '1 litter', 68, 32, 'Alcohol', NULL, NULL, NULL),
(21, 'alcohol.png', 'Isopropyl Alcohol', 40, '60ml', 0, 123, 'Alcohol', NULL, NULL, NULL);

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
(23, 'test.png', 'test', 100, '1L', 0, 0, 'Alcohol', '123\r\n456', '789\r\n123', '456\r\n789'),
(24, 'test.png', 'test1', 122, '1L', 0, 0, 'Alcohol', '22', '33', '44');

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
(1, 'bryanken00#810', '', 'Anti-Aging Serum', '30ml', 30, 'Serum', -4),
(2, 'bryanken00#810', '', 'Moisturizing Cream', '50ml', 20, 'Face Cream', -12),
(3, 'bryanken00#810', '', 'Exfoliating Scrub', '100g', 13, 'Facial Scrub', -3),
(4, 'bryanken00#810', '', 'Hydrating Toner', '200ml', 16, 'Toner', 0),
(5, 'bryanken00#810', '', 'Acne Treatment Gel', '15ml', 10, 'Spot Treatment', -4),
(6, 'raven#828', '', 'Brightening Face Mask', '25g', 9, 'Face Mask', 0),
(7, 'raven#828', '', 'Moisturizing Body Lotion', '200ml', 13, 'Body Lotion', 0),
(8, 'raven#828', '', 'Revitalizing Eye Cream', '15ml', 25, 'Eye Cream', 0),
(9, 'raven#828', '', 'Soothing Aloe Vera Gel', '100ml', 10, 'Aloe Vera Gel', 0),
(10, 'raven#828', '', 'Hydrating Facial Mist', '50ml', 7, 'Facial Mist', 0),
(11, 'Besa#828', '', 'Cleansing Foam', '150ml', 13, 'Facial Cleanser', 0),
(12, 'Besa#828', '', 'Anti-Wrinkle Cream', '50g', 20, 'Face Cream', 0),
(13, 'Besa#828', '', 'Refreshing Toner', '200ml', 16, 'Toner', 0),
(14, 'Besa#828', '', 'Hydrating Sheet Mask', '25ml', 7, 'Sheet Mask', 0),
(15, 'Besa#828', '', 'Lip Balm', '10g', 5, 'Lip Care', 0),
(16, 'bryanken00#810', '', 'Hydrating Serum', '50ml', 25, 'Serum', -11),
(17, 'bryanken00#810', '', 'Brightening Serum', '30ml', 22, 'Serum', 0),
(18, 'bryanken00#810', '', 'Firming Serum', '30ml', 28, 'Serum', 1),
(19, 'bryanken00#810', '', 'Vitamin E Serum', '20ml', 19, 'Serum', 1),
(20, 'bryanken00#810', '', 'Night Cream', '50ml', 30, 'Face Cream', 1),
(21, 'bryanken00#810', '', 'Anti-Acne Cream', '30ml', 23, 'Face Cream', 1),
(22, 'bryanken00#810', '', 'Hydrating Gel Cream', '50ml', 20, 'Face Cream', 1),
(23, 'bryanken00#810', '', 'Whitening Cream', '50ml', 25, 'Face Cream', 1),
(24, 'bryanken00#810', '', 'Gentle Facial Scrub', '75g', 12, 'Facial Scrub', 1),
(25, 'bryanken00#810', '', 'Charcoal Scrub', '50g', 11, 'Facial Scrub', 1),
(26, 'bryanken00#810', '', 'Microdermabrasion Scrub', '100g', 15, 'Facial Scrub', 1),
(27, 'bryanken00#810', '', 'Pore Minimizing Scrub', '50g', 13, 'Facial Scrub', 1),
(28, 'bryanken00#810', '', 'Rosewater Toner', '150ml', 13, 'Toner', 1),
(29, 'bryanken00#810', '', 'Clarifying Toner', '200ml', 15, 'Toner', 1),
(30, 'bryanken00#810', '', 'Balancing Toner', '100ml', 12, 'Toner', 1),
(31, 'bryanken00#810', '', 'Hydrating Mist Toner', '120ml', 17, 'Toner', 1),
(32, 'raven#828', '', 'Hydrating Sheet Mask', '20g', 8, 'Face Mask', 0),
(33, 'raven#828', '', 'Purifying Clay Mask', '50g', 10, 'Face Mask', 0),
(34, 'raven#828', '', 'Collagen Face Mask', '30g', 9, 'Face Mask', 0),
(35, 'raven#828', '', 'Soothing Gel Mask', '25g', 7, 'Face Mask', 0),
(36, 'raven#828', '', 'Nourishing Body Lotion', '250ml', 15, 'Body Lotion', 0),
(37, 'raven#828', '', 'Whitening Body Lotion', '200ml', 13, 'Body Lotion', 0),
(38, 'raven#828', '', 'Firming Body Lotion', '150ml', 12, 'Body Lotion', 0),
(39, 'raven#828', '', 'Scented Body Lotion', '200ml', 11, 'Body Lotion', 0),
(40, 'raven#828', '', 'Anti-Aging Eye Cream', '10ml', 20, 'Eye Cream', 0),
(41, 'raven#828', '', 'Brightening Eye Cream', '15ml', 22, 'Eye Cream', 0),
(42, 'raven#828', '', 'Hydrating Eye Cream', '20ml', 19, 'Eye Cream', 0),
(43, 'raven#828', '', 'Anti-Wrinkle Eye Cream', '12ml', 24, 'Eye Cream', 0),
(44, 'raven#828', '', 'Cooling Aloe Vera Gel', '150ml', 9, 'Aloe Vera Gel', 0),
(45, 'raven#828', '', 'Moisturizing Aloe Vera Gel', '100ml', 8, 'Aloe Vera Gel', 0),
(46, 'raven#828', '', 'Soothing Aloe Vera Gel', '200ml', 10, 'Aloe Vera Gel', 0),
(47, 'raven#828', '', 'Refreshing Aloe Vera Gel', '120ml', 7, 'Aloe Vera Gel', 0),
(48, 'raven#828', '', 'Rosewater Facial Mist', '100ml', 9, 'Facial Mist', 0),
(49, 'raven#828', '', 'Hydrating Facial Mist', '150ml', 11, 'Facial Mist', 0),
(50, 'raven#828', '', 'Refreshing Facial Mist', '50ml', 7, 'Facial Mist', 0),
(51, 'raven#828', '', 'Cucumber Facial Mist', '120ml', 8, 'Facial Mist', 0),
(52, 'Besa#828', '', 'Gentle Foaming Cleanser', '120ml', 10, 'Facial Cleanser', 0),
(53, 'Besa#828', '', 'Creamy Cleansing Milk', '200ml', 12, 'Facial Cleanser', 0),
(54, 'Besa#828', '', 'Acne Control Cleanser', '150ml', 13, 'Facial Cleanser', 0),
(55, 'Besa#828', '', 'Exfoliating Cleanser', '100ml', 11, 'Facial Cleanser', 0),
(56, 'Besa#828', '', 'Anti-Aging Face Cream', '50ml', 25, 'Face Cream', 0),
(57, 'Besa#828', '', 'Moisturizing Day Cream', '30ml', 20, 'Face Cream', 0),
(58, 'Besa#828', '', 'Night Repair Cream', '50ml', 23, 'Face Cream', 0),
(59, 'Besa#828', '', 'Whitening Face Cream', '50ml', 24, 'Face Cream', 0),
(60, 'Besa#828', '', 'Balancing Toner', '150ml', 14, 'Toner', 0),
(61, 'Besa#828', '', 'Pore Minimizing Toner', '200ml', 17, 'Toner', 0),
(62, 'Besa#828', '', 'Hydrating Toner', '120ml', 15, 'Toner', 0),
(63, 'Besa#828', '', 'Clarifying Toner', '100ml', 16, 'Toner', 0),
(64, 'Besa#828', '', 'Moisturizing Sheet Mask', '25ml', 8, 'Sheet Mask', 0),
(65, 'Besa#828', '', 'Brightening Sheet Mask', '20ml', 9, 'Sheet Mask', 0),
(66, 'Besa#828', '', 'Hydrating Sheet Mask', '30ml', 7, 'Sheet Mask', 0),
(67, 'Besa#828', '', 'Soothing Sheet Mask', '25ml', 7, 'Sheet Mask', 0),
(68, 'Besa#828', '', 'Tinted Lip Balm', '5g', 7, 'Lip Care', 0),
(69, 'Besa#828', '', 'Moisturizing Lip Butter', '8g', 6, 'Lip Care', 0),
(70, 'Besa#828', '', 'Lip Scrub', '10g', 8, 'Lip Care', 0),
(71, 'Besa#828', '', 'Lip Sleeping Mask', '15g', 10, 'Lip Care', 0),
(72, 'bryanken00#810', '', 'Blemish Control Gel', '15ml', 10, 'Spot Treatment', 1),
(73, 'bryanken00#810', '', 'Acne Clearing Solution', '30ml', 15, 'Spot Treatment', 1),
(74, 'bryanken00#810', '', 'Oil Control Spot Treatment', '10ml', 9, 'Spot Treatment', 1),
(75, 'bryanken00#810', '', 'Pimple Patch', '20 patches', 7, 'Spot Treatment', 1),
(76, 'admin#578', '', 'Cleansing Foam', '150ml', 13, 'Facial Cleanser', 0),
(77, 'admin#578', '', 'Gel Cleanser', '200ml', 15, 'Facial Cleanser', 0),
(78, 'admin#578', '', 'Creamy Cleansing Milk', '180ml', 12, 'Facial Cleanser', 0),
(79, 'admin#578', '', 'Exfoliating Scrub Cleanser', '100ml', 10, 'Facial Cleanser', 1),
(80, 'admin#578', '', 'Micellar Water', '250ml', 9, 'Facial Cleanser', 1),
(81, 'admin#578', '', 'Hydrating Face Cream', '50ml', 20, 'Moisturizer', 1),
(82, 'admin#578', '', 'Oil-Free Moisturizer', '100ml', 17, 'Moisturizer', 1),
(83, 'admin#578', '', 'Nourishing Night Cream', '50ml', 22, 'Moisturizer', 1),
(84, 'admin#578', '', 'Gel Moisturizer', '75ml', 15, 'Moisturizer', 1),
(85, 'admin#578', '', 'Anti-Aging Moisturizer', '30ml', 25, 'Moisturizer', 1),
(86, 'admin#578', '', 'Brightening Face Mask', '25g', 9, 'Face Mask', 1),
(87, 'admin#578', '', 'Hydrating Sheet Mask', '30g', 10, 'Face Mask', 1),
(88, 'admin#578', '', 'Clay Mask', '50g', 13, 'Face Mask', 1),
(89, 'admin#578', '', 'Detoxifying Charcoal Mask', '30g', 11, 'Face Mask', 1),
(90, 'admin#578', '', 'Soothing Aloe Vera Mask', '20g', 8, 'Face Mask', 1),
(91, 'admin#578', '', 'Brightening Serum', '30ml', 25, 'Serum', 0),
(92, 'admin#578', '', 'Hyaluronic Acid Serum', '50ml', 30, 'Serum', 1),
(93, 'admin#578', '', 'Vitamin C Serum', '30ml', 28, 'Serum', 1),
(94, 'admin#578', '', 'Anti-Aging Serum', '25ml', 27, 'Serum', 1),
(95, 'admin#578', '', 'Rejuvenating Facial Oil', '20ml', 23, 'Serum', 1),
(96, 'admin#578', '', 'Nourishing Lip Balm', '5g', 5, 'Lip Care', 1),
(97, 'admin#578', '', 'Tinted Lip Balm', '4g', 6, 'Lip Care', 1),
(98, 'admin#578', '', 'Lip Scrub', '10g', 7, 'Lip Care', 1),
(99, 'admin#578', '', 'Lip Sleeping Mask', '15g', 9, 'Lip Care', 1),
(100, 'admin#578', '', 'Lip Butter', '8g', 8, 'Lip Care', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblvolumemonth`
--

CREATE TABLE `tblvolumemonth` (
  `MATERIAL_NAME` varchar(100) NOT NULL,
  `SUPPLIER` varchar(100) NOT NULL,
  `CODE_NAME` varchar(100) NOT NULL,
  `CURRENT_VOLUME` int(11) NOT NULL,
  `CURRENT_MONTH` int(2) NOT NULL
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
-- Indexes for table `tblmonthlysummary`
--
ALTER TABLE `tblmonthlysummary`
  ADD PRIMARY KEY (`itemID`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audittrailmarketing`
--
ALTER TABLE `audittrailmarketing`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblaccount`
--
ALTER TABLE `tblaccount`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblcancelledorder`
--
ALTER TABLE `tblcancelledorder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblcartdata`
--
ALTER TABLE `tblcartdata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `tblconfirmationproduct`
--
ALTER TABLE `tblconfirmationproduct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblconfirmationtracking`
--
ALTER TABLE `tblconfirmationtracking`
  MODIFY `TrackingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcourierdelivery`
--
ALTER TABLE `tblcourierdelivery`
  MODIFY `deliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tblcourierdeliverycompleted`
--
ALTER TABLE `tblcourierdeliverycompleted`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblcourierdeliverydate`
--
ALTER TABLE `tblcourierdeliverydate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblcourierinformation`
--
ALTER TABLE `tblcourierinformation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblcurrentmonth`
--
ALTER TABLE `tblcurrentmonth`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1664;

--
-- AUTO_INCREMENT for table `tblmonthlysummary`
--
ALTER TABLE `tblmonthlysummary`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `tblordercheckout`
--
ALTER TABLE `tblordercheckout`
  MODIFY `OrderNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tblordercheckoutdataarchive`
--
ALTER TABLE `tblordercheckoutdataarchive`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tblorderexpirationtime`
--
ALTER TABLE `tblorderexpirationtime`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tblpreregistration`
--
ALTER TABLE `tblpreregistration`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `prodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblrebrandingproducts`
--
ALTER TABLE `tblrebrandingproducts`
  MODIFY `prodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `CheckAndMoveExpiredOrders` ON SCHEDULE EVERY 10 SECOND STARTS '2023-09-21 11:30:16' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

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
  WHERE a.Expiration <= NOW();

  INSERT INTO tblorderarchive (OrderNumber, OrderRefNumber, OrderDate, UserID, address, contact, email)
  SELECT b.OrderNumber, b.OrderRefNumber, b.OrderDate , b.UserID, b.address, b.contact, b.email
  FROM tblcancelledorder AS a
  JOIN tblordercheckout AS b ON b.OrderRefNumber = a.OrderRefNumber
  WHERE b.OrderRefNumber NOT IN(SELECT OrderRefNumber FROM tblorderarchive);

  -- for keep tracking data
  INSERT INTO tblordercheckoutdataArchive (OrderRefNumber, ProductName, volume, Quantity, Price)
  SELECT b.OrderRefNumber, b.ProductName, b.volume, b.Quantity, b.Price
  FROM tblorderarchive AS a
  JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
  WHERE b.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblordercheckoutdataarchive);

  -- bring back the Quantity of Expired order
  UPDATE tblProducts AS a
  JOIN tblordercheckoutdataArchive AS b ON a.prodName = b.ProductName AND a.prodVolume = b.volume
  SET a.Quantity = a.Quantity + b.Quantity,
  a.Sold = a.Sold - b.Quantity,
  b.checker = 'Added'
  WHERE b.checker IS NULL;

  UPDATE tblrebrandingproducts AS a
  JOIN tblordercheckoutdataArchive AS b ON a.prodName = b.ProductName AND a.prodVolume = b.volume
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
  SET a.status =  'Cancelled'
  WHERE a.status != 'Expired';

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
