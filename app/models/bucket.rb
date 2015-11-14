class Bucket < ActiveRecord::Base
  # Alias for acts_as_taggable_on :tags
  acts_as_taggable
  acts_as_taggable_on :tags

  has_many   :galleries
  has_many   :order_items
  belongs_to :user
end
