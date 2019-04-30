class AddQueryStringToWebsite < ActiveRecord::Migration[5.2]
  def change
    add_column :websites, :query_string_key_page, :string
    add_column :websites, :query_string_key_search, :string 
  end
end
