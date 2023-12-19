<?php
if(session_status() === PHP_SESSION_NONE)
    session_start();
include('../includesPHP/topNav.php');
unset($_SESSION['checkedCheckboxesData']);?>

<!DOCTYPE html>

<html>

<head>

    <title>Rebranding Products</title>
    
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="../css/style.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">

</head>

<body>
    <br>

    <div class="rebrandingProducts">

        <div class="rebrandingCategory">

            <button onclick="rebrandingBtnFunc()" class="rebrandingCategory-btn">Category <i class="fa-solid fa-caret-down"></i> </button>

            <div id="rebrandingCat" class="rebrandingCategory-content">
                <?php
                
                $sql = "SELECT DISTINCT prodCategory from tblrebrandingproducts WHERE userID = '$userID'";
                $result = $conn->query($sql);
                
                echo "<a href='#' id='showAllRebranding' onclick='filterProducts(\"none\")'>All</a>";
                while ($row = $result->fetch_assoc()) {
                    echo "<a href='#' id='" . $row['prodCategory'] . "' onclick='filterProducts(\"" . $row['prodCategory'] . "\")'>" . $row['prodCategory'] . "</a>";
                }
                ?>

            </div>

        </div>

        <div class="innerRebrandingProducts">
            <?php
            if(!isset($_SESSION['userID']))
            homepage();
                $sql = "SELECT prodID, prodImg, prodName, prodVolume, prodPrice, prodCategory from tblrebrandingproducts WHERE userID = '$userID'";
                // echo $sql;
                $result = $conn->query($sql);
            
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $prodID = $row['prodID'];
                        $prodImg = $row['prodImg'];
                        $prodName = $row['prodName'];
                        $prodVariant = $row['prodVolume'];
                        $prodPrice = $row['prodPrice'];
                        $prodCategory = $row['prodCategory'];
                
                        echo "<div class='gridProduct' id='$prodCategory'>";
                            echo "<div class='productImgCon'>";
                            echo "<div class='productImgCon-con'>";
                            echo "<img class='prodImg' id='productImg' src='resources/$prodImg' alt='prodImg.png' onerror=\"this.src='../Products/thumbnail/NoImage.png'\">";
                            echo "</div>";
                            echo "</div>";

                            echo "<div class='productinfoCon-con'>";
                            echo "<p class='productLbl' id='productLabel'>$prodName</p><br><br><br>";
                            echo "<p class='weight' id='productWeight'>$prodVariant</p><br><br><br>";
                            echo "<p class='price' id='productPriceR'>₱$prodPrice</p><br><br><br>";
                            echo "</div>";
                            echo "<button class='addCart' onclick='addToCart(\"$prodName\", \"$prodVariant\", \"$prodID\")'>Add to Cart</button>";
                        echo "</div>";
                    }
                } else {
                    // homepage();
                    echo "No Product";
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
    <script src="../javascript/rebranding.js"></script>
    <script src="../javascript/web.js"></script>
    <!-- <script src="../javascript/messenger.js"></script> -->

</body>

</html>
