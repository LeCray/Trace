class Car < ApplicationRecord
	attr_accessor :driver
	has_one :driver


	validates :driver, presence: true
end
