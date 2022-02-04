# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Destroying existing data
puts '[1/3] Deleting data...'
Membership.delete_all
Friendship.delete_all
Dream.delete_all
Duration.delete_all
Schedule.delete_all
User.delete_all
puts 'DB is empty now ✅'

puts '[2/3] Creating new seed...'
# Old deleted, now seeding new ones : durations
# 107 possibles
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
puts "⏱ #{Duration.count} durations created."

# Users : old deleted, now seeding new ones
user1 = User.new(nickname: 'charlie', email: 'charlie@apple.com', password: 'password', password_confirmation: 'password')
user2 = User.new(nickname: 'clem', email: 'clem@apple.com', password: 'password', password_confirmation: 'password')
user3 = User.new(nickname: 'buxton', email: 'buxton@apple.com', password: 'password', password_confirmation: 'password')
user1.save!
user2.save!
user3.save!
puts "🐵 #{User.count} users created."

# Old deleted, now seeding new ones : dreams
dream1 = Dream.new(owner_id: user1.id, title: 'Road trip in the south of Norway', is_completed: false,
                   nb_users_min: 1, nb_users_max: 2, cost: 1000, duration_id: Duration.last.id,
                   description: 'I dream of going back to Norway to enjoy again the hikings, cabins and midnight sun')
dream2 = Dream.new(owner_id: user1.id, title: "Pas d'info pour le titre de mon rêve", is_completed: false,
                   nb_users_min: 1, nb_users_max: 4, cost: 500, duration_id: Duration.first.id,
                   description: 'petit dream blabla')
dream3 = Dream.new(owner_id: user2.id, title: "finir l'app Buxton ticket !", is_completed: false,
                   nb_users_min: 1, nb_users_max: 6, cost: 20, duration_id: Duration.last.id,
                   description: 'Qui veut coder la meilleure app du marché avec moi ?')
dream4 = Dream.new(owner_id: user3.id, title: 'Becoming, maybe, formule 1 driver', is_hidden: false,
                   nb_users_min: 1, nb_users_max: 6, cost: 20,
                   description: 'Have I a dream that one day, maybe, I might become formule 1 driver')
dream5 = Dream.new(owner_id: user1.id, title: 'Make it snow everyday', is_hidden: false,
                   nb_users_min: 1, nb_users_max: 6, cost: 20, duration_id: Duration.last.id,
                   description: "Because when it snows, we can't go to the office to work")
dream6 = Dream.new(owner_id: user1.id, title: 'Discover Alaska', is_hidden: false,
                   nb_users_min: 1, nb_users_max: 6, cost: 20,
                   description: 'Faire des balade en traineaux, adopter un huski, manger du bon saumon etc.')
dream7 = Dream.new(owner_id: user2.id, title: 'Gagner au loto', is_hidden: false,
                   nb_users_min: 1, nb_users_max: 10, cost: 1,
                   description: "Si on s'y met tous, on peut y arriver !")

dream1.save!
dream2.save!
dream3.save!
dream4.save!
dream5.save!
dream6.save!
dream7.save!
puts "🌟 #{Dream.count} dreams created."

# Old deleted, now seeding new ones : friendships
# (user = who asked, friend = who choose to confirm)
friendship1 = Friendship.new(user_id: user1.id, friend_id: user2.id, is_confirmed: true)
friendship2 = Friendship.new(user_id: user2.id, friend_id: user1.id)
friendship3 = Friendship.new(user_id: user3.id, friend_id: user1.id, is_confirmed: true)
friendship4 = Friendship.new(user_id: user3.id, friend_id: user2.id)
friendship5 = Friendship.new(user_id: user1.id, friend_id: user3.id, is_confirmed: true)
friendship1.save!
friendship2.save!
friendship3.save!
friendship4.save!
friendship5.save!
puts "💕 #{Friendship.count} friendships created."

# Old deleted, now seeding new ones : schedules
schedule1 = Schedule.new(start_at: DateTime.new(2022,02,01,10,00,00), end_at: DateTime.new(2022,02,02,10,00,00))
schedule2 = Schedule.new(start_at: DateTime.new(2022,02,01,10,00,00))
schedule1.save!
schedule2.save!
puts "📆 #{Schedule.count} schedules created."

# Old deleted, now seeding new ones : memberships
membership1 = Membership.new(user_id: user1.id, dream_id: dream3.id, is_confirmed: true)
membership2 = Membership.new(user_id: user1.id,dream_id: dream4.id, is_confirmed: true)
membership1.save!
membership2.save!
puts "🤝 #{Membership.count} memberships created."

puts '[3/3] DB is ready ✅ '
