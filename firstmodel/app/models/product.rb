class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews
  has_one_attached :image

  def getimage
    if self.image.blob_id == nil
      return "product_filler"
    else
      return self.image
    end
  end
end
