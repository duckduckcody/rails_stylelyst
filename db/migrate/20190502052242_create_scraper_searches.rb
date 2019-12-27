class CreateScraperSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_searches, &:timestamps
  end
end
