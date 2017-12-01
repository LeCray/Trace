class Booking < ApplicationRecord

	has_one :driver

	validates :date, presence: true
	validates :time, presence: true
	validates :description, presence: true
	

end
