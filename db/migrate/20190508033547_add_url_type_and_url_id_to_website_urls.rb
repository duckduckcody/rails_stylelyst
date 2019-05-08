class AddUrlTypeAndUrlIdToWebsiteUrls < ActiveRecord::Migration[5.2]
  def change
    add_reference :website_urls, :url, polymorphic: true, index: true
  end
end
