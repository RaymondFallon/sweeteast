class ShowtimesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @showtimes = Showtime.order(:start_datetime)
                         .includes(:movie, :theater)
                         .upcoming
  end

  def create
    @showtime = Showtime.new(showtime_params)
    @showtime.save
  end

  def destroy
    Showtime.find(params[:id]).destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def showtime_params
    params.require(:showtime).permit(:movie_id, :theater_id, :start_datetime)
  end
end
