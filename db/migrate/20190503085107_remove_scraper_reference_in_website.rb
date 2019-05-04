class RemoveScraperReferenceInWebsite < ActiveRecord::Migration[5.2]
  def change
    remove_column :scrapers, :website_id
  end
end
