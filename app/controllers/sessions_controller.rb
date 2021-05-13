class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "Welcome Back #{user.email}!"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = 'Invalid credentials! Please try again.'
      redirect_to login_path
    end
  end
end
