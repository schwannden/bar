class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :bucket_id
      t.integer :order_id
      t.integer :quantity
      t.string :price

      t.timestamps null: false
    end
  end
end
