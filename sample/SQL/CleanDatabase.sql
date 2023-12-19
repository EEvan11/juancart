-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: admin.cqkzw4o58odp.ap-southeast-1.rds.amazonaws.com
-- Generation Time: Oct 29, 2023 at 11:07 AM
-- Server version: 8.0.33
-- PHP Version: 8.2.10

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
CREATE DEFINER=`admin`@`%` PROCEDURE `confirmProduct` ()   BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
UPDATE tblconfirmationtracking 
SET Status = 'COMPLETED' 
WHERE TrackingID = '42';
UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Micellar Water' AND prodVolume = '250ml';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Hydrating Face Cream' AND prodVolume = '50ml';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Oil-Free Moisturizer' AND prodVolume = '100ml';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Nourishing Night Cream' AND prodVolume = '50ml';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Gel Moisturizer' AND prodVolume = '75ml';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Anti-Aging Moisturizer' AND prodVolume = '30ml';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Brightening Face Mask' AND prodVolume = '25g';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Hydrating Sheet Mask' AND prodVolume = '30g';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Clay Mask' AND prodVolume = '50g';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Detoxifying Charcoal Mask' AND prodVolume = '30g';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Soothing Aloe Vera Mask' AND prodVolume = '20g';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Hydrating Face Cream' AND prodVolume = '50ml';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Vitamin C Serum' AND prodVolume = '30ml';UPDATE tblrebrandingfinishproduct AS a 
JOIN tblrebrandingproducts AS b ON b.prodID = a.ID 
SET a.FinishProduct = a.FinishProduct + '1' 
WHERE b.prodName = 'Anti-Aging Serum' AND prodVolume = '25ml';INSERT INTO audittrailmarketing(DateAction,userID,Description) VALUES(NOW(),'1','Confirm Stock - TrackingID: 42');
    -- If successful, commit the transaction
    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `audittrailmarketing`
--

