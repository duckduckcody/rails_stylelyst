class MoveScraperToWebsiteModel < ActiveRecord::Migration[5.2]
  def change
    remove_reference :website_pages, :scraper_id
    remove_column :website_pages, :scraper_id
    add_reference :scrapers, :website, foreign_key: true
  end
end
