class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validate :quantity_available

  def total_price
    product.price * quantity
  end

  private

  def quantity_available
    if product && quantity > product.stock
      errors.add(:quantity, "exceeds available stock")
    end
  end
end
