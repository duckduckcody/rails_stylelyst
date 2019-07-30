class ClothesController < ApplicationController
  def index
  end

  def get_clothes
    result = GetClothes.call(params)
    render :json => {'clothes': result.clothes}
  end

  def get_settings
    render :json => {
      'genders': Gender.all,
      'categories': Category.all
    }
  end

  def website_match
    result = WebsiteMatchByCategory.call(params)
    render :json => {'websites': result.websites}
  end
end
