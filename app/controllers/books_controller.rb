require 'byebug'

class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def show
    @write = Write.new
    @authors = Author.all
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :pages)
  end

end
