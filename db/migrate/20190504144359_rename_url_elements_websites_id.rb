class RenameUrlElementsWebsitesId < ActiveRecord::Migration[5.2]
  def change
    rename_column :url_elements, :websites_id, :website_id
  end
end
