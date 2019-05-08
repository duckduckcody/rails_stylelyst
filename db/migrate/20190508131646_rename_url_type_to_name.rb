class RenameUrlTypeToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :website_url_functions, :url_type, :name
  end
end
