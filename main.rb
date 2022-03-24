require_relative 'connection'
require_relative 'models'

product1 = Product.first
product2 = Product.find(2)

product4 = Product.create!(name: 'Wesh', price: 200, description: 'A Wesh', inventory: 3, category: Category.first, supplier: Supplier.first)

product1.inventory = 3
product1.save
# puts Supplier.find(1).categories
