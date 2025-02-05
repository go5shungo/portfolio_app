class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_pets
  has_many :pets, :through => :post_pets

  def get_image
  end

  def create
  end
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
