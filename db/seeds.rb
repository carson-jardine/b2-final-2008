# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@grey_sloan = Hospital.create!(name: "Grey Sloan Memorial")
@meredith = @grey_sloan.doctors.create!(name: "Meredith Gray", specialty: "General Surgery", university: "Dartmouth College")
@bailey = @grey_sloan.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stamford University")
@denny = @meredith.patients.create!(name: "Denny Duquette", age: 38)
@katie = @meredith.patients.create!(name: "Katie Bryce", age: 24)
@zola = @bailey.patients.create!(name: "Zola Shepherd", age: 4)
