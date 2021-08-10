# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

20.times do |i|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
  description: Faker::Lorem.paragraph(sentence_count: 3), email: "bruno")
end


10.times do |i|
  Event.create(start_date:'2021-08-24', duration:30, title: Faker::Movies::HarryPotter.character, description: Faker::Movies::HarryPotter.quote,
  price: 200, location: Faker::Movies::HarryPotter.house, administrator_id: i+1)

Attendance.create(event_id:i+1, participant_id: rand(1..20), stripe_customer_id: rand(1..20))
Attendance.create(event_id:i+1, participant_id: rand(1..20), stripe_customer_id: rand(1..20))
Attendance.create(event_id:i+1, participant_id: rand(1..20), stripe_customer_id: rand(1..20))
end


puts " Seed done !"


