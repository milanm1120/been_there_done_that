# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Destination.destroy_all
Pin.destroy_all

# Destination.create([
#     {city: "New York City", state: "New York", country: "USA"},
#     {city: "Los Angeles", state: "California", country: "USA"},
#     {city: "Paris", state: "", country: "France"},
#     {city: "Sydney", state: "", country: "Australia"}
#     ])


milan=User.create(firstname: "Milan", lastname: "Mody", email: "milanm1120@gmail.com", password:"1234")