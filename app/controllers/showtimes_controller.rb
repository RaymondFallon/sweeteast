class ShowtimesController < ApplicationController
  def index
    @showtimes = Showtime.order(:start_datetime)
                         .includes(:movie, :theater)
                         .upcoming
  end
end
