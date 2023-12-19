<?php
    try{
        $servername = '127.0.0.1:3306'; // Replace with your MySQL host
        $username = 'u990138912_juancart'; // Replace with your MySQL username
        $password = 'Juancart1'; // Replace with your MySQL password
        $dbname = 'u990138912_juancart'; // Replace with your MySQL database name

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
            echo "Database failed to connect";
        }
    }catch(Exception $e){
        echo "<script>window.location.href = '../server.php';</script>";
    }
?>