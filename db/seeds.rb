# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Role.destroy_all
Movie.destroy_all
Actor.destroy_all
Director.destroy_all

# Créer des réalisateurs
100.times do
  director = Director.create!(
    name: Faker::Name.name,
    bio: Faker::Lorem.paragraph,
    birthdate: Faker::Date.birthday(min_age: 30, max_age: 65)
  )
  p "Created director: #{director.name}"
end

# Créer des acteurs
1000.times do
  Actor.create!(
    name: Faker::Name.name,
    bio: Faker::Lorem.paragraph,
    birthdate: Faker::Date.birthday(min_age: 20, max_age: 80)
  )
  p "Created actor: #{Actor.last.name}"
end

# Créer des films
2000.times do
  Movie.create!(
    title: Faker::Movie.title,
    description: Faker::Lorem.paragraph,
    year: rand(1980..2022),
    director: Director.all.sample
  )
  p "Created movie: #{Movie.last.title}"
end

# Associer des acteurs à des films via des rôles
Movie.all.each do |movie|
  actors = Actor.all.sample(rand(2..5))
  actors.each do |actor|
    Role.create!(
      movie: movie,
      actor: actor,
      character_name: Faker::Name.name
    )
  end
end
puts "Seed data created successfully!"
