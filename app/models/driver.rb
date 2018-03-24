	class Driver < ApplicationRecord

	attr_accessor :reset_token, :resent_sent_at

	has_secure_password

	has_one :booking
	has_many :cars
	has_many :invoices
	has_many :messages

	NAME_REGEX = /\w+/

	validates :first_name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A#{NAME_REGEX}\z/i }
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

	 # Returns true if the given token matches the digest.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
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

	# Returns true if a password reset has expired.
	def password_reset_expired?
		reset_sent_at < 2.hours.ago
	end
end
