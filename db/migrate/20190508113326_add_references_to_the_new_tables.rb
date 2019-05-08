class AddReferencesToTheNewTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :website_url_htmls, :website
    add_reference :website_url_htmls, :gender
    add_reference :website_url_htmls, :category
    add_reference :website_url_htmls, :website_url_function
  end
end
