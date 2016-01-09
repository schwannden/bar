class AddOrganizationIdToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :organization_id, :integer
  end
end
