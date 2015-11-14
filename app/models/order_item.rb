class OrderItem < ActiveRecord::Base
  belongs_to :bucket
  belongs_to :order
end
