# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 User.create(first_name: 'Bruno', last_name: 'Feiteiro', email: 'bmfeiteiro@gmail.com', password_digest: "teste", lastfm_username: "bmfeiteiro")
User.create!(first_name:  "Example",
             last_name:  "User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             lastfm_username: "example_fm",
             activated: true,
             activated_at: Time.zone.now)
