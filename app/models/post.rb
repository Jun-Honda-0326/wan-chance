class Post < ApplicationRecord
  validates :text, :image, presence: true

  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
  mount_uploader :image, ImageUploader

  after_create do
    post = Post.find_by(id: self.id)
    tags = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |t|
      tag = Tag.find_or_created_by(text: t.downcase.delete('#'))
      post.tags << tag
    end
  end
end
