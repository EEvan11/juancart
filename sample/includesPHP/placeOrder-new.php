<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
session_regenerate_id();
include('../includesPHP/database.php');

$dropProcedureQuery = "DROP PROCEDURE IF EXISTS placeOrder;";

if ($conn->query($dropProcedureQuery)) {
    
} else {
    echo "Error dropping stored procedure: " . $conn->error;
}

if (!empty($_SESSION['checkedCheckboxesData'])){$dataLength = count($_SESSION['checkedCheckboxesData']);}
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

$procedures_ = "
CREATE PROCEDURE placeOrder()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
";

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
            return;
        }else{
            $rowCountChecker++;
            continue;
        }
    }

    //adding value on tblcheckoutdata
    $sql = "INSERT INTO tblordercheckoutdata(OrderRefNumber,ProductName, volume, Quantity, Price) 
    SELECT '$ref', prodName, prodVolume, $prodQuantity, prodPrice 
    FROM tblproducts 
    WHERE prodName = '$prodName' AND prodVolume = '$prodVolume'; \n";

    $procedures_ .= $sql;

    $sql = "INSERT INTO tblordercheckoutdata(OrderRefNumber,ProductName, volume, Quantity, Price) 
    SELECT '$ref', prodName, prodVolume, $prodQuantity, prodPrice 
    FROM tblrebrandingproducts 
    WHERE prodName = '$prodName' AND prodVolume = '$prodVolume' AND userID = '$userID'; \n";
    $result = mysqli_query($conn, $sql);
    $procedures_ .= $sql;
    

    // Update Product Stock
    $sqlUpdate = "UPDATE tblproducts
    SET Quantity = Quantity - $prodQuantity,
    Sold = Sold + $prodQuantity
    WHERE prodName = '$prodName' AND prodVolume = '$prodVolume'; \n";

    $procedures_ .= $sqlUpdate;

    $sqlUpdateRebranding = "UPDATE tblrebrandingproducts
    SET Sold = Sold + $prodQuantity
    WHERE prodName = '$prodName' AND prodVolume = '$prodVolume'; \n";
    $procedures_ .= $sqlUpdateRebranding;


    $sqltoDelete = "DELETE FROM tblcartdata WHERE prodName = '$prodName' AND prodVariant = '$prodVolume'; \n";
    $procedures_ .= $sqltoDelete;

}

$sql2 = "INSERT INTO tblordercheckout(OrderRefNumber, OrderDate, UserID, address, contact, email, shippingFee) VALUES('$ref', NOW(), '$uID', '$custAddress', '$custNumber', '$custEmail',0); \n";
$procedures_ .= $sql2;

$sql3 = "INSERT INTO tblorderstatus VALUES('$ref','toPay'); \n";
$procedures_ .= $sql3;

$procedures_ .= "
    -- If successful, commit the transaction
    COMMIT;
END;
";


if ($conn->multi_query($procedures_)) {
    // Loop to consume all results (needed for multi-query)
    do {
        // Check for errors
        if ($conn->errno) {
            echo "Error executing script: " . $conn->error;
            break;
        }
    } while ($conn->more_results() && $conn->next_result());

    echo "Stored procedure created successfully.";
} else {
    echo "Error creating stored procedure: " . $conn->error;
}


$procedureCall = "CALL placeOrder();";

if ($conn->query($procedureCall)) {
    $uID = $_SESSION['userID'];
    $name = $_SESSION['username'];
    session_unset();
    session_destroy();
    session_start();
    $_SESSION['userID'] = $uID;
    $_SESSION['username'] = $name;
} else {
    echo "Error executing stored procedure: " . $conn->error;
}


?>