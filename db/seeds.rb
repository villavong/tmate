# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

puts "Importing countries..."
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Country.create! do |country|
    country.id = row[0]
    country.name = row[1]
    country.country_code = row[2]


  end
end
#
# puts "Importing schools..."
# CSV.foreach(Rails.root.join("universities.csv"), headers: false) do |row|
#   School.create! do |school|
#     school.country_code = row[0]
#     school.name = row[1]
#     school.link = row[2]
#
#   end
# end
