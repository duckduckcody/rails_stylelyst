class CreateWebsitePageCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :website_page_categories, &:timestamps
  end
end
