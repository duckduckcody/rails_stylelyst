class CategoryToReferenceGender < ActiveRecord::Migration[5.2]
  def change
    remove_column :website_url_htmls, :gender_id
    add_reference :categories, :gender
  end
end
