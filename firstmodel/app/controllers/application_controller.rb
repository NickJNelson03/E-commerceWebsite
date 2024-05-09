class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_cart

  def current_cart
    return nil unless user_signed_in?
    Cart.find_or_create_by(user_id: current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:firstname, :lastname, :email, :password, :password_confirmation, :account_type)
    end
  end
end
