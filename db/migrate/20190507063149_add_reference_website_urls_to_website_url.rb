class AddReferenceWebsiteUrlsToWebsiteUrl < ActiveRecord::Migration[5.2]
  def change
    remove_column :website_url_jsons, :website_id
    add_reference :website_url_jsons, :website_url, index: :true
    remove_column :website_url_htmls, :website_id
    add_reference :website_url_htmls, :website_url, index: :true
  end
end
