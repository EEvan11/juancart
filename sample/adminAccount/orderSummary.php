
<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
include('../includesPHP/database.php');

    $ref = $_GET['refNumber'];
    $custName = $_GET['custName'];
    $sql = "SELECT a.OrderRefNumber, a.OrderDate, a.Address
    FROM tblordercheckout AS a JOIN 
    tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber 
    JOIN tblcustomerinformation AS c ON a.UserID = c.UserID 
    WHERE a.OrderRefNumber = '$ref'";

    $result = $conn->query($sql);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $refNumber = $row['OrderRefNumber'];
            $OrderDate = date('Y-m-d', strtotime($row['OrderDate']));
            $Address = $row['Address'];
        }
    }
?>

    <div class="admin-order-summary">
        <div class="adn-order-summary-header">
            <p class="adn-order-summary-title">Order Summary</p>
            <p class="adn-order-summary-refno"><?php echo $refNumber ?></p>
        </div>

        <div class="adn-order-summary-con">

            <div class="adn-order-summay-content">
                <p class="adn-order-title">Customer</p>
                <p class="adn-order-info" id="adn-order-customer"><?php echo $custName ?></p>
            </div>

            <div class="adn-order-summay-content">
                <p class="adn-order-title">Order Date</p>
                <p class="adn-order-info" id="adn-order-date"><?php echo $OrderDate ?></p>
            </div>

            <div class="adn-order-summay-content">
                <p class="adn-order-title">Address</p>
                <p class="adn-order-info" id="adn-order-address"><?php echo $Address ?></p>
            </div>
        </div>

    </div>

    <div class="admin-order-status">

        <div class="adn-order-status-header">
            <p class="adn-order-status-title">Order Status</p>
        </div>

        <div class="adn-order-status-con">
            <button class="adn-order-status-btn" onClick="btnApprovedOrder('<?php echo $ref?>')">Order Approved</button>
            <button class="adn-order-status-btn">To Ship</button>
            <button class="adn-order-status-btn">On Delivery</button>
            <button class="adn-order-status-btn">Delivery Complete</button>
            <button class="adn-order-status-btn">Invoice</button>   
        </div>

    </div>

    <div class="admin-order-info">

        <div class="admin-order-info-header">
            <p class="admin-order-info-title">Product Name</p>
            <p class="admin-order-info-title">Quantity</p>
            <p class="admin-order-info-title">Price</p>
            <p class="admin-order-info-title">Discount</p>
            <p class="admin-order-info-title">Total Price</p>
        </div>


        <div class="admin-order-info-content">
        <?php
            $sqlOrder = "SELECT a.OrderRefNumber, b.ProductName, b.Quantity, b.Price, (b.Quantity*b.Price) As Total, c.Discount 
            FROM tblordercheckout AS a JOIN 
            tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber 
            JOIN tblcustomerinformation AS c ON a.UserID = c.UserID 
            WHERE a.OrderRefNumber = '$ref'";

            $result = $conn->query($sqlOrder);


            $itemCount = 0;
            $totalQuantity = 0;
            $totalDiscount = 0;
            $totalAmount = 0;
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $ProductName = $row['ProductName'];
                    $Quantity = $row['Quantity'];
                    $Price = $row['Price'];
                    $Discount = $row['Discount'];
                    $Total = $row['Total'];

                    $itemCount++;
                    $totalQuantity += $Quantity;
                    $totalDiscount += $Discount;
                    $totalAmount += $Total;
                echo "<div class='admin-order-info-divider'>
                    <p class='admin-order-info-prod' id='admin-order-product'>$ProductName</p>
                    <p class='admin-order-info-prod' id='admin-order-quantity'>$Quantity</p>
                    <p class='admin-order-info-prod' id='admin-order-price'>$Price</p>
                    <p class='admin-order-info-prod' id='admin-order-discount'>$Discount</p>
                    <p class='admin-order-info-prod' id='admin-order-totalPrice'>$Total</p>
                </div>";
                }
            }
        ?>

        </div>

        <div class="admin-order-info-footer">
            <p class="admin-order-info-footer-content" id="adm-item">Item: <?php echo $itemCount ?></p>
            <p class="admin-order-info-footer-content" id="adm-totalQuatity">Total Quantity: <?php echo $totalQuantity ?></p>
            <p class="admin-order-info-footer-content" id="adm-totalDiscount">Total Discount: <?php echo $totalDiscount ?></p>
            <p class="admin-order-info-footer-content" id="adm-totalAmount">Total Amount: <?php echo $totalAmount ?></p>
        </div>

    </div>
