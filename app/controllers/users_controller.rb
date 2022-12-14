class UsersController < ApplicationController
  before_action :ensure_currect_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @book_comment = BookComment.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_currect_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

end
