class CreateScraperComponentPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_component_prices, &:timestamps
  end
end
