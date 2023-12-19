<?php
if(session_status() === PHP_SESSION_NONE)
    session_start();

$userID = $_SESSION['userID'];
$productLabel = $_POST['productLabel'];
$productWeight = $_POST['productWeight'];
$quantity = $_POST['prodQuantity'];


include('../includesPHP/database.php');

$sqlChecker = "SELECT uID FROM tblcartdata WHERE uid = '$userID' AND prodName = '$productLabel' AND prodQuantity = '$quantity' AND prodVariant = '$productWeight'";
// echo $sqlChecker;
$result = $conn->query($sqlChecker);
if ($result->num_rows > 0) {
    // Not working yet
    echo "Please review your cart. This item has already been added.";
}else{
    $sql = "INSERT INTO tblcartdata (uID, prodName, prodQuantity, prodVariant) VALUES('$userID','$productLabel','$quantity','$productWeight')";
    if ($conn->query($sql) === TRUE) {  
        // echo "Record updated successfully";
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>