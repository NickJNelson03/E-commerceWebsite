class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = current_user
    # Rails does the magic.
  end
end
