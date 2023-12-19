<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
if(!isset($_GET['ref']))
    return;

    include('../includesPHP/database.php');
$ref = $_GET['ref'];
$category = $_POST['Category'];
$reason = $_POST['Reason'];
$selectedItems = json_decode($_POST['SelectedItems']);

$imageDirectory = "../ReturnImg/";

// Function to find a unique filename by adding a counter
function findUniqueFilename($directory, $filename) {
    $counter = 0;
    $baseName = pathinfo($filename, PATHINFO_FILENAME);
    $extension = pathinfo($filename, PATHINFO_EXTENSION);

    $newFilename = $filename;
    while (file_exists($directory . $newFilename)) {
        $counter++;
        $newFilename = $baseName . '_' . $counter . '.' . $extension;
    }

    return $newFilename;
}

$imageDirectory = "../ReturnImg/";

$img1 = $_POST['img1'];
$img1 = findUniqueFilename($imageDirectory, $img1);

$img2 = $_POST['img2'];
$img2 = findUniqueFilename($imageDirectory, $img2);

$conn->begin_transaction();

try {
    $sqlReturnDetails = "INSERT INTO tblreturndetails (OrderRefNumber, DateAdded, Reason, Category, imgPath1, imgPath2, imgPath3) VALUES ('$ref', NOW(), '$reason', '$category', '$img1', '$img2', '')";
    $sqlReturnStatus = "INSERT INTO tblreturnstatus (OrderRefNumber,Status) VALUES ('$ref', 'Pending')";

    if ($conn->query($sqlReturnDetails) === TRUE  && $conn->query($sqlReturnStatus) === TRUE)
        echo "";
    
    foreach ($selectedItems as $item) {
        $prodName = $item->productName;
        $prodVariant = $item->variant;
        $quantity = $item->quantity;

        $sqlProducts = "INSERT INTO tblreturnproduct (OrderRefNumber, prodName, prodVariant, Quantity) VALUES ('$ref','$prodName','$prodVariant','$quantity')";
        if ($conn->query($sqlProducts) === TRUE)
        echo "";
    }


    $sqlUpdateStatus = "UPDATE tblorderstatus 
    SET Status = 'Return' 
    WHERE OrderRefNumber = '$ref'";

    if ($conn->query($sqlUpdateStatus) === TRUE)
    echo "";

    $conn->commit();
    
    echo "Return Products updated successfully";
    
} catch (Exception $e) {

    $conn->rollback();
    echo "Error updating records: " . $e->getMessage();
}


?>