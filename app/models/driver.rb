class Driver < ApplicationRecord

	has_many :cars

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :id_number, presence: true
	
	
end
