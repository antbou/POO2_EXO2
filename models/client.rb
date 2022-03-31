class Client < ActiveRecord::Base
  has_many :orders
  has_many :ordered_products, through: :orders, source: :products
  has_many :comments, foreign_key: "author_id"

  validates :firstname, :lastname, presence: true, length: { :minimum => 2 }

  def to_s
    "#{firstname} #{lastname}"
  end

  def self.no_need
    self.all.each do |client|
      if (client.orders.count == 0)
        client.destroy
      end
    end
  end
end
