class UsersController < ApplicationController
  def index
    @book_new = Book.new
    @users=User.all
    @book=Book.new
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @book=Book.new
  end

  def edit
  end
end
