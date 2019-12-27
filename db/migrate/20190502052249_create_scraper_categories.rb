class CreateScraperCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_categories, &:timestamps
  end
end
