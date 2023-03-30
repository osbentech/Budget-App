# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
main_user = User.create!(name:'test',email:'man@gmail.com',password:'123456')
Category.create!(name:'test', icon:'https://as1.ftcdn.net/v2/jpg/01/93/61/82/1000_F_193618296_24g9muYFJL9f38ZWHb7WSk36FXwcef7X.jpg', user_id:main_user.id)