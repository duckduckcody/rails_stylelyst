class AddComponentToScraper < ActiveRecord::Migration[5.2]
  def change
    add_reference :scraper_components, :scraper
  end
end
