<?php
    if(session_status() === PHP_SESSION_NONE)
        session_start();

    $invoiceId = isset($_GET['invoice_id']) ? $_GET['invoice_id'] : '';
    include('../includesPHP/database.php');

    $rows = array();
?>

<!DOCTYPE html>

<html>

    <head>

        <title>Order Summary</title>
        <link rel='icon' href='../icon/icon.png' type='image/x-icon'>
       
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Onest'>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css' integrity='sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==' crossorigin='anonymous' referrerpolicy='no-referrer' />

        <style>
            .invoice-container{
                border: 1px solid black;
                width: 50rem;
                height: auto;
                margin: auto auto auto auto;
            }

            .invoice-kbn-logo{
                float: left;
                width: 10rem;
                height: 5rem;
                margin: 20px auto auto 20px;
            }

            .logo-invoice{
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .invoice-container-header{
                width: 50%;
                height: auto;
                margin: auto auto auto auto;
                text-align: center;
                font-family: 'Onest', serif;
            }

            .company-title{
                font-weight: bold;
                font-size: 15px;
            }

            .company-add{
                font-size: 12px;
            }

            .company-email{
                font-size: 12px;
                color: blue;
            }

            .company-no{
                font-size: 12px;
            }

            .invoice-client-info-con{
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                font-family: 'Onest', serif;
                font-size: 12px;
            }

            .invoice-client-info-one{
                margin-left: 10px;
            }

            .invoice-product-info-div{
                width: 100%;
                height: auto;
                margin-bottom: 50px;
                font-family: 'Onest', serif;
                font-size: 14px;
            }

            .invoice-product-info-header, .invoice-product-info-con{
                width: 100%;
                height: auto;
                display: grid;
                grid-template-columns: repeat(5, 1fr);
                margin-bottom: -25px;
            }

            .invoice-product-info{
                background-color: #AAC27F;
                text-align: center;
                height: 30px;
                padding-top: 10px;
                border: 1px solid black;
            }

            .invoice-product{
                border: 1px solid black;
                text-align: center;
            }

            .total-info-con{
                font-family: 'Onest', serif;
                font-size: 12px;
                margin-left: 10px;
            }

            .signature-con{
                width: 90%;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                text-align: center;
                font-family: 'Onest', serif;
                font-size: 12px;
                margin: 10px auto auto auto;
            }

            .condition{
                width: 90%;
                margin: 50px auto 50px auto;
            }

            .certify{
                text-align: center;
                font-family: 'Onest', serif;
                font-size: 12px;
                margin-bottom: 50px;
            }

            .sign{
                margin-top: 50px;
                text-decoration-line: overline;
            }
        </style>

    </head>

    <body>

    <div class='invoice-container'>

        <div class='invoice-kbn-logo'>
            <img class='logo-invoice' src='https://kissedbynature.online/image\logo/KBN_Logo.png' alt=''>
        </div>

        <div class='invoice-container-header'>

            <div class='invoice-header-info'>
                <p class='company-title'>KBN Skin Essentials LTD. CO.</p>
                <p class='company-add'>National Road (in front of Tayuman Elementary School) Brgy. Tayuman Binangonan, Rizal</p>
                <p class='company-email'>kissedbynatureph@gmail.com</p>
                <p class='company-no'>Mobile No. 09060080698</p>
            </div>

            <p class='company-title'>Statement of Account</p>
        </div>

        <div class='invoice-client-info-con'>

            <?php
                $sql = "SELECT  CONCAT(c.Firstname, c.Lastname) AS name,
                a.OrderDate, a.address, a.contact, 'AR No', c.AccountType, a.OrderDate, a.OrderRefNumber,
                CONCAT(b.ProductName, ' (', b.volume, ')') AS product,
                b.Quantity, b.Price, SUM(b.Quantity * b.Price) AS total
                FROM tblordercheckout AS a 
                JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber 
                JOIN tblcustomerinformation AS c ON a.UserID = c.UserID 
                JOIN tblproducts AS d ON b.ProductName = d.prodName AND b.volume = d.prodVolume 
                WHERE a.OrderRefNumber = 'ref8'
                GROUP BY product;";

                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $rows[] = $row;
                    }
                    $jsonResult = json_encode($rows);
                } else {
                    echo json_encode(array('message' => 'No results found'));
                }
            ?>

            <div class='invoice-client-info-one'>
                <p class='invoice-client-info'><?php echo "Name: " . $rows[0]['name']; ?></p>
                <p class='invoice-client-info'><?php echo "Address: " . $rows[0]['address']; ?></p>
                <p class='invoice-client-info'><?php echo "Contact: " . $rows[0]['contact']; ?></p>
                <p class='invoice-client-info'><?php echo "Type of Customer: " . $rows[0]['AccountType']; ?></p>
            </div>

            <div class='invoice-client-info-two'>
                <p class='invoice-client-info'><?php echo "Date: " . $rows[0]['OrderDate']; ?></p>
                <p class='invoice-client-info'><?php echo "PO No: " . $rows[0]['OrderRefNumber'] ?></p>
                <p class='invoice-client-info'>AR No:</p>
            </div>

        </div>

        <div class='invoice-product-info-div'>

            <div class='invoice-product-info-header'>
                <p class='invoice-product-info'>Product</p>
                <p class='invoice-product-info'>Quantity</p>
                <p class='invoice-product-info'>Unit</p>
                <p class='invoice-product-info'>Price</p>
                <p class='invoice-product-info'>Total Amount</p>
            </div>

            <?php
            $total = 0;
                for($i = 0; $i < count($rows); $i++){
                    echo "<div class='invoice-product-info-con'>
                        <p class='invoice-product'>" . $rows[$i]['product'] . "</p>
                        <p class='invoice-product'>" . $rows[$i]['Quantity'] . "</p>
                        <p class='invoice-product'>Di ko alam</p>
                        <p class='invoice-product'>₱" . $rows[$i]['Price'] . "</p>
                        <p class='invoice-product'>₱" . $rows[$i]['total'] . "</p>
                    </div>";
                    $total += $rows[$i]['total'];
                }
            ?>

        </div>

        <div class='total-info-con'>
            <p class='total-info'>Total: <?php echo $total; ?></p>
            <p class='total-info'>Payment: </p>
            <p class='total-info'>Balance from Previous Purchased:</p>
            <p class='total-info'>Outstanding Balance</p>
            <p class='total-info'>Remarks:</p>
        </div>

        <div class='condition'>
            <p class='certify'>This is to certify that the above products that ypu receive was in good conditions and we have no return, no exchange policy. We look forward to be a business partner and experience the beauty from within by Kissed By Nature products, 'GANDA MO NATURAL'</p>

            <div class='signature-con'>

                <div class='signature'>
                    <p class='sign-title'>Prepared By:</p>
                    <p class='sign'>Signature over Printed Name</p>
                </div>

                <div class='signature'>
                    <p class='sign-title'>Witness By:</p>
                    <p class='sign'>Signature over Printed Name</p>
                </div>

                <div class='signature'>
                    <p class='sign-title'>Checked By:</p>
                    <p class='sign'>Signature over Printed Name</p>
                </div>
                
            </div>
        </div>


    </div>
        
    </body>

</html>