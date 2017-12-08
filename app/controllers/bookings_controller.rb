class BookingsController < ApplicationController

	def index
		@bookings = Booking.all.order('created_at DESC').paginate(page: params[:page], per_page:3)
		@booking = Booking.find(params[:driver_id])
		@driver = Driver.find(params[:driver_id])
	end

	def show
	end

	def new
		@booking = Booking.new
	  	@driver = Driver.find(params[:driver_id])
	end

	def create
		@driver = Driver.find(params[:driver_id])
		@booking = @driver.bookings.build(booking_params)

		if @booking 

			if @booking.save!
			redirect_to driver_path(@driver.id), notice: "Your booking has been placed"	
			else
			redirect_to driver_path(@driver.id)
			end
		else 
			redirect_to driver_path(@driver.id)
		end
	end

	def destroy
		@driver = Driver.find(params[:id])	
		@booking = Booking.find(params[:driver_id])

	  	@booking.destroy
	  	redirect_to driver_path(@driver.id), notice:  "Booking has been deleted."	
	end


	private

	def booking_params
	  params.require(:booking).permit(:date, :time,:make, :model, :description)
	end

end
