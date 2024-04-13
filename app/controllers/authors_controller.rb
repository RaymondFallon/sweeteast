# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @authors = Author.order(:name)
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
