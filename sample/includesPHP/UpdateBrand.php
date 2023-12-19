<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();

include('../includesPHP/database.php');

$hiddenID = $_POST['hiddenID'];
$brand = $_POST['Brand'];
$varPopup;

$sql = "UPDATE tblcustomerinformation
SET Description = '$brand'
WHERE UserID = '$hiddenID';";

$varPopup = "Product Description has been updated!";

$stmt = $conn->prepare($sql);
$stmt->execute();

echo $varPopup;
?>