class UsersController < ApplicationController


  def index
      @users= User.all
  end

  def create
     @user = User.new(user_params)
     if user.save
         session[:user_id] = user.id
     redirect_to posts_page
    else
    redirect_to root_path
    end
end

  def show
      @user = User.find(params[:id])
  end

  def new
      @user = User.new
  end


  private
  def user_params
      params.require(:user).permit(:name, :email, :password)
  end
end
