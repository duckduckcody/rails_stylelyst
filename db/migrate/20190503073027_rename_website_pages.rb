class RenameWebsitePages < ActiveRecord::Migration[5.2]
  def change
    rename_table :website_pages, :website_urls
    rename_table :website_page_searches, :website_url_searches
    rename_table :website_page_categories, :website_url_categories
  end
end
