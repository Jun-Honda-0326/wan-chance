class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :comments
  has_many :posts, dependent: :destroy  
  has_many :likes, dependent: :destroy
  has_many :messages
  has_many :entries
  has_many :rooms, through: :entries 
end
