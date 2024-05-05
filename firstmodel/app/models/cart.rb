class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_product(product_id, quantity)
    current_item = cart_items.find_by(product_id: product_id)
    product = Product.find(product_id)

    # Check available stock
    if current_item
      new_quantity = current_item.quantity + quantity.to_i
    else
      new_quantity = quantity.to_i
    end

    if new_quantity > product.stock
      return nil
    end

    if current_item
      current_item.quantity += quantity.to_i
    else
      current_item = cart_items.build(product_id: product_id, quantity: quantity)
    end

    current_item
  end
end
