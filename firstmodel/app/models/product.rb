class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
  validates :desc, presence: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
  validates :brand_id, presence: true
  has_one_attached :image

  def getimage
    if self.image.blob_id == nil
      return "product_filler"
    else
      return self.image
    end
  end
>>>>>>> origin/main
end
