class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_product(product_id, quantity)
    current_item = cart_items.find_or_initialize_by(product_id: product_id)
    new_quantity = current_item.quantity + quantity.to_i

    if new_quantity <= current_item.product.stock
      current_item.quantity = new_quantity
      current_item
    else
      nil
    end
  end

  def total_items
    cart_items.sum(:quantity)
  end

  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end
end
