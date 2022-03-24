class Order < ActiveRecord::Base
  belongs_to :client
  has_many :order_items
  has_many :products, through: :order_items

  validates :order_items, :client, presence: true
  validates_associated :order_items

def to_s
  "#{id} #{price}"
end

  def price
    order_items.sum(&:price)
  end

  def self.most_expensive
    o = nil
    self.all.each do |order|
      if(o == nil || order.price > o.price)
        o = order
      end
    end
    return o
  end
end