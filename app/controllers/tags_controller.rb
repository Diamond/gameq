class TagsController < ApplicationController
  before_filter :set_tag, only: [:show, :destroy, :update]

  def create
    @tag = Tag.new tag_params
    if @tag.save
      render json: @tag, status: :ok, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @tag, status: :ok
  end

  def index
    @tags = Tag.all
    render json: @tags, status: :ok
  end

  def destroy
    @tag.destroy
    head :ok
  end

  def update
    if @tag.update_attributes tag_params
      render json: @tag, status: :ok
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.where(id: params[:id]).first
  end
end
