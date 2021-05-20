class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "Welcome Back #{user.email}!"
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:alert] = 'Invalid credentials! Please try again.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out.'
    redirect_to '/'
  end
end
