class Post < ApplicationRecord
  validates :text, :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
end
