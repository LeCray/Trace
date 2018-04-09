var UpdateCarStatus = (function() {

	var $notifyDriverBtn;
	var $email;
	var $carID;
	var $carStatus;
	var $parameters;
	var update_car_status_url = '/api/v1/update_car_status';

	var fetchElements = function() {
		$notifyDriverBtn       	= $('#notifyDriverBtn');
		$parameters 			= $('#parameters');
		$email 					= $parameters.data('email');
		$vehicleReg 			= $('#vehicle-reg option:selected').text();
		$carStatus 				= $('#car-status').val;
	};


	var initializeEvents = function() {

		$notifyDriverBtn.on("click", function() {
			var email = $email;
			var vehicleReg = $vehicleReg;
			var carStatus = $carStatus;
			console.log("Car Status Updated. Vehicle Reg: "+vehicleReg+ "email: "+email )		

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




