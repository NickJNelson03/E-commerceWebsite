class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.find_by(id: params[:id])  # using find_by to avoid raising an exception if no record is found
    if @cart.nil?
      redirect_to root_path, alert: "Cart not found."
      return
    end
  end
end
