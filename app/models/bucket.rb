class Bucket < ActiveRecord::Base
  # Alias for acts_as_taggable_on :tags
  acts_as_taggable
  acts_as_taggable_on :tags

  has_many   :galleries
  has_many   :order_items
  has_many   :availables
  belongs_to :organization
end
