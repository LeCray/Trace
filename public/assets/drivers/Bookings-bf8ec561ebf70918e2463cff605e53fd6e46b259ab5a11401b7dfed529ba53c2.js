var Bookings = (function() {

	var $btnConfirm;
	var $btnCancel;
	var $email;
	var $parameters;
	var confirm_url = '/api/v1/confirm_booking';
	var cancel_url = '/api/v1/cancel_booking';


	var fetchElements = function() {
		$parameters 			= $('#parameters');
		$email 					= $parameters.data('email');
		$btnConfirm       		= $('#btnConfirm');
		$btnCancel 				= $('#btnCancel');
	};


	var initializeEvents = function() {

		$btnConfirm.on("click", function() {
			var email = $email;
			console.log("Booking Confirmed. Email: " + email )//+ ", DriverID: " + driver_id + ", Booking: " + booking);		

			$.ajax({
				url: confirm_url,
				method: 'POST',
				dataType: 'json',
				data: {		
					email: email,
				},

				success: function(response) {
					 document.getElementById("status").innerHTML = "CONFIRMED"
				}
			});
		});

		$btnCancel.on("click", function() {
			var email = $email;
			console.log("Booking Cancelled. Email: " + email )//+ ", DriverID: " + driver_id + ", Booking: " + booking);		

			$.ajax({
				url: cancel_url,
				method: 'POST',
				dataType: 'json',
				data: {		
					email: email,
				},

				success: function(response) {
					document.getElementById("status").innerHTML = "CANCELLED"
				}
			});
		});

	};

	var init = function() {
		fetchElements();
		initializeEvents();
	};

	return {
		init: init 
	};
})();




