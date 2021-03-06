require_relative 'connection'
require_relative 'models'

pcr = Category.create!(name: 'PCR')
sup = Category.create!(name: 'SUP')

st = Supplier.create!(name: 'Technique', email: 'technique@gmail.com')
sm = Supplier.create!(name: 'Michel', email: 'michel@gmail.com')

product1 = Product.create!(name: 'apple', price: 2.35, description: 'Little apple', inventory: 10, category: pcr, supplier: st)
product2 = Product.create!(name: 'lemon', price: 6.15, description: 'Big lemon', inventory: 3, category: pcr, supplier: sm)
product3 = Product.create!(name: 'limousine', price: 25.95, description: 'A limousine', inventory: 15, category: sup, supplier: st)
product4 = Product.create!(name: 'truck', price: 200, description: 'A truck', inventory: 7, category: sup, supplier: sm)

client = Client.create!(firstname: 'Anthony', lastname: 'Bouillant')
Individual.create!(firstname: 'john', lastname: 'doedoe')
Company.create!(firstname: 'Michel', lastname: 'Technique')

order1 = client.orders.create(order_items: [
  OrderItem.new(quantity: 2, item_price: product1.price, product: product1),
  OrderItem.new(quantity: 125, item_price: product3.price, product: product3),
  OrderItem.new(quantity: 3, item_price: product4.price, product: product4)
])

Client.find(2).orders.create(order_items: [
  OrderItem.new(quantity: 2, item_price: product1.price, product: product1),
  OrderItem.new(quantity: 3, item_price: product4.price, product: product4)
])

Client.find(2).orders.create(order_items: [
  OrderItem.new(quantity: 1, item_price: product1.price, product: product1),
  OrderItem.new(quantity: 1, item_price: product2.price, product: product2)
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