# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def new
    debugger
  end

  def index
    @articles = Article.all
    @showtimes = Showtime.for_date(Time.zone.today)
  end

  def show
    @article = Article.find(params[:id])
  end
end
