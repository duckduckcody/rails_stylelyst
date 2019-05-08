class CreateWebsiteUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :website_urls do |t|
      t.references :website_url_type, foreign_key: true
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
