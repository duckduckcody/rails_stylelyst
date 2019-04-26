class AddUrlextensionToScraper < ActiveRecord::Migration[5.2]
  def change
    add_column :scrapers, :url_extension, :string
  end
end
