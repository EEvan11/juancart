<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
?>

<html>
    <head>

        <title>KissedByNature</title>
        <link rel="icon" href="../icon/icon.png" type="image/x-icon">
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="../css/style.css">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">

    </head>
</html>


<?php
echo "<script>window.location.href = 'homepage/';</script>";
?>