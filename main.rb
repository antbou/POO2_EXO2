require_relative "connection"
require_relative "models"

puts Order.all
puts "\nMost Expensive #{Order.most_expensive}"

puts "\n#{Category.no_need}"

puts Client.all
Client.no_need
puts "\n"
puts Client.all
