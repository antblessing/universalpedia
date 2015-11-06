include Faker
require 'faker'

    50.times do
        user = User.create!(
        :email => Faker::Internet.email,
        :password => Faker::Name.name
        )
    end
    
    100.times do
      random_boolean = [true, false].sample
      wiki = Wiki.create!(
        :title => Faker::Company.catch_phrase,
        :body => Faker::Company.catch_phrase,
        :private => random_boolean
        )
    end
puts "#{User.count} users created!"
puts "#{Wiki.count} wikis created!"
