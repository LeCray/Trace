class Message < ApplicationRecord

belongs_to :driver

validates :content, presence: true
scope :for_display, -> { order(:created_at).last(50) }
end
