class Product < ActiveRecord::Base
  attribute :price
  belongs_to :category
  has_many :orders
end