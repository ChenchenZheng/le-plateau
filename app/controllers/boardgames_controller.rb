class BoardgamesController < ApplicationController
  after_action :verify_authorized, except: [:scan_barcode]

  require 'json'
  require 'open-uri'

  def new
    @boardgame = Boardgame.new(barcode: params[:barcode], name: params[:name], description: params[:description], category: params[:category])
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

  def scan_barcode
  end

  def import_boardgame
    url = "https://api.barcodelookup.com/v2/products?barcode=#{params[:barcode]}&formatted=y&key=#{ENV["BARCODELOOKUP_KEY"]}"
    boardgame_serialized = URI.open(url).read
    boardgame = JSON.parse(boardgame_serialized)
    boardgame = boardgame["products"][0]
    @boardgame = Boardgame.find_or_initialize_by(barcode: params[:barcode], name: boardgame["product_name"], description: boardgame["description"], category: boardgame["category"])
    authorize @boardgame
    if @boardgame.new_record?
      redirect_to new_boardgame_path(barcode: params[:barcode], name: boardgame["product_name"], description: boardgame["description"], category: boardgame["category"])
    else
      redirect_to @boardgame
    end
  end

  private

  def boardgame_params
    params.require(:boardgame).permit(:name, :description, :category, :level, :duration, :photo, :barcode)
  end
end
