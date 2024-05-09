module ApplicationHelper
  def cart_count
    if current_user && current_cart
      current_cart.cart_items.sum(:quantity)
    else
      0
    end
  end

end
