class UsersController < ApplicationController
  def new; end

  def create
    existing_user = User.where(email: user_params[:email])
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Welcome, #{user.email}!"
      session[:user_id] = user.id
      redirect_to dashboard_path
    elsif user.password != user.password_confirmation
      flash[:alert] = 'Mismatched passwords! Please try again.'
      redirect_to registration_path
    elsif existing_user.any?
      flash[:alert] = 'Account already exists! Please sign in.'
      redirect_to login_path
    else
      flash[:alert] = 'Please fill in all fields.'
      redirect_to registration_path
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
