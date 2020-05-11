class Message < ApplicationRecord
  validates :message, presence: true
  belongs_to :user
  belongs_to :room
end
