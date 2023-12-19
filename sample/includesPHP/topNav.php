<?php
if(session_status() == PHP_SESSION_NONE)
    session_start();
    include('../includesPHP/database.php');
?>
<div class="topNav">

    <div class="innerTopNav">

        <div class="compressed">
            <i class="fa-solid fa-bars"></i>
        </div>

        <!--<img src="../image\logo/KBN_icon.png" class="logo">

        <div class="KBNLogo">
            <p class="l1">KBN</p>
            <p class="l2">SKIN ESSENTIALS MANUFACTURING</p>
        </div>-->

        <a href="../homepage" class="logoKbn-con">
            <img src="../image/logo/removlog.png" class="logoKbn" alt="KBN Logo">
        </a>

        <div class="HB"> 

            <div class="topNav-content">

                <a class="hna" href="../homepage">HOME</a>
                <a class="hna" href="../about" >ABOUT US</a>
                <a class="hna" onclick="catFuncEnter()" >CATEGORIES</a> 
                <?php
                    if(!isset($_SESSION['userID']))
                    echo " <a class='hna' href='../application'>REGISTRATION</a>";
                ?>              

        

            </div>

            <div class="searchBar">
                <svg class="searchIcon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
                <input placeholder="Search" type="search" class="searchInput" id='searchInput'>
            </div>

            <div id="seach-pop-up">
            </div>

            
        
                <div class="mobile-compressed">

                    <a class="mobile-compressed-btn" onclick="mobaSideBtnFunc()">
                        <i class="fa-solid fa-bars"></i>
                    </a>

                </div>

                <div id="mobile-sidebar-container">

                    <ul class="mobile-sidebar-content">
                        <li class="mobile-hna-li"><a class="mobile-hna" href="../homepage">Home</a></li>
                        <li class="mobile-hna-li"><a class="mobile-hna" href="../about" >About Us</a></li>
                        <li class="mobile-hna-li"><a class="mobile-hna-moba" onclick="toggleDropdown('productDropdownmoba')">KBN Products <i class="fa-solid fa-caret-down"></i></a></li>
                        <div id="productDropdownmoba">
                            <ul>

                                <?php
                                    $sql = "SELECT * FROM tblproductcategories";
                                    $result = $conn->query($sql);
                                    $totalAmount = 0;
                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            $prodName = $row['prodCategory'];
                                            $prodCategory = $row['CategoryName']; // to display
                                            echo "<li>";
                                            echo "<a class='category' href='../Products/?Cat=$prodName'>$prodCategory</a>";
                                            echo "</li>";
                                        }
                                    }
                                ?>
                            </ul>

                        </div>

                        <?php
                        if(!isset($_SESSION['userID']))
                            echo "<li class='mobile-hna-li'><a class='mobile-hna' href='../application'>REGISTRATION</a><li>";
                        ?>  

                        <?php
                        if(isset($_SESSION['userID'])){
                            $userID = $_SESSION['userID'];
                            $sql = "SELECT AccountType FROM tblcustomerinformation WHERE userID = '$userID'";
                            $result = $conn->query($sql);
                            $row = $result->fetch_assoc();
                            if ($result->num_rows == 1) {
                                if($row['AccountType'] == 'Rebranding')
                                echo "<li class='mobile-hna-li'><a class='mobile-hna' href='../Products/rebrandingProducts.php'>MY PRODUCTS</a></li>";
                            }else
                                return;
                        }
                        ?>
                        
                       
                    </ul>

                    <script>
                        function toggleDropdown(dropdownId) {
                            var productDropdownmoba = document.getElementById(dropdownId);

                            if (!productDropdownmoba) {
                                return; // Exit if there's no dropdown with the given ID
                            }

                            if (productDropdownmoba.style.display === "block" || productDropdownmoba.style.display === "") {
                                productDropdownmoba.style.display = "none";
                            } else {
                                productDropdownmoba.style.display = "block";
                            }
                        }
                    </script>

                    <?php
                    if(isset($_SESSION['userID'])){
                        $userID = $_SESSION['userID'];
                        $sql = "SELECT AccountType FROM tblcustomerinformation WHERE userID = '$userID'";
                        $result = $conn->query($sql);
                        $row = $result->fetch_assoc();
                        if ($result->num_rows == 1) {
                            if($row['AccountType'] == 'rebranding')
                                echo "<a class='mobile-hna-rebranding' href='../Products/rebrandingProducts.php'>My Product</a>";
                        }else
                            return;
                    }
                    ?>

                </div>

            <div class="topNav-icon">
                <?php
                if(session_status() == PHP_SESSION_NONE){
                    session_start();
                } else{
                    if (isset($_SESSION['username'])) {
                        echo "<a class='icn'>";
                        echo "<i  onclick='profileBtnFunc()'>" . '<i class="fa-solid fa-user-tie"></i>'. "</i>";
                        echo "</a>";
                    } else {
                        echo "<a class='icn' id='cartBtn' onclick='logInBtnFunc()'>";
                        echo "<i class='fa-sharp fa-solid fa-user'></i>";
                        echo "</a>";
                    }
                }
                ?>

                <?php
                if(session_status() == PHP_SESSION_NONE){
                    echo "<a class='icn' id='cartBtn'>";
                    echo "<i class='fa-sharp fa-solid fa-bag-shopping'></i>";
                    echo "</a>";
                    
                }else{
                    if(isset($_SESSION['username'])){
                        echo "<a class='icn' id='cartBtn' onclick='cartfunc()'>";
                        echo "<i class='fa-sharp fa-solid fa-bag-shopping'></i>";
                        echo "</a>";
                    }
                }
                ?>

        
                <!-- <a class="icn" id="cartBtn" onclick="logInBtnFunc()">
                    <i class="fa-sharp fa-solid fa-user"></i>
                </a> -->

            </div>            

        </div>

        <div id="productDropdown">
            <ul>

                <?php
                    $sql = "SELECT * FROM tblproductcategories";
                    $result = $conn->query($sql);
                    $totalAmount = 0;
                    if (mysqli_num_rows($result) > 0) {
                        while ($row = mysqli_fetch_assoc($result)) {
                            $prodName = $row['prodCategory'];
                            $prodCategory = $row['CategoryName']; // to display
                            echo "<li>";
                            echo "<a class='category' href='../Products/?Cat=$prodName'>$prodCategory</a>";
                            echo "</li>";
                        }
                    }
                ?>
            </ul>

        </div>
        
    </div>

