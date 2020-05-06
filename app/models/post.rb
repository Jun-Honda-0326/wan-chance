class Post < ApplicationRecord
  validates :text, :image, presence: true

  mount_uploader :image, ImageUploader
end
