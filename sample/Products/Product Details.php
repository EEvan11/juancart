<?php
if(session_status() == PHP_SESSION_NONE)
        session_start();
    include('../includesPHP/database.php');

        $prodName_ = $_GET['prod'];
        $prodVolume_ = $_GET['vol'];
?>

<!DOCTYPE html>

<html>

<head>

    <title>Product Details</title>
    
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

    <div class="productDescriptionCon">

    <!-- <div class='itemImage'>
        <img class='ageEsaserImg' id='productImg' src='resources/$prodImg_'>
    </div>
    <div class='itemDesciption'> -->

            <?php 
            
            $sql = "SELECT * FROM tblproducts WHERE prodName = '$prodName_' AND prodVolume = '$prodVolume_'";
            // echo $sql;
            $result = $conn->query($sql);
        
            if ($result->num_rows > 0) {
                if ($row = $result->fetch_assoc()) {
                    $prodImg_ = $row['prodImg'];
                    $prodPrice_ = $row['prodPrice'];
                    $prodVolume_ = $row['prodVolume'];
                    $prodCategory_ = $row['prodCategory'];
                    $prodDescription_ = $row['Description'];
                    $prodStock_ = $row['Quantity'];

                    echo "
                    <div class='itemImage'>
                        <div class='itemImage-con'>
                            <img class='ageEsaserImg' id='productImg' src='resources/$prodImg_'>
                        </div>
                    </div>";
                    echo "
                    <div class='itemDesciption'>";
                        echo "<div class='itemDes'>";
                            echo "<p class='itemName'>$prodName_</p>";
                            echo "<p class='itemPrice'>₱$prodPrice_</p>";
                        echo "</div>";

                        echo "<p class='pstock' id='productStock'>Stock: $prodStock_ pcs</p>";
                        echo "<button class='addTcart'>Add to Cart</button>";

                        echo "<ul class='prodDesCat'>
                            <li id='Description'>
                                <p class='desTitle'>Description</p>";

                                $seperator_ = explode("+", $prodDescription_);
                                $rowCount_ = count($seperator_);

                                echo "<p class='desInfo'>";
                                for($i = 0; $i <$rowCount_; $i++){
                                    echo $seperator_[$i] . "<br>";
                                }
                                echo "</p>";

                            echo "</li>";

                        echo "</ul>
                    </div>";
                }
            } else {
                homepage();
            }
            
            ?>

            <!-- <div class="itemDes">

                <p class="itemName">Age Eraser Soap</p>

                <p class="itemPrice">₱100</p>

            </div> -->

            <!-- <button class="addCart">Add to Cart</button> -->
            <!-- <button class="#">Add to Cart</button>

            <ul>
                <li id="expandInfo">
                    <p>Description</p>
                    <i id="expandIcn" class="fa-sharp fa-solid fa-caret-down"></i>
                </li>

                <li id="expandInfo">
                    <p>Ingredients</p>
                    <i id="expandIcn" class="fa-sharp fa-solid fa-caret-down"></i>
                </li>

                <li id="expandInfo"> 
                    <p>How to use</p>
                    <i id="expandIcn" class="fa-sharp fa-solid fa-caret-down"></i>
                </li>

            </ul>

        </div> -->

    </div>

    
    

    <?php include('../includesPHP/footer.php')?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../javascript/AJax.js"></script>
    <script src="../javascript/web.js"></script>

</body>

</html>