</div>


<div id="cartContent">

    <div class="cartTitle">

        <a class="close" onclick="cartfunc()">
            <i class="fa-solid fa-xmark"></i>
        </a>

        <p class="cartT">Cart</p>

    </div>
    
    <!-- <p class="cartInfo">Your cart is empty.</p> -->

    <div class="cartItem">

            <?php 
                include('../includesPHP/cartData.php');
            ?>

    </div>

    <div class="cartFooter">

    <input type="checkbox" id="productCheckboxAll" class="productCheckboxAll" onclick="checkAllBox()" value="All"> 
    <label for="productCheckboxAll" class="productCheckboxAll-lbl">All</label>

    <label class="productTotal"> Total: ₱0.00</label>

    <button onclick="checkOutBtnFunc()" class="checkOutButton">Check Out</button>
</div>
</div>


<div id="logInCon">

    <form method="post" action="<?php echo $_SERVER['PHP_SELF'];?>" onsubmit="submitFormLogin(); return false;" id="loginForm"> 


        <a class="closeLogIn" onclick="logInBtnFunc()">
            <i class="fa-solid fa-xmark"></i>
        </a>

        <p class="LoginTitle">Log In</p>
        <br>

        <div class="input-group">
            <input required="" type="text" name="txtUsername" autocomplete="off" class="loginInput">
            <label class="user-label">User Name</label>
        </div>

        <br><br>

        <div class="input-group">
            <input required="" type="password" name="txtPassword" class="loginInput">
            <label class="user-label">Password</label>
        </div>

        <!-- <a class="forgotPass" onclick="forgotpassPopUpFunc()">Forgot Password</a> -->

        <br><br><br><br>

        <div id="error-message"></div>

        <input type="submit" class="logInButton" value="Log in"></input>

        <br><br>

        <a class="registrationLink" href="../application/index.php">registration</a>

    </form>


    <script>
    document.getElementById('loginForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent the default form submission

        var formData = new FormData(this);

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '../includesPHP/login.php', true);


        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = xhr.responseText;

                if (response.trim() === 'success') {
                    window.location.href = '../homepage';
                } else {
                    document.getElementById('error-message').innerHTML = 'Incorrect password';
                }
            }
        };

        xhr.send(formData);
    });
</script>

</div>


<div id="userProfileCon">
    
