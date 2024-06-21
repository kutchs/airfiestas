# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all if Rails.env.development?
Event.destroy_all if Rails.env.development?

user1 = User.create!(email: "hello@hotmail.com", password: "123456", name: "John", firstname: "Doe")

Event.create!([
  {
    name: "The Big Event",
    description: "The biggest event of the year!",
    location: "123 Main St, New York, NY 10001",
    date_time: "2022-12-01",
    open: true,
    user_id: user1.id
  },
  {
    name: "The Small Event",
    description: "The smallest event of the year!",
    location: "456 Elm St, New York, NY 10002",
    date_time: "2022-12-04",
    open: true,
    user_id: user1.id,
  },
  {
    name: "The Medium Event",
    description: "The medium event of the year!",
    location: "789 Oak St, New York, NY 10003",
    date_time: "2022-12-04",
    open: true,
    user_id: user1.id,
  },
])

puts "Created #{Event.count} events"
