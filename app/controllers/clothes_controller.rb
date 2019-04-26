class ClothesController < ApplicationController
  def index
    @website = Website.find_by(name: 'Culture Kings')
    @clothes = @website.scraper.scrape('/collections/mens-tops')
  end

  def settings
    @websites = Website.all
    @categories = Category.all
    @genders = Gender.all
  end
end
