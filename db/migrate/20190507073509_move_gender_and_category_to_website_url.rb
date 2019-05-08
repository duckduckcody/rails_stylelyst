class MoveGenderAndCategoryToWebsiteUrl < ActiveRecord::Migration[5.2]
  def change
    add_reference :website_urls, :gender, index: :true
    add_reference :website_urls, :category, index: true
    remove_column :website_url_htmls, :category_id
    remove_column :website_url_htmls, :gender_id
  end
end
