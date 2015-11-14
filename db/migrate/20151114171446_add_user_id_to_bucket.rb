class AddUserIdToBucket < ActiveRecord::Migration
  def change
    add_column :buckets, :user_id, :integer
  end
end
