class RemoveWebsitesIdFromUrls < ActiveRecord::Migration[5.2]
  def change
    remove_column :website_url_htmls, :websites_id
  end
end
