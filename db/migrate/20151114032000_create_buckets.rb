class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.string :price
      t.string :aasm_state

      t.timestamps null: false
    end
  end
end
