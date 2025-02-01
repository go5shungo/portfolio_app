class Pet < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  enum kind: {
    その他: 0,
    猫: 1,
    犬: 2
  }

  enum sex: {
    オス♂: true,
    メス♀: false
  }

  validates :name, presence: true
  validates :kind, presence: true
  validates :image, presence: true

end
