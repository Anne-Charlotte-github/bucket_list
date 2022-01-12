# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Destroying existing data
puts '[1/3] Deleting data...'
Duration.delete_all
Schedule.delete_all
Friendship.delete_all
Dream.delete_all
User.delete_all
puts 'DB is empty now ✅'

puts '[2/3] Creating new seed...'
# Creating new users
user1 = User.new(nickname: 'charlie', email: 'charlie@apple.com', password: 'password', password_confirmation: 'password')
user2 = User.new(nickname: 'clem', email: 'clem@apple.com', password: 'password', password_confirmation: 'password')
user3 = User.new(nickname: 'buxton', email: 'buxton@apple.com', password: 'password', password_confirmation: 'password')
user1.save!
user2.save!
user3.save!
puts "🐵 #{User.count} user(s) created."

# Creating new dreams
dream1 = Dream.new(owner_id: user1.id, title: 'Road trip in the south of Norway', is_completed: false,
                   nb_users_min: 1, nb_users_max: 2, cost: 1000,
                   description: 'I dream of going back to Norway to enjoy again the hikings, cabins and midnight sun')
dream2 = Dream.new(owner_id: user1.id, title: 'Dream 2', is_completed: false,
                   nb_users_min: 1, nb_users_max: 4, cost: 500,
                   description: 'petit dream blabla')
dream3 = Dream.new(owner_id: user2.id, title: 'dream 3', is_completed: false,
                   nb_users_min: 1, nb_users_max: 6, cost: 20,
                   description: 'Super cool dream 3')
dream4 = Dream.new(owner_id: user3.id, title: 'Becoming, maybe, formule 1 driver', is_hidden: false, is_completed: false,
                   nb_users_min: 1, nb_users_max: 6, cost: 20,
                   description: 'Have I a dream that one day, maybe, I might become formule 1 driver')
dream1.save!
dream2.save!
dream3.save!
dream4.save!
puts "🌟 #{Dream.count} dream(s) created."

# Creating new friendships (user = who asked, friend = who choose to confirm)
friendship1 = Friendship.new(user_id: user1.id, friend_id: user2.id, is_confirmed: true)
friendship2 = Friendship.new(user_id: user2.id, friend_id: user1.id)
friendship3 = Friendship.new(user_id: user3.id, friend_id: user1.id, is_confirmed: true)
friendship4 = Friendship.new(user_id: user3.id, friend_id: user2.id)
friendship1.save!
friendship2.save!
friendship3.save!
friendship4.save!
puts "💕 #{Friendship.count} friendship(s) created."

# Creating new schedules
schedule1 = Schedule.new(start_at: DateTime.new(2022,02,01,10,00,00), end_at: DateTime.new(2022,02,02,10,00,00))
schedule2 = Schedule.new(start_at: DateTime.new(2022,02,01,10,00,00))
schedule1.save!
schedule2.save!
puts "📆 #{Schedule.count} schedule(s) created."

# Creating new durations (107 possibles)
max_quantity = {
  'minute(s)' => 60,
  'hour(s)' => 24,
  'day(s)' => 7,
  'week(s)' => 4,
  'month(s)' => 12,
  'year(s)' => 6
}
unit_choices = %w(minute(s) hour(s) day(s) week(s) month(s) year(s)).freeze

unit_choices.each do |unit|
  quantity = 1
  until quantity == max_quantity[unit]
    duration = Duration.new(quantity: quantity, unit: unit)
    duration.save!
    quantity += 1
  end
end

# quantity = 1
# until quantity == 60
#   duration = Duration.new(quantity: quantity, unit: 'minute(s)')
#   duration.save!
#   quantity += 1
# end
# quantity = 1
# until quantity == 24
#   duration = Duration.new(quantity: quantity, unit: 'hour(s)')
#   duration.save!
#   quantity += 1
# end
# quantity = 1
# until quantity == 7
#   duration = Duration.new(quantity: quantity, unit: 'day(s)')
#   duration.save!
#   quantity += 1
# end
# quantity = 1
# until quantity == 4
#   duration = Duration.new(quantity: quantity, unit: 'week(s)')
#   duration.save!
#   quantity += 1
# end
# quantity = 1
# until quantity == 12
#   duration = Duration.new(quantity: quantity, unit: 'month(s)')
#   duration.save!
#   quantity += 1
# end
# quantity = 1
# until quantity == 6
#   duration = Duration.new(quantity: quantity, unit: 'year(s)')
#   duration.save!
#   quantity += 1
# end
puts "⏱ #{Duration.count} duration(s) created."

puts '[3/3] DB is ready ✅ '
