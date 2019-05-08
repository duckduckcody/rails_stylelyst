class AddWebsiteUrlReferenceToJsonScraper < ActiveRecord::Migration[5.2]
  def change
    add_reference :scraper_jsons, :website_url_json, index: true
  end
end
