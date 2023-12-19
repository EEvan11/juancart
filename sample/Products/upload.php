<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();

$targetDirectory = "resources/"; // The directory where you want to save the uploaded files
$targetFile = $targetDirectory . basename($_FILES["file"]["name"]);

if (move_uploaded_file($_FILES["file"]["tmp_name"], $targetFile)) {
    $uploadedFileName = basename($_FILES["file"]["name"]); // Get the file name only
    echo $uploadedFileName;
} else {
    echo json_encode(array("message" => "Error uploading file."));
}
?>