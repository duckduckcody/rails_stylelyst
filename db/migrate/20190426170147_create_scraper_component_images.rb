class CreateScraperComponentImages < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_component_images do |t|

      t.timestamps
    end
  end
end
