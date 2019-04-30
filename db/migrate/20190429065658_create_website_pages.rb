class CreateWebsitePages < ActiveRecord::Migration[5.2]
  def change
    create_table :website_pages do |t|
      t.string :url_extension
      t.references :gender, foreign_key: true
      t.references :category, foreign_key: true
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
