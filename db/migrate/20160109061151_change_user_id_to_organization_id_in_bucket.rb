class ChangeUserIdToOrganizationIdInBucket < ActiveRecord::Migration
  def change
    add_column :buckets, :organization_id, :integer
    remove_column :buckets, :user_id
  end
end
