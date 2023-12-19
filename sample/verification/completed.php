<?php
if(session_status() === PHP_SESSION_NONE)
    session_start();

include('../includesPHP/database.php');

$emailAdd = $_SESSION['emailAddress'];


$sqlprocedureExistChecker = "SELECT COUNT(*)
FROM information_schema.routines
WHERE routine_name = '$emailAdd' AND routine_type = 'PROCEDURE';
";

$result = $conn->query($sqlprocedureExistChecker);
$row = $result->fetch_assoc();
if ($result->num_rows == 1) {
    if ($row['COUNT(*)'] == 0) {
        // Stored procedure with the specified name exists
        echo '<script>';
        echo 'alert("Session Expired. Pre-Register Again.");';
        echo 'window.location.href = "../homepage/";';
        echo '</script>';
    }
}

$procedureN = "CALL " . $emailAdd . "();";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the verification codes from the form
    
    $stmt = $conn->prepare($procedureN);
    $success = $stmt->execute();

    if ($success) {
        if (isset($_SESSION['emailAddress'])) {
            unset($_SESSION['EmailAddressPreReg']); // Unset the session variable
            unset($_SESSION['emailAddress']); // Unset the session variable

            echo '<script>';
            echo 'alert("Verification successful!");';
            echo 'window.location.href = "../homepage/";';
            echo '</script>';
        }
    }
}
?>
