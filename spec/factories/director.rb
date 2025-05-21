# frozen_string_literal: true

FactoryBot.define do
  factory :director do
    name { "Steven Spielberg" }
    bio { "Famous director" }
    birthdate { "1946-12-18" }
  end
end
