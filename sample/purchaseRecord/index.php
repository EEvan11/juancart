<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();

if(!isset($_SESSION['userID']))
    header("Location: ../homepage");
?>


<?php include('../includesPHP/topNav.php')?>
<!DOCTYPE html>
<html>

<head>

    <title>Purchase Record</title>
    
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="../css/style.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">

</head>

<body>

    <div class="log">
    </div>

    <div id="overlay"></div>

    <br><br>
    <div class="purchaseRecord">

        <a class="prItem active" id="prToPay" href="../purchaseRecord/?Cat=toPay">
            <p class="prTitle">To Pay</p>
        </a>

        <a class="prItem" id="prToShip" href="../purchaseRecord/?Cat=toShip">
            <p class="prTitle">To Ship</p>
        </a>

        <a class="prItem" id="prToReceive" href="../purchaseRecord/?Cat=toReceive">
            <p class="prTitle">To Receive</p>
        </a>

        <a class="prItem" id="prToReturn" href="../purchaseRecord/?Cat=Return">
            <p class="prTitle">To Return</p>
        </a>

        <a class="prItem" id="prToRate" href="../purchaseRecord/?Cat=Completed">
            <p class="prTitle">Completed</p>
        </a>

        <script>
            var cat = "<?php echo $_GET['Cat']; ?>";
            const prItems = document.querySelectorAll('.prItem');

            for (const item of prItems) {
                item.style.backgroundColor = 'white';
                item.style.color = 'black';
            }
            if (cat === "toPay") {
                const toPay = document.querySelector('#prToPay');
                toPay.style.backgroundColor = '#AAC27F';
                toPay.style.color = 'white';
            } else  if (cat === "toShip") {
                console.log(cat);
                const toPay = document.querySelector('#prToShip');
                toPay.style.backgroundColor = '#AAC27F';
                toPay.style.color = 'white';
            } else  if (cat === "toReceive") {
                console.log(cat);
                const toPay = document.querySelector('#prToReceive');
                toPay.style.backgroundColor = '#AAC27F';
                toPay.style.color = 'white';
            } else  if (cat === "Return") {
                console.log(cat);
                const toPay = document.querySelector('#prToReturn');
                toPay.style.backgroundColor = '#AAC27F';
                toPay.style.color = 'white';
            } else  if (cat === "Completed") {
                console.log(cat);
                const toPay = document.querySelector('#prToRate');
                toPay.style.backgroundColor = '#AAC27F';
                toPay.style.color = 'white';
            }
        </script>

    </div>

    <div class="prToPay">

        <?php
        if(!isset($_GET['Cat']))
            homepage();

        function homepage(){
                echo "<script>";
                echo "window.location.href = '../homepage/';";
                echo "</script>";
        }

        $tab = $_GET['Cat'];
        $userID = $_SESSION['userID'];

            // local variable
            $datapurchaseRecord = array();
            $totalPrice = 0;

            // if tab = toPay
            //kbnprods
            $sql = '';
            $sqlRebranding = '';
            if($tab == 'toPay'){
                $sql = "SELECT b.OrderRefNumber, b.ProductName, b.Volume, b.Price, b.Quantity, d.prodImg,
                SUM(b.Price * b.Quantity) AS TotalPrice, Expiration
                FROM tblorderstatus AS a
                JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
                JOIN tblordercheckout AS c ON c.OrderRefNumber = b.OrderRefNumber
                JOIN tblproducts AS d ON b.ProductName = d.prodName AND b.volume = d.prodVolume
                JOIN tblorderexpirationtime AS e ON e.OrderRefNumber = a.OrderRefNumber
                WHERE a.Status = '$tab' AND c.UserID = '$userID'
                GROUP BY b.OrderRefNumber ORDER BY c.OrderDate DESC;";

                // echo $sql;
                
                $result = $conn->query($sql);
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        $datapurchaseRecord[] = $row;
                    }
                    mysqli_free_result($result);
                }
    
                //rebranding
                $sqlRebranding = "SELECT b.OrderRefNumber, b.ProductName, b.Volume, b.Price, b.Quantity, d.prodImg,
                SUM(b.Price * b.Quantity) AS TotalPrice, e.Expiration
                FROM tblorderstatus AS a
                JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
                JOIN tblordercheckout AS c ON c.OrderRefNumber = b.OrderRefNumber
                JOIN tblrebrandingproducts AS d ON b.ProductName = d.prodName AND b.volume = d.prodVolume
                JOIN tblorderexpirationtime AS e ON e.OrderRefNumber = a.OrderRefNumber
                WHERE a.Status = '$tab' AND c.UserID = '$userID'
                GROUP BY b.OrderRefNumber ORDER BY c.OrderDate DESC;";
            } else{
                if($tab == 'toShip')
                    $tab = 'Approved';
                if($tab == 'toReceive')
                    $tab = 'Delivery';

                $sql = "SELECT b.OrderRefNumber, b.ProductName, b.Volume, b.Price, b.Quantity, d.prodImg,
                SUM(b.Price * b.Quantity) AS TotalPrice
                FROM tblorderstatus AS a
                JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
                JOIN tblordercheckout AS c ON c.OrderRefNumber = b.OrderRefNumber
                JOIN tblproducts AS d ON b.ProductName = d.prodName AND b.volume = d.prodVolume
                WHERE a.Status = '$tab' AND c.UserID = '$userID'
                GROUP BY b.OrderRefNumber ORDER BY c.OrderDate DESC;";

                if($tab == 'Completed'){
                    $sql = "SELECT b.OrderRefNumber, b.ProductName, b.Volume, b.Price, b.Quantity, d.prodImg, SUM(b.Price * b.Quantity) AS TotalPrice
                    FROM tblorderstatus AS a
                    JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
                    JOIN tblordercheckout AS c ON c.OrderRefNumber = b.OrderRefNumber
                    JOIN tblproducts AS d ON b.ProductName = d.prodName AND b.volume = d.prodVolume
                    WHERE a.Status = 'Completed' AND c.UserID = '$userID' GROUP BY b.OrderRefNumber ORDER BY c.OrderDate DESC;";
                }
                
                $result = $conn->query($sql);
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        $datapurchaseRecord[] = $row;
                    }
                    mysqli_free_result($result);
                }
    
                //rebranding
                $sqlRebranding = "SELECT b.OrderRefNumber, b.ProductName, b.Volume, b.Price, b.Quantity, d.prodImg,
                SUM(b.Price * b.Quantity) AS TotalPrice
                FROM tblorderstatus AS a
                JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
                JOIN tblordercheckout AS c ON c.OrderRefNumber = b.OrderRefNumber
                JOIN tblrebrandingproducts AS d ON b.ProductName = d.prodName AND b.volume = d.prodVolume
                WHERE a.Status = '$tab' AND c.UserID = '$userID'
                GROUP BY b.OrderRefNumber ORDER BY c.OrderDate DESC;";
            }

            $resultRebranding = $conn->query($sqlRebranding);
            if (mysqli_num_rows($resultRebranding) > 0) {
                while ($row = mysqli_fetch_assoc($resultRebranding)) {
                    $datapurchaseRecord[] = $row;
                }
                mysqli_free_result($resultRebranding);
            }
            if(!empty($datapurchaseRecord)){
                for($i = 0; $i < count($datapurchaseRecord); $i++){
                    $ref = $datapurchaseRecord[$i]['OrderRefNumber'];
                    $img = $datapurchaseRecord[$i]['prodImg'];
                    $prodName = $datapurchaseRecord[$i]['ProductName'];
                    $prodVolume = $datapurchaseRecord[$i]['Volume'];
                    $prodQuantity = $datapurchaseRecord[$i]['Quantity'];
                    $prodPrice = $datapurchaseRecord[$i]['Price'];
                    $prodTotalPrice = $datapurchaseRecord[$i]['TotalPrice'];
                    if(isset($datapurchaseRecord[$i]['Expiration'])){
                        $expiration = $datapurchaseRecord[$i]['Expiration'];
                        $now = time();
                        $expirationTimestamp = strtotime($expiration);
                        $remainingTime = max(0, $expirationTimestamp - $now);
                        $days = floor($remainingTime / (60 * 60 * 24));
                        $remainingTime -= $days * (60 * 60 * 24);
                        $hours = floor($remainingTime / (60 * 60));
                        $remainingTime -= $hours * (60 * 60);
                        $minutes = floor($remainingTime / 60);
                    }
                    echo "<div class='prToPayProduct'>";
                        echo "<a class='prToPayOrderSeparator' href='../purchaseRecord/toPayProductInfo.php?ref=$ref' id='$ref' >";
                        echo "<div class='prToPayItemPicture'>";
                            echo "<div class='prToPayItemPicture-con'>";
                                echo "<img class='prSampleImg' src='../Products/resources/$img' alt='productImg' id='productImg'>";
                            echo "</div>";
                        echo "</div>";
                        echo "<div class='prToPayProductDetails'>";
                            echo "<p class='prToPayProductName'>Order Summary:</p>";
                            $totalPrice += $prodTotalPrice;
                        //echo "<label class='receiveDate'>Receive By: November 14, 2023</label>";
                        echo "<p class='prToPayTotalAmountret'>Amount Payable: ₱$prodTotalPrice</p>";
                            //echo "<p class='prToPayProductWeight'>$prodVolume</p>";
                            // echo "<p class='prToPayProductQuantity'>x$prodQuantity</p>";
                            // echo "<p class='prToPayProductPrice'>₱$prodPrice</p>";
                        echo "</div>";
                        echo "</a><br><br>";
                        echo "<div class='prToPayInfo'";
                            echo "<label class='orderRefNo'>Reference Number: <b>$ref</b></label><br>";
                            if($tab == 'toPay')
                                echo '<p class="orderTimeLimit" id="countdown-' . $ref . '">Pay before: ' . $days . ' day(s) ' . $hours . ' hour(s) ' . $minutes . ' min(s)</p><br>';
                        
                            if($tab == 'toPay')
                                echo "<button class='cancelbtn' onclick=\"cancelOrder('$ref')\">Cancel</button>";
                            if($tab == 'Completed'){
                                
                                $sqlReturn = "SELECT COALESCE(a.DeliveryDate, '2020-01-01') AS DeliveryDate
                                FROM tblcourierdeliverycompleted AS a
                                LEFT JOIN tblcourierdelivery AS b ON b.deliveryID = a.deliveryID
                                WHERE b.OrderRefNumber = '$ref';";
                                $returnSQL = $conn->query($sqlReturn);
                                $row1Return = $returnSQL->fetch_assoc();
                                if ($returnSQL->num_rows == 1) {
                                    $dateCompleted = $row1Return['DeliveryDate'];
                                    $today = new DateTime();  // Get the current date and time
                                    $dateCompleted = new DateTime($dateCompleted);  // Convert the DeliveryDate to a DateTime object
                                    $interval = $today->diff($dateCompleted);  // Calculate the interval between today and the DeliveryDate

                                    if ($interval->days < 15) {
                                        $remainingDays = 15 - $interval->days;
                                        echo "<p class='orderTimeLimit'>Return within $remainingDays days</p>";
                                        echo "<button class='retbtn' onclick=\"openPopup('$ref')\">Return</button>";
                                    }
                                }

                                echo "<button class='invoicebtn' onclick=\"redirect('$ref')\">Invoice</button>";
                            }
                        echo "</div><br><br>";
                    echo "</div>";
                    echo "<hr class='hrdivider'>";
                }
            }
            else{
                echo "<p class='noOrders'>No order Yet</p>";
            }
        ?>

        <script type="text/javascript">
            var popup;

            function redirect(ref){
                window.location.href = '../Email/Invoice.php?ref=' + ref;
            }
            function openPopup(ref) {
                var url = '../purchaseRecord/popupReturn.php?ref=' + ref;
                var width = 1000;
                var height = 600;
                var left = (window.innerWidth - width) / 2;
                var top = (window.innerHeight - height) / 2;

                if (popup && !popup.closed) {
                    popup.focus();
                } else {
                    popup = window.open(url, '_blank', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
                }
            }

            function cancelOrder(ref) {
                var userConfirmation = window.confirm("Are you sure you want to cancel the order?");

                if (userConfirmation) {
                    cancelOrderPHP(ref);
                } else {
                    return;
                }
            }

            function cancelOrderPHP(cancelRef_) {
                var cancelRef = cancelRef_;

                var xhr = new XMLHttpRequest();
                xhr.open('GET', '../IncludesPHP/cancelFunction.php?cancel=' + cancelRef, true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        alert(xhr.responseText);

                        window.location.reload();
                    }
                };
                xhr.send();
            }
        </script>
        
    </div>

    
    

    <?php include('../includesPHP/footer.php')?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../javascript/AJax.js"></script>
    <script src="../javascript/web.js"></script>

</body>

</html>