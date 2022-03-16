require_relative 'connection'
require_relative 'models'


Client.create!(firstname: 'fff', lastname: 'fff')

client = Client.find(1)

puts client.ordered_products.cheap

puts "Affichez les produits commandé par quantité de plus de 50 pièces"
OrderItem.all.bulk(50).each { 
  |o| puts "#{o.product}" 
}
puts "\nTest de validation 1"
orderTest = Order.new(client: client)
puts orderTest.save

puts "\nTest de validation 2"
puts orderTest.order_items.build.save

puts "\nTest de validation 3"
puts orderTest.order_items.build(quantity: 10).save

puts "\nTest de validation 4"
puts orderTest.order_items.build(product: Product.first).save

puts "\nTest de validation 5"
puts orderTest.order_items.build(quantity: 200, item_price: Product.first.price, product: Product.first)

order1 = client.orders.create(order_items: [
  OrderItem.new(quantity: 2, product: Product.find(1)),
  OrderItem.new(quantity: 2,  product: Product.find(3)),
])

puts order1.total_price
