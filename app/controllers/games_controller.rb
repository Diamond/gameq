class GamesController < ApplicationController
  def index
    determine_game_index
    render json: @games, status: :ok
  end

  def show
    @game = Game.find(params[:id])
    render json: @game, status: :ok
  end

  protected
  def determine_game_index
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @games = @tag.games
    else
      @games = Game.all
    end
  end
end
