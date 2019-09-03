class RemoveWebsiteUrlFunction < ActiveRecord::Migration[5.2]
  def change
    drop_table :website_url_functions
    remove_foreign_key :websites, :website_url_functions
    remove_column :websites, :website_url_functions
  end
end
