class CreateContentsMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :contents_media do |t|
      t.references :content, foreign_key: true
      t.references :medium, foreign_key: true

      t.timestamps
    end
  end
end
