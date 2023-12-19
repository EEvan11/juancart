<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
?>

<!DOCTYPE html>
<html>
<head>

    <title>About</title>

    <link rel="icon" href="../icon/icon.png" type="image/x-icon">
    
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="../css/style.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">
    
    <script src="https://unpkg.com/scrollreveal"></script>

</head>


<body>

    <div class="log">
        <?php include('../includesPHP/topNav.php')?>   
    </div>

    <div class="abtContent">

        <div class="innerAbtContent">

            <p class="abt">About Us</p>

            <p class="abt-title">Strength and Weaknesses</p>

            <div class="abt-grid">
                
                
                 
            

                <div class="abt-grid-item">

                    <div class="abt-item-img-con2">
                        <img src="resources/Streng.png" class="abt-item-img" alt="owner.png">
                    </div>

                    <div class="abt-item2">

                        <p class="abt-item-title">STRENGTHS</p>

                        <p class="abt-item-info">JuanCart is the go-to online shop with a user-friendly interface for real-time updates, enabling local businesses to connect with customers directly. Feedback is valued, and flexible payment options, including cash or digital wallets, are offered.</p>

                    </div>

                </div>

                <!--<div class="abt-grid-item">-->

                <!--    <div class="abt-item-img-con">-->
                <!--        <img src="resources/Weak.png" class="abt-item-img" alt="owner.png">-->
                <!--    </div>-->

                <!--    <div class="abt-item3">-->

                <!--        <p class="abt-item-title">WEAKNESSES</p>-->
                    
                <!--        <p class="abt-item-info">While JuanCart offers many conveniences, it requires a stable internet connection, and the inability to check product quality before purchase or to process payments via online banking can be limiting for some customers.</p>-->

                <!--    </div>-->


                <!--</div>-->
                
                 <div class="abt-grid-item">

                    <div class="abt-item-img-con2">
                        <img src="resources/Weak.png" class="abt-item-img" alt="owner.png">
                    </div>

                    <div class="abt-item2">

                        <p class="abt-item-title">WEAKNESSES</p>
                    
                        <p class="abt-item-info">While JuanCart offers many conveniences, it requires a stable internet connection, and the inability to check product quality before purchase or to process payments via online banking can be limiting for some customers.</p>

                    </div>


                </div>

          

                
                
            </div>


        </div>
        
    </div>

    <br><br>

    

    <?php include('../includesPHP/footer.php')?>


    <script src="../javascript/web.js"></script>

    <script>
        ScrollReveal({
             reset: true,
             distance: '60px' ,
             duration: 500,
             delay:50
             });

             ScrollReveal().reveal('.abt', { delay: 50 });
             ScrollReveal().reveal('.abt-title', { delay: 50, origin: 'left' });

             ScrollReveal().reveal('.abt-item', { delay: 300, origin: 'bottom' });
             ScrollReveal().reveal('.abt-item-img-con', { delay: 50, origin: 'right' });

             ScrollReveal().reveal('.abt-item2', { delay: 300, origin: 'right' });
             ScrollReveal().reveal('.abt-item-img-con2', { delay: 50, origin: 'left' });

             ScrollReveal().reveal('.abt-item3', { delay: 300, origin: 'bottom' });
             ScrollReveal().reveal('.abt-item-img-con3', { delay: 50, origin: 'right' });

    </script>
</body>
</html>