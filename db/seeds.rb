# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Destroying existing data
puts "Deleting data"
User.delete_all
puts "Database is empty now"

# Creating new users
user1 = User.new(nickname: 'charlie', email: 'charlie@apple.com', password: 'password', password_confirmation: 'password')
user1.save!

puts "#{User.count} user(s) created."


puts "DB is ready. ✅"
