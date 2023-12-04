# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create users
users = User.create([
  { name: 'John Doe', username: 'john_doe', email: 'john@example.com', password: 'password' },
  { name: 'Jane Doe', username: 'jane_doe', email: 'jane@example.com', password: 'password' },
  { name: 'Alice Smith', username: 'alice_smith', email: 'alice@example.com', password: 'password' },
  { name: 'Bob Johnson', username: 'bob_johnson', email: 'bob@example.com', password: 'password' },
  { name: 'Eva Wilson', username: 'eva_wilson', email: 'eva@example.com', password: 'password' },
])

# Create addresses
addresses = Address.create([
  { landmark: 'Landmark 1', street: 'Street 1', city: 'City 1', pincode: 12345, state: 'State 1', country: 'Country 1', phone: 1234567890, user_id: 1 },
  { landmark: 'Landmark 2', street: 'Street 2', city: 'City 2', pincode: 67890, state: 'State 2', country: 'Country 2', phone: 9876543210, user_id: 2 },
  { landmark: 'Landmark 3', street: 'Street 3', city: 'City 3', pincode: 54321, state: 'State 3', country: 'Country 3', phone: 9876543210, user_id: 3 },
  { landmark: 'Landmark 4', street: 'Street 4', city: 'City 4', pincode: 87654, state: 'State 4', country: 'Country 4', phone: 1234567890, user_id: 4 },
  { landmark: 'Landmark 5', street: 'Street 5', city: 'City 5', pincode: 13579, state: 'State 5', country: 'Country 5', phone: 9876543210, user_id: 5 },
])


# Create foods
foods = Food.create([
  { name: 'Pizza', price: 10, cooking_time: 15, quantity: 5 },
  { name: 'Burger', price: 8, cooking_time: 10, quantity: 8 },
  { name: 'Pasta', price: 12, cooking_time: 12, quantity: 3 },
  { name: 'Salad', price: 5, cooking_time: 5, quantity: 10 },
  { name: 'Sushi', price: 15, cooking_time: 20, quantity: 4 },
  # Add more foods as needed
])

# Create orders
# orders = Order.create([
#   { user_id: 1, address_id: 1 },
#   { user_id: 2, address_id: 2 },
#   { user_id: 3, address_id: 3 },
#   { user_id: 4, address_id: 4 },
#   { user_id: 5, address_id: 5 },
# ])

# Create associations for cart_foods
cart_foods = CartFood.create([
  { cart_id: 1, food_id: 1 },
  { cart_id: 2, food_id: 2 },
  { cart_id: 3, food_id: 3 },
  { cart_id: 4, food_id: 4 },
  { cart_id: 5, food_id: 5 },
])

# Create associations for order_foods
order_foods = OrderFood.create([
  { order_id: 1, food_id: 1 },
  { order_id: 2, food_id: 2 },
  { order_id: 3, food_id: 3 },
  { order_id: 4, food_id: 4 },
  { order_id: 5, food_id: 5 },
])

puts 'Seed data created successfully!'
