require_relative 'connection'
require_relative 'models'

pcr = Category.create!(name: 'PCR')
sup = Category.create!(name: 'SUP')

product1 = Product.create!(name: 'apple', price: 2.35, description: 'Little apple', category: pcr)
product2 = Product.create!(name: 'lemon', price: 6.15, description: 'Big lemon', category: pcr)
product3 = Product.create!(name: 'limousine', price: 25.95, description: 'A limousine', category: sup)
product4 = Product.create!(name: 'truck', price: 200, description: 'A truck', category: sup)

client = Client.create!(firstname: 'Anthony', lastname: 'Bouillant')
Client.create!(firstname: 'john', lastname: 'doedoe')

order1 = client.orders.create(order_items: [
  OrderItem.new(quantity: 2, item_price: product1.price, product: product1),
  OrderItem.new(quantity: 125, item_price: product3.price, product: product3),
  OrderItem.new(quantity: 3, item_price: product4.price, product: product4)
])


order2 = Order.new()
order2.order_items << [
  OrderItem.new(quantity: 1, item_price: product1.price, product: product1),
  OrderItem.new(quantity: 75, item_price: product2.price, product: product2),
  OrderItem.new(quantity: 3, item_price: product3.price, product: product3),
  OrderItem.new(quantity: 200, item_price: product4.price, product: product4)
]
client.orders << order2
client.save!

puts '--SEEDERS DONE--'