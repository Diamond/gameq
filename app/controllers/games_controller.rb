class GamesController < ApplicationController
  before_filter :set_game, only: [:show, :destroy, :update]

  def create
    @game = Game.first_or_create game_params
    if UserGame.add_game_for_user(@game, current_user, params[:completed])
      render json: @game, status: :ok, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def show
    if params[:user_id].present?
      @user_game = UserGame.where(user_id: params[:user_id], game_id: params[:id]).first
    else
      @user_game = Game.where(id: params[:id]).first
    end
    render json: @user_game, status: :ok
  end

  def index
    determine_nested_resource
    render json: @games, status: :ok
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

  private
  def game_params
    params.require(:game).permit(:name)
  end

  def user_game_params
    { completed: params[:completed] }
  end

  def set_game
    @game = Game.where(id: params[:id]).first
    @user_game = UserGame.where(game_id: @game.id, user_id: current_user.id).first
  end

  def determine_nested_resource
    if params[:user_id].present?
      @games = User.find(params[:user_id]).games
    elsif params[:tag_id].present?
      @games = Tag.find(params[:tag_id]).games
    else
      @games = Game.all
    end
  end
end
