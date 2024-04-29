class ShowtimesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @showtimes_by_date = Showtime.order(:start_datetime)
                                 .includes(:movie, :theater)
                                 .upcoming
                                 .group_by(&:date)

    @selected_date = selected_or_default_date
  end

  def create
    @showtime = Showtime.new(showtime_params)
    @showtime.manually_added = true
    @showtime.save
  end

  def destroy
    Showtime.find(params[:id]).destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def selected_or_default_date
    default = Showtime.upcoming.minimum(:start_datetime)&.to_date
    selected = Date.parse(params[:date]) if params[:date]
    selected || default
  rescue Date::Error
    default
  end

  def showtime_params
    params.require(:showtime).permit(:movie_id, :theater_id, :start_datetime)
  end
end
