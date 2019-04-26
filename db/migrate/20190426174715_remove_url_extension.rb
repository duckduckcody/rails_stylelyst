class RemoveUrlExtension < ActiveRecord::Migration[5.2]
  def change
    remove_column :scrapers, :url_extension
    remove_column :Scrapers, :name
  end
end
