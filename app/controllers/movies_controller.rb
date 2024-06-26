# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @showtimes_by_date = @movie.showtimes.includes(:theater)
                                         .order(:start_datetime)
                                         .upcoming
                                         .group_by(&:date)
    @selected_date = selected_or_default_date(@showtimes_by_date.keys)
  end

  def new
    @movie = Movie.new
    @movie.aliases.build
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Success'
      redirect_to movie_path(@movie)
    else
      flash.now[:error] = 'Error'
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = 'Success'
      redirect_to movie_path(@movie)
    else
      flash.now[:error] = 'Error'
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :spotlighted, :description,
                                  aliases_attributes: %i[id text _destroy])
  end
end
