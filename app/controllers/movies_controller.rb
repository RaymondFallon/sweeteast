# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @selected_date = params[:date] ? Date.parse(params[:date]) : Time.zone.today
    @showtimes_by_date = @movie.showtimes.includes(:theater)
                                         .order(:start_datetime)
                                         .upcoming
                                         .group_by { _1.start_datetime.to_date }
  end

  def new
    @movie = Movie.new
    @movie.aliases.build
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Success"
      redirect_to edit_movie_path(@movie)
    else
      flash.now[:error] = "Error"
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "Success"
      redirect_to edit_movie_path(@movie)
    else
      flash.now[:error] = "Error"
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :spotlighted, :description,
                                  aliases_attributes: %i[id text _destroy])
  end
end
