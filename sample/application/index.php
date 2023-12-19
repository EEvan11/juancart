<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();

if(isset($_SESSION['emailAddress']) && isset($_SESSION['EmailAddressPreReg']) && isset($_SESSION['hax'])){
    echo "<script>window.location.href = '../verification/?hax=" . $_SESSION['hax'] . "';</script>";
}
?>

<!DOCTYPE html>

<html>

<head>

    <title>Registration</title>

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
    

    <div class="registrationForm">

        <div class="innerRegistrationForm">
            
            <img class="fphoto" src="resources/Juancar.png">

            <form method="post" class="cusInfo" id="registrationForm">

                <p class="applicationTitle">Registration</p>

                <div class="form-con">

                    <div class="form-item"> 
                        <input class="regFormName" name="regFormLastName" required maxlength="50" oninput="validateLetters(this)">
                        <label class="form-lbl">Last Name <span style="color:red">*</span></label>
                    </div> 

                    <div class="form-item">
                        <input class="regFormName" name="regFormFirstName" required maxlength="50" oninput="validateLetters(this)">
                        <label class="form-lbl">First Name <span style="color:red">*</span></label>
                    </div>
                    
                    <div class="form-item">
                        <input class="regFormName-MI" name="regFormM" required maxlength="2" oninput="validateLetters(this)">
                        <label class="form-lbl-MI">MI </label>
                    </div>

                </div>

                <div class="form-con">

                <div class="form-item">
                    <input id="regFormName" class="regFormName" type="text" name="regFormContact" oninput="validateContactInput(this)">
                    <label class="form-lbl">Contact No.<span style="color:red">*</span></label>
                </div>

                <div class="form-item">
                    <input type="Email" class="regFormName" name="regFormEmail" required oninput="validateEmailInput(this)">
                    <label class="form-lbl">Email<span style="color:red">*</span></label>
                </div>

                </div>

                <!-- <div class="add">

                    <div class="form-item">
                        <p class="form-lbl-add">Region:<span style="color:red">*</span></p>
                        <select class='regFormRegion' id="regionSelect" required>
                            <option value="Default">Region</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <p class="form-lbl-add">Province:<span style="color:red">*</span></p>
                        <select class='regFormProvince' id="provinceSelect" required>
                            <option value="Default">Province</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <p class="form-lbl-add">City:<span style="color:red">*</span></p>
                        <select class='regFormCity' id="citySelect" required>
                            <option value="Default">City</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <p class="form-lbl-add">Barangay:<span style="color:red">*</span></p>
                        <select class='regFormBarangay' id="barangaySelect" required>
                            <option value="Default">Barangay</option>
                        </select>
                    </div>
                    
                </div> -->

                <br> <br> 

                <div class="form-con">
                    
                <div class="form-item">
                    <input class="address" name="address" required>
                    <label class="form-lbl-add2">Full Address<span style="color:red">*</span></label>
                </div>

                <!-- <div class="form-item">
                    <input class="regFormName-MI" name='zipC' type="number" value="1000" min='1000' max='9999' maxlength="4" required oninput="validateZipcodeInput(this)" onfocus="onInputFocus(this)" onblur="onInputBlur(this)">
                    <label class="form-lbl-MI">Zip Code</label>
                </div> -->
                  
                </div>

                <!-- <div id="app">
                    <p class="toggel-lbl">We are your FDA-licensed manufacturer of skincare, beauty products, and cosmetics. We offer product customization and rebranding. Check the box below if you're interested.</p>

                    <p class="toggel-lbl-btn">Customize or rebrand your products:</p>

                    <label class="checker">
                        <input type="checkbox" class="checkbox" value="yes" onclick="customermodefunc()">
                        <div class="check-bg"></div>
                        <div class="checkmark">
                            <svg viewBox="0 0 100 100">
                                <path stroke-linejoin="round" stroke-linecap="round" stroke-width="15" stroke="#FFF" fill="none" d="M20,55 L40,75 L77,27"></path>
                            </svg>
                        </div>
                    </label>
                </div> -->

                <!-- <div id="form-con">
                    <input class="productDes">
                    <label class="productDes-lbl">Product Description<span style="color:red">*</span></label>
                </div> -->

                <br>
                
                <button class="appbtn" onclick="passingData(event)">Submit</button>
                    
            </form>

        </div>

    </div>

    <script>

            // Add an event listener for beforeunload
        window.addEventListener('beforeunload', function (e) {
            // Cancel the event
            e.preventDefault();
            // Chrome requires returnValue to be set
            e.returnValue = '';

            // Display the confirmation message
            var confirmationMessage = 'Are you sure you want to leave?';
            (e || window.event).returnValue = confirmationMessage; // Standard
            return confirmationMessage; // IE
        });

        function onInputFocus(input) {
            // Set the minimum length to 0 when the input is focused
            input.setAttribute('minlength', 0);
        }

        function onInputBlur(input) {
            // Get the value and ensure it has a minimum length of 4
            let zipCode = input.value;
            if(zipCode.length === 0){
                zipCode = '1000';
            }
            while (zipCode.length < 4) {
                zipCode = zipCode + '0';
            }

            // Set the value with leading zeros back to the input
            input.value = zipCode;

            // Set the minimum length back to 4 when the input is blurred
            input.setAttribute('minlength', 4);
        }


        function validateZipcodeInput(element) {
            if (element.value.length === 0 || element.value.startsWith('0')) {
                element.value = '';
                return;
            }
            if (element.value.length < 4) {
                // null
            } else {
                element.value = element.value.slice(0, 4);
            }
        }


        const formCon = document.querySelector('#form-con');
        let formVisible = false;

        function customermodefunc() {
            if (formVisible) {
                formCon.style.display = 'none';
                formVisible = false;
            } else {
                formCon.style.display = 'block';
                formVisible = true;
            }
        }
    </script>

    
    <br><br>
    <?php include('../includesPHP/footer.php')?>
    <script src="../javascript/preregisterInputchecker.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../javascript/regionAPI.js"></script>
    <script src="../javascript/web.js"></script>

</body>

</html>