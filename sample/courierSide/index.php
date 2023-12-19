<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
// session_destroy();
include('../includesPHP/database.php');
if(!isset($_SESSION['courierID']))
    echo "<script>window.location.href = '../loginPageMobile/';</script>";
?>

<!DOCTYPE html>

<html>

<head>

    <title>Courier</title>
    
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="../css/style.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">
</head>

<body>

    <?php include('../courierSide/courierTopNav.php')?>

    <div class="courierSide">

            <div class="orderLists">

                <div class="orderLists-header">
                    <p class="orderLists-title">Delivery Lists</p>
                </div>

                <div class="orderList-container">
                    <?php
                        $deliveryRiderID = $_SESSION['courierID'];
                        $sql = "SELECT CONCAT(a.Firstname,' ',a.Lastname) AS Fullname, b.OrderRefNumber, d.Status, c.courierID FROM tblcustomerinformation AS a
                        JOIN tblordercheckout AS b ON b.UserID = a.UserID
                        JOIN tblcourierdelivery AS c ON c.OrderRefNumber = b.OrderRefNumber
                        JOIN tblorderstatus AS d ON d.OrderRefNumber = c.OrderRefNumber
                        WHERE c.courierID = '$deliveryRiderID' AND d.status != 'toship' AND d.status !='completed'";
                        // echo $sql;
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                $ref = $row['OrderRefNumber'];
                                $fName = $row['Fullname'];
                                $status = $row['Status'];
                            echo "<div class='orderList-item-separator'>";
                            echo "<a class='orderList-item' href='../courierSide/orders.php?ref=$ref'>";
                                echo "<div class='orderList-clientInfo'>";
                                    echo "<p class='orderList-refNo'>$ref</p>";
                                    echo "<p class='orderList-clientName'>$fName</p>";
                                    echo "<p class='orderList-status'>For $status</p>";
                                echo "</div>";
    
                                echo "<p class='orderList-TA'>Total Amount</p>";
                                echo "<p class='orderList-totalAmount'>₱100</p>";
    
                            echo "</a>";
    
                            echo "</div>";
                            }
                        } else {
                            echo "No orders found.";
                        }
                    ?>
                </div>

            </div> 

    </div>

    <script src="../javascript/web.js"></script>

</body>

</html>