# frozen_string_literal: true

class HomepageController < ApplicationController
  def home
    @articles = Article.published.order(published_at: :desc).limit(5)
    @movies_today = Movie.for_date(Time.zone.today)
    @movies_later = Movie.this_week - @movies_today
  end
end
