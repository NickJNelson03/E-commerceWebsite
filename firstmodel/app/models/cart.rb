class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  belongs_to :user

  # Method to add a product to the cart or update quantity if it already exists
  def add_product(product_id, quantity)
    current_item = cart_items.find_by(product_id: product_id)
    
    if current_item
      current_item.quantity += quantity.to_i
    else
      current_item = cart_items.build(product_id: product_id, quantity: quantity)
    end
    current_item
  end
end
