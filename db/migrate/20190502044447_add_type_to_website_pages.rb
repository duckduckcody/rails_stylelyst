class AddTypeToWebsitePages < ActiveRecord::Migration[5.2]
  def change
    add_column :website_pages, :type, :string
  end
end
