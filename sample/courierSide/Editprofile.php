<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();

include('../includesPHP/database.php');

$identifier = $_POST['identifier'];

$hiddenID = $_POST['hiddenID'];
$varPopup;

if($identifier == "EditName"){
    $Name = $_POST['FullName'];
    $sql = "UPDATE tblcourierinformation SET Firstname = '$firstName', Lastname = '$lastName' WHERE UserID = '$hiddenID'";
    $varPopup = "Your Name has been Updated!";
} else if($identifier == "EditContact"){
    $Contact = $_POST['Contact'];
    $sql = "UPDATE tblcourierinformation SET ContactNo = '$Contact' WHERE courierID = '$hiddenID'";
    $varPopup = "Your Contact Number has been Updated!";
} else if($identifier == "EditPassword"){
    $password = $_POST['NewPass'];
    $sql = "UPDATE tblcourieraccount SET Password = '$password' WHERE courierID = '$hiddenID'";
    $varPopup = "Your Password has been Updated!";
} else if($identifier == "EditEmail"){
    $Email = $_POST['Email'];
    $sql = "UPDATE tblcourierinformation SET Email = '$Email' WHERE courierID = '$hiddenID'";
    $varPopup = "Your Email has been Updated!";
}

$stmt = $conn->prepare($sql);
$stmt->execute();

echo $varPopup;
?>