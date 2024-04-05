# frozen_string_literal: true

class HomepageController < ApplicationController
  def home
    @articles = Article.published.order(published_at: :desc)
    @showtimes = Showtime.for_date(Time.zone.today)
  end
end
