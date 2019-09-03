class RenameRefences < ActiveRecord::Migration[5.2]
  def change
    rename_column :scraper_fields, :scraper_html_id, :scraper_id
    rename_column :website_pages, :scraper_html_id, :scraper_id
    remove_column :website_pages, :website_url_function_id
  end
end
