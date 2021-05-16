class FriendshipsController < ApplicationController
  def create
    wanted_friend = User.where(email: params[:search].downcase).first
    users_not_including_self = User.where.not(email: current_user.email)

    if users_not_including_self.include?(wanted_friend) && !current_user.followees.include?(wanted_friend)
      current_user.followees << wanted_friend
      flash[:notice] = "Successfully added #{wanted_friend.email}!"
      redirect_to dashboard_path
    elsif params[:search] == current_user.email
      flash[:alert] = "You cheeky buggar. You can't add yourself!"
      redirect_to dashboard_path
    elsif current_user.followees.include?(wanted_friend)
      flash[:alert] = "#{wanted_friend.email} already added!"
      redirect_to dashboard_path
    elsif !users_not_including_self.include?(wanted_friend)
      flash[:alert] = 'Friend not found. Please try again!'
      redirect_to dashboard_path
    end
  end
end
