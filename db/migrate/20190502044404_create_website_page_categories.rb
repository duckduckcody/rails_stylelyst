class CreateWebsitePageCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :website_page_categories do |t|

      t.timestamps
    end
  end
end
