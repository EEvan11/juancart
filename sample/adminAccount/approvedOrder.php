<?php
include('../includesPHP/database.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ref = $_POST['refNumber'];

    $stmt = $conn->prepare("UPDATE tblorderstatus SET Status = 'Approved' WHERE OrderRefNumber = ?");
    $stmt->bind_param("s", $ref);

    if ($stmt->execute()) {
        echo "Record updated successfully";
    } else {
        echo "Error updating record: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "Invalid request method";
}
?>
