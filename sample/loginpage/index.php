<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
    include('../includesPHP/database.php');
?>
<!DOCTYPE html>

<html>

<head>

    <title>Log In</title>
    
    <<meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="../css/style.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">
</head>

<body>

    <div class="logInPage">
        <img src="../image\logo/KBN_Logo.png" class="logInPage-logo">

        <form method="POST" class="inner-logInPage" action="<?php echo $_SERVER['PHP_SELF'];?>">

        <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $uName = $_POST['txtUsername'];
                $pWord = $_POST['txtPassword'];
                $sql = "SELECT UserID, Username, Password FROM tblcustomeraccount WHERE Username = '$uName' AND Password ='$pWord'";
                $result = $conn->query($sql);
                $row = $result->fetch_assoc();
                if ($result->num_rows == 1) {
                    if (session_status() === PHP_SESSION_ACTIVE) {
                        $_SESSION['userID'] = $row['UserID'];
                        $_SESSION['username'] = $row['Username'];
                        echo "<script>window.location.href = '../homepage';</script>";
                    }
                }else{
                    $sql = "SELECT courierID,Username FROM tblcourieraccount WHERE Username = '$uName' AND Password ='$pWord'";

                    $result = $conn->query($sql);
                    $row = $result->fetch_assoc();

                    if ($result->num_rows == 1) {
                        $_SESSION['courierID'] = $row['courierID'];
                        $_SESSION['Username'] = $row['Username'];
                        echo "<script>window.location.href = '../courierSide/';</script>";
                    }else{
                        echo "<center><span style='color: #1a332e;'>Incorrect username/password</span></center>";
                    }
                }
            }
        ?>
            
            <input class="logInPage-input" placeholder="Username" type="text" name="txtUsername">

            <input class="logInPage-input" placeholder="Password" type="password" name="txtPassword">

            <input class="warehouse-btn" type="submit" value="Log In">

        </form>

    </div>

    <script src="../javascript/web.js"></script>

</body>

</html>