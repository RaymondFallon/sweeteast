

# frozen_string_literal: true

class TheatersController < ApplicationController
  def index
    @theaters = Theater.order(:name)
  end

  def show
    @theater = Theater.find(params[:id])
    @showtimes = @theater.showtimes.includes(:movie).for_date(Time.zone.today)
  end
end
