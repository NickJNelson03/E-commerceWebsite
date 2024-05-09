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
  
  def pickProducts(int)
    randProds=Array.new
    used= Array.new
    pickList=self.products
    int=[int, pickList.length].min
    for i in 0...int
      candidate=pickList[rand(pickList.length)]
      while used.include? candidate
        candidate=pickList[rand(pickList.length)]
      end
      used.push(candidate)
      randProds.push(candidate)
    end
    return randProds
  end
end
