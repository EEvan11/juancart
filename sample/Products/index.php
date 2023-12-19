<?php
if(session_status() === PHP_SESSION_NONE)
    session_start();
?>

<!DOCTYPE html>

<html>

<head>

    <title>Products</title>
    <link rel="icon" href="../icon/icon.png" type="image/x-icon">
    
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

    <div class="outerProductCon">

        <div class="productCon">

        


            <?php
            if(!isset($_GET['Cat'])){
                homepage();
            }else{

                $cat = $_GET['Cat'];
                $sql = "SELECT prodImg, prodName, prodPrice, prodVolume, Quantity from tblproducts where prodCategory = '$cat'";
                $result = $conn->query($sql);
            
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $prodImg = $row['prodImg'];
                        $prodName = $row['prodName'];
                        $prodPrice = $row['prodPrice'];
                        $prodVariant = $row['prodVolume'];
                        $prodStock = $row['Quantity'];
                
                        echo "<div class='gridProduct'>";
                            echo "<div class='productImgCon' onclick=\"location.href='../Products/Product Details.php?prod=$prodName&vol=$prodVariant'\">";
                                echo "<div class='productImgCon-con'>";
                                    echo "<img class='prodImg' id='productImg' src='resources/$prodImg' onerror=\"this.src='../Products/thumbnail/NoImage.png'\">";
                                echo "</div>";
                            echo "</div>";
                
                        echo "<div class='productinfoCon-con'>";
                            echo "<p class='productLbl' id='productLabel'>$prodName</p><b><br><br>";
                            echo "<p class='weight' id='productWeight'>$prodVariant</p>";
                            echo "<p class='price' id='productPrice'>₱$prodPrice</p>";
                            echo "<p class='stock' id='productStock'>Stock: $prodStock pcs</p>";
                        echo "</div>";
                            if($prodStock > 0 && isset($_SESSION['userID'])){
                                echo "<button id='addCart' class='addCart'>Add to Cart</button>";
                            }else{
                                echo "<button class='addCartDisabled' onclick='alertMessage()'>Add to Cart</button>";
                            }
                        echo "</div>";
                    }
                } else {
                    homepage();
                }
                
            }

            function homepage(){
                echo "<script>";
                    echo "window.location.href = '../homepage/';";
                echo "</script>";
            }
        ?>
        </div>

    </div>
    
    <?php include('../includesPHP/footer.php')?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../javascript/AJax.js"></script>
    <script src="../javascript/web.js"></script>

</body>

</html>