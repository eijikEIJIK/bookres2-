class PostBooksController < ApplicationController
  def index
    @post_book = PostBook.new
    @post_books = PostBook.all
  end

  def new
    @post_book = PostBook.new
  end

  def create
    @post_book = PostBook.new(post_book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to post_books_path
  end

  def show
  end

  def edit
  end

  private

  def post_book_params
    params.require(:post_book).permit(:title, :body)
  end

end
