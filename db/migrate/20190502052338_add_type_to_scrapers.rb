class AddTypeToScrapers < ActiveRecord::Migration[5.2]
  def change
    add_column :scrapers, :type, :string
  end
end
