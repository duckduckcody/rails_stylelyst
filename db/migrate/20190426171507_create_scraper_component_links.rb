class CreateScraperComponentLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_component_links do |t|

      t.timestamps
    end
  end
end
