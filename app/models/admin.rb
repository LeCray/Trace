class Admin < ApplicationRecord


	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :role, presence: true

end


	before_save :format_name
	before_save :format_role
	
	def to_s
		"#{first_name} #{last_name}"
	end

	def format_name
		self.first_name = self.first_name.capitalize
		self.last_name = self.last_name.capitalize
	end

	def format_role
		self.role = self.role.capitalize
	end

  	def random_token
  		if self.new_record?
  			self.token = SecureRandom.uuid
  		end
  	end


	 # Returns true if the given token matches the digest.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	private


    # Converts email to all lower-case.
  	def downcase_email
		self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
		self.activation_token  = Admin.new_token
		self.activation_digest = Admin.digest(activation_token)
    end

    # Returns the hash digest of the given string.
	def Admin.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		                                          BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

     # Returns a random token.
	def Admin.new_token
		SecureRandom.urlsafe_base64
	end