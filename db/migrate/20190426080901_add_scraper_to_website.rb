class AddScraperToWebsite < ActiveRecord::Migration[5.2]
  def change
    add_reference :scrapers, :website
  end
end
