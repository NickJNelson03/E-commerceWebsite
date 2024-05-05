class ApplicationController < ActionController::Base
  before_action :set_cart

  private

  def set_cart
    if user_signed_in?
      @cart = current_user.cart
    end
  end
end
