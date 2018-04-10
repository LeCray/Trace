class Car < ApplicationRecord

	has_one :driver

	validates :driver, presence: true
	validates :make, presence: true
	validates :model, presence: true
	validates :vehicle_reg, presence: true
end
