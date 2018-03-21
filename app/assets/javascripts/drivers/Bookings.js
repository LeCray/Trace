var Bookings = (function() {

	var $btnConfirm;
	var $btnCancel;
	var $email;
	var $booking;
	var $driver_id;
	var $parameters;
	var confirm_url = '/api/v1/bookings/confirm_booking';
	var cancel_url = '/api/v1/bookings/cancel_booking';



	var fetchElements = function() {
		$parameters 			= $('#parameters');
		$email 					= $parameters.data('email');
		$driver_id 				= $parameters.data('id');
		$booking				= $parameters.data('bookings');
		$btnConfirm       		= $('#btnConfirm');
		$btnCancel 				= $('#btnCancel');
	};



	var initializeEvents = function() {

		$btnConfirm.on("click", function() {
			var email = $email;
			var booking = $booking;
			var driver_id = $driver_id;
			console.log("Booking Confirmed. Email: " + email + ", DriverID: " + driver_id + ", Booking: " + booking);		

			$.ajax({
				url: confirm_url,
				method: 'POST',
				dataType: 'json',
				data: {		
					email: email,
					booking: booking
				},

				success: function(response) {
					
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




