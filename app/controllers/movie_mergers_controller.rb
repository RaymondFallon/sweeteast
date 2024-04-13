# frozen_string_literal: true

class MovieMergersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def update
    @merger = MovieMerger.new(params[:movie1_id], params[:movie2_id])
    if @merger.merge
      flash[:notice] = "Success"
      redirect_to edit_movie_path(@merger.movie1)
    else
      flash[:error] = "Error"
      redirect_back(fallback_location: root_path)
    end
  end
end
