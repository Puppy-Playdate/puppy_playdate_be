# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

  user1 = User.create!(name: "James Sullivan", email: "sully@gmail.com", password: "password")
  user2 = User.create!(name: "Mike Wazowski", email: "mike@gmail.com", password: "password")
  user3 = User.create!(name: "Randall Boggs", email: "randy@gmail.com", password: "password")
  user4 = User.create!(name: "Boo", email: "boo@gmail.com", password: "password")

  dog1 = user1.dogs.create!(name: "Fido", breed: "Lab", age: 5, size: 1, neutered: true)
  dog2 = user1.dogs.create!(name: "Bob", breed: "Pug", age: 3, size: 0, neutered: false)
