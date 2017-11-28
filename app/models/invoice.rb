class Invoice < ApplicationRecord
	belongs_to :driver

	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   	validates :first_name, presence: true # Make sure the owner's name is present.
   	validates :last_name, presence: true

end
