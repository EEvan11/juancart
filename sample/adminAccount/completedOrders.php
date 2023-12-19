<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();

if(!isset($_SESSION['AdminID']))
echo "<script>window.location.href = '../loginPageMobile/';</script>";
?>
<!DOCTYPE html>
<html>
<head>

<title>Admin Account</title>
    
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">
    
    <link rel="stylesheet" href="../css/style.css">
</head>


<body>

    <div class="log">  
        <?php include('../includesPHP/database.php')?>  
    </div>
    

    <div class="admin-side">

        <div class="admin-side-header">

            <a class="admin-side-toggle-btn" onclick="adminSideToggleBtnFunction()">
                <i class="fa-solid fa-bars"></i>
            </a>

            <p class="admin-side-title">Completed Orders</p>
            
        </div>
        
        <div id="admin-side-nav">

            <div class="admin-side-content-icn">
                <a class="forLink" href="../adminAccount/index.php">
                    <i id="admin-side-icn" class="fa-solid fa-person-circle-check"></i>
                    <p class="admin-side-icn-label" href="#">For Approval</p>
                </a>
            </div>

            <div class="admin-side-content-icn" >
                <a class="forLink" href="../adminAccount/processingOrders.php">
                    <i id="admin-side-icn" class="fa-solid fa-bars-progress"></i>
                    <p class="admin-side-icn-label">Processing</p>
                </a>
            </div>

            <div class="admin-side-content-icn">
                <a class="forLink" href="../adminAccount/completedOrders.php">
                    <i id="admin-side-icn" class="fa-solid fa-list"></i>
                    <p class="admin-side-icn-label" href="#">Completed</p>
                </a> 
            </div>

            <div class="admin-side-footer">
                <a class="admin-side-setting"  href="../courierSide/accountSetting.php">Account Setting</a>
                <hr class="sep1">
                <p class="admin-side-setting" onclick="signOut()">sign out</p>
            </div>

        </div>

        <br>

        <div class="adminside-btn-con">

        </div>


        <div id="admin-account-con">


            <div class="admin-orders-con">

                <div class="admin-orders-header">
                    <p>Orders</p>
                </div>

                <div class="admin-orders-content">

                
                        
                    <table>

                    <?php
                    $sql = "SELECT a.OrderRefNumber, a.UserID, CONCAT(b.FirstName, ' ' , b.LastName) AS Fullname, c.Status 
                    FROM tblordercheckout AS a 
                    JOIN tblcustomerinformation AS b ON a.UserID = b.UserID 
                    JOIN tblorderstatus As c ON c.OrderRefNumber = a.OrderRefNumber";
                    $result = $conn->query($sql);

                    if (mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            $refNumber = $row['OrderRefNumber'];
                            $UserID = $row['UserID'];
                            $Fullname = $row['Fullname'];
                            $Status = $row['Status'];
                            echo "<tr>
                                    <div class='admin-orders' name='$refNumber' id ='$refNumber' onclick='adminOrderList(\"$refNumber\",\"$Fullname\")'>
                                        <div class='orders-info'>
                                            <div class='info-divider'>
                                                <p class='adn-order-refno'>$refNumber</p>
                                                <p class='adn-order-client'>$Fullname</p>
                                                <p class='adn-order-stats'>$Status</p>
                                            </div>

                                        <p class='adn-order-total-lbl'>Total Amount:</p>
                                        <p class='adn-order-total'>₱50</p>
                                        
                                        </div>
                                    </div>
                                </tr>";
                        }
                    }
                    ?>          
                    </table>


                </div>

            </div>
            
            <div class="admin-client-order" id="Admin-OrderList">
                
            </div>

        </div>

    </div>

    

    <!-- <?php include('../includesPHP/footer.php')?> -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../javascript/web.js"></script>
    <script src="../javascript/admin.js"></script>
</body>
</html>