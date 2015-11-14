class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :text
      t.string :image
      t.integer :bucket_id

      t.timestamps null: false
    end
  end
end
