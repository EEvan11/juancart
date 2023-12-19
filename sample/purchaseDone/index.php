<?php
    if(session_status() == PHP_SESSION_NONE)
        session_start();
    session_regenerate_id();
?>

<!DOCTYPE html>

<html>

<head>

    <title>Purchase</title>
    
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- <link rel="stylesheet" href="../css/style.css"> -->
    <link rel="stylesheet" href="../css/purchase.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">

</head>

<body>

    <h1>Thank You for Your Purchase!</h1>
    <p>We appreciate your business. If you have any questions or need further assistance, please don't hesitate to contact us.</p>
    <img src="../image\logo/removlog.png" alt="Logo" class="logo">
    <div class="button">
        <a href="../homepage">Go Back to Home Page</a>
    </div>

</body>
    <!-- <script src="../javascript/AJax.js"></script>
    <script src="../javascript/web.js"></script> -->

</html>