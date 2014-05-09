class GamesController < ApplicationController
  before_filter :set_game, only: [:show, :destroy, :update]

  def create
    @game = Game.new game_params
    if @game.save
      render json: @game, status: :ok, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def show

  end

  def index
  end

  def destroy
  end

  def update
  end

  private
  def game_params
    params.require(:game).permit(:name, :completed)
  end

  def set_game
    @game = Game.where(params[:id]).first
  end
end
