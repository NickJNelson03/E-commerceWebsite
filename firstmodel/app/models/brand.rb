class Brand < ApplicationRecord
  has_many :products
  has_one_attached :logo
  belongs_to :user

  def getimage
    if self.logo.blob_id == nil
      return "product_filler"
    else
      return self.logo
    end
  end
end
