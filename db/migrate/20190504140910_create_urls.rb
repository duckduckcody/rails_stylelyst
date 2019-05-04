class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.references :websites
      t.references :element, polymorphic: true, index: true

      t.timestamps
    end
  end
end
