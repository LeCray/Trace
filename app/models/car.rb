class Car < ApplicationRecord

	has_one :driver


	validates :driver, presence: true
end
