class UsersController < ApplicationController
  before_filter :set_user, only: [:show, :update, :destroy]

  def create
    @user = User.new user_params
    if @user.save
      render json: @user, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def show
    if @user
      render json: @user, status: :ok
    else
      head :unprocessable_entity
    end
  end

  def destroy
    if is_self? 
      @user.destroy
      logout
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def update
    if is_self? 
      if @user.update_attributes user_params
        render json: @user, status: :ok, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      head :unprocessable_entity
    end
  end

  protected
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.where(id: params[:id]).first
  end

  def is_self?
    @user.present? && @user == current_user
  end
end
