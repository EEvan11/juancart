<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
    include('../includesPHP/database.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $uName = $_POST['txtUsername'];
    $pWord = $_POST['txtPassword'];
    $sql = "SELECT UserID, Username, Password FROM tblcustomeraccount WHERE BINARY Username = '$uName' AND Password ='$pWord'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    if ($result->num_rows == 1) {
        if (session_status() === PHP_SESSION_ACTIVE) {
            $_SESSION['userID'] = $row['UserID'];
            $_SESSION['username'] = $row['Username'];
            // $_SESSION['password'] = $row['Password'];

            echo 'success';
        } else {
            echo 'not started';
        }
    } else {
        echo 'Incorrect username/password';
    }
}
?>