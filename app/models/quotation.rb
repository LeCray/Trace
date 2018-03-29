class Quotation < ApplicationRecord
		
	has_one :driver

	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
	validates :attachment, presence: true
end