<input id="hiddenID" value="<?php echo $_SESSION['userID']?>">
 
        <a class="closeLogIn" onclick="profileBtnFunc()">
            <i class="fa-solid fa-xmark"></i>
        </a>

        <a class="setting" onclick="settingBtnFunc()">
            <i class="fa-solid fa-gear"></i>
        </a>

        <div id="settingCon">
            <button class="accountSetting" onclick="accSettingButtonFunc()">Account Setting</button>
            <!-- LogoutFunction located in AJax -->
            <button class="logOut" onclick="LogoutFunction()">Log Out</button>
        </div>

        <div class="userAccount">

            <a class="userIcon">
                <i class="fa-sharp fa-solid fa-user"></i>
            </a>

            <p class="userName">
                <?php
                    echo $_SESSION['username'];
                ?>
            </p>

        </div>

        <div class="myPurchases">

            <p class="purchaseTitle">My Purchase</p>

            
            <div class="purchaseCategory">
                <a class="purchaseIcn" href="../purchaseRecord/?Cat=toPay">
                    <i class="fa-regular fa-credit-card"></i>
                    <p class="purchaseIcn-lbl">To Pay</p>
                </a>
                    
                <a class="purchaseIcn" id="toShip" href="../purchaseRecord/?Cat=toShip">
                    <i class="fa-sharp fa-solid fa-truck-fast"></i>
                    <p class="purchaseIcn-lbl">To Ship</p>
                </a>
                    
                <a class="purchaseIcn" id="toReceive" href="../purchaseRecord/?Cat=toReceive">
                    <i class="fa-sharp fa-solid fa-boxes-stacked" ></i>
                    <p class="purchaseIcn-lbl">To Receive</p>
                </a>

                <a class="purchaseIcn" id="toReturn" href="../purchaseRecord/?Cat=Return">
                    <i class="fa-solid fa-right-left"></i>
                    <p class="purchaseIcn-lbl">Return</p>
                </a>
                
                <a class="purchaseIcn" id="toRate" href="../purchaseRecord/?Cat=Completed">
                    <i class="fa-regular fa-face-smile"></i>
                    <p class="purchaseIcn-lbl">completed</p>
                </a>
            
            </div>

        </div>

        <?php
            if($_SESSION['Description'] == 'Not Set'){
                $userID = $_SESSION['userID'];
                echo "
                    <div id='form-con'>
                        <p class='product-des-info'>Enter your ideal product description here.</p>
                            <input class='productDes' id='rebrandingBrand'>
                        <label class='productDes-lbl'>Product Description<span style='color:red'>*</span></label>
                    </div>
                    <button class='appbtn-product' onClick='SettingUpBrand(\"$userID\")'>Submit</button>
                ";
            }
        ?>
        <!-- place order item -->

        <!-- <p class="notifT">Notification</p>

        <div id="notifications">
            <div class="notifs">
                <p class="notif-title">new discount</p>
                <p class="notif-info">wkdjqbqbcqi</p>
            </div>
        </div> -->
        
</div>

<!-- edit acc info -->

<div id="AccountNSecurity">

    <div class="AccountNSecurityHeader">

        <a class="checkOutBack" onclick="accSettingButtonFunc()">
            <i class="fa-solid fa-arrow-left"></i>
        </a>

        <p class="AccountNSecurityTitle">Account Setting</p>

    </div>
    <?php
        $var = $_SESSION['userID'];
        $sql = "SELECT * FROM tblcustomerinformation WHERE userID = '$var'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
    ?>
    <div class="accCatdiv">
        <p class="accCat">Name: <?php echo $row['Firstname'] . " " . $row['Lastname'] ?></p>

        <a class="edit" id="userName" onclick="editNameBtnFunc()">
            <i class="fa-solid fa-arrow-right"></i>
        </a>

    </div>

    <div class="accCatdiv">
        <p class="accCat">Phone: <?php echo $row['Number'] ?></p>

        <a class="edit" id="userPhone" onclick="editPhoneBtnFunc()">
            <i class="fa-solid fa-arrow-right"></i>
        </a>

    </div>

    <!-- <div class="accCatdiv">
        <p class="accCat">Email:</p>

        <a class="edit" id="userEmail" onclick="editEmailBtnFunc()">
            <i class="fa-solid fa-arrow-right"></i>
        </a>

    </div> -->

    <div class="accCatdiv">
        <p class="accCat">Address: binangonan</p>

        <a class="edit" id="userPass"  onclick="editEmailBtnFunc()">
            <i class="fa-solid fa-arrow-right"></i>
        </a>

    </div>

    <div class="accCatdiv">
        <p class="accCat">Change Password</p>

        <a class="edit" id="userPass"  onclick="editPasswordBtnFunc()">
            <i class="fa-solid fa-arrow-right"></i>
        </a>

    </div>

</div>

