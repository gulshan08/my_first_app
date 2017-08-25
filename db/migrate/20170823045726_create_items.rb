class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.attachment :picture
      t.string :name
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
