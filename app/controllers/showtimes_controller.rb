class ShowtimesController < ApplicationController
  def index
    @showtimes = Showtime.order(:start_datetime).includes(:theater).upcoming
  end
end
