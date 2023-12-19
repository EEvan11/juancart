<?php
    if(session_status() == PHP_SESSION_NONE)
        session_start();
    include('../includesPHP/database.php');

    $userID = $_SESSION['userID'];
    $prodName = $_POST['prodName'];
    $prodID = $_POST['prodID'];
    $prodVariant = $_POST['prodVariant'];

    $sqlChecker = "SELECT uID FROM tblcartdata WHERE uid = '$userID' AND prodName = '$prodName' AND prodVariant = '$prodVariant'";
    // echo $sqlChecker;
    $result = $conn->query($sqlChecker);
    if ($result->num_rows > 0) {
        // Not working yet
        echo "<script>window.alert('Please review your cart. This item has already been added.');</script>";
    }else{
        $sql = "INSERT INTO tblcartdata (uID, prodName, prodQuantity, prodVariant) VALUES('$userID','$prodName',1,'$prodVariant')";
        $sql1 = "INSERT INTO tblcartdata (uID, prodName, prodQuantity, prodVariant)
        SELECT userID, prodName, 1, prodVolume
        FROM tblrebrandingproducts
        WHERE userID = '$userID' AND prodName = '$prodName' AND prodVolume = '$prodVariant';";
        echo $sql1;
        if ($conn->query($sql) === TRUE) {
            echo "Record updated successfully";
        } else {
            echo "Error updating record: " . $conn->error;
        }
    }

?>