require_relative 'connection'
require_relative 'models'

client = Client.find(1)

puts client.ordered_products.cheap

puts "Affichez les produits commandé par quantité de plus de 50 pièces"
OrderItem.all.bulk(50).each { 
  |o| puts "#{o.product}" 
}
