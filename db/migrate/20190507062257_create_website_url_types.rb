class CreateWebsiteUrlTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :website_url_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
