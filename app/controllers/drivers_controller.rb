class DriversController < ApplicationController

	def index
		@drivers = Driver.all.order('created_at')
	end


	def new
		@driver = Driver.new
	end


	def create
	end


	def show
	end


end
