class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def edit
    
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path    
  end

  private
  def set_user
    @user = User.find(params[:id])  
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end
end
