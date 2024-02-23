# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]

  def index
    @authors = Author.all
    @showtimes = Showtime.for_date(Time.zone.today)
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to @author
    else
      render :edit
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :bio)
  end
end
