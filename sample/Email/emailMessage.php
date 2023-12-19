<!DOCTYPE html>

<html>

<head>

    <title>email</title>
    <link rel='icon' href='../icon/icon.png' type='image/x-icon'>
    
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css' integrity='sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==' crossorigin='anonymous' referrerpolicy='no-referrer' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">

    <style>
        .message-email-container{
            width: 100%;
            height: auto;
        }

        .email-message-con{
            width: 500px;
            height: auto;
            margin: 50px auto auto auto;
            box-shadow: 1px 5px 20px 1px #a7a2a2;
            border-radius: 10px;
            padding: 10px 10px 10px 10px;
        }

        .email-txt{
            font-size: 15px;
            margin-bottom: 20px;
        }

        .email-txt-vlbl{
            font-size: 12px;
        }

        .email-input-fields{
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            column-gap: 5px;
            padding-bottom: 10px;
        }

        .email-input{
            width: 50px;
            height: 50px;
            border-radius: 5px;
        }

    </style>

</head>

<body>

<div class='message-email-container'>
    <div class='email-message-con'>
        <p class='email-txt'>Dear Mr/Ms,</p>
        <p class='email-txt'>Welcome to KBN Skin Essentials! To ensure the security of your account, please verify your email address by entering the following verification code:</p>
        <div class='email-input-fields'>
            <p class='email-txt-vlbl'>Verification Code:</p>
            <input class='email-input' name='code1' placeholder='' type='tel' maxlength='1'>
            <input class='email-input' name='code2' placeholder='' type='tel' maxlength='1'>
            <input class='email-input' name='code3' placeholder='' type='tel' maxlength='1'>
            <input class='email-input' name='code4' placeholder='' type='tel' maxlength='1'>
        </div>
        <p class='email-txt'>Please enter this code on our website or app to complete the verification process. If you didn't request this verification, please ignore this email.</p>
        <p class='email-txt'>Thank you for choosing KBN Skin Essentials. If you have any questions or need assistance, please don't hesitate to contact our support team at [Support Email Address]</p>
        <p class='email-txt'>Best regards,</p>
        <p class='email-txt'>Kissed by Nature</p>
    </div>
</div>
    
</body>

</html>
