<?php
    if(session_status() == PHP_SESSION_NONE)
        session_start();
    include('../includesPHP/database.php');

    $ref = $_GET['ref'];
    $deliveryID = $_GET['dID'];
    $sql = "UPDATE tblorderstatus SET Status = 'Completed' WHERE OrderRefNumber = '$ref'";

    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $currentDate = date("Y-m-d h:i A");
    $sqlInsert = "INSERT INTO tblcourierdeliverycompleted(deliveryID,DeliveryDate) VALUES('$deliveryID',NOW())";

    $stmt1 = $conn->prepare($sqlInsert);
    $stmt1->execute();

    if ($stmt->affected_rows > 0 && $stmt1->affected_rows > 0) {
        echo "alert('Order delivered successfully')";
    } else {
        echo "alert('Please contact administrator')";
    }


?>