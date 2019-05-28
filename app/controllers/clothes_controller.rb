class ClothesController < ApplicationController
  def index
    params[:page] = (params[:page] ||= '1')
    @page = params[:page].to_i # this is used for page nav. TODO: move this into javascript
    @url_function = WebsiteUrlFunction.find_by(name: 'page')
    @user_settings = UserSettingsService.call(cookies)
    @clothes = @user_settings[:website_ids].each_with_object([]) do |website_id, clothes|
      website = Website.find(website_id)
      clothes.concat(website.scrape(@user_settings, params, @url_function))
    end
  end

  def settings
    @websites = Website.all
    @categories = Category.all
    @genders = Gender.all
    @user_settings = UserSettingsService.call(cookies)
  end

  def website_match
    websites = WebsiteUrlHtml
      .where(category: params[:category])
      .map{ |category| category.website }
      .sort_by { |website| website.name }
    render :json => {'websites': websites}
  end
end
