<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
session_regenerate_id();
include('../includesPHP/database.php');

if (!empty($_SESSION['checkedCheckboxesData'])){$dataLength = count($_SESSION['checkedCheckboxesData']);}


$conn->begin_transaction();

try{
    $userID = $_SESSION['userID'];
    //random number of ref number
    $sqlrefGen = "SELECT COUNT(OrderRefNumber) FROM tblorderstatus";
    $resultrefGen = $conn->query($sqlrefGen);
    $rowrefGen = $resultrefGen->fetch_assoc();
    $countValue = $rowrefGen['COUNT(OrderRefNumber)'];
    $ref = "ref" . $countValue+1;
    $uID = $_SESSION['userID'];
    $custAddress = $_SESSION['custAddress'];
    $custNumber = $_SESSION['custNumber'];
    $custEmail = $_SESSION['custEmail'];

    
    $refChekcer = "ref" . $countValue;
    $rowCountChecker = 0;
    
    for($i = 0; $i < $dataLength; $i++){
        $prodName = $_SESSION['checkedCheckboxesData'][$i]['itemName'];
        $prodVolume = $_SESSION['checkedCheckboxesData'][$i]['itemDetails'];
        $prodQuantity = $_SESSION['checkedCheckboxesData'][$i]['quantityNo'];
        $itemPrice = $_SESSION['checkedCheckboxesData'][$i]['itemPrice'];

        $sqlChecker = "SELECT * FROM tblordercheckoutdata WHERE OrderRefNumber = '$refChekcer' AND ProductName = '$prodName' AND volume = '$prodVolume' AND Quantity = '$prodQuantity'";
        $result = $conn->query($sqlChecker);
        $row = $result->fetch_assoc();
        if ($result->num_rows == 1) {
            if($rowCountChecker == $dataLength){
                $conn->rollback();
            }else{
                $rowCountChecker++;
                continue;
            }
        }
    
        //adding value on tblcheckoutdata
        $sql = "INSERT INTO tblordercheckoutdata(OrderRefNumber,ProductName, volume, Quantity, Price) 
        SELECT '$ref', prodName, prodVolume, $prodQuantity, prodPrice 
        FROM tblproducts 
        WHERE prodName = '$prodName' AND prodVolume = '$prodVolume'";
        $result = mysqli_query($conn, $sql);

        if ($result) {
            $numRowsInserted = mysqli_affected_rows($conn);
            if($numRowsInserted == 0){
                $sql = "INSERT INTO tblordercheckoutdata(OrderRefNumber,ProductName, volume, Quantity, Price) 
                SELECT '$ref', prodName, prodVolume, $prodQuantity, prodPrice 
                FROM tblrebrandingproducts 
                WHERE prodName = '$prodName' AND prodVolume = '$prodVolume' AND userID = '$userID'";
                $result = mysqli_query($conn, $sql);
            }
        } else {
            echo "Error: " . mysqli_error($conn);
        }
        //updating table products (Quantity, Sold);
    
        // Update Product Stock
        $sqlUpdate = "UPDATE tblproducts
        SET Quantity = Quantity - $prodQuantity,
        Sold = Sold + $prodQuantity
        WHERE prodName = '$prodName' AND prodVolume = '$prodVolume'";
    
        if (mysqli_query($conn, $sqlUpdate)) {
            $rowsAffected = mysqli_affected_rows($conn);
            if ($rowsAffected > 0) {
                echo "Table updated successfully. $rowsAffected rows were affected.";
            } else {
                $sqlUpdateRebranding = "UPDATE tblrebrandingproducts
                SET Sold = Sold + $prodQuantity
                WHERE prodName = '$prodName' AND prodVolume = '$prodVolume'";
                    if (mysqli_query($conn, $sqlUpdateRebranding)) {
                        echo "Table updated successfully.";
                    } else {
                        echo "Error updating table: " . mysqli_error($conn);
                    }
            }
        } else {
            echo "Error updating table: " . mysqli_error($conn);
        }

        $sqltoDelete = "DELETE FROM tblcartdata WHERE prodName = '$prodName' AND prodVariant = '$prodVolume'";
        
        if (mysqli_query($conn, $sqltoDelete)) {
            echo "Table updated successfully.";
        } else {
            echo "Error updating table: " . mysqli_error($conn);
        }
    
    }
    
    $sql2 = "INSERT INTO tblordercheckout(OrderRefNumber, OrderDate, UserID, address, contact, email, shippingFee) VALUES('$ref', NOW(), '$uID', '$custAddress', '$custNumber', '$custEmail',0)";
    
    if ($conn->query($sql2) === TRUE) {
        echo "Record updated successfully sql1";
    }else {
        echo "Error updating recordSQL1: " . $conn->error;
    }
    
    $sql3 = "INSERT INTO tblorderstatus VALUES('$ref','toPay')";
    // adding value on tblcheckout
    if($conn->query($sql3) === TRUE){
        echo "Record updated successfully sql2";
        // $_SESSION['checkedCheckboxesData'] = null;
        $uID = $_SESSION['userID'];
        $name = $_SESSION['username'];
        session_unset();
        session_destroy();
        session_start();
        $_SESSION['userID'] = $uID;
        $_SESSION['username'] = $name;
    
    }else {
        echo "Error updating recordSQL2: " . $conn->error;
    }

    $conn->commit();
} catch (Exception $e) {

    $conn->rollback();
    echo "Error updating records: " . $e->getMessage();
}

?>