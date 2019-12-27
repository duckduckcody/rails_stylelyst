class CreateWebsitePageSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :website_page_searches, &:timestamps
  end
end
