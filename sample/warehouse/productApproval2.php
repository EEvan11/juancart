<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
if(!isset($_SESSION['AdminID']))
    echo "<script>window.location.href = '../loginPageMobile/';</script>";
?>
<!DOCTYPE html>
<html>
<head>

<title>Product Approval</title>
    
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">
    
    <link rel="stylesheet" href="../css/style.css">
</head>


<body>

    <div class="log">  
        <?php include('../includesPHP/database.php')?>  
    </div>
    

    <div class="admin-side">

        <div class="admin-side-header">

            <a class="admin-side-toggle-btn" onclick="adminSideToggleBtnFunction()">
                <i class="fa-solid fa-bars"></i>
            </a>

            <p class="admin-side-title">For Approval</p>
            
        </div>
        
        <div id="admin-side-nav">

            <div class="admin-side-content-icn">
                <a class="forLink" href="../adminAccount/index.php">
                    <i id="admin-side-icn" class="fa-solid fa-person-circle-check"></i>
                    <p class="admin-side-icn-label" href="#">For Approval</p>
                </a>
            </div>

            <div class="admin-side-content-icn" >
                <a class="forLink" href="../adminAccount/processingOrders.php">
                    <i id="admin-side-icn" class="fa-solid fa-bars-progress"></i>
                    <p class="admin-side-icn-label">Processing</p>
                </a>
            </div>

            <div class="admin-side-content-icn">
                <a class="forLink" href="../adminAccount/completedOrders.php">
                    <i id="admin-side-icn" class="fa-solid fa-list"></i>
                    <p class="admin-side-icn-label" href="#">Completed</p>
                </a> 
            </div>

            <div class="admin-side-footer">
                <a class="admin-side-setting"  href="../courierSide/accountSetting.php">Account Setting</a>
                <hr class="sep1">
                <p class="admin-side-setting" onclick="signOut()">sign out</p>
            </div>

        </div>

        <br>

        <div class="adminside-btn-con">

        </div>


        <div id="admin-account-con">


            <div class="admin-orders-con">

                <div class="warehouse-orders-header">
                    <p>Orders</p>
                </div>

                <div class="warehouse-orders-content">

                    <div class="warehouse-orders">
                        <div class="warehouse-orders-info">
                            <div class="warehouse-info-divider">
                                <p class="warehouse-order-refno">7319823</p>
                                <p class="warehouse-approveby-title">Approved By:</p>
                                <p class="warehouse-order-client">raven</p>
                                <p class="warehouse-approveby">chuchay</p>
                            </div>

                            <p class="warehouse-items-title">Items:</p>
                            <p class="warehouse-item">9</p>

                            <p class="warehouse-order-total-lbl">Total Amount:</p>
                            <p class="warehouse-order-total">97</p>
                        </div>
                    </div>

                </div>

            </div>
            
            <div class="admin-client-order" id="warehouse-OrderList">

                <div class="warehouse-order-summary">

                    <div class="warehouse-summary-content">
                        <p class="warehouse-summary-lbl">PO Number</p>
                        <p class="warehouse-summary">43231</p>
                    </div>

                    <div class="warehouse-summary-content">
                        <p class="warehouse-summary-lbl">Approve By</p>
                        <p class="warehouse-summary">Raven</p>
                    </div>

                    <div class="warehouse-summary-content">
                        <p class="warehouse-summary-lbl">Customer</p>
                        <p class="warehouse-summary">rose</p>
                    </div>

                    <div class="warehouse-summary-content">
                        <p class="warehouse-summary-lbl">Ordered Date</p>
                        <p class="warehouse-summary">12/4/12</p>
                    </div>

                    <div class="warehouse-summary-content">
                        <p class="warehouse-summary-lbl">Address</p>
                        <p class="warehouse-summary">binangonan,rizal</p>
                    </div>

                </div>

                <div class="warehouse-order-info">

                    <div class="warehouse-product-info-header">
                        <p class="warehouse-product-info-lbl">Product Name</p>
                        <p class="warehouse-product-info-lbl">Quantity</p>
                        <p class="warehouse-product-info-lbl">Price</p>
                        <p class="warehouse-product-info-lbl">Discount</p>
                        <p class="warehouse-product-info-lbl">Total Price</p>
                    </div>

                    <div class="warehouse-product-info">

                        <div class="warehouse-product-info-divider">
                            <p class="warehouse-product">soap</p>
                            <p class="warehouse-product">2</p>
                            <p class="warehouse-product">2</p>
                            <p class="warehouse-product">0</p>
                            <p class="warehouse-product">74</p>
                        </div>
            
                    </div>

                    <div class="warehouse-product-footer">
                        <p class="warehouse-product-footer-lbl">Item: 7</p>
                        <p class="warehouse-product-footer-lbl">Total Quantity: 107</p>
                        <p class="warehouse-product-footer-lbl">Total Discount:</p>
                        <p class="warehouse-product-footer-lbl">Total Amount: 321</p>
                        <button class="warehouse-process-btn">Process</button>
                    </div>

                </div>
                
            </div>

        </div>

    </div>

    <!-- <?php include('../includesPHP/footer.php')?> -->
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../javascript/web.js"></script>
    <script src="../javascript/admin.js"></script>

    <script>
        const adminSideToggleBtn = document.querySelector('#admin-side-nav');
        const adminSideToggleBtnContainer = document.querySelector('#admin-account-con');
        const adminSideBtn = document.querySelector('.admin-side-toggle-btn');
        const adminSideIcon = document.querySelector('#admin-side-icn');
        const adminSideLblIcon = document.querySelector('.sidebar-icn-label');
            
        let adminSideToggleBtnFunction = function () {
            adminSideToggleBtn.classList.toggle('show');
            adminSideToggleBtnContainer.classList.toggle('show');
            adminSideBtn.classList.toggle('show');
            adminSideIcon.classList.toggle('show');
            adminSideLblIcon.classList.toggle('show');
        };

        adminSideToggleBtn.addEventListener('click', adminSideToggleBtnFunction);
    </script>
</body>
</html>