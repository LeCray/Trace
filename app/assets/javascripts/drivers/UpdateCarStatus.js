var UpdateCarStatus = (function() {

	var $notifyDriverBtn;
	var $email;
	var $vehicleReg;
	var $carStatus;
	var $parameters;
	var update_car_status_url = '/api/v1/update_car_status';

	var fetchElements = function() {
		$notifyDriverBtn       	= $('#notifyDriverBtn');
		$parameters 			= $('#parameters');
		$email 					= $parameters.data('email');	
	};



	var initializeEvents = function() {

		$notifyDriverBtn.on("click", function() {
			var email = $email;
			var vehicleReg = $('#vehicle-reg').find(":selected").text();
			var carStatus = $('#car-status').find(":selected").text();
			console.log("Car Status Updated. Vehicle Reg:" +vehicleReg+ ", Status:" +carStatus+ ", email:" +email )		

			$.ajax({
				url: update_car_status_url,
				method: 'POST',
				dataType: 'json',
				data: {		
					email: email,
					vehicleReg: vehicleReg,
					carStatus: carStatus
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




