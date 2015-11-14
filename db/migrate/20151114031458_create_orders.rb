class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :serial_number
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :price
      t.string :buyer

      t.timestamps null: false
    end
  end
end
