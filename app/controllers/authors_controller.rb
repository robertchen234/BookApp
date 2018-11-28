class AuthorsController < ApplicationController

  before_action :authors :only[:show, :edit, :create, :update, :destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save?
      redirect_to @author
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @author.update(author_params)
    redirect_to @author
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private
  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :birth_year)
  end


end
