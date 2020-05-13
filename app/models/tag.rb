class Tag < ApplicationRecord
  has_many :post_tags, foreign_key: :post_id
  has_many :posts, through: :post_tags
end
