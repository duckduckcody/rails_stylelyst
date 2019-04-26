class CreateScrapers < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapers do |t|
      t.string :name
      t.string :container_selector

      t.timestamps
    end
  end
end
