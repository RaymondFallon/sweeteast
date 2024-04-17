# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @showtimes_by_movie = Showtime.upcoming.includes(:movie, :theater).group_by(&:movie)
  end

  def show
    @movie = Movie.find(params[:id])
    @showtimes = @movie.showtimes.upcoming.includes(:theater)
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
    params.require(:movie).permit(:title, aliases_attributes: %i[id text _destroy])
  end
end
