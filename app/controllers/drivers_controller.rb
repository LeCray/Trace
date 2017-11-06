class DriversController < ApplicationController

	def index
		@drivers = Driver.all.order('created_at')
	end

	def show
	end

	def create
	end

end
