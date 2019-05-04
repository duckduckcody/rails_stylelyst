class DropScraperSearchAndScraperCategory < ActiveRecord::Migration[5.2]
  def change
    rename_table :scraper_searches, :scraper_htmls
    rename_table :scraper_categories, :scraper_jsons
  end
end
