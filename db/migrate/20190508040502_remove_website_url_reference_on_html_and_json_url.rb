class RemoveWebsiteUrlReferenceOnHtmlAndJsonUrl < ActiveRecord::Migration[5.2]
  def change
    remove_column :website_url_jsons, :website_url_id
    remove_column :website_url_htmls, :website_url_id
  end
end
