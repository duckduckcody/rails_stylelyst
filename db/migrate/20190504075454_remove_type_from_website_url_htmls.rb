class RemoveTypeFromWebsiteUrlHtmls < ActiveRecord::Migration[5.2]
  def change
    remove_column :website_url_htmls, :type
  end
end
