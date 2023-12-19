<?php
    if(session_status() === PHP_SESSION_NONE)
        session_start();
    include('../includesPHP/database.php');

    // $regionName = $_POST['RegionName'];
    // $provinceName = $_POST['ProvinceName'];
    // $cityName = $_POST['CityName'];
    // $barangayName = $_POST['BarangayName'];
    // $zipcode = $_POST['Zipcode'];

    $regionName = ' ';
    $provinceName = ' ';
    $cityName = ' ';
    $barangayName = ' ';
    $zipcode = '1000';

    $street = $_POST['Street'];

    $lastName = $_POST['LastName'];
    $firstName = $_POST['FirstName'];
    $mi = $_POST['MI'];

    $contact = $_POST['Contact'];
    $email = $_POST['Email'];

    $checkBox = $_POST['Checkbox'];
    if($checkBox)
        $brand = 'Not Set';
    else
        $brand = "KBN";

    $sql = "SELECT Firstname, Middlename, Lastname, Contactnum FROM tblpreregistration WHERE Emailadd = '$email';";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    if ($result->num_rows >= 1) {
        echo "The Email is already Pre-Registered";
        exit;
    }

    $sqlAccount = "SELECT email FROM tblcustomerinformation WHERE email = '$email';";
    $result = $conn->query($sqlAccount);
    $row = $result->fetch_assoc();
    if ($result->num_rows >= 1) {
        echo "The Email is already Registered";
        exit;
    }
    
    list($username, $domain) = explode('@', $email);

    

    
    $sql = "INSERT INTO tblpreregistration(Firstname,Middlename,Lastname,Contactnum,Emailadd,Region,Province,City,Barangay,Street,Zipcode,Brand,Status)
    VALUES('$firstName','$mi','$lastName','$contact','$email','$regionName','$provinceName','$cityName','$barangayName','$street','$zipcode','$brand','pending');";

    $query = "DROP PROCEDURE IF EXISTS " . $username;
    if ($conn->query($query) === TRUE) {
        $createProcedureSQL = "
        CREATE PROCEDURE $username()
        BEGIN
            $sql
        END;";
    }

    $sqlCheckerprod = "SELECT email FROM tblprocedurestorage WHERE email = '$username';";
    $result = $conn->query($sqlCheckerprod);
    $row = $result->fetch_assoc();
    if ($result->num_rows == 1) {
        $sqlDrop = "DROP PROCEDURE IF EXISTS $username";
        $stmt = $conn->prepare($sqlDrop);
        $stmt->execute();
    }
        $sqlProcedureStorage = "INSERT INTO tblprocedurestorage(email, expiration) VALUES('$username', DATE_ADD(NOW(), INTERVAL 1 HOUR));";
        $stmt = $conn->prepare($sqlProcedureStorage);
        $stmt->execute();

    if ($conn->multi_query($createProcedureSQL) === TRUE) {
        function encryptText($text, $key) {
            $method = 'aes-256-cbc';
            $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length($method));
            $encrypted = openssl_encrypt($text, $method, $key, 0, $iv);
            return base64_encode($iv . $encrypted);
        }
        $_SESSION['emailAddress'] = $username;
        $key = 'kbnthesis';
        $text = $email;
        $_SESSION['EmailAddressPreReg'] = $text;
        $encryptedText = encryptText($text, $key);
        echo "Pre-Registration almost done!|$encryptedText";
    } else {
        function encryptText($text, $key) {
            $method = 'aes-256-cbc';
            $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length($method));
            $encrypted = openssl_encrypt($text, $method, $key, 0, $iv);
            return base64_encode($iv . $encrypted);
        }
        $text = $email;
        $_SESSION['emailAddress'] = $username;
        $_SESSION['EmailAddressPreReg'] = $text;
        $_SESSION['hax'] = $encryptedText;

        $key = 'kbnthesis';
        $encryptedText = encryptText($text, $key);
        echo "Pre-Registration almost done!|$encryptedText";
    }

?>
