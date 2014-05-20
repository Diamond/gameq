class UserGamesController < ApplicationController
  before_filter :set_user_game, only: [:destroy, :update, :show]

  def create
    @game = Game.first_or_create game_params
    if @game.valid?
      @user_game = UserGame.add_game_for_user(@game, @user, user_game_params[:user_game][:completed])
      if @user_game.valid?
        render json: @user_game, status: :ok, location: @user_game
      else
        render json: @user_game.errors, status: :unprocessable_entity
      end
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_game.destroy
    head :ok
  end

  def update
    if @user_game.update_attributes user_game_params
      render json: @user_game, status: :ok
    else
      render json: @user_game.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user_game, status: :ok
  end

  def index
    @user = User.find(params[:user_id])
    render json: @user.games, status: :ok
  end

  protected
  def set_user_game
    @user_game = UserGame.where(user_id: params[:user_id], game_id: params[:id]).first 
  end

  def game_params
    params.require(:game).permit(:name)
  end

  def user_game_params
    params.require(:user_game).permit(:completed)
  end
end
