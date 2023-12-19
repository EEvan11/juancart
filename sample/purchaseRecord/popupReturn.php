<!DOCTYPE html>
<?php
    if(session_status() == PHP_SESSION_NONE)
        session_start();
    include('../includesPHP/database.php');
    $ref = $_GET['ref'];
?>
<html lang="en">
<head>
    <title>Return</title>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="../css/style.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">

    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            overflow-x: auto;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        /* Style the checkboxes */
        input[type="checkbox"] {
            width: 16px;
            height: 16px;
            margin: 0;
            vertical-align: middle;
        }

        /* Style the input fields in the "Quantity" column */
        input[type="number"] {
            width: auto;
            height: 20px;
        }

        /* Add some responsive styling */
        @media (max-width: 600px) {
            table {
                overflow-x: auto;
            }

            table, thead, tbody, th, td, tr {
                display: block;
            }

            th, td {
                text-align: center;
            }

            /* Hide table headers (but show them in the first row) */
            thead tr {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }

            tr {
                margin-bottom: 20px;
            }

            td {
                /* Important: add a data-th attribute to specify the header for each cell */
                position: relative;
                padding-left: 50%;
            }

            td:before {
                position: absolute;
                left: 6px;
                content: attr(data-th) ": ";
                font-weight: bold;
            }
        }
    </style>
</head>
<body>
    <div class="return-products-info">
        <p class="ret-title">Product Return</p>
        <p class="ret-cat">Reference Number: <?php echo $ref ?></p>
        <p class="ret-cat">List of Products: </p>

        <table>
            <thead>
                <tr>
                    <th data-th="Checkbox">Select</th>
                    <th data-th="Product Name">Product Name</th>
                    <th data-th="Variant">Variant</th>
                    <th data-th="Quantity">Quantity</th>
                </tr>
            </thead>

            <tbody>
                <?php
                    $sql = "SELECT * FROM tblordercheckoutdata WHERE OrderRefNumber = '$ref'";
                    $result = $conn->query($sql);
                    if (mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            $prodName = $row['ProductName'];
                            $volume = $row['volume'];
                            $quantity = $row['Quantity'];
                            echo "<tr data-ref='$ref'>
                                <td data-th='Checkbox'><input type='checkbox'></td>
                                <td data-th='Product Name' id='ProdName'>$prodName</td>
                                <td data-th='Variant' id='ProdVariant'>$volume</td>
                                <td data-th='Quantity'>
                                    <input type='number' value='1' min='0' max='$quantity' oninput='enforceMaxValue(this)' id='prodQuantity'>
                                </td>
                            </tr>";
                        }
                    }
                ?>
            </tbody>

        </table>
            <label for="cars" class="ret-cat">Reason:</label>
            
            <select name="cars" id="ret-reason-cat">
                <option value="Defective or Damage Product">Defective or Damage Product</option>
                <option value="Wrong Item Received">Wrong Item Received</option>
                <option value="Quality or Performance Issues">Quality or Performance Issues</option>
                <option value="Packaging or Dispenser Issues">Packaging or Dispenser Issues</option>
                <option value="Other">Other</option>
            </select>

            <br><br>

        <p class="ret-cat">Details: </p>
        <input type="text" class="ret-details-txtbox" id='reason'>

        <p class="ret-cat">Picture: </p>
        
        <div class="ret-cat-box">
            <input class="ret-picture-box" type="file" name="image1" accept="image/*">
            <input class="ret-picture-box" type="file" name="image2" accept="image/*">
        </div>

        <button class="ret-confirm" onclick="returnConfirm('<?php echo $ref?>')">Confirm</button>
        
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../javascript/returnProduct.js"></script>
    
</body>
</html>