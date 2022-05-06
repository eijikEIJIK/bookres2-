class UsersController < ApplicationController
  before_action :authenticate_user!
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
    @user = User.find(params[:id])

    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user != current_user
      redirect_to user_path(params[:id])
    end

    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
