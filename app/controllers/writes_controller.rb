class WritesController < ApplicationController
  before_action :find_write, only: [:show, :edit, :update, :destroy]

  def index
    @writes = Write.all
  end

  def new
    @write = Write.new
    @authors = Author.all
    @books = Book.all
  end

  def create
    @write = Write.new(write_params)

    if @write.save
      redirect_to @write
    else
      render :new
    end
  end

  def show
  end

  def edit
    @authors = Author.all
    @books = Book.all
  end

  def update
    if @write.update(write_params)
      redirect_to @write
    else
      render :new
    end
  end

  def destroy
    @write.destroy
    redirect_to writes_path
  end

  private
  def find_write
    @write = Write.find(params[:id])
  end

  def write_params
    params.require(:write).permit(:author_id, :book_id)
  end
end
