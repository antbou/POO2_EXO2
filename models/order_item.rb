class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    validates :product, :order, presence: true
    validates :quantity, numericality: { greater_than: 0, only_integer: true }
    before_create { self.item_price = self.product.price }

    scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }

    def price
        item_price * quantity
    end
end