<?php

if(session_status() == PHP_SESSION_NONE)
    session_start();

    $ref = $_GET['cancel'];
    $reason = 'Cancelled';

    include('../includesPHP/database.php');

    //ARCHIVE

    $SQL = "INSERT INTO tblcancelledorder (OrderRefNumber, CancelDate,Reason) VALUES('$ref',NOW(), '$reason');";
    $SQLDelete = "DELETE FROM tblorderexpirationtime WHERE OrderRefNumber = '$ref';";
    if ($conn->query($SQL) === TRUE) {
        if ($conn->query($SQLDelete) === TRUE) {
            echo "Order with reference $ref successfully canceled!";
        } else {
            echo "Error: " . $SQL . "<br>" . $conn->error;
        }
    } else {
        echo "Error: " . $SQL . "<br>" . $conn->error;
    }
    
?>