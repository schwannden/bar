class CreateAvailables < ActiveRecord::Migration
  def change
    create_table :availables do |t|
      t.string :filter_type
      t.string :filter
      t.integer :bucket_id

      t.timestamps null: false
    end
  end
end
