class ConsolesController < ApplicationController
  before_filter :set_console, only: [:show, :destroy, :update]

  def create
    @console = Console.new console_params
    if @console.save
      render json: @console, status: :ok, location: @console
    else
      render json: @console.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @console, status: :ok
  end

  def index
    @consoles = Console.all
    render json: @consoles, status: :ok
  end

  def destroy
    @console.destroy
    head :ok
  end

  def update
    if @console.update_attributes(console_params)
      render json: @console, status: :ok
    else
      render json: @console.errors, status: :unprocessable_entity
    end
  end

  private
  def console_params
    params.require(:console).permit(:name)
  end

  def set_console
    @console = Console.where(id: params[:id]).first
  end
end
