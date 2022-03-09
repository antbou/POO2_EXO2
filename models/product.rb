class Product < ActiveRecord::Base
  attribute :price
  belongs_to :category
  has_many :orders

  scope :cheap, -> { where('price <= 20') }

  def to_s
    "#{name} #{price}"
  end
end