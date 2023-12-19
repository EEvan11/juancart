<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
if(!isset($_SESSION['userID']))
    header("Location: ../homepage");
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

    <div class="log">
        <?php include('../includesPHP/topNav.php')?>
    </div>

    

    <br><br>

    <div class="toPayProductInfo">

        <div class="prToPayClientInfo">
            <?php
                $ref = $_GET['ref'];
                $uID = $_SESSION['userID'];
                $sql = "SELECT DISTINCT a.OrderRefNumber, a.address, a.contact, a.email, CONCAT(b.Firstname, ' ' ,b.Lastname) AS Fullname
                FROM tblordercheckout AS a
                JOIN tblcustomerinformation AS b ON a.UserID = b.UserID WHERE a.OrderRefNumber = '$ref' AND b.UserID = '$uID'";
                $result = $conn->query($sql);
                // echo $sql;
                $row = $result->fetch_assoc();
            ?>
            <p class="deliveryTitle">Address Information</p>
            <p class="refNumber">Reference Number: <?php echo $row['OrderRefNumber']?></p>
            <p class="clientInfo">Name: <?php echo $row['Fullname']?></p>
            <p class="clientAddress">Address: <?php echo $row['address']?></p>
            <p class="clientNo">Contact: <?php echo $row['contact']?></p>
            <p class="clientEmailAddress">Email: <?php echo $row['email']?></p>

            <!-- <div class="return-products-info">

                <p class="ret-title">Product Return</p>

                <p class="ret-cat">Reason: </p>
                <button class="ret-reason-btn" onclick="retconfunc()">Category</button>

                <p class="ret-cat">Details: </p>
                <input type="text" class="ret-details-txtbox">

                <p class="ret-cat">Picture: </p>
                    <form action="/upload" method="post" enctype="multipart/form-data">
                        <input class="ret-picture-box" type="file" name="image" accept="image/*">
                    </form>
                
                <button class="ret-confirm">Confirm</button>
            </div>

            <div id="ret-reason-cat">
                <p class="cat-reason">Defective or Damage Product</p>
                <p class="cat-reason">Wrong Item Received</p>
                <p class="cat-reason">Quality or Performance Issues</p>
                <p class="cat-reason">Packaging or Dispenser Issues</p>
                <p class="cat-reason">Other</p>
            </div> -->

        </div>

        <div class="toPayProductDetailsTP">

            <div class="toPayProductDetailsScroll">
                
            <?php

                // Local Variable
                $Subtotal = 0;
                $datatoPayProdInfo = array();

                $sql = "SELECT b.OrderRefNumber, a.ProductName, a.volume, a.Price, a.Quantity, c.prodImg
                FROM tblordercheckoutdata AS a
                JOIN tblorderstatus AS b ON a.OrderRefNumber = b.OrderRefNumber
                JOIN tblproducts AS c ON a.ProductName = c.prodName AND a.volume = c.prodVolume
                WHERE b.OrderRefNumber = '$ref' AND a.OrderRefNumber = '$ref'";
                // echo $sql . "<br>";
                $result = $conn->query($sql);
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        $datatoPayProdInfo[] = $row;
                    }
                    mysqli_free_result($result);
                }

                $sqlRebranding = "SELECT b.OrderRefNumber, a.ProductName, a.volume, a.Price, a.Quantity, c.prodImg
                FROM tblordercheckoutdata AS a
                JOIN tblorderstatus AS b ON a.OrderRefNumber = b.OrderRefNumber
                JOIN tblrebrandingproducts AS c ON a.ProductName = c.prodName AND a.volume = c.prodVolume
                WHERE b.OrderRefNumber = '$ref' AND a.OrderRefNumber = '$ref' AND c.userID = '$uID'";
                // echo $sqlRebranding;
                $result1 = $conn->query($sqlRebranding);
                if (mysqli_num_rows($result1) > 0) {
                    while ($row1 = mysqli_fetch_assoc($result1)) {
                        $datatoPayProdInfo[] = $row1;
                    }
                    mysqli_free_result($result1);
                }


                for($i = 0; $i < count($datatoPayProdInfo); $i++){
                    $prodImg = $datatoPayProdInfo[$i]['prodImg'];
                    $prodName = $datatoPayProdInfo[$i]['ProductName'];
                    $prodVolume = $datatoPayProdInfo[$i]['volume'];
                    $prodPrice = $datatoPayProdInfo[$i]['Price'];
                    $prodQuantity = $datatoPayProdInfo[$i]['Quantity'];

                    echo "<div class='toPayProductSeparator'>";
                    echo "<div class='itemPicture'><img class='sampleImg' src='../Products/resources/" . $prodImg . "' alt='prodImg.png'></div>";
                    echo "<p class='productName'>$prodName</p>";
                    echo "<p class='productWeight'>$prodVolume</p>";
                    echo "<p class='productPrice'>₱$prodPrice</p>";
                    echo "<p class='productQuantity'>$prodQuantity</p>";
                    echo "</div>";
                    $Subtotal += $prodPrice * $prodQuantity;
                }

            ?>

                
            </div>
            <?php
            $shipping = 0;

            $totalAmount = $shipping + $Subtotal;

            ?>

            <div class="totalAmountCon">
                <br>
                    <p class="amount" id="subTotal">Subtotal: <?php echo $Subtotal?></p>
                    <p class="amount" id="shipping">Shipping: <?php echo $shipping?></p>
                    <p class="totalAmount" id="totalAmount">Total: <?php echo $totalAmount?></p>
            </div>

        </div>

    </div>
    <script>
        // Add an event listener for beforeunload
        // window.addEventListener('beforeunload', function (e) {
        //     // Cancel the event
        //     e.preventDefault();
        //     // Chrome requires returnValue to be set
        //     e.returnValue = '';

        //     // Display the confirmation message
        //     var confirmationMessage = 'Are you sure you want to leave?';
        //     (e || window.event).returnValue = confirmationMessage; // Standard
        //     return confirmationMessage; // IE
        // });
    </script>

    <?php include('../includesPHP/footer.php')?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../javascript/AJax.js"></script>
    <script src="../javascript/web.js"></script>

</body>

</html>