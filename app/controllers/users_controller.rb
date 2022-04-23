class UsersController < ApplicationController
  def index
     @book_temprate = Book.new
     @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @book_temprate = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to users_path(user.id), notice: 'You have updated user successfully.'
    else
     @user= User.all
     render :show
    end
  end

  private

def user_params
  params.require(:user).permit(:name,:profile_image)
end


end