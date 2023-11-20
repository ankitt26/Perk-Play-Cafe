# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "Ankit", username: "user1" , email: "ank@g,mail.com", password: "ank1234")
Food.create(name:"Bravo top" ,price:300 , cooking_time:15 , quantity: 250)
Address.create(
    landmark: "Landmark1",
    street: "123 Main St",
    city: "City1",
    pincode: 12345,
    state: "State1",
    country: "Country1",
    phone: 1234567890,
    user_id: user1.id
  )