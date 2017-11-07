class Driver < ApplicationRecord
	attr_accessor :cars

	has_many :cars 

end