<!-- edit name -->

<div id="editName">

    <div class="editNameHeader">

        <a class="checkOutBack" onclick="editNameBtnFunc()">
            <i class="fa-solid fa-arrow-left"></i>
        </a>

        <p class="editNameTitle">Edit Name</p>
        </input>
        <p class="saveBtn" onclick="EditName()">Save</p>

    </div>

    <br>

    <div class="input-group">
        <input required="" id="editFirstName" type="text" name="txtUsername" autocomplete="off" class="editInput">
        <label class="edit-label">First Name</label>
    </div>

    <div class="input-group">
        <input required="" id="editLastName" type="text" name="txtUsername" autocomplete="off" class="editInput">
        <label class="edit-label">Last Name</label>
    </div>


</div>

<!-- edit phone -->

<div id="editPhone">

    <div class="editPhoneHeader">

        <a class="checkOutBack" onclick="editPhoneBtnFunc()">
            <i class="fa-solid fa-arrow-left"></i>
        </a>

        <p class="editPhoneTitle">Edit Phone</p>

        <p class="saveBtn" onclick="EditContact()">Save</p>

    </div>

    <br>

    <div class="input-group">
        <input required="" id="editUserPhone" type="number" name="txtUsername" autocomplete="off" class="editInput">
        <label class="edit-label">New Phone Number</label>
    </div>

</div>

<!-- edit Email -->

<div id="editEmail">

    <div class="editEmailHeader">

        <a class="checkOutBack" onclick="editEmailBtnFunc()">
            <i class="fa-solid fa-arrow-left"></i>
        </a>

        <p class="editEmailTitle">Edit Address</p>

        <p class="saveBtn" onclick="EditAddress()">Save</p>

    </div>

    <div class="input-group">
        <input required="" id="editUserAddress" type="text" name="txtUsername" autocomplete="off" class="editInput">
        <label class="edit-label">New Adress</label>
    </div>

</div>

<!-- edit pass -->

<div id="editPassword">

    <div class="editPasswordHeader">

        <a class="checkOutBack" onclick="editPasswordBtnFunc()">
            <i class="fa-solid fa-arrow-left"></i>
        </a>

        <p class="editPasswordTitle">Edit Password</p>

        <p class="saveBtn" onclick="EditPassword()">Save</p>

    </div>

    <div class="input-group">
        <input required="" id="oldPassword" type="password" name="txtUsername" autocomplete="off" class="editInput">
        <label class="edit-label">Old Password</label>
    </div>

    <div class="input-group">
        <input required="" id="editUserPassword" type="password" name="txtUsername" autocomplete="off" class="editInput">
        <label class="edit-label">New Password</label>
    </div>

    <div class="input-group">
        <input required="" id="confirmPassword" type="password" name="txtUsername" autocomplete="off" class="editInput">
        <label class="edit-label">Confirm Password</label>
    </div>

    <div id="errorMessage"></div>
    
</div>

<div class="drpdown_compressed">

    <a class="hna" href="#">Home</a>
    <a class="hna" href="#">News</a>
    <a class="hna" href="#">About</a>

    <div class="icn">
        
        <button id="cartBtn" class="icnCart" onclick="cartFunc()">
            <i class="fa-sharp fa-solid fa-bag-shopping"></i>
        </button>

        <a class="icnUser" href="#" >
            <i class="fa-sharp fa-solid fa-user"></i>
        </a>

        <a class="icnSearch" href="#">
            <i class="fa-solid fa-magnifying-glass"></i>
        </a>

    </div>

</div>

<br><br><br><br>

<!-- <form id="forgotPass-con">

    <a class="closeLogIn" onclick="forgotpassPopUpFunc()">
        <i class="fa-solid fa-xmark"></i>
    </a>

    <p class="forgotPass-mess">Please enter your email address to reset your password. We will send you a link to reset your password to this address. Please note that you will need to have access to this email address to complete the password reset process</p>

    <div class="input-group">
        <input required="" type="text" name="txtUsername" autocomplete="off" class="loginInput">
        <label class="user-label">Email Address</label>
    </div>

    <br><br>

    <button class="forgot-pass-send">Send</button>

</form> -->

<script>
    const forgotpassPopUp = document.querySelector('#forgotPass-con');

    let forgotpassShow = true;

    let forgotpassPopUpFunc = function () {
        if (forgotpassShow) {
            forgotpassPopUp.style.display = 'block';
            forgotpassShow = false;
        } else {
            forgotpassPopUp.style.display = 'none';
            forgotpassShow = true;
        }
    }
</script>
