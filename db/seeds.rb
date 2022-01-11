# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Destroying existing data
puts '[1/3] Deleting data'
Friendship.delete_all
Dream.delete_all
User.delete_all
puts 'Database is empty now'

puts '[2/3] Creating new seed...'
# Creating new users
user1 = User.new(nickname: 'charlie', email: 'charlie@apple.com', password: 'password', password_confirmation: 'password')
user2 = User.new(nickname: 'clem', email: 'clem@apple.com', password: 'password', password_confirmation: 'password')
user1.save!
user2.save!
puts "🐵 #{User.count} user(s) created."

# Creating new dreams
dream1 = Dream.new(owner_id: user1.id, title: 'Road trip in the south of Norway', is_hidden: true, is_completed: false,
                   nb_users_min: 1, nb_users_max: 2, cost: 1000,
                   description: 'I dream of going back to Norway to enjoy again the hikings, cabins and midnight sun')
dream2 = Dream.new(owner_id: user1.id, title: 'Dream 2', is_hidden: true, is_completed: false,
                   nb_users_min: 1, nb_users_max: 4, cost: 500,
                   description: 'Amazing dream 2')
dream3 = Dream.new(owner_id: user2.id, title: 'dream 3', is_hidden: true, is_completed: false,
                   nb_users_min: 1, nb_users_max: 6, cost: 20,
                   description: 'Super cool dream 3')
dream1.save!
dream2.save!
dream3.save!
puts "🌟 #{Dream.count} dream(s) created."

# Creating new friendships
friendship1 = Friendship.new(user_id: user1.id, friend_id: user2.id)
friendship1.save!
puts "💕 #{Friendship.count} friendship(s) created."

puts '[3/3] DB is ready. ✅ '
