class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @book_new = Book.new
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    
    if @book.user!=current_user
      redirect_to book_path(params[:id])
    end
  end

  def update
    book = Book.find(params[:id])
    
    if book.user!=current_user
      redirect_to book_path(params[:id])
    end
    
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    
    if @book.user!=current_user
      redirect_to book_path(params[:id])
    end
    
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
