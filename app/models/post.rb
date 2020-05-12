class Post < ApplicationRecord
  validates :text, :image, presence: true

  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags

  mount_uploader :image, ImageUploader
end
