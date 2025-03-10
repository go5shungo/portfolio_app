class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      has_many :post_comments, dependent: :destroy
      has_many :posts, dependent: :destroy
      has_many :pets, dependent: :destroy
      has_many :favorites, dependent: :destroy
      has_one_attached :profile_image

      def self.search_for(content, method)
        if method == 'perfect'
          User.where(name: content)
        elsif method == 'forward'
          User.where('name LIKE ?', content + '%')
        elsif method == 'backward'
          User.where('name LIKE ?', '%' + content)
        else
          User.where('name LIKE ?', '%' + content + '%')
        end
      end

      def get_profile_image(width, height)
        unless profile_image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        profile_image.variant(resize_to_limit: [width, height]).processed
      end
end