# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @showtimes = Showtime.for_date(Time.zone.today)
  end

  def show
    @article = Article.find(params[:id])
  end
end
