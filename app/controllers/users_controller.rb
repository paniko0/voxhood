class UsersController < ApplicationController

  before_filter :authorize, only: :profile

  def profile
    unless current_user
      redirect_to login_path
    end
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def forgot

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
