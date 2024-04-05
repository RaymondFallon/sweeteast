# frozen_string_literal: true

class HomepageController < ApplicationController
  def home
    @articles = Article.published.order(published_at: :desc).limit(5)
    @showtimes = Showtime.for_date(Time.zone.today)
  end
end
