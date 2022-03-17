class Product < ActiveRecord::Base
  attribute :price
  belongs_to :category
  belongs_to :supplier
  has_many :orders

  scope :cheap, -> { where('price <= 20') }

  def to_s
    "#{name} #{price}"
  end
end