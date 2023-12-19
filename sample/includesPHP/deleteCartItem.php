<?php 
    if(session_status() == PHP_SESSION_NONE)
    session_start();
    include('../includesPHP/database.php');

    $uID = $_SESSION['userID'];
    $prodName = $_POST['prodName'];
    $prodVariant = $_POST['prodVariant'];

    $sql = "DELETE FROM tblcartdata WHERE uID = '$uID' AND prodName = '$prodName' AND prodVariant = '$prodVariant'";

    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Record deleted successfully";
    } else {
        // Deletion failed
        echo "Failed to delete record";
    }

?>