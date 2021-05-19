class ViewingPartyController < ApplicationController
  def new
    @movie_title       = params[:movie_title]
    @movie_runtime_min = params[:movie_runtime]
  end

  def create
    party = Party.new(viewing_party_params)
    if party.save
      params[:followers].delete("")
      params[:followers].each do |follower|
        party.viewing_party_guests.create(user_id: follower, party_id: party.id)
      end
      redirect_to dashboard_path
    else
      @movie_title = params[:movie_title]
      @movie_runtime_min = params[:duration]

      flash[:alert] = 'Please fill in all fields and choose at least one friend.'
      render :new
    end
  end

  private

  def viewing_party_params
    params.permit(:duration, :date, :start_time, :movie_title, :user_id)
  end
end
