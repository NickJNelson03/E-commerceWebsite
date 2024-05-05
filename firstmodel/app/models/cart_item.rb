class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  validate :quantity_available

  private

  def quantity_available
    if product && quantity > product.stock
      errors.add(:quantity, "exceeds available stock")
    end
  end


end
