function addToCart(prodName, prodVariant, prodID) {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '../includesPHP/rebrandingAddtoCart.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            // Handle the response from the rebrandingAddtoCart.php script if needed
            console.log(xhr.responseText);
        }
    };
    xhr.send('prodName=' + encodeURIComponent(prodName) + '&prodVariant=' + encodeURIComponent(prodVariant) + '&prodID=' + encodeURIComponent(prodID));
}
