class AddGetMethodTo < ActiveRecord::Migration[5.2]
  def change
    add_column :websites, :emulate_browser_get, :boolean
  end
end
