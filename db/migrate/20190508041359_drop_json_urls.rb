class DropJsonUrls < ActiveRecord::Migration[5.2]
  def change
    drop_table :scraper_json_properties
    drop_table :scraper_jsons
    drop_table :website_url_jsons
    drop_table :website_urls
  end
end
