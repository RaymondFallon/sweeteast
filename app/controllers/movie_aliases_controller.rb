# frozen_string_literal: true

class MovieAliasesController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    if @movie.aliases.create(movie_alias_params)
      flash[:notice] = 'Alias added successfully'
    else
      flash[:error] = 'Error adding alias'
    end

    redirect_to edit_movie_path(@movie)
  end

  def destroy
    @movie_alias = MovieAlias.find(params[:id])
    if @movie_alias.destroy
      flash[:notice] = 'Alias removed successfully'
    else
      flash[:error] = 'Error removing alias'
    end

    redirect_to edit_movie_path(@movie_alias.movie)
  end

  private

  def movie_alias_params
    params.require(:movie_alias).permit(:text)
  end
end
