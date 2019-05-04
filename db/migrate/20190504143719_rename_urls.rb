class RenameUrls < ActiveRecord::Migration[5.2]
  def change
    rename_table :urls, :url_elements
  end
end
