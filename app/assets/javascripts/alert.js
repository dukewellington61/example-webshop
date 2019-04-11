

$(document).on('turbolinks:load', function(){


	$("#alert").delay(500).fadeOut(5000);
	$("#notice").delay(500).fadeOut(50000);

});

$(document).ready(function () {
        if (window.location.href == 'http://localhost:3000/payments/create') {
          $("#line_items_count").hide();
          $(".navbar_cart").append('0');
        }
    });
