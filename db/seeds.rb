puts "🌱 Seeding spices..."

 users = [
  {username: 'JohnDoe', password: 'password1'},
  {username: 'JaneDoe', password: 'password2'}
 ]

 users.each do |user|
  User.create(user)

puts "✅ Done seeding!"
