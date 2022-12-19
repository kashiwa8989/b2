class UsersController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @book.save
    redirect_to books_path(@book)
  end
  
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
