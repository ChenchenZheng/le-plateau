class BoardgamesController < ApplicationController

  def new
    @boardgame = Boardgame.new
    authorize @boardgame
  end

  def create
    @boardgame = Boardgame.new(boardgame_params)
    authorize @boardgame
    if @boardgame.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def boardgame_params
    params.require(:boardgame).permit(:name, :description, :category, :level, :duration, :photo)
  end
end
