class ClothesController < ApplicationController
  def index
    params[:page] = (params[:page] ||= '1')
    @url_function = WebsiteUrlFunction.find_by(name: 'page')
    @user_settings = UserSettingsService.call(cookies)
    @user_settings[:website_ids].each do |website_id|
      @website = Website.find(website_id)
      @clothes = @website.scrape(@user_settings, params, @url_function)
    end
  end

  def search
    params[:page] = (params[:page] ||= '1')
    @url_function = WebsiteUrlFunction.find_by(name: 'search')
    @user_settings = UserSettingsService.call(cookies)
    @user_settings[:website_ids].each do |website_id|
      @website = Website.find(website_id)
      @clothes = @website.scrape(@user_settings, params, @url_function)
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
