class CreateContentsGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :contents_genres do |t|
      t.references :content, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
