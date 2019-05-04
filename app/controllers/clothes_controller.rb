class ClothesController < ApplicationController
  def index
    params[:page] = (params[:page] ||= '1')
    @user_settings = UserSettingsService.call(cookies)
    @user_settings[:website_ids].each do |website_id|
      @website = Website.find(website_id)
      @clothes = @website.scrape(@user_settings, params)
    end
  end

  def search
    # check for params[:query], if none throw error
    @query = params[:query]
    @user_settings = UserSettingsService.call(cookies)
    @user_settings[:website_ids].each do |website_id|
      @website = Website.find(website_id)
      @clothes = @website.scrape_search(@user_settings, @query)
    end
    render :index
  end

  def settings
    @websites = Website.all
    @categories = Category.all
    @genders = Gender.all
    @user_settings = UserSettingsService.call(cookies)
  end
end