CREATE TABLE `audittrailmarketing` (
  `ID` int NOT NULL,
  `DateAction` datetime NOT NULL,
  `UserID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblaccount`
--

CREATE TABLE `tblaccount` (
  `AccountID` int NOT NULL,
  `Username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `accType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Position` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
  `AccountID` int NOT NULL,
  `FirstName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LastName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MiddleName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Birthdate` date NOT NULL,
  `Age` int NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EmailAdd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
  `itemID` int NOT NULL,
  `userAccount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ArchiveDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcancelledorder`
--

CREATE TABLE `tblcancelledorder` (
  `ID` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CancelDate` datetime NOT NULL,
  `Reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcancelledorder`
--

INSERT INTO `tblcancelledorder` (`ID`, `OrderRefNumber`, `CancelDate`, `Reason`) VALUES
(1, 'ref34', '2023-10-29 10:56:08', 'Expired'),
(2, 'ref35', '2023-10-29 10:56:08', 'Expired'),
(3, 'ref36', '2023-10-29 10:56:08', 'Expired'),
(4, 'ref37', '2023-10-29 10:56:08', 'Expired'),
(5, 'ref38', '2023-10-29 10:56:08', 'Expired'),
(6, 'ref39', '2023-10-29 10:56:08', 'Expired'),
(7, 'ref40', '2023-10-29 10:56:08', 'Expired'),
(8, 'ref41', '2023-10-29 10:56:08', 'Expired'),
(9, 'ref42', '2023-10-29 10:56:08', 'Expired'),
(10, 'ref43', '2023-10-29 10:56:08', 'Expired'),
(11, 'ref47', '2023-10-29 10:56:08', 'Expired'),
(12, 'ref48', '2023-10-29 10:56:08', 'Expired'),
(13, 'ref49', '2023-10-29 10:56:08', 'Expired'),
(14, 'ref50', '2023-10-29 10:56:08', 'Expired'),
(15, 'ref51', '2023-10-29 10:56:08', 'Expired'),
(16, 'ref52', '2023-10-29 10:56:08', 'Expired'),
(17, 'ref73', '2023-10-29 10:56:08', 'Expired'),
(18, 'ref74', '2023-10-29 10:56:08', 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `tblcartdata`
--

CREATE TABLE `tblcartdata` (
  `ID` int NOT NULL,
  `uID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodQuantity` int NOT NULL,
  `prodVariant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationproduct`
--

CREATE TABLE `tblconfirmationproduct` (
  `ID` int NOT NULL,
  `TrackingID` int NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductVariant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductQuantity` int NOT NULL,
  `TimeAdded` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationproductarchive`
--

CREATE TABLE `tblconfirmationproductarchive` (
  `ID` int NOT NULL,
  `TrackingID` int NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductVariant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductQuantity` int NOT NULL,
  `TimeAdded` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationproductRebranding`
--

CREATE TABLE `tblconfirmationproductRebranding` (
  `ID` int NOT NULL,
  `UserID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TrackingID` int NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductVariant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductQuantity` int NOT NULL,
  `TimeAdded` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationproductRebrandingarchive`
--

CREATE TABLE `tblconfirmationproductRebrandingarchive` (
  `ID` int NOT NULL,
  `UserID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TrackingID` int NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductVariant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductQuantity` int NOT NULL,
  `TimeAdded` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationtracking`
--

CREATE TABLE `tblconfirmationtracking` (
  `TrackingID` int NOT NULL,
  `DateAdded` date NOT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AddedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblconfirmationtrackingarchive`
--

CREATE TABLE `tblconfirmationtrackingarchive` (
  `TrackingID` int NOT NULL,
  `DateAdded` date NOT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AddedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcourieraccount`
--

CREATE TABLE `tblcourieraccount` (
  `courierID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierdelivery`
--

CREATE TABLE `tblcourierdelivery` (
  `deliveryID` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `courierID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierdeliverycompleted`
--

CREATE TABLE `tblcourierdeliverycompleted` (
  `ID` int NOT NULL,
  `deliveryID` int NOT NULL,
  `DeliveryDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierdeliverydate`
--

CREATE TABLE `tblcourierdeliverydate` (
  `ID` int NOT NULL,
  `deliveryID` int NOT NULL,
  `DeliveryDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcourierinformation`
--

CREATE TABLE `tblcourierinformation` (
  `courierID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int NOT NULL,
  `Lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MI` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ContactNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcurrentmonth`
--

CREATE TABLE `tblcurrentmonth` (
  `itemID` int NOT NULL,
  `todayCurrentVolume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `RECEIVED_VOLUME` int DEFAULT NULL,
  `APPEARANCE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RELEASED_VOLUME` int DEFAULT NULL,
  `REJECT_VOLUME` int DEFAULT NULL,
  `HOLD_VOLUME` int DEFAULT NULL,
  `PROD_RETURN` int DEFAULT NULL,
  `DATE_TODAY` datetime NOT NULL,
  `MATERIAL_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CODE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SUPPLIER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORIES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcurrentmonth_archive`
--

CREATE TABLE `tblcurrentmonth_archive` (
  `itemID` int NOT NULL,
  `todayCurrentVolume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RECEIVED_VOLUME` int DEFAULT NULL,
  `APPEARANCE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RELEASED_VOLUME` int DEFAULT NULL,
  `REJECT_VOLUME` int DEFAULT NULL,
  `HOLD_VOLUME` int DEFAULT NULL,
  `PROD_RETURN` int DEFAULT NULL,
  `DATE_TODAY` datetime NOT NULL,
  `MATERIAL_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CODE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SUPPLIER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORIES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomeraccount`
--

CREATE TABLE `tblcustomeraccount` (
  `UserID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomerdiscount`
--

CREATE TABLE `tblcustomerdiscount` (
  `userID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomerinformation`
--

CREATE TABLE `tblcustomerinformation` (
  `UserID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Lastname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Firstname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MI` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Discount` float DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AccountType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbldisposproduct`
--

CREATE TABLE `tbldisposproduct` (
  `ID` int NOT NULL,
  `ProdName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Variant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblmonthlysummary`
--

CREATE TABLE `tblmonthlysummary` (
  `itemID` int NOT NULL,
  `MATERIAL_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CODE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CONTROL_NUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SUPPLIER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORIES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderapproved`
--

CREATE TABLE `tblorderapproved` (
  `ID` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ApprovedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderarchive`
--

CREATE TABLE `tblorderarchive` (
  `OrderNumber` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OrderDate` datetime NOT NULL,
  `UserID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shippingFee` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblordercheckout`
--

CREATE TABLE `tblordercheckout` (
  `OrderNumber` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OrderDate` datetime NOT NULL,
  `UserID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shippingFee` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblordercheckoutdata`
--

CREATE TABLE `tblordercheckoutdata` (
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `volume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Quantity` int NOT NULL,
  `Price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblordercheckoutdataarchive`
--

CREATE TABLE `tblordercheckoutdataarchive` (
  `ID` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `volume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Quantity` int NOT NULL,
  `Price` int NOT NULL,
  `checker` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderexpirationtime`
--

CREATE TABLE `tblorderexpirationtime` (
  `ID` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorderexpirationtime`
--

INSERT INTO `tblorderexpirationtime` (`ID`, `OrderRefNumber`, `Expiration`) VALUES
(1, 'ref61', '2023-11-03 11:02:38'),
(2, 'ref62', '2023-11-03 11:02:38'),
(3, 'ref63', '2023-11-03 11:02:38'),
(4, 'ref64', '2023-11-03 11:02:38'),
(5, 'ref65', '2023-11-03 11:02:38'),
(6, 'ref66', '2023-11-03 11:02:38'),
(7, 'ref67', '2023-11-03 11:02:38'),
(8, 'ref68', '2023-11-03 11:02:38'),
(9, 'ref69', '2023-11-03 11:02:38'),
(10, 'ref70', '2023-11-03 11:02:38'),
(11, 'ref71', '2023-11-03 11:02:38'),
(12, 'ref72', '2023-11-03 11:02:38'),
(13, 'ref75', '2023-11-03 11:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblorderstatus`
--

CREATE TABLE `tblorderstatus` (
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpreregistration`
--

CREATE TABLE `tblpreregistration` (
  `ID` int NOT NULL,
  `Firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Middlename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Contactnum` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Emailadd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `City` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Barangay` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Zipcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblproductcategories`
--

CREATE TABLE `tblproductcategories` (
  `prodCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CategoryName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `prodID` int NOT NULL,
  `prodImg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodPrice` int NOT NULL,
  `prodVolume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Sold` int DEFAULT NULL,
  `prodCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Ingredients` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Howtouse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`prodID`, `prodImg`, `prodName`, `prodPrice`, `prodVolume`, `Quantity`, `Sold`, `prodCategory`, `Description`, `Ingredients`, `Howtouse`) VALUES
(1, 'age-eraser-soap.png', 'Age Eraser Soap', 100, '135g', 2495, 5, 'Soap', 'The best ingredients in nature are blended in this unique anti-ageing black beauty soap. You now have the power to renew your skin and make younger, whiter and fresher. With micro beads that gently exfoliate and remove dead skin cells.', 'Saponified oils of palm, coconut, soybean and castor, aqua, sodium lactate, activated charcoal, bearberry extract (w/ allantoin & alpha arbutin), glycerin, moringga extract, fragrance oil, colorant and cocomonoethanolamide.', 'For Face: Lather on hands until foamy and massage onto face. Rinse well.+ForBody: Lather on skin directly and rinse well.+Use daily. If irratation occurs, discontinue use.'),
(2, '', 'Glutamansi Soap', 50, '50g', 399, 1, 'Soap', 'Whitening, Moisturizing, Skin Clarifying, Exfoliating, Micro-peeling, Deodorizing', 'Aqua, Coconut Oil, Palm Oil, Sodium Hydroxide, Virgin Coconut Oil, Calamansi Extract, Calamansi Rind, Sodium Bicarbonate, Titanium Dioxide, Phenoxyethanol, Propylene Glycol, Fragrance Oil, Glycerin, Glutathione', 'Aqua, Coconut Oil, Palm Oil, Sodium Hydroxide, Virgin Coconut Oil, Calamansi Extract, Calamansi Rind, Sodium Bicarbonate, Titanium Dioxide, Phenoxyethanol, Propylene Glycol, Fragrance Oil, Glycerin, Glutathione'),
(3, 'alcohol.png', 'Kojic Rejuvinating Soap', 70, '135g', 99, 1, 'Soap', NULL, NULL, NULL),
(4, 'frejuv.png', 'Bleaching Soap', 25, '70g', 73, 27, 'Soap', NULL, NULL, NULL),
(5, 'glow-set.png', 'Revitalize Whitening Beauty Bar', 90, '135g', 97, 3, 'Soap', NULL, NULL, NULL),
(6, '', 'Snail Max White Lotion', 50, '250ml', -1, 1, 'Lotion', '', '', ''),
(7, 'glutamansi-lotion.png', 'Glutamansi Lotion', 70, '250ml', 285, 15, 'Lotion', 'Achieve that rosy skin and radiant glow with this non-sticky premium lotion. Made with effective natural ingredients such as glutathione, calamansi extract, baking soda, shea butter, kojic acid,  glycolic, moisturize and hydrate your skin fast while keeping it soft, smooth, form and young-looking.', 'Aqua, Stearic Acid, Glycol Monostearate, Isopropyl Yristate, Cetyl Alcohol, Glycerin, Glycol Distearate, Glycine Soja (Soybean) Oil, Mineral Oil, Sodium Bicarbonate, Propylene Glycol, Citric Acid, Zinc Oxide, Titanium Dioxide, Kojic Acid Dipalmitate, Glycolic Acod, Citrofortunella Microcarpa (Calamansi) Extract, Green Carica Papaya Extract, Octyl Methoxycinnamate, Glutathione, Phenoxyethanol, Butyrospermum Parkii (Shea) Oil, Fragrance ang BHT, CI 42053', 'Pour desire amount on skin and spread evenly on hands, legs and body. Use twice daily.+For external use only. Of irratation occurs, discontinue use+Store in a cool, dry place not exceeding 30°.'),
(8, 'alcohol.png', 'Bleaching Lotion', 40, '250ml', 90, 10, 'Lotion', NULL, NULL, NULL),
(9, 'frejuv.png', 'Gluta White Lotion', 100, '250ml', 100, 0, 'Lotion', NULL, NULL, NULL),
(10, 'age-eraser-soap.png', 'Kojic Rejuvinating Soap', 40, '110g', -2, 102, 'Rejuvenating', NULL, NULL, NULL),
(11, 'sunblock-rejuv.png', 'Sunblock', 90, '10g', 36, 64, 'Rejuvenating', NULL, NULL, NULL),
(12, 'cream-rejuv.png', 'Bright Cream', 150, '10g', 93, 7, 'Rejuvenating', NULL, NULL, NULL),
(13, 'frejuv.png', 'Toner', 125, '60ml', 93, 7, 'Rejuvenating', NULL, NULL, NULL),
(14, 'rejuv-set.png', 'Rejuvenating Set', 250, 'Kojic Soap, Sunblock, Night Cream, Toner', 91, 9, 'Rejuvenating', 'Improves skin texture+Removes dead skin cell+Improves skin barriers+Reduce fine lines and wrinkles+Increase skin moisture results to healthy glowing skin', NULL, NULL),
(15, 'gel-toner-radiantGlow.png', 'Gel Toner', 100, '60ml', 90, 10, 'Glass Skin', NULL, NULL, NULL),
(16, 'facialwash-radiantGlow.png', 'Facial Wash', 50, '80ml', 0, 97, 'Glass Skin', NULL, NULL, NULL),
(17, 'alcohol.png', 'Serum', 40, '5g', 0, 25, 'Glass Skin', NULL, NULL, NULL),
(18, 'sunblock-radiantGlow.png', 'Sun Block', 90, '10g', 48, 52, 'Glass Skin', NULL, NULL, NULL),
(19, 'glow-set.png', 'Radiant Glow Facial Set', 350, 'Gel Toner, Facial Wash, Serum, Sunblock', 100, 0, 'Glass Skin', 'Young looking, fair smooth, firm and perfect glass skin is finally within your reach.', NULL, NULL),
(20, 'alcohol.png', 'Isopropyl Alcohol', 50, '1 litter', 152, 48, 'Alcohol', NULL, NULL, NULL),
(21, 'alcohol.png', 'Isopropyl Alcohol', 40, '60ml', 186, 147, 'Alcohol', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblproductsarchive`
--

CREATE TABLE `tblproductsarchive` (
  `prodID` int NOT NULL,
  `prodImg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodPrice` int NOT NULL,
  `prodVolume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Sold` int DEFAULT NULL,
  `prodCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Ingredients` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Howtouse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrebrandingfinishproduct`
--

CREATE TABLE `tblrebrandingfinishproduct` (
  `ID` int NOT NULL,
  `FinishProduct` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrebrandingproducts`
--

CREATE TABLE `tblrebrandingproducts` (
  `prodID` int NOT NULL,
  `userID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodImg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prodName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodVolume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodPrice` int NOT NULL,
  `prodCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Sold` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrebrandingproductsarchive`
--

CREATE TABLE `tblrebrandingproductsarchive` (
  `prodID` int NOT NULL,
  `userID` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodImg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prodName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodVolume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodPrice` int NOT NULL,
  `prodCategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Sold` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblreturndetails`
--

CREATE TABLE `tblreturndetails` (
  `ID` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DateAdded` datetime NOT NULL,
  `Reason` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgPath1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imgPath2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imgPath3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblreturnproduct`
--

CREATE TABLE `tblreturnproduct` (
  `ID` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodVariant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblreturnstatus`
--

CREATE TABLE `tblreturnstatus` (
  `ID` int NOT NULL,
  `OrderRefNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblvolumemonth`
--

CREATE TABLE `tblvolumemonth` (
  `MATERIAL_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SUPPLIER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CODE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CURRENT_VOLUME` int NOT NULL,
  `CURRENT_MONTH` int NOT NULL
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audittrailmarketing`
--
ALTER TABLE `audittrailmarketing`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblaccount`
--
ALTER TABLE `tblaccount`
  MODIFY `AccountID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcancelledorder`
--
ALTER TABLE `tblcancelledorder`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tblcartdata`
--
ALTER TABLE `tblcartdata`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblconfirmationproduct`
--
ALTER TABLE `tblconfirmationproduct`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblconfirmationproductRebranding`
--
ALTER TABLE `tblconfirmationproductRebranding`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblconfirmationtracking`
--
ALTER TABLE `tblconfirmationtracking`
  MODIFY `TrackingID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcourierdelivery`
--
ALTER TABLE `tblcourierdelivery`
  MODIFY `deliveryID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcourierdeliverycompleted`
--
ALTER TABLE `tblcourierdeliverycompleted`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcourierdeliverydate`
--
ALTER TABLE `tblcourierdeliverydate`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcourierinformation`
--
ALTER TABLE `tblcourierinformation`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcurrentmonth`
--
ALTER TABLE `tblcurrentmonth`
  MODIFY `itemID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmonthlysummary`
--
ALTER TABLE `tblmonthlysummary`
  MODIFY `itemID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorderapproved`
--
ALTER TABLE `tblorderapproved`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblordercheckout`
--
ALTER TABLE `tblordercheckout`
  MODIFY `OrderNumber` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblordercheckoutdataarchive`
--
ALTER TABLE `tblordercheckoutdataarchive`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorderexpirationtime`
--
ALTER TABLE `tblorderexpirationtime`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblpreregistration`
--
ALTER TABLE `tblpreregistration`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `prodID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblrebrandingproducts`
--
ALTER TABLE `tblrebrandingproducts`
  MODIFY `prodID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblreturndetails`
--
ALTER TABLE `tblreturndetails`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblreturnproduct`
--
ALTER TABLE `tblreturnproduct`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblreturnstatus`
--
ALTER TABLE `tblreturnstatus`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`admin`@`%` EVENT `CheckAndMoveExpiredOrders` ON SCHEDULE EVERY 10 SECOND STARTS '2023-10-15 13:13:28' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
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
