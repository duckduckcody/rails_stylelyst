class CreateScraperComponentImages < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_component_images, &:timestamps
  end
end
