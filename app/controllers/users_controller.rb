class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Welcome, #{user.email}!"
      session[:user_id] = user.id
      redirect_to '/'
    elsif user.password != user.password_confirmation
      flash[:alert] = "Mismatched passwords! Please try again."
      redirect_to new_user_path
    else
      flash[:alert] = "Please fill in all fields."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
