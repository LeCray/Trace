var Bookings = (function() {

	var $btnConfirm;
	var $btnCancel;
	var $email;
	var $booking;
	var $driverID
	var $parameters;
	var confirm_url = '/api/v1/bookings/confirm_booking';
	var cancel_url = '/api/v1/bookings/cancel_booking';



	var fetchElements = function() {
		$parameters 			= $('#parameters');
		$email 					= $parameters.data('email');
		$booking				= $parameters.data('bookings');
		$driverID 				= $parameters.data('driverID');
		$btnConfirm       		= $('#btnConfirm');
		$btnCancel 				= $('#btnCancel');
	};



	var initializeEvents = function() {

		$btnConfirm.on("click", function() {
			var email = $email;
			var booking = $booking;
			var driverID = $driverID
			console.log("Booking Confirmed. Email: " + email + ", Booking: " + booking);		

			$.ajax({
				url: confirm_url,
				method: 'POST',
				dataType: 'json',
				data: {		
					email: email,
					booking: booking
				},

				success: function(response) {
					window.location.href = '/drivers/' +  driverID
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




