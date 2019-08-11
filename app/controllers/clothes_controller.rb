class ClothesController < ApplicationController
  def index
  end

  def get_all_clothes
    result = ScrapeClothes.call(params)
    render :json => {'clothes': result.clothes}
  end
end