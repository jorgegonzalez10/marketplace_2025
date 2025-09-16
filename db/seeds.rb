# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Shipment.destroy_all
Payment.destroy_all
OrderItem.destroy_all
Order.destroy_all
Address.destroy_all
CartItem.destroy_all
Cart.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all


users = User.create!([
  { email: 'vendedor@gmail.com', password: '123456' },
  { email: 'comprador@gmail.com', password: '123456'}
])

puts 'creando categorias'

categories = Category.create!([
  {name: 'Tech'},
  {name: 'home'},
  {name: 'clothes'}
])

puts 'creando productos'

products = Product.create!([
  { title: 'iphone', price: '1000', published: true, category_id: categories[0].id, user_id: users[0].id },
  { title: 'sofa', price: '500', published: true, category_id: categories[1].id, user_id: users[0].id },
  { title: 't-shirt', price: '20', published: true, category_id: categories[2].id, user_id: users[0].id }
])

adresses = Address.create!([
  {street: '5801 preston oaks rd', city: 'dallas', zip: '75254', country: 'usa', user_id: users[1].id },
  {street: '2340 creekview dr', city: 'waco', zip: '76711', country: 'usa', user_id: users[1].id }
])

puts 'creando cart'

cart = Cart.create!(
  user_id: users[1].id
)

puts "cart items"

cart_items = CartItem.create([
  { product_id: products[0].id, cart_id: cart.id, quantity: 1, price: products[0].price },
  { product_id: products[1].id, cart_id: cart.id, quantity: 1, price: products[1].price },
  { product_id: products[2].id, cart_id: cart.id, quantity: 1, price: products[2].price }
])

puts 'creando order'

order = Order.create!(
  user_id: users[1].id, address_id: Address.all.sample.id, total: cart_items.map { |item| item.price * item.quantity }.sum, status: 200
)

orderItem = OrderItem.create!([
  {order_id: order.id, product_id: cart_items[0].product_id, price_at_purchase: cart_items[0].price, quantity: cart_items[0].quantity },
  {order_id: order.id, product_id: cart_items[1].product_id, price_at_purchase: cart_items[1].price, quantity: cart_items[1].quantity },
  {order_id: order.id, product_id: cart_items[2].product_id, price_at_purchase: cart_items[2].price, quantity: cart_items[2].quantity }
])
