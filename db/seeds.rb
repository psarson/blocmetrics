require 'faker'

10.times do

  User.create!(
    email: Faker::Internet.email,
    password: 'Helloworld'
    )
end
users = User.all

15.times do

  registered_application = RegisteredApplication.create!(
    user: users.sample,
    name: Faker::App.name,
    url: Faker::Internet.domain_name
  )
end
registered_applications = RegisteredApplication.all

15.times do

   event = Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::App.name
  )
end
events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Event.count} event created"
puts "#{RegisteredApplication.count} registered_applications created"
