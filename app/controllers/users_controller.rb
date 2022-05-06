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
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
