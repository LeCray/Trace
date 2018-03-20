var Bookings = (function() {

	var $btnConfirm;
	var $btnCancel;
	var $email;
	var $booking;
	var $parameters;
	var confirm_url = '/api/v1/bookings/confirm_booking';
	var cancel_url = '/api/v1/bookings/cancel_booking';



	var fetchElements = function() {
		$parameters 			= $('#parameters');
		$email 					= $parameters.data('email');
		$booking				= $parameters.data('bookings');
		$btnConfirm       		= $('#btn-confirm');
		$btnCancel 				= $('#btn-cancel');
	};



	var initializeEvents = function() {

		$btnConfirm.on("click", function() {
			var email = $email;
			var booking = $booking;
			console.log("Booking Confirmed " + email ":" + booking);		

			$.ajax({
				url: confirm_url,
				method: 'POST',
				dataType: 'json',
				data: {
					
					email: email,
					account_id: AccountId,
					client_id: ClientId,
				},

				success: function(response) {
					window.location.href = '/admin/' + ClientId 
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




