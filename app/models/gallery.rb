class Gallery < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :bucket
  belongs_to :organization
end
