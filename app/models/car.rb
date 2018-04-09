class Car < ApplicationRecord

	has_one :driver

	STATUS = ["In Maintenence Bay","In Washing Bay", "Ready for Collection"]

	validates :driver, presence: true
	validates :make, presence: true
	validates :model, presence: true
	validates :vehicle_reg, presence: true
end
