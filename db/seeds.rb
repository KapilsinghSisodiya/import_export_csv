# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.new(name: "satyam", email: "satyamyuvasoft@gmail.com", telephone_number: "8225853424", website: "yuvasoft").save
User.new(name: "ankit", email: "ankit@gmail.com", telephone_number: "8225853424", website: "yuvasoft").save
User.new(name: "punit", email: "punit@gmail.com", telephone_number: "8225853424", website: "yuvasoft").save