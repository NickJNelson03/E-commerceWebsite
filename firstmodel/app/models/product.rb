class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews
  has_one_attached :image
end
