class SessionsController < ApplicationController
  def create
    @user = login params[:email], params[:password]
    session[:user_id] = @user.present? ? @user.id : nil
    head (@user.present? ? :ok : :unprocessable_entity)
  end

  def destroy
    session[:user_id] = nil
    head :ok
  end
end
