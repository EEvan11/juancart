<?php
    if(session_status() == PHP_SESSION_NONE)
    session_start();
    include('../includesPHP/database.php');

    $uID = $_SESSION['userID'];
    $data = array();

    $sql = "SELECT a.prodImg, b.prodName, b.prodVariant, a.prodPrice, b.prodQuantity, a.Quantity
    FROM tblproducts AS a
    JOIN tblcartdata AS b ON a.prodName = b.prodName AND a.prodVolume = b.prodVariant
    JOIN tblcustomeraccount AS c ON b.uID = c.UserID
    WHERE c.UserID = '$uID'";
    $result = $conn->query($sql);
    echo "<br>";
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
        mysqli_free_result($result);
    }
    $sqlRebranding = "SELECT a.prodImg, b.prodName, b.prodVariant, a.prodPrice, b.prodQuantity, '9999' AS Quantity
    FROM tblrebrandingproducts AS a
    JOIN tblcartdata AS b ON a.prodName = b.prodName AND a.prodVolume = b.prodVariant
    JOIN tblcustomeraccount AS c ON c.UserID = b.uID
    WHERE b.uID = '$uID' AND a.userID = '$uID'";
    // echo $sqlRebranding;
    $resultRebranding = $conn->query($sqlRebranding);
    if ($resultRebranding) {
        while ($row = mysqli_fetch_assoc($resultRebranding)) {
            $data[] = $row;
        }
        mysqli_free_result($resultRebranding);
    }

    if (!empty($data)) {
        for ($i = 0; $i < count($data); $i++) {
                $prodImg = $data[$i]['prodImg'];
                $prodName = $data[$i]['prodName'];
                $prodVariant = $data[$i]['prodVariant'];
                $prodPrice = $data[$i]['prodPrice'];
                $prodQuantity = $data[$i]['prodQuantity'];
                $prodMax = $data[$i]['Quantity'];
                echo "<div class='cart-item'>";
                    echo "<input type='checkbox' id='productCheckbox' class='productCheckbox' onclick=\"clickCheckbox()\">";

                    echo "<div class='itemPicture'>";
                        echo "<div class='itemPicture-con'>";
                            echo "<img class='sampleImg' id='productImg' src='../Products/resources/$prodImg' alt='rebranding.img' onerror=\"this.src='../Products/thumbnail/NoImage.png'\">";
                        echo "</div>";
                    echo "</div>";

                    echo "<a class='icnTrash'><i class='fa-solid fa-trash' onclick='deleteCartItem(\"$prodName\", \"$prodVariant\")'></i></a>";

                
                    echo "<p class='iName'>$prodName</p>";
                    echo "<p class='iDetails'>$prodVariant</p>";
                    echo "<p class='iPrice'>₱ $prodPrice</p>";
                    
                    echo "<div class='itemQuantity'>";
                        echo "<a class='icnQuantity' onclick='quantityMinus($i)'><i class='fa-solid fa-minus'></i></a>";
                            echo "<input type='text' class='quantityNo' id='quantityNo' value='$prodQuantity' onfocus='handleFocus(this)' onblur='handleBlur(this)' oninput='handleInput(this, $i, $prodMax)'>";
                        echo "<a class='icnQuantity' onclick='quantityAdd($i, $prodMax)'><i class='fa-solid fa-plus'></i></a>";
                    echo "</div>";

                    echo "<p class='i-stocks'>Stocks: $prodMax</p>";

                echo "</div>";

                
        }
    }else{
        echo "No orders found.";
    }
?>

<script>
    let isInputFieldFocused = false;

    function handleFocus(inputField) {
        // Set the flag to true when the input field is focused
        isInputFieldFocused = true;
        inputField.setAttribute('minlength', 0);
    }

    function handleBlur(inputField) {
        // Reset the flag to false when the input field loses focus
        isInputFieldFocused = false;
        let quantity = inputField.value;
        if (quantity.length === 0 || quantity === '0') {
            inputField.value = '1';
        }
    }

    function handleInput(inputField, index, max) {
        // Checker
        if (isInputFieldFocused) {
            isInputFieldFocused = false;
            return;
        }
        if(inputField.value[0] === '0'){
            inputField.value = '0';
        }

        inputField.value = inputField.value.replace(/[^0-9]/g, '');

        // Check if the input is not empty
        if (inputField.value.trim() !== "") {
            let enteredValue = parseInt(inputField.value, 10);
            if (isNaN(enteredValue) || enteredValue < 1) {
                // You might want to handle this case, e.g., set a default value
            } else if (enteredValue > max) {
                // Adjust the entered value if it's greater than max
                inputField.value = (max).toString();
            }
        }

        quantityManualInput(index);
    }
</script>


