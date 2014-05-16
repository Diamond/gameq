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
    render json: @game, status: :ok
  end

  def index
    determine_nested_resource
    render json: @games, status: :ok
  end

  def destroy
    @game.destroy
    head :ok
  end

  def update
    if @game.update_attributes(game_params)
      render json: @game, status: :ok
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  private
  def game_params
    params.require(:game).permit(:name, :completed)
  end

  def set_game
    @game = Game.where(id: params[:id]).first
  end

  def determine_nested_resource
    if params[:member_id].present?
      @game = Member.find(params[:member_id]).games
    elsif params[:tag_id].present?
      @game = Tag.find(params[:tag_id]).games
    else
      @games = Game.all
    end
  end
end
