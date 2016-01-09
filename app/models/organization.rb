class Organization < ActiveRecord::Base
  has_many :buckets
  has_many :galleries
end
