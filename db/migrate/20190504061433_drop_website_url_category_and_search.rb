class DropWebsiteUrlCategoryAndSearch < ActiveRecord::Migration[5.2]
  def change
    drop_table :website_url_categories
    drop_table :website_url_searches
    rename_table :website_urls, :website_url_htmls
  end
end
