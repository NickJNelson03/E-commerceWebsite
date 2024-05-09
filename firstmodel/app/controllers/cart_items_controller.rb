# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]  # You might want to protect update and destroy too

  def create
    @cart = current_cart
    product = Product.find(cart_item_params[:product_id])
    @cart_item = @cart.add_product(product.id, cart_item_params[:quantity])

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_back fallback_location: root_path }
        format.js   # This will look for a file called create.js.erb
      else
        format.html { redirect_back fallback_location: product_path(product), alert: 'Unable to add product.' }
        format.js
      end
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Item removed successfully.' }
      format.js   # Handle AJAX response if applicable
    end
  end


  # other methods...

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    {
    product_id: params[:product_id],
    quantity: params[:quantity]
    }
  end

  def current_cart
    # Ensure the current_cart method handles carts properly, possibly creating a new cart if one does not exist
    Cart.find_or_create_by(user_id: current_user.id)  # Adjust this line according to your application's logic
  end
end
