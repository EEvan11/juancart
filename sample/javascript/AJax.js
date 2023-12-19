// Add to cart Alert
function alertMessage(){
  alert('Please log in to access this feature.');
  return;
}

// $(document).ready(function() {
//     $('.addCart').click(function() {
//       var productID = $(this).attr('id'); // dipa naset pag may database na
//       var productImg = $(this).siblings('.productImgCon').find('img').attr('src');
//       var productLabel = $(this).closest('.gridProduct').find('.productLbl').text();
//       var productWeight = $(this).closest('.gridProduct').find('.weight').text();
//       var productPrice = $(this).closest('.gridProduct').find('.price').text();
//       var currentPath = window.location.pathname;
//       var pathComponents = currentPath.split('/');
//       var dirName = pathComponents[pathComponents.length - 2];
//       var prodQuantity = 1;
  
//       // Make an AJAX request to the AddtoCart.php file with the data
//       $.ajax({
//         url: '../includesPHP/AddtoCart.php',
//         type: 'POST',
//         data: {
//           productImg: productImg,
//           productLabel: productLabel,
//           productWeight: productWeight,
//           productPrice: productPrice,
//           prodQuantity: prodQuantity,
//           dirName: dirName
//         },
//         success: function(response) {
//           // Handle the response from the server
//           console.log(response);
//         },
//         error: function(xhr, status, error) {
//           // Handle the error
//           console.log(xhr.responseText);
//         }
//       });
//     });
//   });


$(document).ready(function() {
  $('.addCart').click(function() {
    var addButton = $(this); // The clicked button

    // Create the loader element
    var loader = $('<div class="loader3"><div class="circle1"></div><div class="circle1"></div><div class="circle1"></div><div class="circle1"></div><div class="circle1"></div></div>');

    // Disable the button and append the loader to the body
    addButton.prop('disabled', true);
    addButton.text('');
    $('body').append(loader);

    var productLabel = addButton.closest('.gridProduct').find('.productLbl').text();
    var productWeight = addButton.closest('.gridProduct').find('.weight').text();
    var prodQuantity = 1;

    // Make an AJAX request to the AddtoCart.php file with the data
    $.ajax({
      url: '../includesPHP/AddtoCart.php',
      type: 'POST',
      data: {
        productLabel: productLabel,
        productWeight: productWeight,
        prodQuantity: prodQuantity,
      },
      success: function(response) {
        // Handle the response from the server
        // console.log(response);
        if(response === "Please review your cart. This item has already been added.")
          alert(response);

        // Enable the button and remove the loader with a time delay
        setTimeout(function() {
          addButton.prop('disabled', false);
          addButton.text('Add to Cart');
          loader.remove();
        }, 2000); // Adjust the delay (in milliseconds) as needed
      },
      error: function(xhr, status, error) {
        // Handle the error
        console.log(xhr.responseText);

        // Enable the button and remove the loader with a time delay
        setTimeout(function() {
          addButton.prop('disabled', false);
          addButton.text('Add to Cart');
          loader.remove();
        }, 2000); // Adjust the delay (in milliseconds) as needed
      }
    });
  });
});

function addCartHomePage(button) {
  var addButton = $(button);

  // Create the loader element
  var loader = $('<div class="loader3"><div class="circle1"></div><div class="circle1"></div><div class="circle1"></div><div class="circle1"></div><div class="circle1"></div></div>');

  // Disable the button and append the loader to the body
  addButton.prop('disabled', true);
  addButton.text('');
  $('body').append(loader);

  var productLabel = addButton.data('product-name');
  var productWeight = addButton.data('product-variant');
  var prodQuantity = 1;

  // Make an AJAX request to the AddtoCart.php file with the data
  $.ajax({
    url: '../includesPHP/AddtoCart.php',
    type: 'POST',
    data: {
      productLabel: productLabel,
      productWeight: productWeight,
      prodQuantity: prodQuantity,
    },
    success: function(response) {
      // Handle the response from the server
      alert(response);

      // Enable the button and remove the loader with a time delay
      setTimeout(function() {
        addButton.prop('disabled', false);
        addButton.text('Add to Cart');
        loader.remove();
      }, 2000); // Adjust the delay (in milliseconds) as needed
    },
    error: function(xhr, status, error) {
      // Handle the error
      console.log(xhr.responseText);

      // Enable the button and remove the loader with a time delay
      setTimeout(function() {
        addButton.prop('disabled', false);
        addButton.text('Add to Cart');
        loader.remove();
      }, 2000); // Adjust the delay (in milliseconds) as needed
    }
  });
}
