class Driver < ApplicationRecord

	attr_accessor :reset_token

	has_secure_password

	has_many :cars
	has_many :invoices
	has_many :bookings

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :tel, presence: true

	  # Sets the password reset attributes.
	def create_reset_digest
		self.reset_token = Driver.new_token
		update_attribute(:reset_digest,  Driver.digest(reset_token))
		update_attribute(:reset_sent_at, Time.zone.now)
	end

	# Sends password reset email.
	def send_password_reset_email
		DriverMailer.password_reset(self).deliver_now
	end
	
	  # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    	# Returns a random token.
	def Driver.new_token
		SecureRandom.urlsafe_base64
	end

    # Returns the hash digest of the given string.
	def Driver.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		                                          BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
