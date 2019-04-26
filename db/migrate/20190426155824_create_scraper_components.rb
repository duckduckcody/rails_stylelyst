class CreateScraperComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_components do |t|
      t.string :name
      t.string :selector
      t.string :type

      t.timestamps
    end
  end
end
