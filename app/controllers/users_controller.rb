class UsersController < ApplicationController
  def index
    @user = User.new
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