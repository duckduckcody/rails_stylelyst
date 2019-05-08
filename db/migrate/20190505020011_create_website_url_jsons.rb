class CreateWebsiteUrlJsons < ActiveRecord::Migration[5.2]
  def change
    create_table :website_url_jsons do |t|
      t.string :url
      t.string :body
      t.string :request_type
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
