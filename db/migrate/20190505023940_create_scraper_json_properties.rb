class CreateScraperJsonProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :scraper_json_properties do |t|
      t.string :key
      t.references :scraper_json, foreign_key: true

      t.timestamps
    end
  end
end
