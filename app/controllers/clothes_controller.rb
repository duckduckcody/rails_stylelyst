class ClothesController < ApplicationController
  def index
    @page = (params[:page] ||= '1')
    @user_settings = UserSettingsService.call(cookies)
    @user_settings[:website_ids].each do |website_id|
      @website = Website.find(website_id)
      @clothes = @website.scrape(@user_settings, @page)
    end
  end

  def settings
    @websites = Website.all
    @categories = Category.all
    @genders = Gender.all
    @user_settings = UserSettingsService.call(cookies)
  end
end
