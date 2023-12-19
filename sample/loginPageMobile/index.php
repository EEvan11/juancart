<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
include('../includesPHP/database.php');
if(isset($_SESSION['courierID']))
    echo "<script>window.location.href = '../courierSide/';</script>";
if(isset($_SESSION['AdminID']))
    echo "<script>window.location.href = '../adminAccount/';</script>"; 
?>

<!DOCTYPE html>
<html>
<head>

<title>Page Title</title>
    
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">
</head>


<body>
        <div class="mLogInPage">

            <div class="logo-con">

                <img src="../image\logo/removlog.png" class="logoLogin">

            </div>
            <?php
                        if ($_SERVER["REQUEST_METHOD"] == "POST") {
                            $uName = $_POST['txtUsername'];
                            $pWord = $_POST['txtPassword'];
                            if (empty($uName) || empty($pWord)) {
                                echo "<center>Please fill the username/password</center><br>";
                            }else{
                                $sql = "SELECT courierID,Username FROM tblcourieraccount WHERE Username = '$uName' AND Password ='$pWord'";
                                $result = $conn->query($sql);
                                $row = $result->fetch_assoc();
                                if ($result->num_rows == 1) {
                                    $_SESSION['courierID'] = $row['courierID'];
                                    $_SESSION['Username'] = $row['Username'];
                                    echo "<script>window.location.href = '../courierSide/';</script>";
                                    // echo $_SESSION['Username'];
                                }else{
                                    $sql = "SELECT AccountID,Username FROM tblaccount WHERE Username = '$uName' AND Password ='$pWord' AND accType='Admin';";
                                    $result = $conn->query($sql);
                                    $row = $result->fetch_assoc();
                                    if ($result->num_rows == 1) {
                                        $_SESSION['AdminID'] = $row['AccountID'];
                                        $_SESSION['Username'] = $row['Username'];
                                        echo "<script>window.location.href = '../adminAccount/';</script>";
                                    }else{
                                        echo "<center>Incorrect username/password</center>";
                                    }
                                }
                            }
                        }
            ?>
            <form class="mLog" method='POST' action="<?php echo $_SERVER['PHP_SELF'];?>"> 
                
                <div class="loginInputM-group">
                    <input required="" type="text" name="txtUsername" autocomplete="off" class="loginInputM">
                    <label class="user-label-mobile">User Name</label>
                </div>

                <div class="loginInputM-group">
                    <input required="" type="password" name="txtPassword" autocomplete="off" class="loginInputM">
                    <label class="user-label-mobile">Password</label>
                </div>



                <button class="logInButtonM">Log In</button>

            </form>

        </div>
    

    <script src="../javascript/web.js"></script>
</body>
</html>