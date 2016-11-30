# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(first_name:  "Example",
             last_name:  "User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             lastfm_username: "rj",
             lastfm_token: "7111fd3f9d511699ec89317cb4004f77",
             activated: true,
             activated_at: Time.zone.now)
Location.create!(
    latitude: -23.565813199999997,
    longitude: -46.5556671,
    user: user)
SearchedLocation.create!(
    latitude: -23.565813199999997,
    longitude: -46.5556671,
    user: user)