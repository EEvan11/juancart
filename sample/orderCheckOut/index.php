<?php
if(session_status() === PHP_SESSION_NONE)
session_start();
            if (!isset($_SESSION['checkedCheckboxesData'])) {
                // Redirect the user back to the previous page
                header("Location: ../homepage");
                exit();
            }
?>

<!DOCTYPE html>

<html>

<head>

    <title>Placed of Order</title>
    
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="../css/style.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">

</head>

<body>
    <?php
        include('../includesPHP/database.php');
    ?>
    <div class="log">
        <?php include('../includesPHP/topNav.php')?>
    </div>

    <?php
        $uID = $_SESSION['userID'];
        $sql = "SELECT * FROM tblcustomerinformation WHERE userID = '$var'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
    ?>

    <div class="check-out-con-outer">

    
        <div id="checkOutCon">
        <form method="POST" onSubmit="placeOrderSubmit(event)">
            <div class="deliveryAdd">
                <form method="POST" onSubmit="placeOrderSubmit(event)">
                    <p class="deliveryTitle">Information Address</p>
                    <p class="clientInfo"><span style="font-weight: bold">Name:</span> <?php echo $row['Firstname'] . " " . $row['Lastname'] ?></p>
                    <p class="clientAddress"><span style="font-weight: bold">Address:</span> <?php echo $row['Address']?></p>
                    <?php $_SESSION['custAddress'] = $row['Address'];?>
                    <p class="clientNo"><span style="font-weight: bold">Contact:</span> <?php echo $row['Number']?></p>
                    <?php $_SESSION['custNumber'] = $row['Number'];?>
                    <p class="clientEmailAddress"><span style="font-weight: bold">Email:</span> <?php echo $row['email']?></p>
                    <?php $_SESSION['custEmail'] = $row['email'];?>
                    <!-- <p class="clientAddress">rizal</p>
                    <p class="zipCode">1940</p> -->

        
            </div>

            <div class="productDetailsCon">
                <div class="productDetails">
                    <?php
                    if (!empty($_SESSION['checkedCheckboxesData'])) {
                        $dataLength = count($_SESSION['checkedCheckboxesData']);
                        $arrayPrice = array();
                        for ($i = 0; $i < $dataLength; $i++) {
                            echo "<div class='prodCheckOutSeperator'>";
                            
                            $itemName = $_SESSION['checkedCheckboxesData'][$i]['itemName'];
                            $itemDetails = $_SESSION['checkedCheckboxesData'][$i]['itemDetails'];
                            $img = $_SESSION['checkedCheckboxesData'][$i]['productImg'];
                            $quantityNo = $_SESSION['checkedCheckboxesData'][$i]['quantityNo'];

                            $sql = "SELECT * FROM tblproducts WHERE prodName = '$itemName' AND prodVolume = '$itemDetails'";
                            $result = $conn->query($sql);
                            if ($result->num_rows > 0) {
                                $row = $result->fetch_assoc();
                                echo "<div class='itemPicture'><img class='sampleImg-p' src='$img' alt='rebranding.img'></div>";
                                echo "<p class='productName'><b>" . $row['prodName'] . "</b></p>";
                                echo "<p class='productWeight'>Variant: " . $row['prodVolume'] . "</p>";
                                echo "<p class='productPrice'>₱" . $row['prodPrice'] . "</p>";
                                echo "<p class='productQuantity'>Quantity: $quantityNo</p>";
                                echo "</div>";
                                echo "<br><br><br><br><br><br>";
                                $arrayPrice[$i] = (int)$quantityNo * (int)$row['prodPrice'];
                            }else{
                                $sql = "SELECT * FROM tblrebrandingproducts WHERE prodName = '$itemName' AND prodVolume = '$itemDetails'";
                                $result = $conn->query($sql);
                                $row = $result->fetch_assoc();
                                echo "<div class='itemPicture'><img class='sampleImg' src='$img' alt='rebranding.img'></div>";
                                echo "<p class='productName'><b>" . $row['prodName'] . "</b></p>";
                                echo "<p class='productWeight'>Variant: " . $row['prodVolume'] . "</p>";
                                echo "<p class='productPrice'>₱" . $row['prodPrice'] . "</p>";
                                echo "<p class='productQuantity'>Quantity: $quantityNo</p>";
                                echo "</div>";
                                echo "<br><br><br><br><br><br>";
                                $arrayPrice[$i] = (int)$quantityNo * (int)$row['prodPrice'];
                            }
                        };
                        $sum = array_sum($arrayPrice);
                        $shipping = 0;
                    
                    } else {
                        $_SESSION['datalist'] = "No data found in session.";
                        // echo $_SESSION['datalist'];
                    }
                    ?>
                </div>

                <div class="totalAmountCon">
                    <p class="amount" id="subTotal">Subtotal: <?php echo $sum ?> </p>
                    <p class="amount" id="shipping">Shipping: <?php echo $shipping ?></p>
                </div>
                <p class="totalAmount" id="totalAmount">Total: <b>₱<?php echo ((int)$sum + (int)$shipping)  ?><b></p>

            </div>

            <button class="placeOrderButton">Place Order</button>
            </form>
        </div>

    </div>

    <?php include('../includesPHP/footer.php')?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../javascript/AJax.js"></script>
    <script src="../javascript/web.js"></script>

</body>

</html>