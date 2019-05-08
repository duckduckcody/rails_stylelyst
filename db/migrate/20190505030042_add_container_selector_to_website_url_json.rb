class AddContainerSelectorToWebsiteUrlJson < ActiveRecord::Migration[5.2]
  def change
    add_column :scraper_jsons, :result_selector, :string
  end
end
