<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
include('../includesPHP/database.php');


$codeChecker = '';
if (isset($_POST['email'])) {
    $emailAdd = $_POST['email'];
    $sqlCodeChecker = "SELECT verificationcode FROM tblverificationcode WHERE email = '$emailAdd'";
    $result = $conn->query($sqlCodeChecker);
    $row = $result->fetch_assoc();
    if ($result->num_rows == 1) {
        $codeChecker = $row['verificationcode'];
    }
}

echo json_encode(['codeChecker' => $codeChecker]);

?>
