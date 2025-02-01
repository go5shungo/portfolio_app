class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def get_image
  end
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
end
