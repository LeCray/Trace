var Show = (function() {

	var $btnConfirm;
	var $btnCancel;
	var confirm_url = '/api/v1/bookings/confirm_booking';
	var cancel_url = '/api/v1/bookings/cancel_booking';



	var fetchElements = function() 
		$btnConfirm       		= $('#btn-confirm');
		$btnCancel 				= $('#btn-cancel');
	};



	var initializeEvents = function() {
	

		$btnConfirm.on("click", function() {
			
			
			console.log("Booking Confirmed");		
						 


			$.ajax({
				url: url,
				method: 'POST',
				dataType: 'json',
				data: {
					change_status_to: change_status_to,
					zar_transaction_id: zar_transaction_id,
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




