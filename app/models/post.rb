class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_pets
  has_many :pets, :through => :post_pets
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  scope :by_category, ->(categories) {includes(:pets).where(pets: {kind: categories}) if categories.present? }
 
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def save_tags(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags
		
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
	
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name:new_name)
      self.tags << post_tag
    end
  end
	
  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content)
    else
      Post.where('title LIKE ?', '%'+content+'%')
    end
  end

end
