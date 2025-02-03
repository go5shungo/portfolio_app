class PostPet < ApplicationRecord
  belongs_to :pet
  belongs_to :post
end
