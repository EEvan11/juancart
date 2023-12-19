function editNameCourier() {
    var FullName = $('#EditNameCourier').val();
    var hiddenID = $('#hiddenIDCourier').val();
    $.ajax({
        url: '../courierSide/Editprofile.php',
        method: 'POST',
        data: {
            FullName: FullName,
            hiddenID: hiddenID,
            identifier: "EditName"
        },
        success: function(response) {
            alert(response);
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}

function editContactCourier() {
    var Contact = $('#EditContactCourier').val();
    var hiddenID = $('#hiddenIDCourier').val();
    $.ajax({
        url: '../courierSide/Editprofile.php',
        method: 'POST',
        data: {
            Contact: Contact,
            hiddenID: hiddenID,
            identifier: "EditContact"
        },
        success: function(response) {
            alert(response);
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}

function editPasswordCourier() {
    var NewPass = $('#EditPasswordCourierNew').val();
    var ConfirmPass = $('#EditPasswordCourierConfirm').val();
    var hiddenID = $('#hiddenIDCourier').val();

    if(NewPass === ConfirmPass){
        $.ajax({
            url: '../courierSide/Editprofile.php',
            method: 'POST',
            data: {
                NewPass: NewPass,
                hiddenID: hiddenID,
                identifier: "EditPassword"
            },
            success: function(response) {
                alert(response);
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    } else{
        alert("Password not match.");
        return;
    }
}

function editEmailCourier() {
    var Email = $('#EditEmailCourier').val();
    var hiddenID = $('#hiddenIDCourier').val();
    $.ajax({
        url: '../courierSide/Editprofile.php',
        method: 'POST',
        data: {
            Email: Email,
            hiddenID: hiddenID,
            identifier: "EditEmail"
        },
        success: function(response) {
            alert(response);
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}