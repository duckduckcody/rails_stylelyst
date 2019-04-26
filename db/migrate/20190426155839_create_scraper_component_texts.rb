class CreateScraperComponentTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_component_texts do |t|

      t.timestamps
    end
  end
end
