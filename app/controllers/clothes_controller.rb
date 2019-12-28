class ClothesController < ApplicationController
  def index; end

  def get_all_clothes
    website_pages =
      WebsitePage.where(
        category: params[:category], website: JSON.parse(params[:websites])
      )
    clothes =
      website_pages.each_with_object([]) do |website_page, clothes|
        clothes.concat(website_page.scrape_page(params[:page]))
      end
    render json: { 'clothes': clothes }
  end
end
