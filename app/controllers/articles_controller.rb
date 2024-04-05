# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]

  def index
    @articles = Article.published.order(published_at: :desc)
    @showtimes = Showtime.for_date(Time.zone.today)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :author_id, :published_at, :content, :preview_text)
  end
end
