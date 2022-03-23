require_relative 'connection'
require_relative 'models'

user = Client.first
supplier = Supplier.first
some_comment = Comment.create(content: 'test', target: supplier)
user.comments << some_comment

product = Product.first
product.comments.create(content:'bonjour',author: user)

puts user.comments
# puts Supplier.find(1).categories
