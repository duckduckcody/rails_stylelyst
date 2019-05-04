class AddScrapersReferenceToUrls < ActiveRecord::Migration[5.2]
  def change
    add_reference :scrapers, :website_url, foreign_key: true
  end
end
