class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    validates :product, :order, presence: true
    validates :quantity, numericality: { greater_than: 0, only_integer: true }

    scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }
end