class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  
  def get_image
  end
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
end
