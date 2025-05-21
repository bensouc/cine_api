# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { "Jurassic Park" }
    description { "Dinosaurs run wild." }
    year { 1993 }
    association :director
  end
end
