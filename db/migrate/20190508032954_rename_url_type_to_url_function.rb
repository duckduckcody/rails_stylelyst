class RenameUrlTypeToUrlFunction < ActiveRecord::Migration[5.2]
  def change
    rename_table :website_url_types, :website_url_functions
    remove_column :website_urls, :website_url_type_id
    add_reference :website_urls, :website_url_function, index: :true
  end
end
