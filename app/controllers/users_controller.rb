class UsersController < ApplicationController
  def create
    @user = User.new user_params
    if @user.save
      render json: @user, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def index; end
  def destroy; end
  def update; end

  protected
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
