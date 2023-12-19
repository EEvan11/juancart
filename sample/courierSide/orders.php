<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
// session_destroy();
include('../includesPHP/database.php');
if(!isset($_SESSION['courierID']))
    echo "<script>window.location.href = '../loginPageMobile/';</script>";
$ref = $_GET['ref'];
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

        <div class="orderContainer">

            <div class="fixedHeader">

                <div class="orderStatus">

                    <div class="orderStatus-header">
                        <p class="orderStatus-header-title">Order Status</p>
                    </div>

                    <div class="orderStatus-buttons">
                        <?php
                            $status = '';
                            $sql = "SELECT Status FROM tblorderstatus WHERE OrderRefNumber = '$ref'";
                            $result = $conn->query($sql);
                            if($row = $result->fetch_assoc()){
                                $status = $row['Status'];
                            }
                        ?>

                        <button class="orderStatus-btn-green">Pending</button>
                        <button class="orderStatus-btn-green">On Shipment</button>
                        <?php
                            if($status != "Completed"){
                                echo "<button class='orderStatus-btn-white' onclick='confirmationPopUpFunc()'>Completed</button>";
                            }else{
                                echo "<button class='orderStatus-btn-green' onclick='confirmationPopUpFunc()'>Completed</button>";
                            }
                        ?>
                    
                    </div>

                    <div id="completed-confirmation">

                        <a class="confirmation-close" onclick="confirmationPopUpFunc()">
                            <i class="fa-solid fa-xmark"></i>
                        </a>

                        <p class="confirmation-message">Have you ensured the completion of the deliveries for Order #[Order Number]?</p>

                        <button class="confirmation-btn" onclick="confirmDelivery('<?php echo $ref; ?>','<?php echo $_SESSION['courierID']; ?>')">Confirm</button>
                    </div>

                </div>

            </div>

            <div class="orderSummary">

            <?php
                $courierID = $_SESSION['courierID'];
                $sql = "SELECT a.Description, CONCAT(a.Firstname, ' ', a.Lastname) AS Fullname, b.OrderDate, a.Address, c.deliveryID
                FROM tblcustomerinformation AS a
                JOIN tblordercheckout AS b ON b.UserID = a.UserID
                JOIN tblcourierdelivery AS c ON c.OrderRefNumber = b.OrderRefNumber
                WHERE b.OrderRefNumber = '$ref';";
                // echo $sql;
                $result = $conn->query($sql);

                $company = '';
                $fullName = '';
                $date = '';
                $address = '';
                $dID = '';

                

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $company = $row['Description'];
                        $fullName = $row['Fullname'];
                        $date = $row['OrderDate'];
                        $dateTime = new DateTime($date);
                        $dateFormatted = $dateTime->format('Y-m-d');
                        $timeFormatted = $dateTime->format('h:ia');
                        // $dateTime = DateTime::createFromFormat('Y-m-d h:i:s', $date);
                        // $outputDate = $dateTime->format('Y-m-d');
                        $address = $row['Address'];
                        $dID = $row['deliveryID'];
                    }
                } else {
                    echo "Something Wrong with your account";
                }
            ?>

                    <script>
                        var dID = <?php echo json_encode($dID); ?>;
                        function confirmDelivery(ref) {
                            fetch(`../courierSide/confirmOrder.php?ref=${ref}&dID=${dID}`)
                            .then(response => response.text())
                            .then(data => {
                                var message = data.substring(7, data.length - 2);
                                alert(message);
                                window.location.href = '../loginPageMobile/';
                            })
                            .catch(error => {
                                console.error('Error:', error);
                            });
                        }
                    </script>

                    <div class="orderSummary-header">
                        <p class="orderSummary-header-title">Order Summary</p>
                        <p class="orderSummary-refNo"><?php echo $ref?></p>
                    </div>

                    <div class="orderSummary-details">

                        <div class="orderSummary-clientCompany">
                            <p class="orderSummary-title">Company</p>
                            <p class="orderSummary-clientCompany-company"><?php echo $company?></p>
                        </div>

                        <div class="orderSummary-receiver">
                            <p class="orderSummary-title">Customer</p>
                            <p class="orderSummary-receiver-rec"><?php echo $fullName?></p>
                        </div>

                        <div class="orderSummary-orderDate">
                            <p class="orderSummary-title">Order date</p>
                            <p class="orderSummary-orderDate-date"><?php echo $dateFormatted . "<br>" .  $timeFormatted?></p>
                        </div>

                        <div class="orderSummary-address">
                            <p class="orderSummary-title">Address</p>
                            <p class="orderSummary-address-add"><?php echo $address?></p>
                        </div>
                                
                    </div>

                </div>

            <div class="orderDetails">

                <div class="orderDetails-header">

                    <p class="orderDetails-title">Product Name</p>
                    <p class="orderDetails-title">Quantity</p>
                    <p class="orderDetails-title">Price</p>
                    <p class="orderDetails-title">Discount</p>
                    <p class="orderDetails-title">Total Price</p>

                </div>

                <div class="orderDetails-item-container">
                    <?php
                        $sql = "SELECT b.ProductName, b.Quantity, b.Price, (b.Quantity*b.Price) As Total, c.Discount
                        FROM tblordercheckout AS a 
                        JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
                        JOIN tblcustomerinformation AS c ON a.UserID = c.UserID
                        WHERE a.OrderRefNumber = '$ref';";

                        $result = $conn->query($sql);

                        $totalItem = 0;
                        $totalPrice = 0;
                        $item = 0;
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                $prodName = $row['ProductName'];
                                $Quantity = $row['Quantity'];
                                $Price = $row['Price'];
                                $Discount = $row['Discount'];
                                $Total = $row['Total'];

                                echo "<div class='orderDetails-item'>";

                                    echo "<p class='order-item' id='order-item-product'>$prodName</p>";
                                    echo "<p class='order-item' id='order-item-quantity'>$Quantity</p>";
                                    echo "<p class='order-item' id='order-item-price'>$Price</p>";
                                    echo "<p class='order-item' id='order-item-discount'>$Discount%</p>";
                                    echo "<p class='order-item' id='order-item-totalPrice'>$Total</p>";

                                echo "</div>";

                                $totalItem += $Quantity;
                                $totalPrice += $Total;
                                $item++;
                            }
                        } else {
                            echo "No orders found.";
                        }
                    ?>

                </div>

                <div class="orderDetails-footer">

                    <p class="orderDetails-footer-details" id="orderDetails-total-item">Item: <?php echo $item?></p>
                    <p class="orderDetails-footer-details" id="orderDetails-total-quantity">Total Quantity: <?php echo $totalItem?></p>
                    <p class="orderDetails-footer-details" id="orderDetails-total-discount">Total Discount: 0</p>
                    <p class="orderDetails-footer-details" id="orderDetails-total-amount">Total Amount: <?php echo $totalPrice?></p>

                </div>

            </div>

        </div>

    </div>

    <script src="../javascript/web.js"></script>

</body>

</html>