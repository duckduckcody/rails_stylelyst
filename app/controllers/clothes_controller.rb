class ClothesController < ApplicationController
  def index; end

  def get_all_clothes
    website_pages = WebsitePage.where(category: params[:category])
    clothes =
      website_pages.each_with_object([]) do |website_page, clothes|
        clothes.concat(website_page.scrape_page(params[:page_number]))
      end
    render json: { 'clothes': clothes }
  end
end
