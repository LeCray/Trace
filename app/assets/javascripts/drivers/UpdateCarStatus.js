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
	};

	var getSelectedOptions = function() {
		$('#vehicle-reg').change(function(){
			$vehicleReg = $(this).find(":selected").text();
		});
		$('#car-status').change(function(){
			$carStatus = $(this).find(":selected").text();
		});
	 };


	var initializeEvents = function() {

		$notifyDriverBtn.on("click", function() {
			var email = $email;
			var vehicleReg = $vehicleReg;
			var carStatus = $carStatus;
			console.log("Car Status Updated. Status:" +carStatus+ ", Vehicle Reg:" +vehicleReg+ ", email:" +email )		

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
		getSelectedOptions();
		initializeEvents();
	};

	return {
		init: init 
	};
})();




