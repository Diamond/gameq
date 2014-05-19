class TagsController < ApplicationController
  before_filter :set_tag, only: [:show, :destroy, :update]

  def create
    @tag  = Tag.first_or_create tag_params
    @game = Game.where(id: params[:game_id]).first
    if @tag.valid? && GameTag.add_tag_for_game(@tag, @game)
      render json: @tag, status: :ok, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @tag, status: :ok
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.where(id: params[:id]).first
  end
end
