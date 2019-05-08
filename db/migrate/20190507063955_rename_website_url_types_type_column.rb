class RenameWebsiteUrlTypesTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :website_url_types, :type, :url_type
  end
end
