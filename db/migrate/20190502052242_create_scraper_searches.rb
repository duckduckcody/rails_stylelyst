class CreateScraperSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_searches do |t|

      t.timestamps
    end
  end
end
