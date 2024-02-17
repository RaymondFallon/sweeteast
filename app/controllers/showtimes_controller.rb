class ShowtimesController < ApplicationController
  def index
    @showtimes = Showtime.upcoming.group_by(&:theater)
  end
end
