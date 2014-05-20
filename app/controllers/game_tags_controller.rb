class GameTagsController < ApplicationController
  before_filter :set_game

  def create
    @tag = Tag.first_or_create tag_params
    @game_tag = GameTag.add_tag_for_game(@tag, @game)
    if @game_tag.save
      redirect_to @game
    else
      render json: @game_tag.errors, status: :unprocessable_entity
    end
  end

  protected
  def set_game
    @game = Game.find(params[:game_id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
