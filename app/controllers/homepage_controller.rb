# frozen_string_literal: true

class HomepageController < ApplicationController
  def home
    @articles = Article.all
    @showtimes = Showtime.for_date(Time.zone.today)
  end
end
