class CreateScraperComponentPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_component_prices do |t|

      t.timestamps
    end
  end
end
