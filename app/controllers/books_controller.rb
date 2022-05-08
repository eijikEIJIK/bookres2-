class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @book_new = Book.new
    @books = Book.all
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id

    if @book_new.save
      redirect_to book_path(@book_new.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])

    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])

    if book.user !=current_user
      redirect_to book_path(params[:id])
    end

    if book.update(book_params)
      redirect_to book_path(book.id), notice: "You have udpated book successfully."
    else
      @book = book
      render :edit
    end
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
