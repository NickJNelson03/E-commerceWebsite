# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]  # You might want to protect update and destroy too

  def create
    @cart = current_cart
    product = Product.find(cart_item_params[:product_id])
    @cart_item = @cart.add_product(product.id, cart_item_params[:quantity])

    if @cart_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      redirect_to products_url, alert: 'Unable to add product.'
    end
  end

  # other methods...

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def current_cart
    # Ensure the current_cart method handles carts properly, possibly creating a new cart if one does not exist
    Cart.find_or_create_by(user_id: current_user.id)  # Adjust this line according to your application's logic
  end
end