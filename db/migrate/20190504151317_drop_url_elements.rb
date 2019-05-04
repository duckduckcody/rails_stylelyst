class DropUrlElements < ActiveRecord::Migration[5.2]
  def change
    drop_table :url_elements
  end
end
