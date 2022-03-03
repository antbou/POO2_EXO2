class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :client
  has_many :order_items
end