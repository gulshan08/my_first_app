class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.attachment :photo_image
      t.integer :photoable_id
      t.string  :photoable_type

      t.timestamps
    end
     add_index :photos, [:photoable_type, :photoable_id]
  end
end
