class UserGamesController < ApplicationController
  before_filter :set_user

  def create
    @game = Game.first_or_create game_params
    if @game.valid? && UserGame.add_game_for_user(@game, @user, user_game_params[:user_game][:completed])
    else

    end
  end

  def destroy
  end

  def update
  end

  def show
  end

  def index
  end

  protected
  def set_user
    @user = User.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name)
  end

  def user_game_params
    params.require(:user_game).permit(:completed)
  end
end
