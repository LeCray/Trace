class Driver < ApplicationRecord

	has_secure_password

	has_many :cars
	has_many :invoices

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :tel, presence: true
	
	
end
