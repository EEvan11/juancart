<!DOCTYPE html>

<html>

    <head>

        <title>email</title>
        <link rel='icon' href='../icon/icon.png' type='image/x-icon'>
        
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">

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
                font-family: "Onest", serif;
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
                font-family: "Onest", serif;
                font-size: 12px;
            }

            .invoice-client-info-one{
                margin-left: 10px;
            }

            .invoice-product-info-div{
                width: 100%;
                height: auto;
                margin-bottom: 50px;
                font-family: "Onest", serif;
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
                font-family: "Onest", serif;
                font-size: 12px;
                margin-left: 10px;
            }

            .signature-con{
                width: 90%;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                text-align: center;
                font-family: "Onest", serif;
                font-size: 12px;
                margin: 10px auto auto auto;
            }

            .condition{
                width: 90%;
                margin: 50px auto 50px auto;
            }

            .certify{
                text-align: center;
                font-family: "Onest", serif;
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

    <div class="invoice-container">

        <div class="invoice-kbn-logo">
            <img class="logo-invoice" src="../image\logo/KBN_Logo.png" alt="">
        </div>

        <div class="invoice-container-header">

            <div class="invoice-header-info">
                <p class="company-title">KBN Skin Essentials LTD. CO.</p>
                <p class="company-add">National Road (in front of Tayuman Elementary School) Brgy. Tayuman Binangonan, Rizal</p>
                <p class="company-email">kissedbynatureph@gmail.com</p>
                <p class="company-no">Mobile No. 09060080698</p>
            </div>

            <p class="company-title">Statement of Account</p>
        </div>

        <div class="invoice-client-info-con">

            <div class="invoice-client-info-one">
                <p class="invoice-client-info">Name:</p>
                <p class="invoice-client-info">Address:</p>
                <p class="invoice-client-info">Contact No:</p>
                <p class="invoice-client-info">Type of Customer:</p>
            </div>

            <div class="invoice-client-info-two">
                <p class="invoice-client-info">Date:</p>
                <p class="invoice-client-info">PO No:</p>
                <p class="invoice-client-info">AR No:</p>
            </div>

        </div>

        <div class="invoice-product-info-div">

            <div class="invoice-product-info-header">
                <p class="invoice-product-info">Product</p>
                <p class="invoice-product-info">Quantity</p>
                <p class="invoice-product-info">Unit</p>
                <p class="invoice-product-info">Price</p>
                <p class="invoice-product-info">Total Amount</p>
            </div>

            <div class="invoice-product-info-con">
                <p class="invoice-product">soap</p>
                <p class="invoice-product">4</p>
                <p class="invoice-product">1</p>
                <p class="invoice-product">₱ 400</p>
                <p class="invoice-product">₱ 400</p>
            </div>

            <div class="invoice-product-info-con">
                <p class="invoice-product">soap</p>
                <p class="invoice-product">4</p>
                <p class="invoice-product">1</p>
                <p class="invoice-product">₱ 400</p>
                <p class="invoice-product">₱ 400</p>
            </div>

        </div>

        <div class="total-info-con">
            <p class="total-info">Total:</p>
            <p class="total-info">Payment:</p>
            <p class="total-info">Balance from Previous Purchased:</p>
            <p class="total-info">Outstanding Balance</p>
            <p class="total-info">Remarks:</p>
        </div>

        <div class="condition">
            <p class="certify">This is to certify that the above products that ypu receive was in good conditions and we have no return, no exchange policy. We look forward to be a business partner and experience the beauty from within by Kissed By Nature products, "GANDA MO NATURAL"</p>

            <div class="signature-con">

                <div class="signature">
                    <p class="sign-title">Prepared By:</p>
                    <p class="sign">Signature over Printed Name</p>
                </div>

                <div class="signature">
                    <p class="sign-title">Witness By:</p>
                    <p class="sign">Signature over Printed Name</p>
                </div>

                <div class="signature">
                    <p class="sign-title">Checked By:</p>
                    <p class="sign">Signature over Printed Name</p>
                </div>
                
            </div>
        </div>


    </div>
        
    </body>

</html>