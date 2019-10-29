class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.boolean :artwork
      t.string :title
      t.references :medium, foreign_key: true
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
