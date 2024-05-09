class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  validate :quantity_does_not_exceed_stock

  private

  def quantity_does_not_exceed_stock
    return unless product && quantity

    if quantity > product.stock
      errors.add(:quantity, "exceeds available stock")
    end
  end
end
