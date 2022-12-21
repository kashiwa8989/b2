class UsersController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}
  
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
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def ensure_current_user
    @user = User.find(params[:id])
  if current_user.id != @user.id
    redirect_to user_path(current_user)
  end
  end
end
